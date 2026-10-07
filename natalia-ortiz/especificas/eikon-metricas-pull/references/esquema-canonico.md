# Esquema canónico — Eikon

Las 17 columnas de salida de `eikon-metricas-pull`. Fuente: `listado.md:32`.

**Regla transversal:** vacío ≠ cero. Cero solo cuando la fuente reportó cero.

---

## Dimensiones

| # | Columna | Tipo | Regla |
|---|---|---|---|
| 1 | `cliente` | texto | Slug estable. No el nombre comercial, que cambia |
| 2 | `pais` | enum | `CO` · `EC` · `PA`. Determina moneda y calendario de feriados |
| 3 | `marca` | texto | Una fila por marca. Grupo Caminos son 4: Subaru, Suzuki, Citroën, PWM |
| 4 | `canal` | enum | Ver tabla de canales abajo |
| 5 | `campana` | texto | Nombre literal del export. **No normalizar** — es la trazabilidad al origen |
| 6 | `objetivo` | enum | `leads` · `ventas` · `trafico` · `alcance` · `interaccion` · `video` · `sin_declarar` |
| 7 | `periodo` | fecha | `YYYY-MM` para mensual. Con su huso horario asociado |

**Canales:**
`meta_ads` · `google_ads_search` · `google_ads_display` · `google_ads_pmax` · `tiktok_ads` ·
`dv360` · `meta_organico` · `instagram_organico` · `linkedin_organico` · `tiktok_organico` · `web`

Separar Search de Display y de PMax **no es opcional**: sus CTR no son comparables entre sí, y
promediarlos produce el error metodológico más común del reporting de pauta.

## Métricas

| # | Columna | Unidad | Trampa |
|---|---|---|---|
| 8 | `inversion` | decimal + `moneda` | **Nunca sumar COP con USD.** La moneda es parte del dato, no metadato |
| 9 | `impresiones` | entero | Veces que se mostró. ≠ alcance |
| 10 | `alcance` | entero | Personas únicas. **Google Ads no lo reporta a nivel campaña** → vacío |
| 11 | `clics` | entero | Clics **en el enlace**, no "todos los clics" |
| 12 | `interacciones` | entero | Solo canales orgánicos. En pauta va vacío, no cero |
| 13 | `leads` | entero | Ver definiciones abajo. **Nunca sumar entre plataformas** |
| 14 | `cpl` | decimal + moneda | **Calculado**, no tomado del export |
| 15 | `ctr` | decimal % | **Calculado** = clics ÷ impresiones. Ver trampa abajo |
| 16 | `frecuencia` | decimal | Solo Meta y TikTok. **Google Search no la tiene** → vacío |
| 17 | `conversiones` | decimal | **Puede ser fraccionado.** No redondear |

### Campos auxiliares obligatorios

No están en las 17 pero sin ellos la tabla no se puede auditar:

`moneda` (`COP`/`USD`) · `huso_horario` · `fuente_archivo` (nombre del export) ·
`fecha_descarga` · `ventana_atribucion`

---

## Las cuatro trampas de definición

### CTR — cuál de los dos

Meta reporta **CTR (todos)** y **CTR (clics en el enlace)**. El primero incluye reacciones,
comentarios, compartidos y taps al perfil, y es sistemáticamente más alto.

**Usar siempre el de enlace.** Muchos benchmarks publicados mezclan ambos sin aclararlo, que es por
qué las cifras de referencia de la industria varían tanto.

**Recalcular, no copiar.** `ctr = clics ÷ impresiones`. Si el valor calculado no coincide con el
del export, el mapeo de `clics` está mal — es el mejor test de que las columnas se leyeron bien.

### Conversiones fraccionadas

Google Ads reporta conversiones con decimales por modelo de atribución: `3,47` conversiones es un
valor correcto, no un error de lectura. Redondear rompe los totales.

Además: **`Conversiones` ≠ `Todas las conversiones`.** La primera cuenta solo las acciones marcadas
como primarias. Elegir una, declararla, y no mezclarlas entre meses.

### Frecuencia donde no existe

Meta y TikTok la reportan. **Google Search no** — no hay concepto de frecuencia en búsqueda. Un cero
ahí se leería como "audiencia sin saturar", que es una conclusión inventada.

Va **vacío por definición**, y así se declara en el reporte de cobertura.

### Leads: tres cosas distintas con el mismo nombre

| Origen | Qué es |
|---|---|
| Meta Lead Ads | Formulario nativo, dentro de la plataforma |
| Conversión en sitio | Formulario propio, atribuido por píxel |
| Evento de GA4 | Lo que la propiedad definió como lead |

Los tres van a `leads` pero con su `canal` distinto. **Sumarlos entre plataformas cuenta la misma
persona más de una vez** — un usuario que hizo clic en Meta y completó el formulario del sitio
aparece en Meta *y* en GA4.

La consolidación es decisión del análisis, con criterio. El normalizador no la toma.

---

## Ventana de atribución

Meta usa por defecto 7 días de clic y 1 día de visualización. **Si alguien la cambió, las
conversiones no son comparables contra meses anteriores** — y el cambio no deja rastro en el
export.

Registrarla por fila. Si no se puede determinar, va al reporte de cobertura como no verificada.

## Períodos comparables

- Un mes calendario en Meta es un mes en el huso de la cuenta publicitaria; en GA4, en el de la
  propiedad. Pueden diferir en horas — irrelevante en el mes, relevante en cortes semanales.
- **Comparar contra el mismo mes del año anterior, no contra el mes previo**, salvo que la cuenta
  no tenga estacionalidad. Los calendarios comerciales de Colombia, Ecuador y Panamá no coinciden.
- Los meses tienen distinta cantidad de días y de fines de semana. Para cuentas e-commerce eso mueve
  la aguja: normalizar por día cuando la comparación sea entre meses de distinta longitud.

---

## Validación de salida

Antes de entregar:

1. **Suma de control**: la inversión total por fuente coincide con el total del export original.
   Es la verificación que atrapa filas de total duplicadas y errores de locale.
2. **CTR recalculado** coincide con el reportado (±0,01%). Si no, hay un mapeo mal.
3. Ninguna fila sin `cliente`, `pais`, `marca`, `canal`, `periodo`, `moneda`.
4. Ningún cero que no venga de la fuente.
5. Toda campaña sin resolver está en el reporte de cobertura con su nombre literal.
