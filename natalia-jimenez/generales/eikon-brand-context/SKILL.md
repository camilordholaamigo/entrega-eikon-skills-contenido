---
name: eikon-brand-context
description: 'Construye y mantiene el "cerebro de marca" de cada cliente de Eikon: identidad y tono con ejemplos de sí/no, lineamientos gráficos, restricciones legales y de oferta, portafolio, guardianes de marca y su criterio real, histórico de lo aprobado y lo rechazado, y lista de nunca-hacer. Es la dependencia de toda la Ola 2 y de media Ola 3: sin esta ficha, el contenido sale genérico y el informe mensual sale plano. USA cuando arranque una marca nueva, cuando haya que actualizar la ficha después de un rechazo o un cambio de lineamiento, o cuando alguien pregunte qué puede y qué no puede decir una marca. NO usa para generar la pieza — esto alimenta a quien la genera.'
metadata:
  version: 1.2.0
  empresa: Eikon Digital
  tipo: skill de Eikon
  entrega: equipo de contenido (2026-10-07)
---

# eikon-brand-context

Construye la ficha de marca que el resto del sistema consulta antes de escribir una sola línea.

**El problema que resuelve.** Dirección de cuentas lo dijo textual: *"todo el mundo está usando ChatGPT en su versión gratuita, se usa muy general, no tiene el contexto completo de la cuenta… muchos content son copiar y pegar nada más."* El modelo no es el problema — el contexto ausente sí. Esta ficha es ese contexto, escrito una vez y versionado.

**Lo que NO hace:** generar piezas, aprobar contenido, ni reemplazar al guardián de marca. Produce el insumo que hace que todo lo demás deje de sonar genérico.

---

## Cuándo corre

| Situación | Modo |
|---|---|
| Cuenta nueva | **Construcción** — ficha desde cero (fases 1 a 5) |
| Rechazo de una pieza | **Aprendizaje** — solo fase 4, se suma el caso al histórico |
| Cambio de lineamiento, campaña o temporada | **Actualización** — fases 2 y 3, sube la versión |
| Alguien pregunta "¿esto se puede decir?" | **Consulta** — se lee la ficha, no se reconstruye |

El modo Aprendizaje es el que sostiene el valor en el tiempo. Una ficha que no registra rechazos se vuelve mentira en tres meses.

---

## Fase 1 — Levantamiento

Preguntar **en una sola tanda**, no de a una. El equipo de cuentas está saturado; una ronda de 8 preguntas se responde, ocho rondas de una no.

1. ¿Qué vende esta marca exactamente y a quién? (portafolio y público real, no el del brochure)
2. ¿Quién aprueba? Nombre, rol, y **si hay segundo filtro**.
3. ¿Qué NO se puede decir nunca? (legal, comercial, competencia, precios)
4. ¿Qué se rechazó en los últimos 3 meses y por qué?
5. ¿Qué contenido funcionó mejor y cómo lo saben?
6. ¿Hay manual de identidad? ¿Dónde vive?
7. ¿Qué temporadas o hitos marcan el año de esta marca?
8. ¿Cuánto tarda realmente una aprobación, de punta a punta?

**Fuentes a barrer antes de preguntar**, para no pedir lo que ya está: la carpeta estandarizada del cliente en Drive, el manual de identidad si existe, las últimas 2 parrillas aprobadas, y el hilo de WhatsApp o correo donde se aprobó/rechazó lo último.

Si el manual de identidad existe, **no lo transcribas** — referenciá su ruta en Drive y extraé solo lo que se usa a diario: paleta, tipografías, uso de logo, y las tres reglas que más se violan.

### La fuente que vale más que el brandbook

Contenido de Eikon dejó la observación más útil de toda la revisión, y contradice el orden de la v1.0:

> *"Me parece importante que este manual de marca no tome de base brandbooks y estrategias de marca,
> sino histórico de conversaciones con cliente para tener una data del estilo que cliente busca en la
> marca. Esto me ayudó mucho al redactar artículos y piezas con marcas que tienen do/don't que
> surgieron en conversaciones o comentarios de presentaciones."*

Tiene razón y el motivo es estructural: **el brandbook dice lo que la marca quiere ser; el histórico
de comentarios dice qué le rechazan de verdad al equipo.** Cuando los dos se contradicen, gana el
segundo — es el que predice si la pieza pasa.

Orden de prioridad de las fuentes, de mayor a menor:

| # | Fuente | Por qué pesa lo que pesa |
|---|---|---|
| 1 | **Comentarios sobre piezas rechazadas** | Es el criterio real del guardián, dicho sobre un caso concreto |
| 2 | **Correos y actas de presentaciones** | Ahí aparecen los do/don't que nunca llegaron al manual |
| 3 | **Mensajes de aprobación por WhatsApp** | Fuente incómoda pero real: buena parte del criterio vive ahí |
| 4 | **Piezas aprobadas del último año** | Lo que sí pasó, que es evidencia más dura que lo que se declara |
| 5 | **Brandbook y manual de identidad** | El marco formal: colores, tipografía, uso de logo |
| 6 | **Estrategia de marca declarada** | Lo que la marca aspira a ser |

Los niveles 1 a 3 no suelen estar ordenados en ningún lado — hay que ir a buscarlos al correo y a los
chats de la cuenta. **Es el trabajo más aburrido del levantamiento y el que hace la diferencia entre
una ficha que sirve y una que repite el brandbook.**

Cuando una regla del brandbook fue contradicha en la práctica, la ficha registra las dos y marca cuál
gana:

```
Uso de emojis
  Brandbook:   "sin emojis en comunicación de marca"
  Práctica:    aprobados en 14 de las últimas 20 piezas de Instagram
  Vigente:     permitidos en redes, no en piezas de campaña ni en web
  Evidencia:   correo de aprobación 12-jun, comentario de Juliana sobre pieza #340
```

### Los tres inputs que faltaban

Planeación de Eikon pidió sumarlos al levantamiento:

- **Sistema de diseño**, si la marca lo tiene. Distinto del manual de identidad: son componentes,
  tokens y reglas de composición, y es lo que decide si una pieza es armable sin diseñador.
- **Núcleo estratégico o True North** de la marca. La frase que ordena las decisiones cuando hay
  conflicto entre dos lineamientos.
- **Plan de mercadeo o comercial del cliente** del período. Sin él, la ficha describe la marca pero no
  sabe qué está tratando de vender este trimestre — y el contenido sale correcto y desalineado.

## Fase 2 — Cadena de aprobación con tiempos reales

Este bloque es el que más dolor ahorra y el que casi nadie documenta.

Registrar por marca: **quién aprueba, en qué orden, cuánto tarda de verdad** (no el SLA nominal), y qué dispara un segundo filtro.

Realidad conocida de la cartera de Eikon, a validar por cuenta:

- **Grupo Caminos** (Subaru, Suzuki, Citroën, PWM) y **Andinautos**: doble aprobación — cliente directo **más** guardianes de marca a nivel nacional. El segundo filtro es el que se come el calendario y es invisible en la planeación.
- **Alcaldía de Manizales**: entidad pública que **envía las piezas ya hechas**; la agencia pauta. La ficha acá no gobierna creación, gobierna qué se puede pautar y con qué evidencia se factura.
- **Greyman Ecuador**: social media más servicio al cliente en canales digitales — la ficha necesita además el árbol de respuestas y el criterio de escalamiento.

Si una marca tiene doble filtro y la ficha no lo dice, la parrilla se planea contra un plazo que no existe.

## Fase 3 — Tono: pares con tensión, no adjetivos

Un adjetivo no es un tono. *"Cercano pero profesional"* es el ejemplo que la industria cita
transversalmente como inútil — no especifica largo de oración, ni grado de distancia, ni cómo se ve
en un caso real. Y es exactamente lo que produce el copy genérico.

**Cada atributo se escribe como un par con tensión**, no como adjetivo suelto:

```
cálido, no confianzudo
directo, no cortante
seguro, no soberbio
```

La tensión hace el trabajo: dice hacia dónde ir **y** dónde está el límite. *"Cercano"* solo no.

Después, por cada atributo, un par de ejemplos sacados de contenido real aprobado y rechazado:

```
Atributo: cálido, no confianzudo
✅ "Ya está listo tu Subaru. Pasá cuando quieras."
❌ "Nos complace informarle que su vehículo se encuentra disponible."
❌ "¡Ey! Tu nave te espera 😎"
```

Tres a cinco pares. Menos de tres no calibra; más de cinco nadie los lee.

**Si hace falta una escala, usar las 4 dimensiones de NN/g** en vez de inventar una — es el
estándar que otros practitioners reconocen: Divertido↔Serio · Formal↔Casual · Respetuoso↔Irreverente
· Neutro↔Entusiasta, cada una de 1 a 3.

### Reglas estructurales — lo que más mueve la aguja con IA

La IA sigue reglas objetivas con alta fiabilidad y falla con adjetivos. Documentar siempre:

- Longitud promedio de oración y máximo de oraciones por párrafo.
- Política de emojis y hashtags **por canal**.
- Tratamiento (tú / usted / vos).
- Vocabulario obligatorio, vocabulario prohibido, naming aprobado de producto.

**El tono cambia por canal.** LinkedIn, Instagram y TikTok no son el mismo registro; una ficha que
no lo separa produce contenido aplanado al mismo tono en todos lados.

## Fase 3.5 — Ejemplos anotados (la sección de mayor impacto)

**Este es el hallazgo que reordena el resto del skill:** el campo que más reduce el "esto no suena a
la marca" no es la descripción de voz — son **2 o 3 piezas gold standard anotadas** por tipo de
contenido. Mostrar cómo escribe la marca funciona mejor que instruir con adjetivos.

Consecuencia práctica: **una ficha con voz + tres ejemplos anotados rinde más que una ficha
impecable sin ejemplos.** Si el tiempo alcanza para una sola cosa, que sean los ejemplos.

Por cada ejemplo: la pieza real, y al costado **por qué funciona** — qué decisión concreta la hace
sonar a esta marca y no a otra. Una pieza sin anotar es un ejemplo; una anotada es una regla.

## Fase 4 — Histórico: lo aprobado y lo rechazado

Por cada rechazo: **qué se propuso, quién lo rechazó, la razón textual, y qué se hizo en su lugar.** La razón textual importa más que la parafraseada — "no me gusta el morado" y "el morado es de la competencia" producen reglas distintas.

Cada rechazo se destila en una regla de la lista de nunca-hacer. Si un rechazo no produce regla, se registra igual bajo "criterio del guardián", que es una categoría legítima: hay aprobadores cuyo criterio es personal y no sistematizable, y saber quiénes son también es información.

**Reglas con razón, no reglas sueltas.** Cada línea de nunca-hacer lleva su porqué. Sin el porqué,
ante un caso que la ficha no anticipó el equipo *"o rompe la regla o se paraliza"* — y los dos
desenlaces son malos. Por eso la ficha cierra con **principios para lo no previsto**, no solo con
reglas cerradas.

### La lista de nunca-hacer incluye los tells de IA

Independiente de la marca, estos delatan texto generado y hay que vetarlos por defecto:

- Em dash compulsivo.
- Vocabulario de relleno: *sumérgete, tapiz, pivotal, panorama, en el vertiginoso mundo de*.
- Rangos falsos: *"desde reuniones íntimas hasta movimientos globales"*.
- Cierres tipo *"En conclusión"*, *"En resumen"*.
- Sobre-formateo: bullets "Término: definición", negritas por todos lados, emojis en títulos.

Ninguno aislado delata IA — la combinación sí, y las audiencias la reconocen aunque no puedan
nombrarla. El contexto de por qué esto importa comercialmente: el contenido percibido como generado
por IA pierde entre 20% y 35% de engagement.

## Fase 5 — Escribir la ficha

Usar `references/ficha-marca-template.md`. Destino:

```
marcas/{marca}/ficha.md
```

En Claude Code esa ruta es relativa a la carpeta de trabajo de la cuenta. En Claude (web o escritorio), entrega la ficha como documento descargable para guardarla en el Drive de la cuenta y cargarla como conocimiento del proyecto de esa marca.

Versionado: `v1.0` al crear. Sube **minor** en actualización de contenido, **major** cuando cambia el posicionamiento o el aprobador. Cada versión abre con la fecha y qué cambió respecto de la anterior — dos líneas, no un changelog.

---

## Reglas duras

Salen de las entrevistas y son innegociables:

1. **La ficha no aprueba nada.** Las aprobaciones de cliente no se automatizan: *"ellos manejan sus propios tiempos y no los podemos automatizar."*
2. **La ficha no genera el arte final.** Alimenta el brief y las variantes de trabajo; la pieza que sale la firma un humano.
3. **Nada de datos sensibles en la ficha.** Sin credenciales de plataforma, sin bases de clientes finales, sin presupuestos de marca previos al lanzamiento. Si hace falta referenciarlos, va la ruta en Drive, no el dato.
4. **Lo que no se sabe se marca como no sabido.** Un campo vacío es información. Un campo inventado envenena todo lo que consume la ficha.

---

## Criterios de calidad

La ficha quedó bien si:

- Alguien que **nunca tocó la cuenta** puede escribir un caption pasable leyéndola sola.
- Tiene **al menos 2 ejemplos anotados** por tipo de contenido. Sin esto, lo demás rinde poco.
- La cadena de aprobación tiene **tiempos reales**, no SLA nominales.
- Hay al menos 3 pares de tono con tensión, tomados de contenido real.
- Cada regla de nunca-hacer rastrea a un rechazo concreto o a una restricción citada, **y lleva su razón**.
- Los huecos están marcados como huecos.
- **Se puede consultar en menos de un minuto.** Doce páginas que se usan ganan a ochenta que nadie abre. Si alguien a cinco minutos de una reunión no encuentra lo que busca, la ficha falló aunque esté completa.

**Test rápido:** si la ficha se lee igual de bien cambiándole el nombre a otra marca del portafolio, no está lista.

**Mínimo viable:** tono con pares (Fase 3) + ejemplos anotados (Fase 3.5) + nunca-hacer (Fase 4).
Con eso ya sirve. El resto se completa con el tiempo — una ficha incompleta que se usa vale más que
una completa que nadie llena.

---

## Nota de posicionamiento comercial

El **histórico de rechazos como parte viva de la ficha no existe como práctica publicada** en la
industria. Los brand books documentan identidad; los rechazos viven en herramientas de workflow
separadas (Marq, Ziflow), cuando viven en algún lado. Que Eikon lo integre en un solo artefacto es
diferenciación real, no adaptación de algo existente — vale posicionarlo así frente al cliente.

Dato relacionado que ordena la conversación: alrededor del 95% de las empresas tienen guidelines
documentados y solo un 25% los hace cumplir. El problema del mercado no es escribir la ficha, es
usarla.

## Qué alimenta

`eikon-parrilla-mensual`, `eikon-caption-writer`, `eikon-brief-creativo`, `eikon-respuestas-comunidad`, `eikon-ajustes-parrilla` (Ola 2); `eikon-propuesta-estrategica` y `eikon-deck-propuesta` (Ola 3); y `eikon-reporte-mensual` (Ola 1), que sin esto entrega análisis sin criterio de marca.
