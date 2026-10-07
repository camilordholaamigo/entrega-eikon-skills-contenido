---
name: eikon-reporte-mensual
description: 'Redacta el informe mensual de una cuenta de Eikon en tres capas que no se mezclan: operativo (campanas, piezas, SLA y tiempos de respuesta), marketing (desempeno, metricas y cumplimiento de KPI con las vistas por dimension disponibles) y negocio (ROI, LTV y conversion). Cada capa se escribe para un lector distinto y por eso van separadas. Declara siempre que fuentes no pudo ver. Usar en el cierre de mes de una cuenta, despues de normalizar metricas y diagnosticar la pauta.'
metadata:
  version: 1.0.0
  empresa: Eikon Digital
  tipo: skill de Eikon
  entrega: equipo de contenido (2026-10-07)
---

# eikon-reporte-mensual

## Cuándo usar

En el cierre de mes de una cuenta, una vez que `eikon-metricas-pull` normalizo los exports y `eikon-insight-pauta` produjo los hallazgos. Tambien cuando el cliente pide el informe antes de la reunion mensual.

## Cuándo NO usar

No normaliza exports — eso es `eikon-metricas-pull`. No diagnostica campanas, que es `eikon-insight-pauta`. No arma el estado de entregas: eso lo cierra `eikon-estado-cuenta`.

## Conexiones

- **Upstream:** ``eikon-metricas-pull` y `eikon-insight-pauta``
- **Downstream:** ``eikon-estado-cuenta`, que cierra el informe con el estado de entregas del mes`
- **Motor generico:** `reportar-estado` — aporta la estructura de reporte para decidir (semaforo, plan contra real, alertas por riesgo); las tres capas y el vocabulario de agencia son de Eikon


## Input del usuario

| Input | Obligatorio | Nota |
|-------|-------------|------|
| `cliente` | Si | Cuenta sobre la que se arma el informe. |
| `periodo` | Si | Mes que se reporta (YYYY-MM). |
| `metricas` | Si | Salida de `eikon-metricas-pull`. |
| `hallazgos` | No | Salida de `eikon-insight-pauta`. Sin esto la capa de marketing describe pero no explica. |
| `kpi` | No | KPI comprometidos del contrato. Sin ellos no se puede reportar cumplimiento, solo desempeno. |

## Workflow

### Paso 1. Declarar el perimetro

Que fuentes entraron, que periodo cubren y cuales no se pudieron ver. Va arriba del informe.

### Paso 2. Capa operativa

Campanas activas, piezas entregadas, SLA y tiempos de respuesta. Es la capa que responde 'que hicieron este mes'.

### Paso 3. Capa de marketing

Desempeno y metricas contra KPI, con las vistas por dimension que existan. Delegar en `reportar-estado` la forma del semaforo y del plan contra real.

### Paso 4. Capa de negocio

ROI, LTV y conversion. Si un indicador no se puede calcular con las fuentes disponibles, se dice; no se estima.

### Paso 5. Revisar que no se mezclaron

Cada capa tiene su lector. Un dato de negocio adentro de la capa operativa hace que ninguno de los dos lectores encuentre lo suyo.

## Reglas duras

- **Las tres capas no se mezclan.** Es la regla que define este informe: cada una se escribe para un lector distinto.
- **Un indicador que no se puede calcular se declara, no se estima.** Un ROI inventado destruye la confianza en todo el resto del informe.
- **El numero incomodo va adelante,** no escondido en un anexo. Si el mes fue malo, la primera capa lo dice.
- **Las fuentes que faltaron se declaran arriba,** no al final: cambian como se lee todo lo demas.

## Output esperado

- Informe con las tres capas separadas y rotuladas.
- Declaracion de perimetro y de fuentes faltantes, arriba del documento.
- Cumplimiento de KPI cuando hay contrato cargado; si no, desempeno sin cumplimiento y la razon.

## Skills relacionados


- `reportar-estado` — el motor generico. Este skill es su envoltorio para Eikon: aporta el
  contexto de la agencia, no reimplementa el metodo.
- `eikon-cierre-financiero` (flujo) — el recorrido completo del cierre mensual.
