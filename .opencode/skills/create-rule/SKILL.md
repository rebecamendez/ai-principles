---
name: create-rule
description: Use when creating or adding a new rule to this repo (principles global/scoped in principles/rules/, or repo rules in rules/). Trigger words: "add rule", "create rule", "nueva rule", "añadir regla", "new principle".
---

# Add a rule

Guide for creating a new rule in this repo, following the conventions.

## 1. Pick the scope

| Scope | Location | Prefix | Installed |
|---|---|---|---|
| global | `principles/rules/aip-global-<name>.md` | `aip-global-` | yes, everywhere |
| scoped | `principles/rules/aip-scoped-<tech>.md` | `aip-scoped-` | yes, only when tech matches |
| repo | `rules/<file>.md` | none | no, stays in this repo |

Rules that apply to every project are global. Rules tied to a technology are scoped. Rules about this repo itself are repo rules.

## 2. Create the file

Copy the format from an existing rule. Every rule file has:

```markdown
# <file-name>

> Scope: <global|tech|repo>: <short description of when it applies>.

## Context

Why this rule exists, in plain domain/business language.

## Rules

- [MUST] ... { <file>.first-rule }
- [SHOULD] ... { <file>.second-rule }
- [NICE] ... { <file>.third-rule }
```

## 3. Enforce the conventions

- [MUST] prefix each bullet with `[MUST]`, `[SHOULD]`, or `[NICE]`.
- [MUST] end every bullet with its readable id: `{ <file>.<rule> }`, lowercase with hyphens, unique.
- [MUST] write in English.
- [MUST] no em dashes (`—`); use a colon or a period instead.
- [MUST] use a human-friendly tone: natural and warm, not a manual.
- [SHOULD] explain at domain/business level before implementation details.
- [SHOULD] keep it concise; a rule you can't skim is a rule nobody follows.

## 4. Register it

- Principles rules (global/scoped): add a row to `principles/rules/index.md`, then run `make install`.
- Repo rules: list the file in `rules/index.md` (see the template) and reference it from `AGENTS.md`.
- ADRs: when the change is a decision with trade-offs, create it in `principles/adrs/` from `template.md` and add a row to `principles/adrs/index.md`.

## 5. Verify

Run `make doctor` and confirm the new rule shows up linked. If it's a principles rule, check it appears in the agent config dirs.
