# repo-maintenance

> Scope: repo: applies only to this `ai-principles` repository.

## Context

This repo is the source of truth for agent principles. Changes here affect every project you work on, so keep it tidy.

## Rules

- [MUST] run `make install` after changing anything in `principles/`. { repo-maintenance.install-after-change }
- [MUST] keep all content in English. { repo-maintenance.english }
- [MUST] register each new rule in `principles/rules/index.md` and each new ADR in `principles/adrs/index.md`. { repo-maintenance.index-rules }
- [SHOULD] run `make lint` and `make doctor` before committing. { repo-maintenance.doctor-before-commit }
