---
tags: [engineering, product, deferred]
created: 2026-08-15
updated: 2026-08-15
---

# Deferred decisions

Explicitly punted, not forgotten. Each should be revisited with a reason,
not just picked up ad hoc.

- **Fog mask implementation** — Skia canvas vs. WebView+MapLibre. Left to
  implementer to weigh at build time. See [[architecture]].
- **Speed/dwell-time filter** (train-window edge case) — not needed for now.
  The photo-capture gate already filters passive transit by construction;
  see [[overview]] for why this differs from GPS-tracking competitors.
- **Radius scaling by area density** — post-MVP. Current radius is fixed at
  100m regardless of urban/rural density; see [[product-decisions]].
- **Heatmap-style intensity rendering** — post-MVP. Overlapping reveals
  currently merge into one flat lit zone; see [[product-decisions]].
- **Fog decay** — reveals are permanent for MVP; no expiry mechanism exists.
- **Anti-cheat beyond GPS/EXIF validation** — none for MVP. If gallery-import
  abuse shows up, `capture_source` on [[data-model|Photo]] is the field to
  key off of.
