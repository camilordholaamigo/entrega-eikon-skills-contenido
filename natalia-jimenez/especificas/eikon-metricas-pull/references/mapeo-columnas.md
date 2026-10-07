# Mapeo de columnas origen → destino

> 🔴 **TODO este archivo es PROPUESTO.** Escrito desde documentación pública de cada plataforma,
> **sin haber visto un export real de Eikon**. Es el insumo 1.2 del documento de insumos de la Ola 1.
>
> Cuando lleguen los exports: corregir acá y subir el skill a v1.1.0. El cuerpo del `SKILL.md` no
> debería necesitar cambios.

**Estado:** 🔴 sin verificar · **Validado contra export real:** ⬜ ninguno · **Fecha:** 2026-08-08

**Por qué esto es frágil:** los nombres de columna cambian con el idioma de la interfaz, con la
versión de la plataforma y con el conjunto de columnas que eligió quien bajó el archivo. Dos
personas del mismo equipo pueden generar exports con encabezados distintos de la misma cuenta.
**Mapear por coincidencia flexible, no por igualdad exacta**, y registrar acá cada variante nueva.

---

## Meta Ads (Business Suite / Ads Manager)

| Destino | Español | Inglés |
|---|---|---|
| `campana` | Nombre de la campaña | Campaign name |
| `inversion` | Importe gastado | Amount spent |
| `impresiones` | Impresiones | Impressions |
| `alcance` | Alcance | Reach |
| `clics` | Clics en el enlace | Link clicks |
| `ctr` | CTR (porcentaje de clics en el enlace) | CTR (link click-through rate) |
| `frecuencia` | Frecuencia | Frequency |
| `leads` | Clientes potenciales / Registros | Leads |
| `conversiones` | Resultados | Results |
| `objetivo` | Objetivo | Objective |

⚠️ **No usar** `CTR (todos)` / `CTR (all)` ni `Clics (todos)` — incluyen reacciones y taps de perfil.
Es el error de lectura más común y el más difícil de detectar después.

⚠️ `Resultados` es **polimórfico**: significa lo que la campaña optimiza. En una campaña de leads
son leads; en una de tráfico, clics. Leer siempre junto a `Tipo de resultado` / `Result indicator`.

**Moneda:** la de la cuenta publicitaria, en el encabezado del archivo, no en una columna.
**Huso:** el de la cuenta publicitaria. Suele estar en el encabezado del rango de fechas.

---

## Google Ads

| Destino | Español | Inglés |
|---|---|---|
| `campana` | Campaña | Campaign |
| `inversion` | Coste / Costo | Cost |
| `impresiones` | Impresiones | Impr. |
| `clics` | Clics | Clicks |
| `ctr` | CTR | CTR |
| `conversiones` | Conversiones | Conversions |
| `cpl` | Coste/conv. | Cost / conv. |
| `canal` | Tipo de campaña | Campaign type |

⚠️ `alcance` y `frecuencia` **no existen** a nivel campaña → vacío por definición.

⚠️ `Conversiones` ≠ `Todas las conversiones` / `All conv.` — elegir una y no mezclarlas entre meses.

⚠️ **Valores fraccionados.** `3,47` conversiones es correcto. No redondear.

⚠️ **`Tipo de campaña` decide el canal**: Search, Display, Video, Performance Max y Shopping van a
canales distintos. Promediar el CTR de Search con el de Display no significa nada.

**Formato:** Google Ads exporta con 2-3 filas de encabezado (nombre del informe, rango de fechas)
antes de la fila real, y cierra con una fila **Total**. Excluirla o se duplica todo.

---

## TikTok Ads

| Destino | Español | Inglés |
|---|---|---|
| `campana` | Nombre de la campaña | Campaign name |
| `inversion` | Costo | Cost |
| `impresiones` | Impresiones | Impressions |
| `alcance` | Alcance | Reach |
| `clics` | Clics | Clicks (destination) |
| `ctr` | CTR | CTR (destination) |
| `frecuencia` | Frecuencia | Frequency |
| `conversiones` | Conversiones | Conversions |

⚠️ TikTok distingue clics al destino de clics totales, igual que Meta. Usar los de destino.

---

## DV360

⬜ **Sin mapear.** No hay evidencia en las entrevistas de qué informe usan ni con qué columnas.
DV360 permite construir informes a medida, así que el mapeo depende de la plantilla que Eikon haya
guardado. **Pedirla junto al export.**

---

## GA4

| Destino | Español | Inglés |
|---|---|---|
| `canal` | Agrupación de canales | Session default channel group |
| `clics` | Sesiones | Sessions |
| `conversiones` | Conversiones / Eventos clave | Conversions / Key events |
| `leads` | Evento definido como lead | (definido por la propiedad) |

⚠️ **`Sesiones` no es `clics`.** Se mapea acá para poder comparar volumen web, pero son cosas
distintas: un clic en la pauta puede no generar sesión (rebote antes de cargar), y una sesión puede
venir de otra fuente. **Declararlo en el reporte de cobertura.**

⚠️ GA4 renombró `Conversiones` a `Eventos clave` en 2024. Ambos nombres circulan según la versión.

⚠️ **`Usuarios` ≠ `Usuarios activos` ≠ `Sesiones`.** Elegir una y sostenerla entre meses.

⚠️ **Nunca sumar conversiones de GA4 con las de Meta o Google Ads.** Es la misma persona contada
dos veces.

**Huso:** el de la propiedad, configurable y frecuentemente distinto del de las cuentas de pauta.

---

## Orgánico (Meta / Instagram / LinkedIn / TikTok)

| Destino | Meta / IG Insights | LinkedIn | TikTok |
|---|---|---|---|
| `impresiones` | Impresiones / Visualizaciones | Impresiones | Visualizaciones de video |
| `alcance` | Alcance | Miembros alcanzados | Alcance |
| `interacciones` | Interacciones | Reacciones + comentarios + veces compartido | Me gusta + comentarios + compartidos |
| `clics` | Clics en el enlace | Clics | Clics |

⚠️ **`interacciones` no es comparable entre redes** — cada plataforma incluye acciones distintas en
su definición de engagement. Sirve para ver evolución dentro de una misma red, **no para comparar
entre redes**. Declararlo.

⚠️ **Fanpage Karma no cubre LinkedIn** (documentado en `CONTEXT.md`). El dato de LinkedIn hay que
bajarlo aparte o queda vacío por ausencia.

---

## Agency Analytics / Datorama

⬜ **Sin mapear.** Son capas de dashboard sobre las mismas fuentes, no fuentes en sí. Dos caminos, y
hay que decidir cuál:

1. **Ignorarlas** y leer siempre los exports nativos. Más trabajo manual, dato más limpio y una sola
   definición por métrica.
2. **Usarlas como fuente única** si ya tienen las conexiones armadas. Menos trabajo, pero se hereda
   cómo esa herramienta definió cada métrica — que puede no coincidir con el nativo.

Depende de qué conexiones tienen contratadas realmente (insumo 3.2 del pedido). **Recomendación
provisional: opción 1** hasta saberlo, porque la opción 2 introduce una definición de métrica que
nadie en el equipo controla.

---

## Detección de locale

Antes de parsear números, por archivo:

| Patrón en el archivo | Locale | Decimal |
|---|---|---|
| `1.234,56` | es | coma |
| `1,234.56` | en | punto |
| `1234,56` | es | coma |
| `1234.56` | en | punto |

**Por archivo, no global.** El mismo equipo puede tener Meta en español y Google Ads en inglés.
Ante ambigüedad (`1.234` puede ser mil doscientos treinta y cuatro, o uno coma doscientos treinta y
cuatro), resolver por el resto del archivo y, si sigue ambiguo, **preguntar** — no asumir.

**Fechas:** `DD/MM/YYYY` vs `MM/DD/YYYY` es indistinguible hasta el día 13. Determinar el formato
con una fecha >12 en el archivo, o por el locale ya detectado.

---

## Bitácora de correcciones

Cada vez que un export real contradiga este mapeo, anotarlo. Es lo que convierte el archivo de
propuesta en dato.

| Fecha | Plataforma | Columna | Decía | Es | Quién verificó |
|---|---|---|---|---|---|
