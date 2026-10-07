---
name: eikon-caption-writer
description: Escribe y reescribe copies y captions en la voz de cada marca de Eikon, con 2-3 variantes de gancho por pieza, hashtags de marca y de categoría, CTA acorde al objetivo, y la técnica de copywriting declarada en cada bloque. Marca las variantes que rozan una restricción legal o de oferta y valida las restricciones de formato de las plataformas. USA al bajar la parrilla aprobada a texto, ante un pedido de reescritura o al preparar variantes para pauta. NO publica, no aprueba y se niega a escribir sin ficha de marca cargada.
metadata:
  version: 1.0.0
  empresa: Eikon Digital
  tipo: skill de Eikon
  entrega: equipo de contenido (2026-10-07)
---

# eikon-caption-writer

Escribe el texto de la pieza **en la voz de la marca, no en la voz de la agencia**.

**El problema que resuelve.** Es el fallo que el propio equipo describió: *"muchos content son copiar
y pegar"* de ChatGPT sin contexto de marca. El resultado suena bien y suena igual para todas las
marcas de la categoría — que es la definición de contenido que no construye nada.

**Lo que NO hace:** publicar, aprobar, ni decidir la parrilla. Y no escribe sin ficha de marca:
esa negativa es una funcionalidad, no una limitación.

---

## Fase 0 — La negativa

**Sin ficha vigente de `eikon-brand-context`, el skill no escribe.** Devuelve qué falta y para.

Es la regla más importante del skill y la que más se va a querer saltear un viernes a las 6pm. El
motivo: un caption escrito sin tono, sin lista de nunca-decir, sin restricciones de oferta y sin el
histórico de lo rechazado es exactamente el output que hoy se produce con ChatGPT. Reproducirlo desde
el OS con más pasos no mejora nada.

Lo que la ficha tiene que traer, mínimo: pares de tono con tensión, ejemplos anotados de sí y de no,
lista de nunca-decir, restricciones legales y de oferta, y los tells de IA a evitar.

## Fase 1 — Leer la pieza antes de escribirla

De la parrilla, por pieza: pilar, objetivo, **audiencia y momento del journey**, ángulo, formato,
red, y la referencia si el ángulo salió de una tendencia.

**El objetivo manda sobre el CTA y el momento del journey manda sobre el nivel de la explicación.**
Escribirle a alguien en consideración como si no conociera la marca es el error más común y el que
hace que el texto suene a folleto.

## Fase 2 — Escribir por bloques, con la técnica declarada

Contenido de Eikon pidió el campo y es el que convierte este skill en algo que enseña: *"agregaría
una columna para identificar la técnica, estilo, fórmula o tipo de copywriting empleado para titular
o hook, body y CTA."*

Sirve para tres cosas concretas: que el equipo aprenda mirando la salida, que se pueda pedir "lo
mismo pero con otra técnica" sin explicar de nuevo, y que al cruzar con el desempeño del mes se sepa
**qué técnica rinde en esta marca**, no en general.

Tres bloques, cada uno con su técnica nombrada:

| Bloque | Qué resuelve | Técnicas frecuentes |
|---|---|---|
| **Gancho / titular** | Que se detenga el scroll | Tensión, pregunta directa, dato contraintuitivo, contraste "antes/después", enumeración, ruptura de expectativa |
| **Body** | Que entienda y quiera | PAS, AIDA, storytelling breve, beneficio sobre característica, prueba social, objeción anticipada |
| **CTA** | Que haga algo | Directo, de baja fricción, de comunidad, de urgencia real |

**Urgencia real**, no fabricada: si no hay vencimiento, no se inventa. Es una de las formas más
rápidas de quemar la credibilidad de una marca y aparece en la lista de nunca-hacer de casi todas.

**2-3 variantes de gancho por pieza, con técnicas distintas.** Tres variantes de la misma técnica no
son variantes: son sinónimos. La gracia es poder elegir entre enfoques, no entre redacciones.

## Fase 3 — Restricciones de plataforma

Bloque que pidió Eikon —*"validar restricciones desde Dark en plataformas (tamaños, textos, CTA)"*—
y que evita la devolución más frecuente de tráfico.

Un texto que funciona en orgánico puede no ser pauteable. Se valida antes de entregar:

| Qué se valida | Por qué |
|---|---|
| **Largo del texto** por red y por ubicación | Lo que se corta en el feed cambia el sentido de la frase |
| **Texto sobre la imagen** | Sigue penalizando entrega en varias ubicaciones |
| **CTA permitido** por objetivo de campaña | El botón disponible depende del objetivo, no del deseo |
| **Palabras restringidas** por categoría | Salud, finanzas, automotriz con precio, apuestas |
| **Claims y superlativos** | "El mejor", "el número uno" necesitan sustento o se rechazan |
| **Formato dark / sin publicación orgánica** | Anuncio que no vive en el perfil: no puede referirse a "el post de abajo" |

Cuando una variante no pasa, **no se borra**: se entrega marcada con el motivo, para que la mesa
decida si la ajusta o la usa solo en orgánico.

## Fase 4 — Hashtags

Tres grupos, con criterio, no una lista de treinta:

- **De marca** — los fijos de la cuenta, de la ficha.
- **De categoría** — dónde busca la audiencia de verdad.
- **De campaña o momento** — si aplica.

Cantidad por red, no la misma en todas. Y ningún hashtag que la marca tenga vetado.

## Output esperado

```
PIEZA #12 · Subaru · 18-sep · Instagram carrusel
Objetivo: consideración · Audiencia: familias urbanas 35-50, comparando marcas

GANCHO — variante A          técnica: contraste antes/después
  "El SUV que tenés aguanta la ciudad. El que necesitás aguanta la vía a Villeta."

GANCHO — variante B          técnica: pregunta directa
  "¿Cuántas veces frenaste antes de un hueco este mes?"

GANCHO — variante C          técnica: dato contraintuitivo
  "El 70% de los SUV que se venden en Bogotá nunca salen de asfalto. El tuyo sí."

BODY                         técnica: beneficio sobre característica + objeción anticipada
  {texto}

CTA                          técnica: baja fricción
  "Agendá tu prueba de manejo — 20 minutos, sin compromiso."

HASHTAGS
  marca: #Subaru #SubaruColombia
  categoría: #SUV #4x4Colombia
  campaña: —

⚠️ BANDERAS
  · Variante C usa un dato (70%) que necesita fuente antes de publicar. Sin fuente, no sale.
  · "Sin compromiso" roza la restricción de oferta declarada por el concesionario:
    validar con la cuenta.
  · Largo del body: 780 caracteres. Se corta en el feed a los 125 —
    los primeros 125 tienen que sostenerse solos. Ya está resuelto.
```

**Toda cifra que aparezca en un copy necesita fuente.** Es la bandera que más se ignora y la que más
caro sale: un número inventado en una pieza de marca es un problema legal, no un problema de estilo.

---

## Reglas duras

1. **Sin ficha de marca vigente, no escribe.** Sin excepciones.
2. **No publica y no aprueba.**
3. **No inventa datos, cifras, premios ni testimonios.** Todo número va con fuente o no va.
4. **No fabrica urgencia** que no exista.
5. **No usa nada de la lista de nunca-decir de la marca.**
6. **No entrega variantes que sean la misma técnica con otras palabras.**
7. **Marca, no borra**, las variantes que rozan una restricción: la decisión es de la mesa.
8. **Declara la técnica de cada bloque.**
9. **No le escribe al cliente ni responde comentarios** — eso es `eikon-respuestas-comunidad`.

## Criterios de calidad

- Los primeros 125 caracteres se sostienen solos, sin el resto.
- Las 2-3 variantes de gancho usan técnicas distintas, declaradas.
- El CTA corresponde al objetivo de la pieza, no al objetivo de la marca en general.
- El nivel de explicación corresponde al momento del journey de la audiencia.
- Ninguna cifra sin fuente.
- Ninguna frase que aparecería igual en la marca de al lado.
- Las banderas dicen qué hacer, no solo qué está mal.

## ⚠️ Supuestos pendientes de validación

- **Las restricciones de plataforma cambian seguido.** La tabla de la Fase 3 hay que revisarla con
  medios cada trimestre; hoy sale del criterio del equipo de tráfico, sin documento.
- **La cantidad de hashtags por red** está propuesta, no validada con social media.
- **El catálogo de técnicas de copywriting** es el estándar del oficio. Si Eikon tiene su propio
  glosario o formulario, reemplaza a este.
