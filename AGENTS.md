# AGENTS.md: `ai-principles` repository

This repo is your source of truth for global agent rules and skills. Work here, install everywhere.

Read these in order:

1. `rules/index.md`: this repo's own rules (repo scope, they win).
2. `principles/rules/index.md`: the index of installable rules.
3. `principles/rules/aip-global-*.md`: always.
4. `principles/rules/aip-scoped-*.md`: only when the project matches the scope.

## What matters

- Everything you install lives in `principles/`.
- Rules are prefixed so uninstall is always safe:
  - `aip-global-*.md`: apply to every project.
  - `aip-scoped-<tech>.md`: apply only when the project matches the scope.
- Each rule carries its readable id in braces, e.g. `{ aip-global-git.atomic-commits }`.
- Skills live in `principles/skills/<name>/SKILL.md`; uninstall removes only skills that are symlinks back to this repo.

## Add a rule

1. Create `principles/rules/aip-<global|scoped>-<name>.md`, using an existing file as a template.
2. Add an entry to `principles/rules/index.md`.
3. Run `make install`.

## Add a skill

1. Create `principles/skills/<name>/SKILL.md` (see `principles/skills/README.md`).
2. Run `make install`.

## Layout

```
rules/            this repo's own rules (repo scope)
principles/        installable principles: AGENTS.md + rules + skills + adrs
scripts/          aip.sh (CLI)
```

## Commands

- `make install`: link into agents + daily hook.
- `make uninstall`: removes only our files (rules/ADRs with `aip-`, skill symlinks) and the hook.
- `make doctor`: verifies everything is installed.
- `make lint`: runs the local checks (syntax, em dashes, indexes).
- `make version`: current commit, date, and message.
- `aip.sh update`: daily `git pull` + re-install (called by the profile hook).
