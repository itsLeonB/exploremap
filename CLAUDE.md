# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repo layout

Monorepo with three top-level directories, each self-contained:

- `backend/` — Go API service. See `backend/CLAUDE.md`.
- `mobile/` — Expo (React Native) app. See `mobile/CLAUDE.md`.
- `map-wiki/` — Obsidian-vault knowledge base for the product and its
  engineering (decisions, architecture, research, rejected alternatives,
  gotchas), following the [llm-wiki pattern](https://gist.githubusercontent.com/karpathy/442a6bf555914893e9891c11519de94f/raw/ac46de1ad27f92b28ac95459c782c07f6b8c964a/llm-wiki.md).
  Plain markdown, no tooling. Entry point: `map-wiki/index.md`, append-only
  history: `map-wiki/log.md`.

Root-level tooling is orchestration only (e.g. running backend + mobile dev
servers together) — no product logic belongs at root.

## map-wiki workflows

Three layers: raw sources (immutable — README, pasted research, chat/PR
discussion; never edited once captured), the wiki itself (`product/`,
`engineering/`, `index.md`), and this file (the schema, defining structure
and the workflows below).

1. **Raw dump.** When source material shows up mid-session (a pasted
   article, research findings, a long design discussion) that's worth
   keeping verbatim, save it under `map-wiki/sources/` before summarizing
   it — don't paraphrase-then-discard the original. Skip this step for
   material that's already durable elsewhere (a committed file like
   `README.md`, a linked PR/issue) — point to it instead of copying it.
2. **Ingest.** Before the session ends: read the source, write or update the
   relevant summary/entity/concept page(s) in `product/` or `engineering/`
   (a single source can touch several pages — that's normal, not a sign to
   split it up front), update `index.md`, and append one entry to `log.md`
   in the form `## [YYYY-MM-DD] ingest | <title>` listing the pages
   touched. This is not optional cleanup — it's part of finishing the task.
   Use YAML frontmatter (`tags`, `created`, `updated`) and `[[wikilinks]]`
   on every page.
3. **Lint.** Periodically (or when asked to "lint the wiki"), scan for:
   contradictions between pages, claims superseded by a newer source,
   orphaned pages with no inbound links, concepts mentioned but never given
   a page, missing cross-references, and gaps worth a web search to fill.
   Fix what's clearly wrong; flag the rest for the user rather than
   guessing. Log the run: `## [YYYY-MM-DD] lint | <what changed>`.

**Also:** consult `map-wiki/` (start at `index.md`) before starting
`backend/` or `mobile/` work — don't re-derive a decision that's already
recorded. For substantial directory work, use subagent-style delegation:
plan and coordinate from root, delegate implementation/exploration to the
relevant directory, and fold results back into the wiki yourself once the
subagent returns.

## Commands

No root-level build/test — each directory has its own (see its CLAUDE.md).
