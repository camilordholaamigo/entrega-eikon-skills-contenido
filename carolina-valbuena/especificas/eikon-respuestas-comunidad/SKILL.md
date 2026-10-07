---
name: eikon-respuestas-comunidad
description: 'Procesa los comentarios y mensajes que llegan a las redes de una marca de Eikon: los tipifica, redacta el borrador de respuesta en voz de marca, direcciona a canal privado lo que es PQR o dato personal, y escala lo que necesita criterio comercial o legal. Produce además el reporte diario de conversación por tipo y por marca. USA en el barrido de la mañana, ante un pico de menciones o al cerrar el reporte del día. NO publica respuestas: el envío lo hace una persona.'
metadata:
  version: 1.0.0
  empresa: Eikon Digital
  tipo: skill de Eikon
  entrega: equipo de contenido (2026-10-07)
---

# eikon-respuestas-comunidad

Convierte la bandeja de comentarios en **respuestas listas para revisar y un reporte que dice qué
está pasando**.

**El problema que resuelve.** Es el servicio que Eikon presta a cuentas como Greyman Ecuador —social
media más servicio al cliente en canales digitales— y hoy se hace mensaje por mensaje, sin
tipificación y sin registro consultable. Cuando alguien pregunta *"¿de qué se está quejando la
gente?"*, la respuesta sale de la memoria de quien atendió.

**Absorbe la propuesta "Reporte de PQRS"** que Eikon hizo en la revisión del 28-ago. No son dos
skills: el mismo barrido que tipifica produce el reporte.

**Lo que NO hace:** publicar. Regla 5 de `CONTEXT.md` — *"respuestas a clientes que requieren criterio
comercial o validación con otra área: se genera borrador; el envío es humano."*

---

## Fase 1 — Tipificar antes de responder

La tipificación es lo que convierte mensajes sueltos en información. Se asigna **una** categoría
primaria por mensaje:

| Tipo | Qué es | Ruta |
|---|---|---|
| **Consulta comercial** | Precio, disponibilidad, dónde comprar | Borrador + derivar a comercial del cliente |
| **Consulta de producto** | Cómo funciona, especificaciones | Borrador con dato verificado |
| **PQR** | Petición, queja o reclamo sobre un caso concreto | **A canal privado, siempre** |
| **Crisis potencial** | Puede escalar, involucra a terceros o a la marca | **Escala inmediata, no se responde** |
| **Elogio** | Comentario positivo | Borrador breve |
| **Troll o spam** | Sin intención genuina | No se responde; se registra |
| **Fuera de alcance** | No es sobre la marca | Se registra |

**Toda PQR va a ambiente privado.** Lo pidió Eikon explícitamente y además lo exige el manejo de datos
personales: un reclamo que menciona una cédula, un número de orden o un caso concreto no se resuelve
en un hilo público. La respuesta pública es la invitación al privado, nunca la solución.

**Crisis no se responde: se escala.** Si el mensaje involucra un accidente, una acusación, un tema
legal, un medio o una persona con audiencia, el skill no redacta borrador. Marca y avisa. Un borrador
bienintencionado en una crisis es cómo una crisis se duplica.

## Fase 2 — Capacidad resolutiva

Eikon marcó que hay que *"validar capacidad resolutiva por integración con sistemas informativos"*.
Traducido: **antes de prometer una respuesta hay que saber si tenemos el dato.**

Por cada consulta, se declara el nivel:

| Nivel | Significa | Qué hace el borrador |
|---|---|---|
| **Resoluble** | El dato está en la ficha de marca o en el material aprobado | Responde |
| **Resoluble con consulta** | El dato existe pero lo tiene el cliente | Acusa recibo y consulta internamente |
| **No resoluble** | Nadie lo tiene, o requiere sistema al que no accedemos | Deriva, con destino nombrado |

**Nunca se inventa una respuesta para no dejar el comentario sin contestar.** Un precio equivocado o
una disponibilidad inventada en un comentario público es un problema comercial del cliente, no un
error de redacción. Es el fallo más caro de este skill y el más tentador.

## Fase 3 — Redactar

En voz de marca, desde `eikon-brand-context`. Sin ficha, el skill responde solo lo que es puramente
operativo (acuse de recibo, derivación a privado) y marca el resto como pendiente de tono.

Reglas de la respuesta pública: breve, sin jerga corporativa, sin pedir disculpas genéricas cuando no
se sabe qué pasó, y sin prometer plazos que no controlamos.

## Fase 4 — El reporte del día

```
CONVERSACIÓN · Greyman Ecuador · 3-sep-2026 · 47 mensajes

POR TIPO
  Consulta comercial   18    ↑ 6 vs. media
  Consulta producto    11
  PQR                   9    ↑ 4 vs. media   ⚠
  Elogio                5
  Troll / spam          3
  Fuera de alcance      1

PQR — LOS 9, POR ASUNTO
  Demora de entrega        6   ← concentración, no es aleatorio
  Producto con falla       2
  Cobro                    1

⚠️ SEÑAL: 6 PQR por demora de entrega en un día. La media es 1.
   No es un problema de comunidad: es un problema de operación del cliente.
   Escalado a la mesa de cuenta.

ESCALADOS      1 (posible crisis — mención de medio local)
SIN RESPONDER  3 (no resolubles: esperan dato del cliente)
```

**El bloque de concentración es el que da valor.** Nueve PQR sueltas son gestión; seis por el mismo
motivo son un hallazgo que la agencia le debe a su cliente. Es exactamente lo que hoy se pierde
cuando cada mensaje se atiende y se olvida.

---

## Reglas duras

1. **No publica ni envía.** Genera borradores; el envío es humano (regla 5 de `CONTEXT.md`).
2. **Toda PQR se direcciona a canal privado.** Nunca se resuelve un caso concreto en público.
3. **Una crisis potencial no recibe borrador.** Se escala.
4. **No inventa datos** de precio, disponibilidad, plazo o especificación.
5. **No toca datos personales** de quien escribe: no los copia al reporte ni al borrador.
6. **No promete plazos que dependen del cliente.**
7. **Todo mensaje queda tipificado**, incluso el que no se responde.
8. **Declara el nivel de capacidad resolutiva** de cada consulta.

## Criterios de calidad

- Ningún mensaje quedó sin tipificar.
- Ninguna PQR tiene borrador de respuesta pública que intente resolverla.
- Las concentraciones por asunto están detectadas y comparadas contra la media.
- Los no resolubles dicen quién tiene el dato.
- Ningún borrador contiene un dato sin fuente.
- El reporte distingue lo que es problema de comunidad de lo que es problema de operación del cliente.

## ⚠️ Supuestos pendientes de validación

- **La taxonomía de siete tipos es propuesta.** Greyman opera con Glaxys para servicio al cliente;
  si esa herramienta ya tiene tipificación, se adopta la suya y no se inventa una paralela.
- **Los umbrales de concentración** (hoy: 3× la media diaria del asunto) no están calibrados. Hacen
  falta dos semanas de barrido real.
- **El SLA de respuesta por tipo y por cuenta** no está declarado en ningún contrato que hayamos
  visto. Es lo primero que habría que confirmar con las mesas.
