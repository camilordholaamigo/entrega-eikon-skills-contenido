---
name: eikon-estado-cuenta
description: 'Consolida el estado real de una cuenta de Eikon desde las fuentes que la agencia sí tiene (Drive, correo, planillas de seguimiento, actas): piezas por estado, pendientes con responsable y fecha, aprobaciones vencidas, entregas en riesgo de SLA y solicitudes sin dueño. Declara siempre qué fuentes no pudo ver. USA en el arranque de semana, antes de hablar con el cliente, al inicializar una cuenta nueva o para el bloque de cumplimiento del informe mensual. NO prioriza la cola del día — eso es eikon-priorizador-dia. NO aprueba, no mueve fechas y no le escribe al cliente.'
metadata:
  version: 1.1.0
  empresa: Eikon Digital
  tipo: skill de Eikon
  entrega: equipo de contenido (2026-10-07)
---

# eikon-estado-cuenta

Responde una sola pregunta, con evidencia: **¿en qué va esta cuenta y qué se va a incumplir?**

**El problema que resuelve.** Hoy el estado de una cuenta vive repartido en cuatro fuentes de verdad
—correo, Drive, WhatsApp y Meet— y se reconstruye a mano cada vez que alguien pregunta. Dirección de
cuentas lo puso primero en su lista: *"la primera actividad que me gustaría automatizar es el
seguimiento del estado de piezas y campañas"*. Y el formato en que se reconstruye depende de quién lo
arma: *"todos los directores de cuenta trabajamos de una manera supremamente diferente, algunos más
ordenados que otros"*.

**La regla de diseño:** un tablero que no dice qué no pudo ver se lee como un tablero completo. Este
skill declara su perímetro **antes** de mostrar un solo número. Un estado silencioso es peor que no
tener estado, porque se toman decisiones sobre él.

**El estado no es la pieza: es la pieza más el reloj.** "En revisión interna" no dice nada; "en
revisión interna hace 6 días, sale el jueves" es la información. Todo lo que sigue está construido
sobre esa distinción.

---

## Modos

El skill corre en tres modos. Si no se indica, es `pulso`.

| Modo | Cuándo | Qué cambia |
|---|---|---|
| `pulso` | Arranque de semana, antes de un status, cadena `eikon-pulso-semanal` | Foco en riesgo y en lo que está parado. Es el default. |
| `init` | Kickoff de cuenta nueva, cadena `eikon-onboarding-cliente` | No hay historia que consolidar: **define** los estados, SLAs, cadena de aprobación y dónde vive cada fuente. Output = el tablero vacío pero configurado. |
| `cierre-mes` | Primeros días hábiles, cadena `eikon-cierre-mes-cliente` | Compara comprometido vs. publicado del mes cerrado. Output = bloque de cumplimiento operativo para el informe, no diagnóstico. |

---

## Fase 0 — Declarar el perímetro

**Antes de consolidar nada.** Listar las fuentes que se pidieron y marcar cada una:

```
FUENTES · Grupo Caminos / Subaru · corte 2026-08-16 10:40
  ✅ Parrilla aprobada agosto (Drive)         actualizada 2026-08-14
  ✅ Planilla de seguimiento (Sheets)         actualizada 2026-08-15
  ✅ Correos de aprobación (hilo cliente)     último 2026-08-15
  ⬜ WhatsApp de la cuenta                    NO LEÍDO — canal personal, no exportado
  ⚠️ Acta del último comité                  desactualizada 11 días
```

Reglas del perímetro:

1. **WhatsApp es el hueco estructural.** Es el canal real del cliente y no hay línea corporativa, así
   que por defecto queda fuera del barrido. Nunca asumir que lo que no está en Drive no existe: lo
   más probable es que se haya pedido por ahí. Declararlo, no compensarlo con inferencias.
2. Una fuente con más de 7 días sin actualizar entra como `⚠️ desactualizada`, no como válida.
3. Si falta la parrilla aprobada del mes, **el skill no produce tablero**: responde `⛔ SIN LÍNEA
   BASE`, porque sin comprometido no hay incumplimiento que medir, solo actividad.

Esto es deliberado y el equipo lo pidió textual: *"muchas veces quedamos con un análisis a medias
porque nos falta información"*. Un chequeo ciego que no se declara se lee como un chequeo aprobado.

## Fase 1 — Máquina de estados

Un solo vocabulario para toda la agencia. Los estados y sus dueños viven en
[`references/estados-y-sla.md`](references/estados-y-sla.md); acá va la forma:

```
por diseñar → en diseño → revisión interna → con cliente → aprobada → publicada
                  ↑                              ↓
                  └──────── devuelta ────────────┘
```

Tres precisiones que decidieron el diseño:

- **`devuelta` es un estado, no un retroceso silencioso.** Una pieza que vuelve a diseño después de
  revisión interna y otra que vuelve después del cliente cuestan distinto y se cuentan aparte. El
  conteo de devoluciones por origen es la métrica que hace visible el reproceso.
- **`con cliente` se parte en dos cuando la cuenta tiene doble filtro.** Grupo Caminos y Andinautos
  aprueban con el cliente directo **y** con los guardianes de marca a nivel nacional. Modelarlo como
  un solo estado esconde dónde está trabada la pieza y a quién hay que empujar.
- **Cuentas que envían pieza terminada no tienen estados de diseño.** La Alcaldía de Manizales manda
  las piezas listas y la agencia pauta. Forzarles la máquina completa produce un tablero lleno de
  casillas vacías que nadie lee. El perfil de estados por cuenta se declara en `init`.

Cada pieza lleva: estado, **días en el estado actual**, responsable nominal, fecha de salida
comprometida y origen (parrilla aprobada / ajuste del cliente / solicitud fuera de parrilla).

## Fase 2 — Riesgo

El riesgo no sale del estado sino de la distancia entre **lo que falta hacer** y **lo que queda de
tiempo**. Regla de cálculo:

```
riesgo = fecha_de_salida − (hoy + tiempo_restante_del_flujo + SLA_de_los_pasos_pendientes)
```

Los SLA operativos conocidos entran acá: implementación de pauta **48h**, y la alerta de pieza sin
aprobar a **5 días** de la fecha de salida. Los demás son propuestos y están marcados como tales en
la referencia.

| Nivel | Criterio | Lectura |
|---|---|---|
| 🔴 **Incumple** | El tiempo restante ya no alcanza aunque todo salga bien | Renegociar fecha hoy, no empujar |
| 🟠 **En riesgo** | Alcanza solo si nadie más se demora | Empujar al dueño del paso actual |
| 🟡 **Atención** | Parada más de lo normal, todavía con margen | Destrabar esta semana |
| ✅ **En curso** | Dentro de SLA | No ocupa espacio en el output |

**Lo parado pesa más que lo atrasado.** Una pieza que lleva 9 días en "revisión interna" no está
atrasada todavía, pero es la que va a incumplir. El ordenamiento del tablero es por días parados
dentro de cada nivel, no por fecha de salida.

**Regla de la espera del cliente.** Una pieza detenida esperando aprobación del cliente **no** es una
falla del equipo, y marcarla como tal quema la credibilidad del tablero. Se cuenta aparte, con la
fecha en que se envió y los días de espera, porque es exactamente el dato que se necesita para la
conversación con el cliente. Las aprobaciones del cliente no se automatizan ni se apuran solas: *"ellos
manejan sus propios tiempos y no los podemos automatizar"*.

## Fase 3 — Solicitudes huérfanas

Todo lo que apareció en correo, acta o comité y **no** tiene pieza, dueño ni fecha. Es la categoría
que explica el reproceso: nadie la ve hasta que el cliente la reclama.

Por cada una: qué se pidió, quién lo pidió, dónde apareció, y la clasificación:

- **Dentro de parrilla** → entra al flujo con dueño y fecha.
- **Fuera de alcance** → no se resuelve acá, se deriva a `scope-change-handler`. El tablero la marca
  y sigue; absorber trabajo no cotizado en silencio es el mecanismo por el que las cuentas se vuelven
  no rentables.
- **Sin clasificar** → falta información para decidir. Va con la pregunta concreta y a quién hacérsela.

## Fase 4 — Escribir el tablero

Formato fijo. Encabezado de una línea, después solo lo que requiere acción.

```
Grupo Caminos / Subaru · agosto · corte 16-ago 10:40
32 piezas comprometidas · 18 publicadas · 🔴 2 · 🟠 4 · 🟡 3 · ⏸ 5 con cliente · ❓ 2 huérfanas
Perímetro: 3 de 5 fuentes verificadas — WhatsApp no leído

🔴 INCUMPLE · Pieza #24 "Test drive Forester" · sale 19-ago
   Estado:       en diseño hace 7 días (SLA 3)
   Falta:        diseño + revisión interna + cliente + tráfico (48h) = 6 días hábiles
   Responsable:  {diseño — nombre}
   Acción:       renegociar fecha de salida con el cliente hoy; no alcanza aunque se apure

⏸ CON CLIENTE · Pieza #19 "Suzuki Vitara — financiación" · enviada 08-ago
   Espera:       8 días · guardián de marca nacional (2º filtro)
   Acción:       la mesa no puede destrabarlo; entra a la agenda del comité con el cliente

❓ HUÉRFANA · "Video para el lanzamiento de octubre" — pedido en acta del 12-ago
   Sin pieza, sin dueño, sin fecha. Fuera de la parrilla aprobada.
   Acción:       clasificar alcance con dirección de cuenta → posible scope-change-handler
```

**Lo que está en curso no se lista.** Un tablero de 32 líneas donde 23 dicen "todo bien" entrena al
equipo a no leerlo. El encabezado cuenta; el cuerpo solo muestra lo que alguien tiene que mover.

Si no hay nada en rojo ni naranja, **decirlo y terminar**: "32 piezas, 0 en riesgo, 5 esperando al
cliente, WhatsApp no leído" es un output válido y valioso.

### Salida en modo `cierre-mes`

Un bloque, sin diagnóstico, listo para pegar en el informe:

```
CUMPLIMIENTO OPERATIVO — agosto
Comprometido: 32 piezas · Publicado: 30 (94%)
No publicadas: 2 — 1 por aprobación del cliente pendiente desde 08-ago, 1 reprogramada a septiembre
Aprobaciones vencidas al cierre: 3 (promedio 6 días de espera)
Devoluciones: 5 — 3 en revisión interna, 2 del cliente
```

El porcentaje va siempre con el numerador y el denominador al lado. Un "94% de cumplimiento" sin las
2 piezas nombradas no es reportable.

### Salida en modo `init`

No hay estado que consolidar. El output es la configuración con la que la cuenta va a operar: perfil
de estados aplicable, SLA por paso, cadena de aprobación (con los filtros del cliente nombrados),
dónde vive cada fuente y su enlace, y **el listado explícito de lo que no entra** con quién lo
renegocia. Se guarda junto a la Cuenta 360 del handoff comercial y se registra en el Sheet maestro.

---

## La OnePage Strategy y el avance del despliegue

Dirección de cuentas de Eikon pidió que el estado no sea solo la cola de piezas: que muestre **si la
estrategia acordada se está ejecutando**. Es la diferencia entre "vamos al día con las entregas" y
"vamos al día con lo que le prometimos al cliente en enero", que no son lo mismo y se confunden todo
el tiempo.

Si la cuenta tiene OnePage Strategy cargada, el tablero abre con su checklist de despliegue:

```
ONEPAGE · Subaru 2026
  ✓ Reposicionamiento de gama alta        desplegado    ene-mar
  ✓ Campaña de leads por concesionario    desplegado    abr-jun
  ⏳ Programa de contenido de posventa     40%           jul-sep   ← va corto
  ○ Piloto de e-commerce de repuestos      no iniciado   oct-dic
```

Cada línea lleva su avance y su ventana. **Una iniciativa sin arrancar a mitad de su ventana es una
alerta de cuenta**, aunque la operación diaria esté impecable — y es exactamente el tipo de cosa que
aparece en la renovación cuando ya no hay margen.

**Regla 1-3-5 para el foco del período.** Cuando la OnePage no existe todavía, el skill igual pide el
foco declarado: 1 objetivo grande, 3 medianos, 5 chicos. Sin eso, el tablero ordena tareas sin saber
contra qué.

## Capacidad compartida: la mesa, no la cuenta

La v1.0 leía una cuenta a la vez. Eikon marcó que eso esconde el problema real: **el equipo es
compartido entre las cuentas de la misma mesa**, y una cuenta puede ir bien mientras deja sin aire a
las otras dos.

El tablero declara, para cada persona asignada, su compromiso proporcional y con quién más lo comparte:

| Persona | En esta cuenta | Otras cuentas de la mesa | Total |
|---|---|---|---|
| Content manager | 40% | Andinautos 40% · Greyman 30% | **110%** ← sobrecomprometido |
| Diseño | 25% | Andinautos 25% | 50% |

Un total sobre 100% no es un dato de color: es la explicación de por qué se van a caer fechas este
mes, y hay que verlo antes de que se caigan. Se cruza con `eikon-priorizador-dia`, que trabaja la
misma capacidad desde el lado de la cola diaria.

## El tablero habilita el "qué tal si", no solo el "no"

Esto lo pidió dirección de cuentas y es un cambio de propósito, no de formato: el estado tiene que
servir para **abrir conversación comercial, no solo para reportar atraso**.

Cuando una solicitud no entra en la capacidad comprometida, la salida no es *"no nos da"* ni *"se te
demora"*. Es una opción con nombre:

```
SOLICITUD FUERA DE CAPACIDAD
  Pedido:      3 piezas extra para lanzamiento de septiembre
  Situación:   la mesa está al 110% con lo ya comprometido
  Qué tal si:  · entra como proyecto aparte, switch on-off, 3 piezas · {valor}
               · o desplaza las 3 piezas de posventa a octubre, sin costo
  Decide:      dirección de cuenta con el cliente
```

Las dos opciones se muestran siempre juntas: la que factura y la que no. Presentar solo la que
factura es vender; presentar solo la que no, es regalar trabajo. El skill **no cotiza el número** —
eso es `eikon-cotizador` y la regla 7 de `CONTEXT.md`— y **no le escribe al cliente**.

## Reglas duras

1. **No aprueba nada ni le escribe al cliente.** Produce el estado; la conversación es humana.
2. **No mueve fechas comprometidas.** Detecta que no alcanzan y dice con quién se renegocia.
3. **No inventa un estado que la fuente no dijo.** Sin evidencia, la pieza va como `sin dato`, no como
   "en diseño" por probabilidad.
4. **No absorbe trabajo fuera de alcance.** Lo marca y lo deriva.
5. **No consolida WhatsApp** salvo que alguien pegue el contenido explícitamente. No hay exportación
   ni acceso, y fingir cobertura ahí es el peor error posible del tablero.

## Criterios de calidad

- El perímetro de fuentes aparece antes que cualquier número.
- Cada línea del cuerpo tiene acción y responsable.
- Las esperas del cliente están separadas de los atrasos del equipo.
- Los días en estado están presentes en toda pieza en riesgo.
- El conteo del encabezado cuadra con el detalle.
- **Test de utilidad:** un director de cuenta debe poder entrar a la reunión con el cliente leyendo
  solo este tablero. Si necesita abrir el Drive para responder "¿y la pieza tal?", el tablero falló.

## ⚠️ Supuestos pendientes de validación

- **La máquina de estados y los SLA por paso son propuestos**, derivados de las entrevistas. Los
  únicos confirmados son el SLA de implementación de pauta (48h) y el umbral de pieza sin aprobar
  (5 días) de la configuración de Eikon. Validar con dirección general de cuentas (Belén Núñez).
- **La planilla de seguimiento no está estandarizada** entre mesas. Este skill asume una estructura;
  el mapeo real se corrige cuando llegue un ejemplar de cada mesa.
- El perfil de estados por tipo de cuenta (concesionario con doble filtro / entidad pública que envía
  pieza / social media estándar) se confirma en el `init` de cada cuenta.
- **Este skill es de la Ola 1.5**, que no pasó el gate de gerencia. Construido para desbloquear las
  cadenas `eikon-pulso-semanal`, `eikon-parrilla-a-entrega`, `eikon-onboarding-cliente` y
  `eikon-cierre-mes-cliente`; su alcance se ratifica con la dueña del área antes del piloto.
