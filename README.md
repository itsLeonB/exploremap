# exploremap

# Fog-of-War Exploration App — Decision Log

## Product

A mobile app that gamifies real-world exploration. The map starts dark/fogged.
Areas light up permanently once "explored" — verified by taking a photo there,
not by passive GPS tracking. This avoids false-positive reveals from transit
(trains, highways, flights) that plague existing fog-map apps.

**Core loop:** take a photo → location validated → 100m radius around that
point lights up on the map, permanently.

## Product Decisions

| Decision | Choice |
|---|---|
| Reveal trigger | Photo capture (not continuous GPS tracking) |
| Location validation | Live camera GPS, or EXIF GPS from imported gallery photo |
| Capture source tracking | Flagged in DB (`live_camera` / `gallery_import`), no weight/trust difference for now |
| Reveal radius | Fixed 100m per photo |
| Overlapping reveals | Rendered as one merged lit zone (no heatmap/intensity — post-MVP) |
| Fog decay | None — reveals are permanent (post-MVP consideration) |
| Anti-cheat | None beyond GPS/EXIF validation (post-MVP consideration) |

**Differentiator vs. existing apps** (Fog of World, FOWIRL, Walksy, etc.):
those use always-on GPS tracking, which falsely "reveals" areas you only
passed through (train routes, highways). Photo-gated reveal requires a
deliberate stop-and-capture action, filtering out passive transit.

## Technical Decisions

- **Backend:** Go
- **Database:** Postgres + PostGIS (geo-indexed radius queries)
- **Mobile framework:** Expo (React Native)
  - Chosen over Flutter and Compose Multiplatform
  - Reasoning: strongest AI-assisted dev tooling fit (TypeScript, works well
    with Claude Code), fastest path for everything except the fog-mask
    rendering itself. Flutter's `flutter_map` had a more direct native path
    for canvas-based fog overlays, but the gap was judged acceptable given
    the workflow fit.
- **Map rendering / fog overlay approach:** to be implemented via
  `@shopify/react-native-skia` canvas layer, or a WebView-based MapLibre GL
  JS instance — both viable, final call deferred to implementation phase.

## Data Model (MVP)

```
User
 └─ id, auth info

Photo
 └─ id, user_id, file_url
 └─ lat, lng
 └─ captured_at
 └─ capture_source   ← enum: 'live_camera' | 'gallery_import'
```

No separate `RevealedArea` table for MVP — revealed zones are computed
client-side as the union of 100m circles around each `Photo.lat/lng` in the
current viewport.

## Deferred Decisions

- Fog mask implementation: left to implementer to weigh Skia canvas vs.
  WebView+MapLibre at build time
- Speed/dwell-time filter (train-window edge case): not needed for now
- Radius scaling by area density — post-MVP
- Heatmap-style intensity rendering — post-MVP
