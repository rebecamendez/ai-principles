# Rules index

A quick map of every rule and when it applies.

| Rule | Scope | What it covers |
|---|---|---|
| [aip-global-git](aip-global-git.md) | global | Conventional Commits, branches, safe integration |
| [aip-global-documentation](aip-global-documentation.md) | global | README, ADRs, writing style |
| [aip-scoped-typescript](aip-scoped-typescript.md) | typescript | strict TypeScript, explicit types |
| [aip-scoped-bash](aip-scoped-bash.md) | bash | safe, predictable shell scripts |

## How rules stack

1. Global: always.
2. Scoped: only when the project matches.
3. Repo: the project's own rules win over both.
