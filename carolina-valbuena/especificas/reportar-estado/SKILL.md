---
name: reportar-estado
description: 'Arma el reporte financiero para leer y decidir, no para archivar: semaforo por cuenta, plan contra real con las desviaciones explicadas, alertas ordenadas por riesgo y las acciones concretas del periodo. Ramifica en `alcance`: `semanal` es el pulso corto del ritmo, `mensual` agrega cierre del mes y tendencia, y `junta` arma la version para socios o board, con el numero incomodo adelante y no escondido en un anexo. Usar al cerrar la semana o el mes, o antes de una reunion donde haya que mostrar como va la plata.'
metadata:
  version: 1.0.0
  empresa: Eikon Digital
  tipo: motor de apoyo
  entrega: equipo de contenido (2026-10-07)
---

> **Motor de apoyo en esta entrega.** Lo usa `eikon-reporte-mensual`, que le delega el método. No hay un ledger financiero configurado: cuando este skill diga «leer el ledger», pide esos datos directamente (cuentas, software contable, rutas de los archivos) y sigue.

Un reporte financiero sirve si quien lo lee sabe que hacer al terminarlo. Este skill preserva dos
invariantes: **el numero incomodo va adelante**, nunca en un anexo ni suavizado; y **toda cifra
sale de un artefacto existente** —conciliacion, cartera, proyeccion—, ninguna se recalcula por
dentro ni se estima al vuelo. El tono es de apoyo y realidad: quien lo lee ya sabe que hay un
reto, y necesita salidas, no senalamientos.

## Cuándo usar

- Explicito: "¿como vamos de plata?", "armame el reporte", "preparalo para la junta", "plan contra
  real del mes".
- Implicito: lo llama `cerrar-semana` como ultimo paso.
- Cadencia: `semanal` en el ritmo, `mensual` al cierre, `junta` cuando toque.

## Cuándo NO usar

- Si los insumos no estan al dia. Un reporte sobre datos viejos es peor que no tenerlo: se decide
  sobre el. Si falta algo, lo digo antes de armarlo.

## Conexiones

- **Hoja de calculo / Documentos** — `degrada`. Con conexion dejo el reporte donde se comparte.
  Sin ella entrego Markdown listo para pegar.

## Input del usuario

Todo sale de artefactos ya producidos. Lo unico que puedo preguntar es contexto que ningun archivo
tiene.

| Campo | Requerido | Pregunta si falta |
|---|---|---|
| Proyeccion vigente | ✅ | De `proyectar-flujo`. Si no hay: "Necesito la proyeccion actualizada, ¿la corremos?" |
| Cartera y cuentas por pagar | ✅ | De `registrar-facturacion` y la corrida de pagos. |
| Saldos | ✅ | De `procesar-extractos`. |
| Que cambio en el negocio | — | "¿Paso algo esta semana que explique un numero raro? Un cliente que se cayo, un cobro que se adelanto." |
| Audiencia | — | Solo en `alcance=junta`. "¿Para quien es? Cambia que se explica y que se da por sabido." |

## Workflow

1. **Verificar frescura de los insumos.** Si alguno tiene mas de siete dias, lo digo arriba del
   reporte, no al pie.
2. **Armar el semaforo por cuenta y por entidad** con los umbrales del ledger. Sin umbrales, el
   saldo va sin color y se dice.
3. **Plan contra real.** Comparo la proyeccion anterior contra lo que efectivamente paso, linea por
   linea, y **explico las tres desviaciones mas grandes** con causa, no solo con magnitud. Una
   variacion sin explicacion no es informacion.
4. **Ordenar las alertas por riesgo**, que es impacto por probabilidad y no monto solo: una semana
   sin con que pagar la nomina pesa mas que una cifra grande que no vence pronto.
5. **Ramificar en `alcance`**:
   - `semanal` — una pagina: semaforo, que entro y salio, que se cobra y que se paga, la primera
     semana en rojo, tres acciones.
   - `mensual` — agrega cierre, tendencia de tres meses, cartera envejecida y estado de
     conciliaciones.
   - `junta` — arranca con la situacion en dos parrafos honestos, sigue con las decisiones que se
     necesitan de esa sala, y deja el detalle atras. **Lo que se pide se dice explicito**: cuanto,
     para cuando y para que.
6. **Cerrar con acciones**, cada una con responsable y fecha. Un reporte que termina en un grafico
   no produce nada.
7. **Escribir atomico** y entregar.

## Reglas duras

- **Nunca recalculo una cifra por dentro.** Sale del artefacto o no sale. Si dos artefactos se
  contradicen, lo reporto en vez de elegir uno.
- **Nunca escondo el numero incomodo** ni lo mando a un anexo.
- **Nunca promedio para tapar una semana negativa.**
- **Nunca presento una variacion sin causa.**
- **Nunca uso tono de reproche.** Se reportan hechos y salidas.
- **Nunca armo el reporte en silencio sobre insumos viejos.** La advertencia va arriba.
- **Nunca proyecto en `junta` un escenario con pipeline sin marcarlo** como no comprometido.

## Output esperado

- `finanzas/reportes/{alcance}-{AAAA-MM-DD}.md`.
- Al usuario: el reporte listo, y en el chat las tres cosas que importan y que decision espera cada
  una.

## Skills relacionados

- **Antes:** `proyectar-flujo`, `conciliar-cuentas`, `cobrar-cartera`, `priorizar-pagos`.
- **Lo llama:** `cerrar-semana`.
- **Equivalente en Estados Unidos:** `report-my-position`.
