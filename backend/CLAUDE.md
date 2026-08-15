# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

```
make run     # go run ./cmd/api
make build   # go build -o bin/api ./cmd/api
make test    # go test ./...
make lint    # go vet ./...
make tidy    # go mod tidy
```

Single test: `go test ./path/to/package -run TestName`

## Architecture

Go module: `github.com/itsLeonB/exploremap/backend`. Entry point:
`cmd/api/main.go` — currently a stub, no HTTP server wired up yet.

Stack: Postgres + PostGIS (geo-indexed radius queries for reveal lookups).
No DB connection or schema exists yet.

Before implementing, check `../map-wiki/engineering/architecture.md` and
`../map-wiki/engineering/data-model.md` for the locked stack and MVP schema
(`User`, `Photo` — no separate `RevealedArea` table by design). Log any new
architectural decision or gotcha back to `map-wiki/` when done — see root
`CLAUDE.md` for the rule.
