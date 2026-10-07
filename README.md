# Eikon OS · Skills para Claude — Equipo de contenido

Las skills de Eikon para el área de social media y contenidos, construidas a partir de las entrevistas de agosto y de la revisión del 28 de agosto. Una skill es un manual de trabajo que Claude sigue cuando la tarea lo pide: no es un programa, no se conecta sola a ninguna plataforma y **no le publica ni le envía nada a nadie**.

Es la segunda entrega. La primera (5 de octubre) fue para gerencia y dirección de cuentas: [camilordholaamigo/entrega-eikon-skills-fase1](https://github.com/camilordholaamigo/entrega-eikon-skills-fase1). Las skills que se repiten son la misma versión.

Esta va para las 9 personas del equipo, cada una con su carpeta. **Todas tienen las mismas 16 skills**; lo que cambia es cómo vienen agrupadas en su guía:

| Carpeta | Para | Su guía agrupa las skills por | Total |
|---|---|---|---:|
| [`kimberly-chocano/`](kimberly-chocano/) | Kimberly Chocano · Dirección de Social Media | los procesos que contó en su entrevista | 16 |
| [`carolina-valbuena/`](carolina-valbuena/) | Carolina Valbuena · Content y Community Management · cuenta de Ecuador | los procesos que contó en su entrevista | 16 |
| [`lina-lancheros/`](lina-lancheros/) | Lina Lancheros · Content Manager | los procesos que contó en su entrevista | 16 |
| [`melanny-duque/`](melanny-duque/) | Melanny Duque · Equipo de contenido | los procesos del área (todavía sin entrevista) | 16 |
| [`natalia-ortiz/`](natalia-ortiz/) | Natalia Ortiz · Equipo de contenido | los procesos del área (todavía sin entrevista) | 16 |
| [`isabel-rosales/`](isabel-rosales/) | Isabel Rosales · Equipo de contenido | los procesos del área (todavía sin entrevista) | 16 |
| [`diana-salazar/`](diana-salazar/) | Diana Salazar · Equipo de contenido | los procesos del área (todavía sin entrevista) | 16 |
| [`natalia-jimenez/`](natalia-jimenez/) | Natalia Jiménez · Equipo de contenido | los procesos del área (todavía sin entrevista) | 16 |
| [`camilo-rodriguez/`](camilo-rodriguez/) | Camilo Rodríguez · Equipo de contenido | los procesos del área (todavía sin entrevista) | 16 |

Dentro de cada carpeta:

- **`generales/`** — las 4 skills de Eikon que sirven a cualquier persona de la agencia.
- **`especificas/`** — las 12 del área de contenido.
- **`descargas/`** — un `.zip` por skill, listo para subir a Claude.
- **`README.md`** — su guía: qué skill usar en cada proceso y por dónde empezar.

En total viajan **15 skills de Eikon** y 1 motor de apoyo que usa el informe mensual.

## Antes que nada: la ficha de marca

Casi todo lo de contenido depende de `eikon-brand-context`, que arma la ficha de cada marca: tono con ejemplos de sí y de no, lineamientos, restricciones legales y de oferta, guardianes y el histórico de lo aprobado y lo rechazado. **`eikon-caption-writer` se niega a escribir sin ficha**, y la parrilla sin ficha sale genérica. Hasta donde sabemos, ninguna cuenta tiene todavía su ficha: la primera tarea con cada marca es armarla.

> *«Arma la ficha de marca de [marca]»* y adjunten el manual de marca, dos o tres parrillas aprobadas y, si los tienen, comentarios de rechazo del cliente.

## Cómo instalarlas

### Antes: qué cuenta de Claude usar

Su documento de gobernanza (§4) lo deja claro: parrillas, briefs, reportes y actas son información **interna** y solo entran a una versión de **equipo o empresa**, sin entrenamiento sobre lo que se le pasa. Instalen estas skills en la cuenta de Claude de Eikon, no en una cuenta personal gratuita.

### A. Claude en la web o en la app de escritorio

1. Abran su carpeta → `descargas/` y bajen los `.zip` (uno por skill, en `generales/` y `especificas/`).
2. En Claude: **Configuración → Capacidades**. Si está apagada, activen *Ejecución de código y creación de archivos*.
3. En **Skills**, elijan *Subir skill* y seleccionen el `.zip`. Una vez por skill.
4. Listo. Claude la usa sola cuando la tarea coincide con su descripción, y también se puede pedir por nombre: *«usa eikon-caption-writer con esta parrilla»*.

Si no aparece la sección Skills, la tiene que habilitar quien administra la cuenta de Claude de Eikon. En los planes de equipo esa persona también puede publicarlas para toda la organización, y así no las sube cada una.

### B. Claude Code

Desde la carpeta del repositorio:

```powershell
# Windows
powershell -ExecutionPolicy Bypass -File .\instalar.ps1 kimberly-chocano
```

```bash
# Mac o Linux
./instalar.sh lina-lancheros
```

Copia `generales/` y `especificas/` de esa persona a `~/.claude/skills`. Después, reinicien Claude Code.

### C. El repositorio completo

En GitHub, **Code → Download ZIP**, o `git clone`.

## Reglas que respetan todas

Salen de sus entrevistas y del documento de gobernanza del 4 de septiembre:

1. **Las aprobaciones del cliente no se automatizan.** Ellos manejan sus tiempos.
2. **Nada sale al cliente sin revisión humana previa.** Ninguna propuesta creativa se envía por correo sin que una persona la revise.
3. **La pieza gráfica final no la hace la IA.** Referencias, brief y variantes de trabajo sí; el arte final lo firma una persona.
4. **Las respuestas que piden criterio comercial o validación del cliente salen como borrador.** El envío es humano.
5. **Lo creativo lo decide el equipo.** Las skills proponen, investigan y redactan borradores; el criterio es de ustedes.
6. **No se tocan transacciones de e-commerce ni bases con información sensible.**

Y una de datos: lo **restringido** —credenciales, bases de clientes finales, campañas y presupuestos de marca antes del lanzamiento, datos de los trabajadores del cliente— **no se pega en Claude**.

> ⚠️ **Accesos y datos personales.** Las claves de las redes de cada cliente (el Excel de accesos) son información **restringida**: no se pegan en Claude ni se suben como adjunto. Para `eikon-respuestas-comunidad`, peguen los mensajes sin teléfonos, correos ni números de documento.

## Las 16 skills de esta entrega

**Clase** (de su documento de gobernanza del 4-sep): **C1** sale al cliente — revisión previa, siempre · **C3** opera la mesa — se revisa la excepción · **C4** insumo que otros consumen — se revisa al publicarlo. «—» = posterior a ese documento o motor de apoyo: queda por clasificar en el comité.

| Skill | Para qué | Clase | Estado | Carpeta |
|---|---|:-:|---|---|
| `eikon-brand-context` | Ficha de marca: tono, lineamientos y lo que nunca se hace | C4 | Con su revisión del 28-ago | generales |
| `eikon-acta-reunion` | Acta con decisiones, propuestas y pendientes, cada uno con su cita | C3 | Con su revisión del 28-ago | generales |
| `eikon-sop-writer` | Documenta un proceso como SOP ejecutable | C3 | Con su revisión del 28-ago | generales |
| `eikon-priorizador-dia` | Ordena las solicitudes contra la capacidad real del equipo | C3 | Con su revisión del 28-ago | generales |
| `eikon-parrilla-mensual` | Parrilla del mes, pieza por pieza | C1 | Con su revisión del 28-ago | especificas |
| `eikon-caption-writer` | Copies y captions en la voz de cada marca | C1 | Con su revisión del 28-ago | especificas |
| `eikon-brief-creativo` | Brief de diseño de una página, sin huecos | C1 | Con su revisión del 28-ago | especificas |
| `eikon-referencias-tendencias` | Barrido de tendencias y referencias por marca | C4 | Con su revisión del 28-ago | especificas |
| `eikon-ajustes-parrilla` | Aplica el feedback del cliente a toda la parrilla | C1 | Con su revisión del 28-ago | especificas |
| `eikon-qa-creativo` | Revisa un concepto antes de producirlo | C1 | Primera versión | especificas |
| `eikon-qa-pieza` | Revisa la pieza terminada antes de enviarla | C1 | Con su revisión del 28-ago | especificas |
| `eikon-metricas-pull` | Normaliza los exports de todas las plataformas | C3 | Con su revisión del 28-ago | especificas |
| `eikon-reporte-mensual` | Informe mensual de una cuenta, en tres capas | — | Primera versión | especificas |
| `reportar-estado` | Motor: semáforo y plan contra real | — | Motor del catálogo base | especificas |
| `eikon-estado-cuenta` | Estado real de una cuenta y qué está en riesgo | C3 | En piloto desde el 16-ago | especificas |
| `eikon-respuestas-comunidad` | Borradores de respuesta a comentarios y mensajes | C1 | Con su revisión del 28-ago | especificas |

**Estado:** *En piloto* = ya se usa con una cuenta real · *Con su revisión del 28-ago* = se hizo o se ajustó con los comentarios que nos devolvieron · *Primera versión* = todavía no pasó por su revisión · *Motor del catálogo base* = skill genérica que otra de Eikon usa por dentro.

## Skills que se encadenan

Algunas están pensadas para correr una detrás de otra: la salida de una es la entrada de la siguiente. Por ahora se corren paso a paso: se le pide a Claude la primera y, con su resultado, la siguiente.

- **Mes de contenido** (Contenido, con revisión de social media): `eikon-brand-context` → `eikon-referencias-tendencias` → `eikon-parrilla-mensual` → `eikon-caption-writer` → `eikon-brief-creativo`. Completo en todas las carpetas. Ataca los siete días que hoy toma armar la grilla.
- **Parrilla a entrega** (Contenido y diseño): `eikon-ajustes-parrilla` → `eikon-brief-creativo` → `eikon-estado-cuenta` → `eikon-priorizador-dia`. Completo en todas las carpetas. Va de la parrilla con comentarios del cliente a la cola de producción. El paso de mapa de dependencias llega en la fase 2.
- **Informe del mes (orgánico)** (Contenido, con medios para la pauta): `eikon-metricas-pull` → `eikon-reporte-mensual`. Completo en todas las carpetas. La lectura de la pauta (`eikon-insight-pauta`) la hace medios y entra entre los dos pasos.

## Lo que hay que saber

- **Salvo `eikon-estado-cuenta`, ninguna se ha corrido todavía con datos reales de Eikon.** Esta entrega es para eso: lo que salga mal o raro, nos lo cuentan y lo ajustamos.
- **Cada skill dice lo que todavía es propuesta**, en su sección *⚠️ Supuestos pendientes de validación*: la cadencia por red, la cantidad de hashtags, la ventana de tendencias, la taxonomía de mensajes. Vale la pena leerla antes de la primera corrida y corregirnos.
- **Las skills no entran a Meta Business Suite ni a Fanpage Karma.** `eikon-metricas-pull` trabaja con los exports que ustedes bajan, y se construyó sin ver un export real de Eikon: con el primero de cada plataforma ajustamos los nombres de columna.
- **`eikon-reporte-mensual` se armó sin los informes de muestra** que pedimos (uno bueno y uno flojo): el formato de tres capas es nuestra propuesta. Con esos dos ejemplos lo calibramos.
- **Algunas skills nombran otras de Eikon que son de otras áreas** (`eikon-alerta-pauta`, `eikon-brief-interrogador`, `eikon-cotizador`, `eikon-deck-propuesta`, `eikon-insight-pauta`, `eikon-propuesta-estrategica`, `eikon-query-listening`, `eikon-salud-cuenta`). Esas las usan cuentas, medios y nuevos negocios, y están en la [entrega del 5 de octubre](https://github.com/camilordholaamigo/entrega-eikon-skills-fase1). No hacen falta para usar las de esta carpeta.
- **`eikon-referencias-tendencias` toma la competencia de `eikon-inventario-assets`**, que todavía no se entrega. Pásenle ustedes la lista de competidores de la marca, o pónganla en su ficha.

## Lo que todavía falta, y por qué

- **Media kit mensual (Lina).** No hay ninguna skill que genere los códigos y las líneas de pauta del media kit. Lo describió una sola persona, así que antes de construirla hay que validar con medios cómo se arman los códigos. Es la primera candidata de la fase 2.
- **Indicadores de servicio al cliente (Carolina).** `eikon-respuestas-comunidad` redacta, tipifica y escala, pero todavía no calcula contactabilidad, tiempos de respuesta y resolución del mes, porque todavía no conocemos el SLA de respuesta de cada cuenta.
- **Recordatorios al aprobador (Carolina).** `eikon-estado-cuenta` marca las aprobaciones vencidas, pero no le recuerda nada a nadie. Las aprobaciones del cliente no se automatizan: la skill dice qué está vencido y de quién depende, y el recordatorio lo manda una persona.
- **Mapa de dependencias de producción.** Es un paso de la cadena *parrilla a entrega*. Es una skill genérica del catálogo que lee la configuración de Eikon y llega en la fase 2. Mientras tanto, la cadena funciona sin ese paso.
- **Las cadenas automáticas.** Por ahora se corren paso a paso, como se explica arriba.

## Lo que les vamos a preguntar

Quedaron abiertas en las entrevistas y destraban la fase 2:

1. ¿Cómo arman el media kit paso a paso y de dónde salen los códigos?
2. ¿Cuántos mensajes de redes responden al día, y cuántos podrían salir del manual de la marca?
3. ¿Qué parte de la parrilla o del informe les toma más tiempo del que debería?
4. ¿Quién les da acceso a las redes y archivos de cada cliente, y qué no debería tocar nunca una herramienta automática?
