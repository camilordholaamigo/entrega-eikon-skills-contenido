---
name: eikon-brief-creativo
description: 'Convierte un requerimiento del ejecutivo de cuenta o una pieza de la parrilla en un brief de diseño ejecutable de una página: objetivo, público, mensaje, formatos y tamaños exactos por plataforma, lineamientos y prohibiciones de marca, referencias, URL destino verificada, fechas y cadena de aprobación. Bloquea el brief incompleto en vez de mandarlo a diseño. USA al bajar la parrilla aprobada a producción, ante un requerimiento nuevo o antes de pasar material a medios. NO genera arte final ni piezas: eso lo firma un humano.'
metadata:
  version: 1.1.0
  empresa: Eikon Digital
  tipo: skill de Eikon
  entrega: equipo de contenido (2026-10-07)
---

# eikon-brief-creativo

Corta el reproceso más caro de la agencia: el que ocurre **después** de que la pieza está diseñada.

**El problema que resuelve.** Medios reporta devoluciones *"porque se mandó mal el material, porque
mandaron mal una URL destino… cada plataforma maneja un tamaño específico"*. Diseño pide
*"estandarización de recursos y lineamientos de marca"*. Las dos quejas son la misma: el brief viaja
en la cabeza del ejecutivo y llega incompleto. Una pieza mal briefeada se detecta cuando ya se
diseñó, y entonces cuesta dos veces: el rediseño y la fecha.

**La regla de diseño:** los tamaños, los formatos y las especificaciones **no salen de la memoria de
nadie**. Salen de [`references/especificaciones-formatos.md`](references/especificaciones-formatos.md).
Si el brief no puede completar una spec desde la referencia, se detiene y lo dice; no la aproxima.

**Un brief bloqueado hoy es más barato que una devolución el jueves.** Ese es todo el argumento.

---

## Fase 0 — Contexto de marca, o no hay brief

El brief hereda la voz, los lineamientos y las prohibiciones de la marca desde `eikon-brand-context`.
**Si la ficha de marca no está cargada, el skill no improvisa.** Un brief sin lineamientos produce
exactamente la pieza genérica que la agencia está tratando de dejar de entregar.

Sin ficha de marca disponible: responder `⛔ SIN CONTEXTO DE MARCA`, indicar qué falta y a quién
pedírselo. Se permite continuar solo si el usuario lo fuerza explícitamente, y en ese caso el brief
sale marcado `⚠️ SIN LINEAMIENTOS VERIFICADOS` en el encabezado, para que diseño sepa que va a
trabajar sin red.

## Fase 1 — Gate de completitud

Ocho campos. Si falta uno, el brief no sale.

| # | Campo | Condición para pasar |
|---|---|---|
| 1 | Objetivo | Qué tiene que lograr la pieza, en una frase con verbo (generar leads / anunciar / recordar) |
| 2 | Público | A quién le habla, con el segmento del cliente, no "público general" |
| 3 | Mensaje central | Una idea. Si hay tres, son tres piezas |
| 4 | Plataformas y ubicaciones | Feed, stories, reels, display — cada una con su spec |
| 5 | Destino | URL final **verificada** + UTM, o "sin destino" declarado |
| 6 | Obligatorios y prohibiciones | Legales, logos, disclaimers, lo que la marca no permite |
| 7 | Fechas | Fecha de salida **y** fecha de entrega interna, calculada hacia atrás |
| 8 | Aprobación | Quién aprueba internamente y quién del lado del cliente |

Ante un campo faltante:

```
⛔ BRIEF INCOMPLETO · Pieza #24 "Test drive Forester"
   Falta:   URL destino (campo 5) y disclaimer legal de financiación (campo 6)
   Dueño:   {ejecutivo de cuenta} — la URL la confirma el cliente
   Riesgo:  sin URL verificada, medios devuelve el material y se pierden 48h de SLA
```

**El campo 5 es el que más devoluciones causa y el que más se da por obvio.** Una URL que redirige,
que apunta a la home en vez del modelo, o que llega sin UTM, obliga a rehacer la implementación
completa en plataforma. Verificar que exista y que sea la correcta es parte del brief, no del tráfico.

## Fase 1.5 — Interrogar el objetivo antes de aceptarlo

El gate de completitud verifica que los campos estén. Esta fase verifica que **el objetivo tenga
sentido**, que es distinto y es donde Eikon puso el foco: el brief llega completo y apuntando al
problema equivocado.

**Cinco porqués sobre el requerimiento.** Se corre siempre, y para en cuanto la respuesta deja de
moverse:

```
"Necesitamos un carrusel de la promo de septiembre"
  ¿por qué?  porque hay que mover inventario de la gama media
  ¿por qué?  porque lleva dos meses rotando lento
  ¿por qué?  porque los leads llegan pidiendo la gama alta
  ¿por qué?  porque la comunicación del semestre se centró ahí
  → el problema no es la promo: es que la gama media no tiene demanda construida.
    Un carrusel de promo no lo resuelve. Se declara y se escala a cuentas.
```

Cuando los cinco porqués llegan a un problema que la pieza no resuelve, **el brief se emite igual con
el hallazgo declarado arriba**. No se bloquea por esto: se avisa. Quien decide cambiar el pedido es
la dirección de cuenta con el cliente, no este skill.

**Validación SMART del objetivo.** Con preguntas guía, no como checklist ceremonial:

| Criterio | Pregunta que se hace | Si falla |
|---|---|---|
| **Específico** | ¿Qué comportamiento concreto queremos del que ve la pieza? | Se propone una reformulación |
| **Medible** | ¿Con qué número sabemos si funcionó, y dónde se lee? | Se pide la métrica; si no existe, se declara no medible |
| **Alcanzable** | ¿Una pieza puede mover eso, o hace falta una campaña? | Se marca la brecha entre pedido y expectativa |
| **Relevante** | ¿Aporta al objetivo del período de la marca? | Se cruza contra la OnePage o el plan del cliente |
| **Temporal** | ¿En qué ventana se espera el resultado? | Se pide la ventana |

Un objetivo que falla en *medible* o en *alcanzable* sale con la reformulación propuesta al lado del
original. **El original nunca se borra** — el brief muestra los dos, y la mesa decide.

## Fase 1.6 — Recursos, alcance y barreras

Bloque nuevo, pedido por Eikon: el brief declara con qué se cuenta y qué lo puede frenar. Un brief
que solo dice qué hacer manda a diseño a descubrir las restricciones a mitad de camino.

| Campo | Qué lleva |
|---|---|
| **Recursos disponibles** | Material gráfico existente, banco de imágenes, fotografía de producto, video, licencias vigentes |
| **Alcance** | Cuántas piezas, cuántas versiones, cuántas rondas de ajuste entran |
| **Barreras** | Aprobación doble, restricción legal, veda, disponibilidad de vocero, material que no existe todavía |
| **Presupuesto** | Si hay producción, pauta o licencias asociadas, y quién lo aprueba |

**Las barreras son el campo que más tiempo ahorra.** Una pieza que necesita fotografía de producto que
nadie tomó no es una pieza atrasada: es una pieza imposible, y conviene saberlo antes de asignarla.

Si hay presupuesto asociado y supera el umbral de aprobación, el brief lo marca y **no lo aprueba**:
regla 4 de `CONTEXT.md`.

## Fase 2 — Calcular la fecha de entrega interna

Nunca se pregunta "¿para cuándo lo necesitás?". Se calcula hacia atrás desde la salida:

```
fecha de salida
  − 48h de implementación en pauta (SLA confirmado de tráfico, si la pieza es pagada)
  − espera de aprobación del cliente (histórico de la cuenta; el doble filtro suma)
  − 1 día de revisión interna
  − tiempo de diseño según tipo de pieza
= fecha de entrega interna del brief a la mesa
```

Si el cálculo cae **antes de hoy**, el brief sale igual pero encabezado con `🔴 FECHA IMPOSIBLE` y la
fecha realista al lado. Es la información que el ejecutivo necesita para llamar al cliente hoy y no
el jueves. En cuentas con doble filtro de aprobación —Grupo Caminos, Andinautos— la espera de
aprobación se cuenta dos veces: cliente directo y guardián de marca nacional.

## Fase 3 — Resolver las specs

Una fila por ubicación, con las medidas exactas y en píxeles. Nunca "adaptar a stories": el diseñador
no debería tener que buscar el número.

Cada fila lleva: plataforma · ubicación · dimensión en px · relación de aspecto · formato de archivo ·
peso máximo · límite de caracteres del copy en pieza · zona segura.

**La zona segura es el dato que casi nadie pone y el que más rediseños genera** — un texto que se come
la interfaz en stories o el recorte del feed obliga a rehacer la pieza completa. Si la referencia no
tiene la spec de una ubicación pedida, el brief la marca `spec no verificada` y no la inventa.

## Fase 4 — Escribir el brief

Una página. Formato fijo, sin párrafos de contexto.

```
BRIEF #24 · Grupo Caminos / Subaru · "Test drive Forester"
Salida: 19-ago  ·  Entrega interna: 14-ago  ·  Aprueba: {cuenta} → cliente directo → guardián marca

OBJETIVO      Generar solicitudes de test drive en Bogotá y Medellín
PÚBLICO       Hombres y mujeres 35-55, interés en SUV, zona metropolitana
MENSAJE       "Probá la Forester este fin de semana, sin compromiso"
TONO          {heredado de eikon-brand-context}

FORMATOS
  Meta feed        1080 × 1350   4:5    JPG   sin texto crítico en los bordes
  Meta stories     1080 × 1920   9:16   JPG   zona segura: 250px arriba / 340px abajo
  Google display   1200 × 628    1.91:1 JPG   ≤150KB (límite duro de la plataforma)
  → specs verificadas contra references/especificaciones-formatos.md (rev. {fecha})

DESTINO       https://…/forester/test-drive?utm_source=…   ✅ verificada 16-ago
OBLIGATORIOS  Logo Subaru versión horizontal · disclaimer de financiación (texto exacto adjunto)
PROHIBIDO     Nunca recortar el logo · no usar la paleta de Suzuki · no prometer precio
REFERENCIAS   {2-3 enlaces o piezas previas que funcionaron, con por qué funcionaron}
ENTREGABLES   3 piezas (feed, stories, display) + versión sin texto para adaptaciones
```

**Las referencias visuales van con la razón, no solas.** "Como esta" no es un brief; "como esta,
por el contraste del texto sobre foto de producto" sí lo es. Sin la razón, el diseñador copia lo
equivocado.

**El campo PROHIBIDO no se deja vacío.** Si la marca no tiene prohibiciones declaradas, escribir
"sin prohibiciones declaradas — verificar con el manual antes de arte final". Un campo vacío se lee
como "todo permitido" y ahí es donde aparece la devolución del guardián de marca.

---

## Reglas duras

1. **No genera la pieza.** Regla dura de Eikon: el arte final lo firma un humano. Acá se permite
   describir referencia y dirección visual, nunca producir el entregable.
2. **No inventa specs.** Si la referencia no la tiene, se marca como no verificada.
3. **No aprueba ni envía nada al cliente.**
4. **No define el mensaje sin contexto de marca.**
5. **No acepta tres mensajes en una pieza.** Devuelve la solicitud dividida en las piezas que hacen
   falta y estima el esfuerzo de cada una — el ejecutivo decide qué recorta.

## Criterios de calidad

- Los ocho campos están completos o el brief está bloqueado con el dueño nombrado.
- Todas las dimensiones están en píxeles y provienen de la referencia.
- La fecha de entrega interna está calculada hacia atrás, no pedida.
- La URL destino está verificada, con UTM, y con la marca de verificación.
- Las referencias visuales incluyen la razón por la que se citan.
- **Test del diseñador:** debe poder abrir el archivo y empezar sin hacer una sola pregunta. Cada
  pregunta que igual tenga que hacer es un campo que este skill no cerró.

## ⚠️ Supuestos pendientes de validación

- **Las specs de plataforma se degradan solas.** Meta, Google y TikTok cambian ubicaciones y
  requisitos varias veces al año. La referencia lleva fecha de revisión y hay que contrastarla contra
  la documentación oficial antes del piloto y cada trimestre.
- Los tiempos de diseño por tipo de pieza son los rangos propuestos de
  `references/criterios-y-capacidad.md` de la skill `eikon-priorizador-dia`, sin
  calibrar.
- El histórico de espera de aprobación por cuenta **no existe todavía**; hasta que
  `eikon-estado-cuenta` acumule datos, el cálculo hacia atrás usa un supuesto que hay que declarar
  en el brief.
- **Este skill es de la Ola 2, que sí requiere gate de gerencia.** Se construyó fuera de orden para
  desbloquear las cadenas `eikon-parrilla-a-entrega` y `eikon-mes-de-contenido`. Validar alcance con
  Ana María Estrada y con los dueños del área (dirección de medios y diseño) antes de instalarlo.
- Toca directamente la tensión declarada creatividad-vs-IA: este skill ataca **el brief**, no la
  pieza. Confirmarlo con diseño y creatividad, no darlo por acordado.
