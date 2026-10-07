# Estados, SLA y fuentes por cuenta — PROPUESTO

> ⚠️ **Todo este archivo es propuesta derivada de las 18 entrevistas, no un acuerdo del equipo.**
> Solo dos valores están confirmados y vienen de la configuración de Eikon:
> `implementacion_pauta_sla_horas: 48` y `alerta_pieza_sin_aprobar_dias: 5`.
> Validar con dirección general de cuentas (Belén Núñez) antes del piloto. Corregir acá, nunca en
> `SKILL.md`.

## Máquina de estados — perfil estándar (social media, ~70% de los contratos)

| # | Estado | Dueño del paso | SLA propuesto | Sale del estado cuando |
|---|---|---|---|---|
| 1 | `por diseñar` | Content manager | 2 días hábiles | El brief creativo está entregado a la mesa de diseño |
| 2 | `en diseño` | Diseño | 3 días hábiles | Hay pieza v1 cargada en la carpeta del cliente |
| 3 | `revisión interna` | Director de cuenta | 1 día hábil | Se aprueba internamente o se devuelve |
| 4 | `con cliente` | Cliente | **no aplica** — se mide, no se exige | Llega aprobación escrita |
| 5 | `aprobada` | Content manager | 1 día hábil | Queda programada o entregada a tráfico |
| 6 | `publicada` | — | — | Estado final |
| ↩ | `devuelta` | Diseño | 2 días hábiles | Vuelve a `revisión interna` |

**El estado 4 no tiene SLA a propósito.** Regla dura del CONTEXT: *"ellos manejan sus propios tiempos
y no los podemos automatizar"*. Se registra la espera para la conversación comercial, no para exigir.

## Perfiles por tipo de cuenta

| Perfil | Cuentas conocidas | Diferencia |
|---|---|---|
| **Concesionario con doble filtro** | Grupo Caminos (Subaru, Suzuki, Citroën, PWM), Andinautos | El estado `con cliente` se parte en `4a. cliente directo` y `4b. guardián de marca nacional`. Se registra la espera de cada uno por separado. |
| **Entidad pública que envía pieza** | Alcaldía de Manizales | No aplican los estados 1-3. El flujo arranca en `aprobada` y sigue a pauta. Sí aplica el control de evidencia de facturación por punto de contrato. |
| **Social media estándar** | Greyman Ecuador y el resto | Máquina completa, sin desdoble. |
| **Pauta** | Transversal a los anteriores | El paso de tráfico agrega **48h** de SLA confirmado, contadas desde material aprobado y completo. Material incompleto (tamaño o URL mal) **reinicia el reloj** — es la devolución que medios reporta como más frecuente. |

## Umbrales de riesgo

| Señal | Umbral propuesto | Nivel |
|---|---|---|
| Días en estado sobre el SLA del paso | > 2× SLA | 🟡 Atención |
| Tiempo restante < trabajo pendiente | cualquier déficit | 🔴 Incumple |
| Tiempo restante = trabajo pendiente sin holgura | 0 días de margen | 🟠 En riesgo |
| Pieza sin aprobar cerca de la salida | 5 días (**confirmado**) | 🟠 En riesgo |
| Fuente de verdad sin actualizar | > 7 días | ⚠️ Perímetro degradado |
| Espera del cliente | > 5 días hábiles | Se reporta, no escala |

## Fuentes por cuenta

Completar una fila por cuenta activa en el `init`. Sin esta tabla el skill no sabe dónde mirar.

| Cuenta | Parrilla aprobada | Planilla de seguimiento | Hilo de aprobaciones | Acta de comité | WhatsApp |
|---|---|---|---|---|---|
| _(pendiente)_ | Drive: `…` | Sheets: `…` | Gmail: etiqueta `…` | Drive: `…` | ⬜ no exportable |

**WhatsApp queda en `⬜` para todas las cuentas.** Es el canal real del cliente y no hay línea
corporativa ni exportación. Es un hueco declarado del sistema, no un pendiente de configuración: se
resuelve con una decisión de gerencia sobre el canal, no con este skill.

## Cadena de aprobación

Por cuenta: quién aprueba internamente, quién aprueba del lado del cliente, si hay segundo filtro de
marca, y por qué medio llega la aprobación válida. **Una aprobación por WhatsApp no es trazable**;
la práctica que el tablero asume es que se confirme por correo o quede registrada en la planilla.
Mientras esa práctica no exista, el tablero va a mostrar aprobaciones "pendientes" que en la realidad
ya se dieron — y eso hay que decirlo en el piloto en vez de dejar que el equipo pierda confianza.
