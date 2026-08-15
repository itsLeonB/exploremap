---
tags: [product]
created: 2026-08-15
updated: 2026-08-15
---

# Overview

exploremap is a mobile app that gamifies real-world exploration through a
fog-of-war map. The map starts dark/fogged; areas light up permanently once
"explored."

**Core loop:** take a photo → location validated → 100m radius around that
point lights up on the map, permanently. See [[data-model]] for how a
`Photo` capture maps to a revealed area, and [[product-decisions]] for the
locked choices behind each step of this loop.

## Differentiator

Existing fog-map apps (Fog of World, FOWIRL, Walksy, etc.) use always-on GPS
tracking, which falsely "reveals" areas a user only passed through — train
routes, highways, flights. exploremap gates reveal on a deliberate
stop-and-capture action (a photo), filtering out passive transit by
construction rather than by a speed/dwell-time heuristic. See
[[deferred-decisions]] for why a dwell-time filter was ruled out as
unnecessary given this design.

Reveal is verified either by live camera GPS or by EXIF GPS from an imported
gallery photo — see [[product-decisions]] for the capture-source tracking
rule.
