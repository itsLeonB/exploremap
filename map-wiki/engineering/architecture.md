---
tags: [engineering, architecture]
created: 2026-08-15
updated: 2026-08-15
---

# Architecture

## Stack

- **Backend:** Go (`backend/`)
- **Database:** Postgres + PostGIS — chosen for geo-indexed radius queries,
  needed to answer "which photos/reveals are within N meters of this point"
  efficiently at the [[data-model|100m-radius reveal]] scale.
- **Mobile framework:** Expo (React Native) (`mobile/`)

## Mobile framework choice: Expo over Flutter / Compose Multiplatform

Expo was chosen over Flutter and Compose Multiplatform.

**Reasoning:** strongest AI-assisted dev tooling fit (TypeScript, works well
with Claude Code), fastest path for everything except the fog-mask rendering
itself.

**Rejected alternative — Flutter:** `flutter_map` had a more direct native
path for canvas-based fog overlays than anything in the RN ecosystem, but
the gap was judged acceptable given the workflow fit. If fog-mask rendering
performance becomes a real bottleneck on RN, this is the tradeoff to
revisit.

## Fog mask rendering — deferred

Two viable approaches, final call deferred to implementation phase:

1. `@shopify/react-native-skia` canvas layer
2. WebView-based MapLibre GL JS instance

Left to the implementer to weigh at build time. See [[deferred-decisions]].
