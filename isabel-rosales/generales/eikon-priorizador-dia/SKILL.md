---
name: eikon-priorizador-dia
description: Ordena las solicitudes entrantes de una mesa de trabajo de Eikon contra la capacidad real del equipo, con criterio explícito de urgencia contractual, impacto en el cliente y esfuerzo, y marca con nombre propio lo que NO entra y con quién hay que renegociarlo. USA al abrir el día, al armar la cola de la semana o cuando entran solicitudes nuevas sobre un equipo ya comprometido. NO consolida el estado de las piezas — eso es eikon-estado-cuenta. NO reasigna personas, no mueve fechas comprometidas con el cliente y no responde solicitudes.
metadata:
  version: 1.1.0
  empresa: Eikon Digital
  tipo: skill de Eikon
  entrega: equipo de contenido (2026-10-07)
---

# eikon-priorizador-dia

Produce dos listas: **lo que entra** y **lo que no entra**. La segunda es el entregable.

**El problema que resuelve.** Hoy nadie dice que algo no entra hasta que se incumple. Las solicitudes
llegan por cuatro canales distintos, el equipo transversal está compartido entre todas las mesas
—producción digital son **dos personas** para diseño, desarrollo, hosting, apps, SEO y
automatizaciones de toda la agencia— y el resultado es el que reporta cuentas: *"el equipo transversal
nos está entregando las cosas tres semanas después"*. Eso no es un problema de orden: es un problema
de capacidad que nadie declaró a tiempo.

**La regla de diseño:** una cola sin corte no es una priorización, es una lista de deseos ordenada.
Si el skill devuelve las 14 solicitudes ordenadas y ninguna marcada como "no entra", falló — porque
esas 14 no caben y alguien se va a enterar el jueves.

**El orden se calcula contra capacidad, no contra importancia.** Todo es importante. Lo escaso es la
hora-persona.

---

## Fase 0 — Sin capacidad no hay cola

Antes de ordenar, el skill necesita tres cosas. Si falta alguna, las pide **en una sola tanda** y no
inventa:

1. **Las solicitudes** del período (día o semana), con cliente y quién las pidió.
2. **La capacidad disponible** por persona o rol: horas realmente libres, ya descontado lo que está
   comprometido. No el horario laboral.
3. **Lo ya comprometido** que sigue abierto — sale de `eikon-estado-cuenta` si está disponible.

Si no hay estimación de esfuerzo por solicitud, el skill **estima con un rango** y lo marca como
supuesto propio (`~2-4h, estimado`), nunca como dato. Un rango declarado se corrige en 10 segundos;
un número inventado se planifica y después se incumple.

**Regla de la capacidad honesta.** Si la capacidad reportada es el horario completo, el skill la
descuenta: reuniones, retrabajos y contexto se comen una parte del día que en esta agencia está
documentada como significativa. El factor propuesto está en
[`references/criterios-y-capacidad.md`](references/criterios-y-capacidad.md). Planificar al 100% de
la jornada es la causa mecánica del incumplimiento.

## Fase 1 — Clasificar antes de ordenar

Cada solicitud recibe una etiqueta. El orden sale de la etiqueta, no del tono con que se pidió.

| Clase | Criterio objetivo | Efecto |
|---|---|---|
| **Compromiso contractual** | Fecha de salida pactada, entregable del contrato, pauta con presupuesto corriendo | Entra primero. No es negociable dentro de la mesa. |
| **Bloqueante de terceros** | Alguien más está parado esperando esto | Sube: desbloquear 3 horas ajenas vale más que avanzar 1 propia. |
| **Ventana que se cierra** | Pierde valor si no se hace hoy (fecha, evento, saldo por agotarse) | Entra o se descarta explícitamente; no se posterga. |
| **Mejora / interno** | Valioso, sin fecha externa | Entra solo con capacidad sobrante. |
| **Fuera de alcance** | No está en el contrato ni en la parrilla aprobada | **No se prioriza: se deriva** a `scope-change-handler`. |

**El "urgente" del solicitante no es una clase.** Se registra quién lo marcó urgente y por qué, pero
no ordena. Si más de la mitad de la cola llega marcada urgente, el skill lo dice en el encabezado y
fuerza un ranking entre esas — porque un equipo donde todo es urgente ya perdió la capacidad de
priorizar y ese hallazgo importa más que la cola del día.

## Fase 2 — Ordenar

Dentro de cada clase, el desempate es en este orden y sin excepciones:

```
1. Costo de retrasarlo    ¿qué se rompe mañana? (campaña que no sale > pieza que se corre)
2. Dinero en juego        cuenta con pauta activa corriendo > cuenta en pausa
3. Trabajo ajeno liberado cuántas personas se destraban
4. Esfuerzo               a igualdad de todo lo anterior, primero lo corto
```

**El esfuerzo va último, no primero.** Despachar lo corto primero se siente productivo y es
exactamente cómo lo importante se cae del día. La única excepción: si algo toma menos de 15 minutos y
destraba a otra persona, se hace ya y no ocupa lugar en la cola.

**Límite de trabajo en curso.** Máximo 2 ítems simultáneos por persona. Una cola de 6 asignada a una
sola persona "en paralelo" no es capacidad, es una fila con más pasos intermedios.

## Fase 3 — Cortar

Acumular esfuerzo estimado contra capacidad hasta llenarla. Todo lo que queda debajo de la línea **es
el corte**, y va con nombre, razón y salida:

```
─────────── LÍNEA DE CAPACIDAD: 6.5h de 6.5h disponibles ───────────
```

Por cada ítem debajo de la línea, tres campos obligatorios:

- **Qué no entra** y de qué cliente.
- **Con quién se renegocia** — nombre, no área.
- **Qué se ofrece a cambio**: fecha alternativa concreta, versión reducida, o se toma de otra mesa.

Un corte sin la tercera columna es una excusa. Con ella es una decisión de negocio que alguien puede
tomar en 30 segundos.

## Fase 4 — Escribir la cola

Una cola por persona o rol, nunca una lista global. Quien la lee ejecuta solo la suya.

```
Mesa Grupo Caminos · martes 16-ago · capacidad declarada 6.5h
14 solicitudes · 9 entran · 5 no entran · 6 marcadas "urgente" por el solicitante (43%)

DISEÑO — {nombre} · 6h disponibles
 1. Pieza #24 Forester — arte para pauta        2.5h  · contractual, sale 19-ago, tráfico necesita 48h
 2. Ajuste Suzuki Vitara (2ª devolución)        1.0h  · bloqueante: medios está esperando el material
 3. Banner home Andinautos                      2.0h  · ventana: promo arranca el jueves
 ─────────── LÍNEA DE CAPACIDAD: 5.5h de 6h ───────────
 4. Rediseño de plantilla mensual               3.0h  · mejora interna
    → No entra hoy ni mañana. Renegociar con {director de cuenta}: se corre a la semana del 25
      o entra si se libera el rediseño de plantilla de otra mesa.
 5. Piezas orgánicas Greyman (4)                4.0h  · contractual, sale 22-ago
    → ⚠️ No entra en la capacidad de esta semana. Es compromiso contractual: esto NO se posterga
      en silencio. Decisión hoy con {dirección de cuentas}: reasignar, reducir a 2 piezas, o
      avisar corrimiento al cliente.
```

**Cuando lo que no entra es contractual, el corte cambia de tono y sube de destinatario.** No es un
"no alcanzamos": es un incumplimiento que todavía se puede evitar y necesita decisión hoy. Ese es el
único caso en que el skill escala por encima de la mesa.

Si todo entra con holgura, decirlo: "9 solicitudes, 4.5h de 6.5h, queda margen para 2h de imprevistos"
es un output válido. Y si la cola entra completa tres días seguidos, la capacidad declarada
probablemente esté subestimada — reportarlo.

---

## Lo que queda fuera sale con recomendación, no como lista

La v1.0 marcaba lo que no entraba y con quién renegociarlo. Eikon pidió un paso más: *"debería quedar
visible si una solicitud quedó fuera de la capacidad disponible **y qué decisión se recomienda
tomar**."*

La diferencia es quién carga con el problema. Una lista de descartes le deja la decisión al director
de cuenta sin insumo; una recomendación le deja la decisión con una opción por default.

Cada ítem cortado sale así:

```
FUERA DE LA COLA
  Pieza extra Andinautos — pedida ayer, sin fecha comprometida
    Por qué no entra:  la mesa está al 110%, y las 3 de Subaru tienen fecha con cliente
    Recomendación:     mover a la semana próxima — nadie la está esperando hoy
    Con quién:         Daniela (dirección de cuenta)

  Ajuste de parrilla Greyman — comprometido para hoy
    Por qué no entra:  entró después de que la cola se cerró
    Recomendación:     renegociar fecha hoy, no mañana — hay compromiso con cliente
    Con quién:         Daniela, antes de las 11am
```

**La recomendación siempre es una de cuatro:** mover de fecha, reasignar dentro de la mesa,
renegociar con el cliente, o convertir en proyecto aparte que se cotiza. Nunca "priorizar mejor".

Si el corte afecta algo con fecha comprometida con cliente, la recomendación lleva **hora límite**:
renegociar a las 9am y a las 5pm no son la misma conversación.

## Flexibilidad contra la carga que ya cursa

Eikon marcó que la cola no puede calcularse como si la mesa arrancara vacía cada mañana. Antes de
ordenar, el skill descuenta **lo que ya está en curso y no se puede parar**: piezas en producción,
material en revisión de cliente, entregas de tráfico dentro del SLA de 48h.

La capacidad disponible del día es la capacidad nominal **menos** esa carga heredada. Un priorizador
que reparte el 100% todos los días produce una cola que se incumple sola y entrena al equipo a
ignorarla.

## Cómo se ordena: matriz declarada, no criterio implícito

La v1.0 ordenaba por urgencia contractual, impacto y esfuerzo sin nombrar el método. Eikon pidió que
el criterio sea explícito y elegible, porque distintas mesas trabajan distinto. Se declara **una**
matriz por corrida y se dice cuál se usó:

| Matriz | Cuándo sirve | Ejes |
|---|---|---|
| **Eisenhower + impacto** (default) | Cola diaria de una mesa | Urgencia × importancia × impacto en cliente |
| **MoSCoW** | Alcance de un mes o de un proyecto | Must / Should / Could / Won't |
| **ICE** | Cuando hay que elegir entre iniciativas, no tareas | Impacto × confianza × esfuerzo |
| **1-3-5** | Días saturados, para forzar foco | 1 grande, 3 medianas, 5 chicas |

La cola declara arriba con cuál se ordenó. Dos personas que ordenan la misma cola con matrices
distintas obtienen resultados distintos, y eso tiene que quedar a la vista.

**Dimensionamiento estandarizado de tiempos.** El esfuerzo no se estima a ojo cada vez: sale de la
tabla de tiempos por tipo de tarea y por perfil que Eikon mantiene. Mientras esa tabla no exista, el
skill usa el estimado de quien pide y **lo marca como estimado sin respaldo** — que es el estado
actual y hay que decirlo.

## Reglas duras

1. **No reasigna personas ni negocia con otra mesa.** Nombra a quién le corresponde decidirlo.
2. **No mueve fechas comprometidas con el cliente.** Detecta que no se cumplen y escala.
3. **No responde solicitudes ni le avisa al cliente.** La conversación es humana.
4. **No prioriza lo que está fuera de alcance.** Lo deriva a `scope-change-handler`; meterlo en la
   cola es cómo se regala trabajo no cotizado.
5. **No usa números inventados.** Todo esfuerzo estimado por el skill va marcado como estimado.

## Criterios de calidad

- Hay una línea de capacidad visible y hay ítems debajo de ella.
- Cada ítem del corte tiene con quién renegociar y qué ofrecer.
- Cada ítem que entra tiene el criterio que lo puso ahí, en una línea.
- La cola está partida por persona, no por cliente.
- Los compromisos contractuales que no entran están escalados, no listados.
- **Test del corte:** si el output no incomoda a nadie, no priorizó. Priorizar es decidir qué no se
  hace, y eso siempre tiene un dueño que se entera.

## ⚠️ Supuestos pendientes de validación

- **El factor de capacidad efectiva y los rangos de esfuerzo por tipo de pieza son propuestos**
  (ver `references/criterios-y-capacidad.md`). Se calibran con las dos primeras semanas de uso real,
  comparando estimado contra ejecutado.
- **La capacidad por persona no existe hoy en ningún sistema.** Mientras se declare a mano en cada
  corrida, la calidad de la cola depende de la honestidad de ese número. La alternativa —derivarla de
  la planilla de seguimiento— requiere que la planilla esté estandarizada, que no lo está.
- El límite de 2 ítems en curso por persona es una convención de industria, no un acuerdo de Eikon.
- **Este skill es de la Ola 1.5**, que no pasó el gate de gerencia. Construido para desbloquear
  `eikon-pulso-semanal` y `eikon-parrilla-a-entrega`; ratificar alcance con dirección general de
  cuentas antes del piloto.
