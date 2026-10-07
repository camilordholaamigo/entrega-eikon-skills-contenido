---
name: eikon-metricas-pull
description: Toma los exports crudos de las plataformas (Meta, Instagram, TikTok, LinkedIn, X, Pinterest, YouTube, Google Ads, DV360, GA4, Fanpage Karma, Agency Analytics) y los normaliza a un modelo de dos enfoques (periódico y acumulado) por dos capas (activo y contenido/campaña) por dos ejecuciones (orgánico y pauta), resolviendo nombres de campaña, monedas por país, husos horarios y períodos comparables. Entrega un juego de vistas en hojas independientes más un reporte de cobertura que declara qué fuente faltó y qué campo quedó vacío. Es la dependencia de todos los demás skills de reporting. USA al cerrar el mes, antes de armar el informe, o cuando haya que consolidar data de varias plataformas. NO usa para analizar ni para sacar conclusiones — esto arma la base sobre la que otros analizan.
metadata:
  version: 1.1.0
  empresa: Eikon Digital
  tipo: skill de Eikon
  entrega: equipo de contenido (2026-10-07)
---

# eikon-metricas-pull

Convierte siete exports con siete formatos distintos en **una tabla comparable**, y dice con
precisión qué parte de esa tabla no es confiable.

**El problema que resuelve.** Es el primer eslabón del dolor #1: el informe que llega el día 10-15
del mes siguiente. Bajar data, pegar en Excel y cuadrar nombres de campaña a mano es donde se va el
tiempo que después falta para el análisis. Gerencia general: *"a la hora de pedir resultados de
análisis, planes de acción, propuestas sobre esos resultados, ya no hay tiempo porque se gastaron el
tiempo en sacar el reporte."*

**Trabaja sobre exports, no sobre APIs.** La agencia no tiene integración; los accesos son por
Business Manager con permisos por cuenta. El skill asume archivos descargados a mano.

**Lo que NO hace:** analizar, interpretar, recomendar. Entrega la base y su reporte de cobertura.
El análisis es `eikon-insight-pauta` y `eikon-reporte-mensual`.

---

## La regla que gobierna todo

> **Un cero solo se escribe cuando la fuente dijo cero. Si la fuente no estuvo, el campo va vacío
> y aparece en el reporte de cobertura.**

Un cero falso se propaga en silencio hasta el informe del cliente y ahí no hay forma de detectarlo.
Esta regla está pedida explícitamente en las entrevistas — el skill **falla ruidosamente si falta
una fuente**, nunca la rellena con cero.

Es la misma lógica que `eikon-alerta-pauta` aplica antes de alertar. Las cuentas con medición rota
desperdician alrededor del 23% del presupuesto porque el algoritmo de puja optimiza contra datos
que no existen.

---

## La segunda regla: no toda métrica se puede sumar

> **Las métricas de conteo discriminado y las promediadas están atadas al período en que se
> consultaron. Sumarlas o promediarlas entre períodos produce un número que parece válido y no lo es.**

Esto lo corrigió planeación de Eikon sobre la v1.0 del skill, y es la corrección más importante que
recibió: *"las métricas con conteo discriminado como alcance o visitantes únicos y las métricas
promediadas como rebote y duración media de la sesión están sujetas al periodo de consulta y no se
deben consolidar-sumar-promediar porque distorsiona los análisis."*

| Clase | Ejemplos | Qué se puede hacer |
|---|---|---|
| **Aditiva** | impresiones, clics, interacciones, leads, inversión, conversiones | Sumar entre períodos y entre filas. Es la única clase que se consolida libremente. |
| **Conteo discriminado** | alcance, usuarios únicos, visitantes únicos | **Nunca sumar.** Se vuelve a consultar a la plataforma con el período completo. Si no se puede reconsultar, el campo va vacío para ese período agregado. |
| **Promediada** | tasa de rebote, duración media de sesión, frecuencia, CTR, CPL, CPM | **Nunca promediar el promedio.** Se recalcula desde los numeradores y denominadores aditivos. |

Las dos reglas prácticas que se derivan:

- **Un agregado mensual no es la suma de cuatro semanales.** El alcance de agosto se baja pidiendo
  agosto, no sumando las cuatro semanas: la misma persona alcanzada en dos semanas cuenta dos veces.
- **Todo indicador se recalcula, nunca se hereda.** El CTR del trimestre es `Σclics / Σimpresiones`,
  no el promedio de los tres CTR mensuales. Igual CPL, CPM, CPC y tasa de conversión.

Cada columna del esquema canónico declara su clase. Si una vista pide agregar una columna de clase
`discriminado` sin dato reconsultado, la celda va vacía y el motivo entra al reporte de cobertura.

---

## El modelo: 2 enfoques × 2 capas × 2 ejecuciones

La v1.0 aplanaba todo a una tabla `cliente-mes-canal-métrica`. Planeación de Eikon marcó que eso
mezcla cosas que no se comparan entre sí. El dato se organiza en tres ejes independientes:

**Enfoque** — cómo se comporta la métrica en el tiempo.

| | Qué mide | Ejemplos |
|---|---|---|
| **Periódico** | Lo que ocurrió *dentro* del período | interacciones, visitas, impresiones, clics, inversión |
| **Acumulado** | El saldo *al cierre* del período | seguidores netos, base de suscriptores, fans totales |

Un acumulado no se suma entre períodos: se toma el último. Un periódico sí.

**Capa** — a qué nivel del activo se mide.

| | Qué consolida | Dimensiones que lleva |
|---|---|---|
| **Activo** (cuenta o perfil) | Acumuladas + periódicas del perfil completo | Caracterización de seguidores: rango de edad, género, ubicación. En web: canal, fuente, medio, campaña, anuncio o keyword, dispositivo, edad, género, ubicación, sección o landing, tipo de evento/conversión |
| **Contenido / campaña** (publicación, grupo de anuncios, anuncio) | Solo periódicas | Caracterización del contenido: formato, campaña, objetivo, medio, moneda |

La capa de contenido **no lleva métricas acumuladas**. Un post no tiene seguidores.

**Ejecución** — orgánico o pauta. Se marca por fila y **no se consolida sin decisión explícita**: un
alcance orgánico y uno pago sobre la misma pieza se superponen y sumarlos infla el número.

**Dimensiones de tiempo derivadas.** Toda fila calcula, además del período: mes, quincena, semana,
día de la semana, jornada y hora. Son las que permiten las vistas de estacionalidad que hoy se
arman a mano.

---

## Fase 1 — Inventario de fuentes esperadas

**Antes de leer un solo archivo**, construir la lista de lo que *debería* estar, a partir de los
servicios contratados por cliente:

```
Grupo Caminos / Subaru · agosto 2026
  esperado: Meta Ads · Google Ads · GA4 · Meta orgánico · Instagram orgánico
  recibido: Meta Ads ✓ · Google Ads ✓ · GA4 ✗ · Meta orgánico ✓ · Instagram orgánico ✓
```

Sin esta lista es imposible distinguir *"esta marca no pauta en TikTok"* de *"alguien se olvidó de
bajar el export de TikTok"*. Las dos producen una fila vacía y significan cosas opuestas.

La lista de servicios por cliente sale de la configuración de Eikon cuando esté cargada (insumo 4.2 del
pedido). Mientras no esté, se pregunta una vez por cliente y se registra.

**El inventario cubre todas las plataformas sociales, no solo donde hay pauta.** Eikon lo marcó
explícito sobre la v1.0, que arrancaba con Meta y TikTok: el barrido esperado incluye Facebook,
Instagram, TikTok, LinkedIn, X, Pinterest, YouTube, Threads y WhatsApp Business, en sus dos
ejecuciones. Una marca sin presencia en una red se declara `no aplica` en el inventario — que es
distinto de no haberla mirado.

## Fase 2 — Leer sin romper

Cada export trae sus trampas. Las cinco que rompen silenciosamente:

**1. Separador decimal.** Un export en español escribe `1.234,56`; uno en inglés, `1,234.56`.
Leído con el parser equivocado, `1.234,56` se convierte en `1,23` o falla. **Detectar el locale por
archivo**, no asumir uno global — el mismo equipo puede tener la interfaz de Meta en español y la
de Google Ads en inglés.

**2. Encabezados de cortesía.** Meta y Google Ads anteponen filas de título, rango de fechas y
totales antes del encabezado real. Buscar la fila de encabezado, no asumir que es la primera.

**3. Filas de total.** Muchos exports cierran con una fila "Total" que, sumada, duplica todo.
Detectarla y excluirla.

**4. Moneda.** Colombia factura en COP, Ecuador y Panamá en USD. **Nunca sumar columnas de moneda
distinta.** Si hay que consolidar, convertir explícitamente y registrar la tasa y su fecha en el
reporte de cobertura. Una inversión sin moneda declarada es un número inútil.

**5. Huso horario.** Meta reporta en el huso de la cuenta publicitaria; GA4 en el de la propiedad.
Un "agosto" bajado con husos distintos no cubre las mismas horas. Registrar el huso de cada fuente.

## Fase 3 — Mapear al esquema canónico

**Cinco columnas de clasificación**, que son las que hacen navegable todo lo demás:
`enfoque` (periódico | acumulado) · `capa` (activo | contenido) · `ejecución` (orgánico | pauta) ·
`clase_metrica` (aditiva | discriminado | promediada) · `moneda`.

**17 columnas de dato**: `cliente · país · marca · canal · campaña · objetivo · período · inversión ·
impresiones · alcance · clics · interacciones · leads · CPL · CTR · frecuencia · conversiones`.

**Dimensiones según la capa** (Eikon las pidió explícitas, no derivables):

- **Capa activo** — caracterización de seguidores: rango de edad, género, ubicación. En web:
  canal, fuente, medio, campaña, anuncio o keyword, dispositivo, edad, género, ubicación,
  sección o landing, tipo de evento/conversión.
- **Capa contenido/campaña** — formato, campaña, objetivo, medio, moneda.

**Dimensiones de tiempo derivadas del período**, en toda fila: mes, quincena, semana, día de la
semana, jornada, hora.

`clase_metrica` no es decorativa: es la columna que impide que una vista sume un alcance. Toda
métrica entra clasificada o no entra.

Definición de cada una y sus reglas en `references/esquema-canonico.md`.
Diccionario de mapeo origen→destino por plataforma en `references/mapeo-columnas.md`.

⚠️ **Ambos archivos son PROPUESTOS.** Se escribieron desde documentación pública de las
plataformas, sin haber visto un export real de Eikon (insumo 1.2 del pedido). Se corrigen ahí, no
acá.

**Las cuatro trampas de definición** — están detalladas en el esquema, pero gobiernan el mapeo:

- **CTR**: Meta tiene *CTR (todos)* y *CTR (clics en el enlace)*. No son lo mismo; el primero
  incluye reacciones y taps de perfil. **Usar siempre el de enlace** y declararlo.
- **Conversiones**: Google Ads las reporta **fraccionadas** por modelo de atribución — `3,47` es un
  valor legítimo. No redondear. Y *Conversiones* ≠ *Todas las conversiones*.
- **Frecuencia**: existe en Meta y TikTok, **no existe en Google Search**. Vacío, no cero.
- **Leads**: un lead de formulario nativo de Meta, una conversión en sitio y un evento de GA4 son
  tres cosas distintas. Mapear cada una a su origen y **nunca sumarlas entre plataformas** — la
  misma conversión suele estar contada dos veces.

**No deduplicar entre plataformas.** Cada fila lleva su canal; consolidar es decisión del análisis,
con criterio, no del normalizador.

## Fase 4 — Resolver campaña → marca y objetivo

El punto más manual y el que más se destraba con la convención de nomenclatura.

- **Si el código de campaña sigue la convención**, marca, objetivo, país y formato se derivan del
  nombre. Es el caso feliz y el argumento para estandarizar.
- **Si no la sigue**, resolver por coincidencia contra la lista de marcas del cliente y pedir
  confirmación humana de lo ambiguo. **Registrar cada resolución manual** — la segunda vez ya no se
  pregunta.

Las campañas que no se pudieron resolver van al reporte de cobertura con su nombre literal. No se
adivina la marca: una fila mal atribuida es peor que una fila declarada como sin resolver.

## Fase 5 — Reporte de cobertura

Sale **siempre**, junto a la tabla. Es la mitad del entregable, no un apéndice.

```
COBERTURA — Grupo Caminos · agosto 2026

Fuentes    4 de 5 recibidas
  ✗ GA4 — no se recibió el export
    Impacto: sin sesiones ni conversiones web. Las filas de canal web quedan vacías,
             NO en cero. El informe no puede afirmar aporte de pauta a conversión web.

Campos     3 vacíos por definición
  · frecuencia — Google Search no la reporta (esperado, no es un hueco)
  · alcance — Google Ads no lo reporta a nivel campaña
  · interacciones — no aplica a canales de pauta

Sin resolver   2 campañas
  · "SUB_AGO_LEADS_V2" → no coincide con ninguna marca cargada
  · "camp final final" → sin convención

Monedas    COP (Colombia) · USD (Ecuador)  — NO consolidadas
Husos      Meta: America/Bogota · GA4: n/a
```

Distinguir siempre **vacío por definición** (Google Search no reporta frecuencia) de **vacío por
ausencia** (no llegó el export). El primero es normal; el segundo es un problema.

Suma un bloque más, que sale de las reglas de agregación:

```
No agregable   2 celdas
  · alcance mensual — se pidió el mes pero solo hay 4 exports semanales.
    NO se sumó. Reconsultar a Meta con rango 01-31 ago.
  · duración media de sesión Q3 — promedio de promedios. Recalcular desde
    Σduración / Σsesiones, o dejar vacío.
```

---

## Fase 6 — Armar las vistas

La tabla canónica es el insumo, no el entregable. Eikon pidió *"un conjunto de vistas (tablas en
hojas independientes) sobre los datos"* — porque una sola tabla plana obliga a cada área a rearmar
su corte a mano, que es justo el trabajo que el skill viene a sacar.

Cada vista va en **su propia hoja**, filtrada por los ejes del modelo:

| Hoja | Corte | Para quién |
|---|---|---|
| `activo-acumulado` | Capa activo, enfoque acumulado, último valor del período | Cuentas, informe mensual |
| `activo-periodico` | Capa activo, enfoque periódico, orgánico y pauta separados | Social media |
| `contenido-organico` | Capa contenido, ejecución orgánica, por pieza | Content managers |
| `campana-pauta` | Capa contenido, ejecución pauta, por campaña y anuncio | Medios |
| `demografia` | Capa activo, desglose por edad, género y ubicación | Planeación |
| `tiempo` | Periódicas por mes, quincena, semana, día y jornada | Planeación, BI |
| `indicadores` | CTR, CPL, CPM, CPC, conversión — **recalculados**, no heredados | Todos |

Reglas de armado, sin excepción:

1. Ninguna vista suma una columna de clase `discriminado`. Si el agregado no se pudo reconsultar a
   la plataforma, la celda va vacía y el motivo entra al reporte de cobertura.
2. Ningún indicador se promedia: se recalcula desde numerador y denominador aditivos.
3. Orgánico y pauta no se consolidan en la misma fila salvo pedido explícito; en ese caso la fila
   se marca `consolidado` y declara la superposición de alcance.
4. Las jerarquías de dimensión se respetan de mayor a menor (país → marca → canal → campaña →
   anuncio). Una vista no salta niveles.

---

## Reglas duras

1. **Nunca rellenar con cero** lo que no vino de la fuente.
2. **Nunca sumar monedas distintas** sin conversión explícita y tasa registrada.
3. **Nunca sumar conversiones entre plataformas** — doble conteo casi garantizado.
4. **Nunca adivinar la marca** de una campaña ambigua.
5. **No redondear conversiones fraccionadas** de Google Ads.
6. **No toca datos personales.** Si un export trae datos de leads (cédula, nombre, correo), esa
   columna no entra al esquema. Aplica la regla del equipo: bases sensibles van encriptadas y este
   skill no las procesa.
7. **La tabla sin su reporte de cobertura no se entrega.**
8. **Nunca sumar una métrica de conteo discriminado** (alcance, usuarios únicos, visitantes únicos)
   entre períodos, entre plataformas ni entre filas. Se reconsulta o se deja vacía.
9. **Nunca promediar un promedio** (rebote, duración media, frecuencia, CTR, CPL, CPM). Todo
   indicador se recalcula desde numerador y denominador aditivos.
10. **Nunca sumar un acumulado entre períodos.** Un acumulado se toma al cierre; el seguidor de
    enero sigue siendo el mismo en febrero.
11. **Nunca consolidar orgánico y pauta** sin pedido explícito y sin declarar la superposición.
12. **Nunca poner métricas acumuladas en la capa de contenido.** Un post no tiene seguidores.

---

## Criterios de calidad

- Toda fila tiene cliente, país, marca, canal, campaña, período y moneda. Sin excepción.
- Toda fila declara enfoque, capa, ejecución y clase de métrica. Sin excepción.
- Todo vacío está clasificado: por definición, por ausencia o por no agregable.
- El reporte de cobertura nombra cada fuente esperada y su estado.
- Ningún número cambió de magnitud respecto del export original — verificable contra el total del archivo.
- Ninguna celda de una vista agregada suma un discriminado ni promedia un promedio.
- Los indicadores de una vista agregada se recalcularon; ninguno se heredó de una fila hija.
- Las resoluciones manuales de campaña quedaron registradas para no repetirse.

**Test de confianza:** entregarle la tabla a alguien que no bajó los exports y preguntarle qué no
puede afirmar con ella. Si no lo puede responder leyendo el reporte de cobertura, el reporte falló.

---

## ⚠️ Supuestos pendientes

Este skill es el más expuesto de la Ola 1 porque se construyó **sin ver un solo export real**.

| Qué | Estado | Se destraba con |
|---|---|---|
| Nombres de columna por plataforma | 🔴 PROPUESTO desde documentación pública | Insumo 1.2 — un export crudo por plataforma |
| Locale y formato numérico | 🔴 Asumido, se detecta en runtime | Insumo 1.2 |
| Convención de códigos de campaña | 🔴 Ausente | Insumo 1.1 |
| Servicios contratados por cliente | 🟡 Se pregunta una vez | Insumo 4.2 |
| Fuentes reales en uso | 🟡 Del stack declarado en `CONTEXT.md` | Confirmar con medios |

**Cuando lleguen los exports:** corregir `references/mapeo-columnas.md` y subir a v1.1.0. El cuerpo
del skill no debería necesitar cambios — todo lo volátil está externalizado a propósito.
