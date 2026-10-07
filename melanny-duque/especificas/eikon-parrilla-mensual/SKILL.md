---
name: eikon-parrilla-mensual
description: Genera la parrilla del mes de una marca de Eikon cruzando los enfoques que envía el cliente, el calendario comercial y de temporadas, los pilares de contenido, las tendencias de la categoría, el listening y la intención de búsqueda, y el desempeño del mes anterior. Entrega la grilla v1 pieza por pieza con audiencia objetivo, más el resumen de cobertura por pilar y por objetivo. USA la semana previa al mes, al abrir una marca nueva o cuando haya que rehacer un mes completo. NO aprueba, no publica y no aplica los ajustes del cliente — eso es eikon-ajustes-parrilla.
metadata:
  version: 1.0.0
  empresa: Eikon Digital
  tipo: skill de Eikon
  entrega: equipo de contenido (2026-10-07)
---

# eikon-parrilla-mensual

Produce la **v1 de la parrilla del mes**: completa, con cobertura declarada y lista para revisión
interna.

**El problema que resuelve.** Es el núcleo del dolor #2, nombrado por 7 de 18 entrevistados: los
siete días que toma armar un mes de contenido. Y el diagnóstico del propio equipo sobre la salida
actual: *"muchos contenidos son copiar y pegar"* de ChatGPT sin contexto de marca.

**La v1 no es la versión final.** La parrilla se entrega un mes antes y se ajusta durante el mes.
Este skill produce la v1; los cambios del cliente los procesa `eikon-ajustes-parrilla`.

**Lo que NO hace:** aprobar, publicar, hablarle al cliente ni generar el arte final. Regla 3 de
`CONTEXT.md`: el arte lo firma un humano.

---

## Fase 0 — Sin cerebro de marca no hay parrilla

**Bloqueante.** Si `eikon-brand-context` no tiene ficha vigente de esta marca, el skill se detiene y
la pide.

No es formalismo: es exactamente el fallo que produce el contenido genérico de hoy. Una parrilla
escrita sin tono, sin restricciones legales, sin portafolio y sin el histórico de lo rechazado sale
correcta y sirve para cualquier marca de la categoría — que es lo mismo que no servir para ninguna.

## Fase 1 — Los seis insumos

La v1.0 del inventario contemplaba tres. Planeación y contenido de Eikon sumaron los otros tres en la
revisión del 28-ago, y son los que separan una parrilla informada de una parrilla inventada.

| # | Insumo | De dónde sale | Si falta |
|---|---|---|---|
| 1 | **Enfoques del mes del cliente** | Correo o brief mensual | Bloqueante — se pide |
| 2 | **Calendario comercial y de temporada** | Plan del cliente + efemérides del país | Se arma con efemérides y se marca como incompleto |
| 3 | **Pilares de contenido** | `eikon-brand-context` | Bloqueante |
| 4 | **Tendencias de la categoría** | `eikon-referencias-tendencias` | Se corre; si no se puede, se declara |
| 5 | **Listening e intención de búsqueda** | `eikon-query-listening` + Keyword Planner | Se declara el hueco |
| 6 | **Desempeño del mes anterior** | `eikon-insight-pauta` (Fase 3.5) + `eikon-metricas-pull` | Se declara el hueco |

**El insumo 6 es el que convierte la parrilla en un sistema que aprende.** Sin él, cada mes se
planifica como si fuera el primero. Lo que entra concretamente: qué formatos, ángulos, ganchos y CTA
rindieron mejor el mes pasado, y cuáles no.

**El insumo 5 es el que casi nadie usa y más diferencia hace.** La intención de búsqueda dice qué
está preguntando la gente sobre la categoría; el listening dice qué está diciendo sobre la marca. Una
parrilla que responde preguntas reales rinde distinto que una que comunica mensajes.

Los tres primeros son bloqueantes. Los tres últimos no: **se declaran como hueco en el resumen de
cobertura** y la parrilla sale igual. Trabar la parrilla del mes porque no corrió el listening es
peor que entregarla con el hueco declarado.

## Fase 2 — Repartir antes de escribir

Primero la estructura, después el contenido. Al revés se llega a fin de mes con nueve piezas de
producto y ninguna de marca.

**Cobertura por pilar.** El reparto sale de la ficha de marca, no de la intuición. Si la marca declara
cuatro pilares con peso, la parrilla respeta ese peso y **la desviación se declara**.

**Cobertura por objetivo.** Cada pieza tiene uno solo: reconocimiento, consideración, conversión o
comunidad. Una pieza con tres objetivos no tiene ninguno.

**Cobertura por formato.** Cruzada con lo que rindió el mes anterior y con las tendencias del plano 1.

**Cadencia por red.** Distinta por plataforma y por tier de cuenta. No se replica la misma pieza en
las cuatro redes: eso es lo que hace que el contenido se sienta de relleno.

## Fase 3 — Audiencia objetivo por pieza

Campo nuevo pedido por Eikon, y no es decorativo: **una pieza sin audiencia declarada se escribe para
todos y no le habla a nadie.**

Por pieza:

| Campo | Ejemplo |
|---|---|
| Segmento | Familias urbanas 35-50, primer SUV |
| Momento del journey | Consideración — comparando marcas |
| Qué sabe ya | Conoce la marca, no conoce la gama media |
| Qué tiene que pasar | Que entienda la diferencia con la gama baja |

Cuando dos piezas del mes tienen exactamente la misma audiencia y el mismo momento, **una de las dos
sobra** y el skill lo marca.

## Fase 4 — Escribir la grilla

Por pieza:

```
#12 · 18-sep · Instagram · Carrusel 1080×1350
  Pilar:      Producto              Objetivo:  Consideración
  Audiencia:  Familias urbanas 35-50, consideración, comparando marcas
  Ángulo:     "El que tenés vs. el que necesitás" (tendencia plano 1, hallazgo 3)
  Copy:       {titular}
  Caption:    {pendiente — eikon-caption-writer}
  CTA:        Agendá tu prueba de manejo
  Visual:     Split vertical, vehículo actual arriba / Forester abajo, sin texto sobre el auto
  Referencia: {link de eikon-referencias-tendencias}
  Estado:     v1 · pendiente de revisión interna
  ⚠️ Riesgo:  comparación con gama propia — validar con guardián de marca
```

**El caption no se escribe acá.** Este skill define el ángulo y el titular; el copy final es
`eikon-caption-writer`, que trabaja con la ficha de tono cargada. Separarlos es lo que evita que la
parrilla se convierta en un documento de 40 páginas que nadie revisa.

## Fase 5 — Curación para formatos largos

Bloque pedido por planeación de Eikon. Cuando el mes incluye un formato robusto —lead magnet,
whitepaper, guía descargable, serie— **no se trata como una pieza más de la grilla.**

Un formato largo necesita: tema con demanda verificada (del insumo 5), estructura propia, piezas
satélite que lo alimenten durante el mes, y una ruta de conversión. El skill lo declara como
**bloque** dentro de la parrilla, con sus piezas satélite marcadas como tales.

Si el mes no tiene formato largo, se dice: la ausencia repetida de formatos de profundidad es una
señal para la mesa, no un dato neutro.

## Fase 6 — Resumen de cobertura

Va **antes** de la grilla en el entregable. Es lo que se revisa; la grilla es el detalle.

```
COBERTURA · Subaru · septiembre 2026 · 22 piezas

POR PILAR                        objetivo    real
  Producto                          40%       45%   ✓
  Estilo de vida                    30%       32%   ✓
  Marca y valores                   20%       14%   ⚠ corto
  Comunidad                         10%        9%   ✓

POR OBJETIVO
  Reconocimiento 8 · Consideración 9 · Conversión 3 · Comunidad 2

HUECOS DE INSUMO
  ⚠ Listening no corrió este mes — los ángulos no están validados contra conversación real
  ⚠ Desempeño de agosto incompleto: falta el orgánico de TikTok

DECISIONES PARA LA MESA
  · Marca y valores queda 6 pts corto. ¿Se acepta o se reemplazan 2 piezas de producto?
  · La pieza #12 compara con gama propia. Necesita visto bueno del guardián antes de diseño.
```

---

## Reglas duras

1. **Sin ficha de marca vigente no arranca.**
2. **No aprueba ni publica.** Entrega v1 para revisión interna.
3. **No genera el arte final.** Da dirección visual; la pieza la firma un humano (regla 3 de `CONTEXT.md`).
4. **No le escribe al cliente.**
5. **Toda pieza tiene un solo objetivo y una audiencia declarada.**
6. **Todo hueco de insumo se declara en el resumen de cobertura.** No se rellena con supuestos.
7. **Toda desviación de la cobertura objetivo se declara**, no se corrige en silencio.
8. **Todo ángulo tomado de una tendencia cita su hallazgo** con link.
9. **Toda pieza que roce una restricción de marca sale marcada**, no eliminada: la decisión es de la mesa.

## Criterios de calidad

- El resumen de cobertura va primero y es legible sin abrir la grilla.
- Ninguna pieza repite audiencia y momento del journey con otra sin justificación.
- Cada pieza tiene formato y tamaño exacto por plataforma, no "carrusel para IG".
- Los ángulos tomados de tendencias tienen su link; los inventados están marcados como propuesta.
- La sección de decisiones para la mesa tiene preguntas concretas, no observaciones.
- Ningún caption está escrito acá.

## ⚠️ Supuestos pendientes de validación

- **La cadencia por red y por tier de cuenta no está declarada en ningún lado.** Hoy cada content
  manager usa la suya. Es el insumo que más ordenaría este skill.
- **Los pesos por pilar salen de la ficha de marca, que hoy no está cargada para ninguna cuenta.**
  Hasta entonces el reparto se propone y se marca como propuesto.
- **El formato de entrega** —Sheet, documento o Drive— depende del hub que sigue sin definirse en
  la configuración de Eikon.
