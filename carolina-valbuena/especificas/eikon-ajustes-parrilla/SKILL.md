---
name: eikon-ajustes-parrilla
description: Toma el feedback del cliente sobre la parrilla y lo aplica de forma consistente en TODAS las piezas afectadas, no solo en la que se comentó, distinguiendo el ajuste puntual del criterio permanente y dejando changelog trazable. Detecta lo que es cambio de alcance y lo deriva en vez de absorberlo. USA cuando el cliente devuelve la parrilla con comentarios, ante ajustes de último momento o al cerrar la ronda de revisión del mes. NO aprueba, no publica y no le responde al cliente.
metadata:
  version: 1.1.0
  empresa: Eikon Digital
  tipo: skill de Eikon
  entrega: equipo de contenido (2026-10-07)
---

# eikon-ajustes-parrilla

El valor no está en aplicar el cambio: está en **aplicarlo donde el cliente no lo señaló**.

**El problema que resuelve.** El content manager lo describió exacto: *"todas las semanas realizar los
ajustes de grilla que envíe el cliente… envía ajustes sobre uno o dos contenidos y tener que
aplicarlos a cada uno"*. Hoy el criterio se aplica solo en la pieza comentada, las otras cinco que
tienen el mismo error pasan igual, y el mes siguiente el cliente vuelve a señalar lo mismo. Cada
ronda de feedback se paga dos veces.

**La regla de diseño:** todo comentario del cliente se clasifica primero como **puntual** o
**criterio**. Un puntual toca una pieza. Un criterio toca todas las que comparten la condición —
incluidas las de los meses que vienen. Confundirlos es lo que produce el bucle.

**Y el criterio no muere en esta parrilla.** Si se aplicó a seis piezas de agosto y no quedó escrito
en la ficha de marca, en septiembre vuelve a aparecer. El changelog alimenta `eikon-brand-context`;
sin ese paso, este skill es un buscar-y-reemplazar caro.

---

## Fase 1 — Clasificar cada comentario

Uno por uno. Nada se aplica antes de estar clasificado.

| Clase | Cómo se reconoce | Alcance |
|---|---|---|
| **Puntual** | Habla de esa pieza y de nada más ("cambiá la foto del post del 12") | 1 pieza |
| **Criterio** | Enuncia una preferencia general, aunque se diga sobre una pieza ("no me gusta que empiece con pregunta") | Todas las que cumplen la condición, este mes y los siguientes |
| **Corrección de dato** | Un hecho está mal (precio, fecha, nombre, cifra) | Todas las piezas donde aparece el dato **y** verificación de dónde más se publicó |
| **Cambio de alcance** | Pide algo que no está en la parrilla aprobada ni en el contrato | 0 piezas: se deriva |
| **Ambiguo** | No se puede clasificar sin preguntar | 0 piezas: se pregunta |

**El caso que más cuesta es el criterio disfrazado de puntual.** "Este copy me quedó muy largo" casi
nunca es sobre ese copy. La prueba es simple: si el comentario se puede reescribir como regla sin
nombrar la pieza, es criterio. Ante la duda, se propone como criterio y se pregunta —el costo de
preguntar es un mensaje; el de no preguntar es la ronda del mes que viene.

**Los ambiguos nunca se resuelven con la mejor interpretación.** Van a una lista de preguntas al
final, agrupadas para hacer una sola consulta al cliente y no cinco.

### De dónde vino el comentario

Eikon marcó lo que la v1.0 daba por resuelto: *"considerar la fuente de los ajustes, ya que muchas
piezas son aprobadas y ajustadas vía WhatsApp una por una."*

No es un detalle de registro. **La parrilla comentada en bloque y el chat que ajusta pieza por pieza
producen feedback de distinta calidad**, y tratarlos igual es lo que hace que un criterio permanente
dicho al pasar en un chat se pierda, o que un comentario suelto se propague como si fuera regla.

| Fuente | Qué suele traer | Cómo se trata |
|---|---|---|
| **Documento de parrilla comentado** | Feedback ordenado, pieza por pieza, con contexto | Se procesa completo |
| **Correo** | Criterio general, a veces con adjunto de referencia | Se procesa completo; el criterio general es candidato a permanente |
| **WhatsApp, pieza por pieza** | Ajuste puntual, urgente, sin contexto | **Se procesa y se marca `fuente: whatsapp`.** Antes de propagarlo como criterio permanente hay que confirmarlo |
| **Comentario en reunión / acta** | Criterio permanente casi siempre | Se procesa; se cita el acta |
| **Verbal sin registro** | — | **No se procesa.** Se pide que quede por escrito |

**La regla que sale de esto: un ajuste de WhatsApp nunca se promueve a criterio permanente sin
confirmación explícita.** Se aplica a la pieza que se pidió, se propaga a las piezas afectadas como
ajuste puntual, y queda en la lista de "candidatos a criterio" para que la mesa lo confirme. Un
mensaje de chat un domingo no puede reescribir el manual de la marca en silencio.

Todo comentario entra con: **fuente · quién lo dijo · fecha y hora · enlace o captura**. Sin quién y
sin cuándo, dos comentarios contradictorios no se pueden resolver — y se contradicen seguido.

### Checklist de cumplimiento por pieza

Antes de aplicar el ajuste, cada pieza afectada pasa por el checklist contra lo que Eikon nombró:
**lineamientos de marca, brandbook y el KV de campaña.** Los tres, no uno.

| # | Verifica | Sale de |
|---|---|---|
| 1 | Paleta, tipografía y uso de logo | Brandbook, vía `eikon-brand-context` |
| 2 | Tono y vocabulario, incluida la lista de nunca-decir | `eikon-brand-context` |
| 3 | Coherencia con el KV de la campaña vigente | Brief de campaña |
| 4 | Restricciones legales y de oferta (letra chica, vigencias, disclaimers) | `eikon-brand-context` |
| 5 | Specs de formato y tamaño por plataforma | `eikon-brief-creativo` |
| 6 | El ajuste pedido no rompe 1 a 5 | — |

**El punto 6 es el que importa.** Un cliente puede pedir un ajuste que viola su propio brandbook —
pasa seguido con colores y con letra chica. El skill aplica el ajuste **y marca el conflicto**; no lo
resuelve por su cuenta ni lo silencia. La decisión es de la mesa con el guardián de marca.

## Fase 2 — Propagar

Para cada criterio, barrer **toda la parrilla vigente** y listar las piezas que cumplen la condición,
incluidas las que ya están aprobadas o publicadas.

```
CRITERIO: "no abrir con pregunta retórica"
  Aplica a 6 piezas de agosto:
    #12  por diseñar     → se ajusta ahora
    #18  en diseño       → se ajusta ahora, avisar a diseño antes de que avance
    #21  con cliente     → ⚠️ ya enviada; consultar si se retira o se deja
    #27  aprobada        → ⚠️ decisión de cuenta: rehacer cuesta 1h y una fecha
    #04  publicada       → no se toca; se registra para no repetirlo
    #31  septiembre      → se aplica al armar la parrilla del mes
```

Tres reglas de propagación:

1. **Lo publicado no se retoca.** Se registra y punto. Reeditar un post publicado por un criterio
   estético cuesta más de lo que corrige.
2. **Lo que ya está con el cliente o aprobado no se cambia en silencio.** Va como decisión al director
   de cuenta con el costo al lado (tiempo y fecha). Cambiar una pieza aprobada sin avisar es cómo se
   rompe la confianza del cliente en el flujo de aprobación.
3. **El criterio se proyecta al mes siguiente**, no solo al vigente. Es el único paso que corta el
   bucle.

## Fase 3 — Costear el ajuste

No todos los cambios cuestan lo mismo y la mesa necesita saberlo antes de comprometer:

| Tipo de cambio | Qué implica | Costo típico |
|---|---|---|
| Solo copy | Se edita el texto, la pieza no se toca | minutos |
| Copy dentro de la pieza | Diseño tiene que reabrir el archivo | 0.25 – 0.5h |
| Cambio de foto o recurso | Búsqueda + reemplazo + revisión | 0.5 – 1h |
| Rediseño | Concepto o composición distinta | 1 – 3h |
| Pieza nueva | No es ajuste | ver `eikon-brief-creativo` |

El total en horas va al encabezado del output y se cruza con la capacidad del día vía
`eikon-priorizador-dia`. **Una ronda de ajustes que no entra en la capacidad no es "urgente": es una
renegociación de fecha**, y hay que decirlo el mismo día en que llega el feedback, no cuando se vence.

## Fase 4 — Detectar el cambio de alcance

Lo que el cliente pide y no está en la parrilla aprobada ni en el contrato **no se hace por buena
voluntad**. Se marca y se deriva a `scope-change-handler`.

Señales de que un "ajuste" es en realidad alcance nuevo:
- Cambia el objetivo o el formato de la pieza, no su ejecución.
- Agrega piezas, plataformas o adaptaciones que no estaban.
- Pide una tercera ronda de cambios sobre la misma pieza.
- Requiere producción (foto, video, desarrollo) que no estaba prevista.

**La tercera ronda merece regla propia.** Dos rondas es revisión normal; a partir de la tercera hay un
problema de brief o de expectativa, y absorberlo en silencio es exactamente cómo una cuenta rentable
deja de serlo. Se registra y pasa como señal a `eikon-salud-cuenta`.

## Fase 5 — Changelog con versión y trazabilidad

El output tiene dos partes y las dos son obligatorias.

```
AJUSTES PARRILLA · Grupo Caminos / Subaru · agosto · recibido 15-ago
9 comentarios → 4 puntuales · 2 criterios · 1 corrección de dato · 1 fuera de alcance · 1 pregunta
Impacto: 11 piezas afectadas · 4.5h estimadas · 2 requieren decisión de cuenta

CAMBIOS APLICADOS
  #12  copy      criterio "no abrir con pregunta"     origen: comentario 3    aplicado
  #18  copy      criterio "no abrir con pregunta"     origen: comentario 3    aplicado
  #14  foto      puntual                              origen: comentario 1    aplicado
  #09  dato      precio 89.900 → 92.400               origen: comentario 6    aplicado + verificado
                 ⚠️ el precio viejo también salió en la pieza #04 (publicada 08-ago)

REQUIEREN DECISIÓN
  #21  ya con el cliente — retirar y reenviar, o dejar
  #27  aprobada — rehacer cuesta 1h y corre la fecha al 21-ago

NO SE HACE ACÁ
  "¿Podemos sumar dos reels de la promo?" → fuera de parrilla aprobada → scope-change-handler

PREGUNTAS AL CLIENTE (una sola consulta)
  1. El criterio de no abrir con pregunta, ¿aplica también a stories o solo a feed?

A FICHA DE MARCA (eikon-brand-context)
  + "No abrir copys con pregunta retórica"          fuente: feedback cliente 15-ago
  + "Precio vigente Forester: 92.400"               fuente: corrección cliente 15-ago
```

**El bloque final es el que hace que este skill valga la pena.** Sin él, el criterio se aplica hoy y
se pierde. Con él, la parrilla de septiembre ya nace corregida.

**El dato corregido se persigue fuera de la parrilla.** Un precio mal no está solo en las piezas del
mes: puede estar en la web, en una campaña corriendo y en una pieza ya publicada. El changelog marca
dónde más buscar aunque este skill no lo pueda verificar.

---

## Reglas duras

1. **No responde al cliente.** Prepara las preguntas agrupadas; el envío es humano.
2. **No aprueba ni publica.** Ni siquiera los cambios que aplicó.
3. **No toca piezas ya publicadas.** Las registra.
4. **No cambia piezas aprobadas o en manos del cliente sin decisión explícita** del director de cuenta.
5. **No absorbe alcance nuevo.** Lo deriva, con nombre.
6. **No interpreta un comentario ambiguo.** Pregunta.

## Criterios de calidad

- Cada comentario tiene clase asignada y ninguna quedó sin clasificar.
- Cada criterio muestra **todas** las piezas donde aplica, con su estado.
- Las piezas aprobadas o enviadas aparecen como decisión, no como cambio hecho.
- El impacto en horas está calculado y cruzado con capacidad.
- El bloque hacia `eikon-brand-context` no está vacío cuando hubo al menos un criterio.
- **Test del mes siguiente:** si el mismo comentario del cliente reaparece en la próxima parrilla, este
  skill falló, aunque haya aplicado los nueve cambios correctamente.

## ⚠️ Supuestos pendientes de validación

- La regla de "tercera ronda = alcance" es una propuesta; el umbral se acuerda con dirección de
  cuentas y debería quedar escrito en el contrato, no solo en el skill.
- Los costos por tipo de cambio salen de los rangos sin calibrar de
  `references/criterios-y-capacidad.md` de la skill `eikon-priorizador-dia`.
- **Depende de `eikon-brand-context`** para persistir los criterios. Si la ficha de marca no está en
  uso, el bucle no se corta: dejar constancia en el output cuando ese destino no exista todavía.
- **Este skill es de la Ola 2, que sí requiere gate de gerencia.** Se construyó fuera de orden para
  desbloquear `eikon-parrilla-a-entrega`. Validar con Ana María Estrada y con el dueño del área
  (social media / content) antes de instalarlo.
