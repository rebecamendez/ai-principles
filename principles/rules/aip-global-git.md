# aip-global-git

> Scope: global: applies to every project.

## Context

Uniform version control across all repositories so history stays readable and safe.

## Rules

- [MUST] use Conventional Commits: `feat:`, `fix:`, `docs:`, `chore:`, `refactor:`, `test:`. { aip-global-git.conventional-commits }
- [MUST] make atomic commits: one responsibility per commit. { aip-global-git.atomic-commits }
- [MUST] work on branches (`feat/...`, `fix/...`) and never commit directly to `main`. { aip-global-git.feature-branches }
- [MUST] integrate with rebase and fast-forward (`git pull --ff-only`, `git rebase`), avoiding merge commits. { aip-global-git.rebase-ff }
- [SHOULD] make small, frequent commits instead of one giant commit. { aip-global-git.small-commits }
- [SHOULD] add a scope when it adds context: `feat(auth): ...`. { aip-global-git.scope }
- [NICE] reference the ticket or issue in the commit body. { aip-global-git.ticket-ref }
