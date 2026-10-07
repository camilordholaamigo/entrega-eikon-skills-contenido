# Especificaciones de formatos por plataforma

**Revisión: 2026-08-16 · Estado: SIN VERIFICAR CONTRA DOCUMENTACIÓN OFICIAL**

> ⚠️ Este archivo es la única fuente de tamaños del brief y **es el que más rápido se pudre**. Meta,
> Google y TikTok cambian ubicaciones, límites y requisitos varias veces al año.
>
> **Antes del piloto y cada trimestre:** contrastar contra la guía oficial de cada plataforma y
> actualizar la fecha de revisión de arriba. Un brief que cita specs vencidas produce exactamente la
> devolución que el skill existe para evitar.
>
> Columna **conf.**: 🟢 estable (relación de aspecto y píxeles, cambian poco) · 🟡 verificar (límites
> de peso, caracteres y zonas seguras) · 🔴 revisar siempre.

## Meta (Facebook + Instagram)

| Ubicación | Píxeles | Aspecto | conf. | Notas |
|---|---|---|---|---|
| Feed cuadrado | 1080 × 1080 | 1:1 | 🟢 | Formato base para adaptaciones |
| Feed vertical | 1080 × 1350 | 4:5 | 🟢 | Máximo vertical del feed; el que más área ocupa |
| Stories / Reels | 1080 × 1920 | 9:16 | 🟢 | |
| Zona segura stories | — | — | 🟡 | ~250px arriba y ~340px abajo libres de texto crítico |
| Zona segura Reels | — | — | 🟡 | La interfaz cubre más abajo que en stories; dejar el tercio inferior limpio |
| Carrusel | 1080 × 1080 | 1:1 | 🟢 | Todas las tarjetas con la misma relación |
| Peso de imagen | — | — | 🔴 | Verificar el límite vigente; no citarlo en el brief si no está verificado |

**La "regla del 20% de texto" ya no rechaza anuncios.** Meta la retiró como criterio de aprobación.
Sobrevive en la agencia como si fuera obligatoria y por eso se rehacen piezas que no hacía falta
rehacer. Sigue siendo una recomendación razonable de rendimiento —imágenes muy cargadas de texto
tienden a entregar peor— pero **no se escribe en un brief como restricción**, se escribe como criterio
de calidad. Si diseño insiste en tratarla como bloqueo, ese es un acuerdo interno, no una regla de
plataforma.

## Google

| Ubicación | Píxeles | Aspecto | conf. | Notas |
|---|---|---|---|---|
| Display responsive — horizontal | 1200 × 628 | 1.91:1 | 🟢 | El más usado |
| Display responsive — cuadrado | 1200 × 1200 | 1:1 | 🟢 | |
| Logo cuadrado | 1200 × 1200 | 1:1 | 🟢 | |
| Logo horizontal | 1200 × 300 | 4:1 | 🟢 | |
| Banner medio rectángulo | 300 × 250 | — | 🟢 | Formatos fijos, siguen vigentes |
| Rascacielos ancho | 300 × 600 | — | 🟢 | |
| Leaderboard | 728 × 90 | — | 🟢 | |
| Móvil | 320 × 50 / 320 × 100 | — | 🟢 | |
| Peso por imagen de display | ≤ 150 KB | — | 🟡 | Límite duro histórico; verificar |

## TikTok

| Ubicación | Píxeles | Aspecto | conf. | Notas |
|---|---|---|---|---|
| In-feed | 1080 × 1920 | 9:16 | 🟢 | |
| Zona segura | — | — | 🔴 | La UI de TikTok tapa más superficie que la de Meta; verificar la guía vigente antes de cerrar un brief con texto en pantalla |

## LinkedIn

| Ubicación | Píxeles | Aspecto | conf. | Notas |
|---|---|---|---|---|
| Imagen única | 1200 × 627 | 1.91:1 | 🟢 | |
| Cuadrado | 1080 × 1080 | 1:1 | 🟢 | |

> Fanpage Karma, la herramienta de benchmark de la agencia, **no cubre LinkedIn**. Si la pieza es de
> LinkedIn, el brief no puede apoyarse en referencias sacadas de ahí.

## Reglas transversales del brief

1. **Diseñar en el formato más grande y adaptar hacia abajo.** Ampliar pierde calidad; reducir no.
2. **Pedir siempre la versión sin texto** cuando la pieza vaya a más de una plataforma: es lo que
   evita el rediseño completo en la siguiente adaptación.
3. **Una relación de aspecto por ubicación, sin excepciones.** El recorte automático de la plataforma
   es el origen silencioso de la mitad de las devoluciones.
4. **El copy dentro de la pieza cuenta caracteres distinto al copy del post.** Especificar los dos por
   separado en el brief.
5. **Nombre de archivo estandarizado**: `{cliente}_{campaña}_{pieza}_{plataforma}_{WxH}.{ext}`. La
   agencia no tiene convención declarada; esta es una propuesta y hay que acordarla con diseño y con
   medios, porque el material que llega mal nombrado es material que se implementa mal.

## Pendiente de Eikon

- Confirmar qué ubicaciones se usan realmente por cliente (nadie usa las 30 disponibles).
- Definir si programática y DV360 requieren un set de tamaños propio.
- Acordar la convención de nombre de archivo — se cruza con el insumo 1.1 (convención de nomenclatura
  de códigos de campaña), pedido a dirección de medios en
  el documento de insumos de la Ola 1.
