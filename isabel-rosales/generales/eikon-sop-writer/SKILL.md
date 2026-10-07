---
name: eikon-sop-writer
description: 'Documenta un proceso de Eikon como SOP ejecutable a partir de cómo lo hace hoy quien lo hace: pasos con responsable por rol, entradas y salidas verificables, puntos de decisión, SLA y qué hacer cuando algo falla. Declara dónde las variantes entre personas son diferencias reales de criterio y no ruido, porque ahí está el proceso que hay que acordar. USA al estandarizar un proceso, al preparar un onboarding o cuando dos personas hacen lo mismo distinto. NO inventa el proceso ideal.'
metadata:
  version: 1.0.0
  empresa: Eikon Digital
  tipo: skill de Eikon
  entrega: equipo de contenido (2026-10-07)
---

# eikon-sop-writer

Escribe el SOP de un proceso **a partir de cómo se hace hoy**, no de cómo debería hacerse.

**El problema que resuelve.** Dirección de cuentas: *"todos los directores de cuenta trabajamos de una
manera supremamente diferente, algunos más ordenados que otros"*. Gerencia general: *"el equipo se
salta procesos, se saltan las fechas de entrega y esto hace que tengamos reprocesos"*.

**Es el prerequisito real de la Ola 4.** Está declarado así en el inventario y conviene decirlo de
frente: **sin proceso acordado, `eikon-estado-cuenta` consolida caos ordenadamente.** Un tablero que
mide contra un proceso que no existe reporta desviaciones contra nada.

**Lo que NO hace:** diseñar el proceso ideal ni decidir cuál variante gana. Documenta, expone las
diferencias y deja la decisión a quien manda en esa área.

---

## La regla que gobierna todo

> **Se documenta lo que se hace, no lo que se debería hacer.** Un SOP que describe un proceso ideal
> que nadie sigue es un documento muerto en dos semanas.

El proceso ideal se puede escribir después, y con más criterio, **una vez que se ve el real**. Al
revés no funciona: es exactamente por qué los manuales anteriores no se usan.

## Fase 1 — Levantar de más de una fuente

Un proceso descrito por una sola persona es el proceso **de** esa persona. Cuando el proceso lo
ejecutan varios —y en Eikon casi todos son así— se levanta de al menos dos, y de tres si hay tres
países.

Por cada fuente: qué hace, en qué orden, con qué herramienta, cuánto le toma, y qué hace cuando algo
sale mal. **La última pregunta es la que más revela** y la que nunca está en los manuales.

## Fase 2 — Separar variante de desviación

**El núcleo del skill.** Cuando dos personas hacen lo mismo distinto, hay tres explicaciones y llevan
a decisiones opuestas:

| Tipo | Qué es | Qué hacer |
|---|---|---|
| **Ruido** | Diferencia sin consecuencia — el orden de dos pasos independientes | Se estandariza por conveniencia. No hay debate |
| **Variante legítima** | La diferencia responde a una condición real: país, tipo de cuenta, tamaño de cliente | **Se documentan las dos**, con la condición que dispara cada una |
| **Desviación** | Una de las dos versiones se salta un control o produce peor resultado | Se nombra, con la consecuencia. La decisión es del dueño del área |

**Colapsar una variante legítima en un solo camino es lo que hace que un SOP se abandone**: quien
opera en Ecuador ve que el manual no contempla su realidad y deja de usarlo. Y llamar "variante" a
una desviación es cómo se institucionaliza el problema.

## Fase 3 — Escribir el SOP

Por paso: qué se hace · **rol** responsable (nunca nombre propio) · entrada · salida verificable ·
herramienta · tiempo estimado · qué hacer si falla.

**La salida verificable es el campo que hace ejecutable el SOP.** "Revisar la pieza" no es un paso;
"la pieza queda marcada como aprobada en la planilla, con fecha y quién aprobó" sí lo es. Sin salida
verificable no se puede saber si el paso ocurrió, y eso es lo que después hace imposible medir.

**Puntos de decisión** explícitos: cuando el proceso se bifurca, cuál es la pregunta, quién la
responde y a dónde va cada rama.

**SLA por paso**, cuando exista. Los que ya están declarados en la agencia: 48h de tráfico, ventana de
4 días del cierre financiero hacia el holding. El resto se propone y se marca como propuesto.

## Fase 4 — Lo que el SOP expone y no resuelve

Bloque obligatorio. Documentar un proceso saca a la luz problemas que no son de documentación:

- Pasos sin dueño claro
- Controles que nadie hace
- Dependencias del equipo transversal, que es el cuello de botella declarado
- Pasos que existen solo porque una herramienta no se configuró
- **Ausencia de métrica del proceso** — gerencia lo nombró como debilidad: *"no hay un proceso ni un
  resultado que midan a cada área"*

Se listan aparte, sin resolverlos. Son insumo para quien dirige el área, no para el SOP.

---

## Reglas duras

1. **Documenta el proceso real, no el ideal.**
2. **No decide cuál variante gana.** Expone y deja la decisión al dueño del área.
3. **Responsables por rol, nunca por nombre propio.** Un SOP con nombres caduca con la primera
   renuncia.
4. **Todo paso tiene salida verificable**, o se marca como no verificable y eso es un hallazgo.
5. **No inventa SLA.** Los que no están declarados se proponen y se marcan como propuestos.
6. **Levanta de más de una fuente** cuando el proceso lo ejecutan varios.
7. **Distingue ruido, variante legítima y desviación**, y nunca llama variante a una desviación.
8. **No documenta procesos que tocan datos sensibles** —nómina, credenciales, información bancaria—
   sin autorización explícita.

## Criterios de calidad

- Cada paso tiene rol, entrada, salida verificable y qué hacer si falla.
- Las variantes legítimas están documentadas con su condición disparadora.
- Las desviaciones están nombradas con su consecuencia, no suavizadas.
- El bloque de lo que el SOP expone y no resuelve tiene al menos un ítem.
- Ningún nombre propio en la columna de responsable.
- Los SLA propuestos están marcados como propuestos.

## ⚠️ Supuestos pendientes de validación

- **Qué proceso se documenta primero.** El inventario sugiere arrancar por el de mesa de cuenta, que
  es el que más variantes tiene y el que bloquea `eikon-estado-cuenta`. Lo decide dirección de cuentas.
- **Dónde viven los SOP.** Depende del hub de Drive que sigue sin definirse en la configuración de Eikon.
- **Quién aprueba un SOP** y cada cuánto se revisa. Sin dueño y sin ciclo de revisión, un SOP
  envejece y vuelve al estado actual.
