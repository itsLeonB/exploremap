# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

```
npm start      # expo start
npm run android
npm run ios
npm run web
```

No test runner configured yet.

Expo has changed significantly across versions — read the versioned docs at
https://docs.expo.dev/versions/v57.0.0/ before writing Expo-API code; do not
rely on training-data knowledge of Expo APIs.

## Architecture

Blank Expo + TypeScript template (`App.tsx`, `index.ts`). No navigation,
state management, or map rendering wired up yet.

The core screen will be a fog-of-war map: base map layer + a fog overlay
that clears in 100m circles around captured photo locations. Rendering
approach (Skia canvas vs. WebView+MapLibre) is an open decision — check
`../map-wiki/engineering/architecture.md` and
`../map-wiki/engineering/deferred-decisions.md` before picking one, and
record the choice back to `map-wiki/` once made (see root `CLAUDE.md`).

Photo capture flow needs both live-camera-with-GPS and gallery-import-with-EXIF-GPS
paths — see `../map-wiki/product/product-decisions.md`.
