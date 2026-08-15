---
tags: [product, decisions]
created: 2026-08-15
updated: 2026-08-15
---

# Product decisions

Locked-in product decisions for MVP. Context: [[overview]].

| Decision | Choice |
|---|---|
| Reveal trigger | Photo capture (not continuous GPS tracking) |
| Location validation | Live camera GPS, or EXIF GPS from imported gallery photo |
| Capture source tracking | Flagged in DB (`live_camera` / `gallery_import`), no weight/trust difference for now |
| Reveal radius | Fixed 100m per photo |
| Overlapping reveals | Rendered as one merged lit zone (no heatmap/intensity — post-MVP, see [[deferred-decisions]]) |
| Fog decay | None — reveals are permanent (post-MVP consideration, see [[deferred-decisions]]) |
| Anti-cheat | None beyond GPS/EXIF validation (post-MVP consideration, see [[deferred-decisions]]) |

`capture_source` is stored on [[data-model|the Photo record]] purely as a
flag for now — it does not affect reveal logic. If gallery-import abuse
becomes a problem, this is the field to key off of.
