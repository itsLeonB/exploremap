---
tags: [engineering, data-model]
created: 2026-08-15
updated: 2026-08-15
---

# Data model (MVP)

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
current viewport. See [[product-decisions]] for why the radius is fixed at
100m and why overlaps merge instead of stacking intensity.

This is deliberately minimal: no `RevealedArea` table means no server-side
geometry maintenance for MVP, at the cost of recomputing the union on every
client render. Revisit if viewport-scale unions become a perf problem — see
[[architecture]] for why Postgres+PostGIS was picked with this kind of
future geo-query in mind.
