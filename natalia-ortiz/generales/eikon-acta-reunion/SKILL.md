---
name: eikon-acta-reunion
description: 'Convierte la transcripción o las notas de una reunión de Eikon en acta accionable, separando siempre tres cosas que no son lo mismo: decisiones confirmadas, propuestas sin cerrar y temas pendientes. Cada compromiso sale con responsable, fecha y la cita textual que lo respalda, y con su nivel de certeza declarado. USA después de un comité, un kickoff o una reunión de cuenta. NO convierte una interpretación en compromiso oficial: eso lo confirma una persona.'
metadata:
  version: 1.0.0
  empresa: Eikon Digital
  tipo: skill de Eikon
  entrega: equipo de contenido (2026-10-07)
---

# eikon-acta-reunion

Produce el acta **separando lo que se decidió de lo que se propuso y de lo que quedó abierto**.

**El problema que resuelve.** Las actas se hacen a mano y llegan tarde o no llegan, y el resultado lo
describió gerencia general: *"el equipo se salta procesos, se saltan las fechas de entrega y esto
hace que tengamos reprocesos"*. Sin acta, lo que se acordó depende de quién lo recuerde.

**La distinción que gobierna el skill** la pidió Eikon en la revisión del 28-ago: *"diferenciar
decisiones confirmadas, propuestas y temas pendientes. O en qué momento las decisiones, responsables
y fechas extraídas pasan de ser una interpretación del transcript a considerarse compromisos
oficiales, porque a veces no es tan preciso."*

Es la observación correcta y es el riesgo central de este tipo de skill: **una transcripción no
distingue entre "hagamos X" dicho como idea y "hagamos X" dicho como decisión.** El tono, la pausa y
el asentimiento de los demás no quedan en el texto.

---

## Las tres categorías

| Categoría | Qué la define | Cómo sale al acta |
|---|---|---|
| **Decisión confirmada** | Alguien la enunció **y** hubo cierre explícito: acuerdo verbal, asignación de responsable, o nadie objetó tras plantearse como resolución | Con responsable, fecha y cita |
| **Propuesta** | Se planteó y **no se cerró**. Se discutió, quedó en el aire, o se dijo "lo vemos" | Con quién la propuso y qué falta para decidirla |
| **Tema pendiente** | Se mencionó y no se discutió. Quedó anotado | Solo enunciado, sin responsable |

**Ante la duda, baja de categoría.** Una propuesta registrada como decisión hace que alguien crea que
tiene luz verde. Una decisión registrada como propuesta se corrige en la revisión del acta, que es un
costo mucho menor.

## El umbral de "compromiso oficial"

La pregunta que hizo Eikon merece una regla explícita, no un criterio implícito.

**Nada de lo que produce este skill es un compromiso oficial hasta que alguien de la reunión lo
confirma.** El acta sale marcada como **borrador** y con un bloque de confirmación arriba:

```
⚠️ ACTA EN BORRADOR — extraída de transcripción, sin confirmar.
   Confirma: {quien convocó}
   Hasta entonces, las 4 decisiones de abajo son interpretaciones del audio,
   no compromisos adquiridos.
   3 de ellas tienen certeza alta · 1 tiene certeza media y está marcada.
```

Al confirmarse, el acta cambia de estado y **recién ahí** sus compromisos alimentan
`eikon-estado-cuenta` y `eikon-priorizador-dia`. Un acta sin confirmar no genera tareas: genera una
pregunta.

## Certeza por ítem

Cada decisión declara con qué evidencia se extrajo:

| Certeza | Evidencia en el transcript |
|---|---|
| **Alta** | Enunciado claro + responsable nombrado + acuerdo o ausencia de objeción |
| **Media** | Enunciado claro, responsable inferido del contexto, sin cierre explícito |
| **Baja** | Se infiere de una conversación ambigua o de audio dudoso |

**La certeza baja no se promueve a decisión.** Va a propuestas, con la cita, para que alguien
resuelva.

## Fase 1 — Leer con el contexto de la reunión

Antes de extraer: qué tipo de reunión fue (comité, kickoff, cuenta, interna), quiénes estaban y con
qué rol, y qué se esperaba resolver. Sin eso, no se puede juzgar si alguien tenía autoridad para
decidir lo que dijo.

**Una decisión tomada por quien no puede tomarla es una propuesta.** Si en una reunión de cuenta
alguien compromete presupuesto que aprueba gerencia, eso no es decisión: es propuesta, aunque haya
sonado como orden.

## Fase 2 — Extraer con cita

Todo ítem lleva la **cita textual** que lo respalda. Es lo que permite resolver un desacuerdo sobre el
acta sin volver a escuchar la grabación completa.

```
DECISIÓN 2 · certeza alta
  Qué:          la parrilla de octubre se entrega el 20-sep, no el 25
  Responsable:  Kimberly (social media)
  Fecha:        20-sep-2026
  Cita:         "listo, la subimos al 20 para que alcancen a revisarla
                 antes del puente" — Daniela, 14:32
  Acuerdo:      Kimberly confirma en 14:35

PROPUESTA 1 · sin cerrar
  Qué:          sumar TikTok a la cuenta desde noviembre
  Propuso:      Óscar
  Qué falta:    presupuesto y confirmación del cliente
  Cita:         "podríamos meter TikTok, ¿no? lo miramos" — Óscar, 14:41
  ⚠️ No se retomó en el resto de la reunión.
```

## Fase 3 — Escribir

Estructura: bloque de confirmación · decisiones · propuestas · pendientes · compromisos con fecha
ordenados cronológicamente · quiénes estaban · qué no se resolvió.

**El bloque "qué no se resolvió" es obligatorio.** Una reunión que termina sin resolver lo que
convocaba es un dato, y desaparece si el acta solo lista lo que sí se decidió.

---

## Reglas duras

1. **No convierte una interpretación en compromiso oficial.** El acta sale en borrador y la confirma
   una persona.
2. **Ante la duda, baja de categoría.**
3. **Todo ítem lleva cita textual.**
4. **Toda decisión declara su certeza.**
5. **Certeza baja no puede ser decisión.**
6. **Una decisión tomada por quien no tiene autoridad es una propuesta.**
7. **No inventa responsables ni fechas.** Si no se dijeron, el campo queda vacío y se marca.
8. **Un acta sin confirmar no genera tareas** en los skills de operación.
9. **No incluye comentarios personales, evaluaciones de desempeño ni conversación fuera de agenda.**

## Criterios de calidad

- Las tres categorías están separadas y ninguna mezcla ítems de otra.
- Toda decisión tiene responsable, fecha y cita, o declara cuál falta.
- El bloque de confirmación está arriba y dice quién confirma.
- El bloque de lo no resuelto existe.
- Ninguna propuesta quedó registrada como decisión.
- Las citas son textuales, con marca de tiempo cuando la hay.

## ⚠️ Supuestos pendientes de validación

- **De dónde salen los transcripts.** Hoy las reuniones son en Meet y no hay proceso de grabación ni
  transcripción declarado. Sin ese insumo, el skill trabaja sobre notas manuales, que traen menos
  literalidad y por lo tanto menos certeza alta.
- **Quién confirma el acta por tipo de reunión** no está definido. Propuesta: quien convocó.
- **La retención de los transcripts** toca datos sensibles cuando la reunión trata presupuesto,
  personal o condiciones comerciales. Hay que definir qué se guarda y por cuánto tiempo antes de
  correr esto de forma sistemática.
