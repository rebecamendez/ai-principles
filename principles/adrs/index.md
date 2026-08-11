# ADRs index

Architecture Decision Records are principles, like rules: they can be global or scoped.

| ADR | Scope | Title | Status |
|---|---|---|---|
| [aip-global-0001](aip-global-0001-portable-markdown-over-native.md) | global | Portable Markdown over per-agent native rules | accepted |

## Statuses

- `proposed`: under discussion.
- `accepted`: decided, the code and docs must follow it.
- `deprecated`: no longer recommended.
- `superseded`: replaced by a newer ADR (reference it).

## Add an ADR

1. Decide the scope: global (applies everywhere) or scoped (`<tech>`, applies only to matching projects).
2. Copy `template.md` to `aip-global-NNNN-<slug>.md` (or `aip-scoped-<tech>-NNNN-<slug>.md` for a scoped ADR), using the next number within that scope.
3. Fill in Context, Decision, Consequences, Alternatives.
4. Add a row to this index with its status.

## Install

`make install` links `index.md`, `template.md`, and every `aip-*.md` here into each agent's `adrs/` directory, so agents can consult decisions.
