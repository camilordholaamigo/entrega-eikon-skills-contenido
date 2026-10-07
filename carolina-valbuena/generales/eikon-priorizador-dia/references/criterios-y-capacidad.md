# Criterios, capacidad y esfuerzo — PROPUESTO

> ⚠️ **Ningún número de este archivo fue validado por Eikon.** Salen de las entrevistas y de
> convención de industria. Se calibran con las dos primeras semanas de uso comparando estimado contra
> ejecutado. Corregir acá, nunca en `SKILL.md`.

## Capacidad efectiva

Nadie produce 8 horas en una jornada de 8 horas. Factores propuestos, sobre horas declaradas:

| Rol | Factor | Por qué |
|---|---|---|
| Diseño y producción | **0.75** | Trabajo en bloques largos, poca reunión, alta interrupción por devoluciones |
| Content / social media | **0.65** | Coordinación con cliente y mesa, revisiones cortas y frecuentes |
| Medios / tráfico | **0.70** | Implementación en plataforma + revisiones diarias no planificadas |
| Dirección de cuenta | **0.50** | La mitad del día es coordinación y cliente; no es capacidad de producción |

Ejemplo: diseño con 8h declaradas → **6h** de capacidad real para la cola.

**Producción digital merece una nota aparte.** Son dos personas para diseño, desarrollo, hosting,
apps, SEO, GEO y automatizaciones de toda la agencia. Cualquier solicitud que caiga ahí compite
contra las otras mesas, no solo contra la propia. El priorizador de una mesa **no puede** resolver esa
competencia: la declara y la escala.

## Rangos de esfuerzo por tipo de solicitud

Rangos, no puntos. Se usa el techo del rango para calcular el corte — subestimar es lo que produce el
incumplimiento.

| Tipo | Rango propuesto |
|---|---|
| Pieza estática simple (adaptación de plantilla) | 0.5 – 1h |
| Pieza estática nueva (concepto propio) | 2 – 4h |
| Carrusel (por 4-6 slides) | 3 – 5h |
| Video corto / edición CapCut | 3 – 6h |
| Ajuste menor sobre pieza existente | 0.25 – 0.5h |
| Devolución con rediseño | 1 – 3h |
| Copy de pieza | 0.25 – 0.75h |
| Implementación de campaña en plataforma | **48h de SLA** (confirmado), 1-2h de trabajo efectivo |
| Brief creativo | 0.5 – 1h |
| Informe mensual por cuenta | 4 – 8h (el dolor #1; el objetivo del OS es bajarlo) |
| Media kit | ~4h (declarado: *"casi todo un día en sacar dos media kits"*) |

## Pesos del desempate

Solo se usan cuando dos ítems están en la misma clase. El orden es lexicográfico, no una fórmula con
pesos sumados: primero se compara costo de retraso; solo si empatan se pasa al siguiente.

```
1. Costo de retrasarlo
2. Dinero en juego (pauta activa corriendo > pauta pausada > sin pauta)
3. Trabajo ajeno liberado
4. Esfuerzo (menor primero)
```

**Por qué lexicográfico y no un score ponderado:** un score con pesos produce números que nadie puede
discutir en una reunión. Un criterio lexicográfico produce una frase — *"va primero porque si no sale
hoy la campaña no arranca"*— y esa frase se puede refutar, que es exactamente lo que se necesita
cuando el director de cuenta no está de acuerdo con la cola.

## Umbrales de alarma sobre la propia cola

| Señal | Umbral | Qué reportar |
|---|---|---|
| Solicitudes marcadas "urgente" por el solicitante | > 40% de la cola | La marca perdió significado; forzar ranking entre ellas |
| Ítems debajo de la línea de capacidad | > 30% del total | Problema de dotación, no de priorización — escalar a gerencia |
| Compromisos contractuales que no entran | ≥ 1 | Escalar el mismo día a dirección de cuentas |
| Cola que entra completa | 3 días seguidos | La capacidad declarada está subestimada |
| Ítems fuera de alcance | ≥ 2 por semana en la misma cuenta | La cuenta está absorbiendo trabajo no cotizado; input para `eikon-salud-cuenta` |

## Canales de entrada

Las solicitudes llegan por cuatro vías y ninguna es la fuente de verdad: correo, Drive, WhatsApp
personal y Meet. El priorizador **solo ve lo que se le pega o lo que está en Drive/Sheets**. Todo lo
pedido por WhatsApp entra a la cola únicamente si alguien lo transcribe. Es el mismo hueco declarado
de `eikon-estado-cuenta` y tiene la misma causa: no hay canal corporativo. Es decisión de gerencia,
no de este skill.
