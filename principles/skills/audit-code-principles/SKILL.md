---
name: audit-code-principles
description: Use when auditing a codebase in any project for compliance with the ai-principles rules and ADRs. Trigger words: "audit code", "compliance", "verificar reglas", "check principles", "adr audit".
---

# audit-code-principles

Audit a codebase against the principles defined in this repo: the installable rules and the accepted ADRs.

## Before you start

1. Read `rules/index.md` to know which rules exist.
2. Read `adrs/index.md`; open every ADR whose status is `accepted` and relevant to the code under review.
3. Match the project's tech stack against the `aip-scoped-*` rules and keep only the scopes that apply.

## What to check

### Rules

For every applicable rule, check each bullet against the code:

- `[MUST]` violations are blocking. Report every one with its id.
- `[SHOULD]` violations are warnings.
- `[NICE]` misses are suggestions.

### ADRs

- Accepted ADRs describe decisions the code should still implement. Verify it does.
- If the code contradicts an accepted ADR, flag it: either the code or the ADR needs to change.

### Consistency

- The code follows the same conventions the rules and ADRs describe (naming, prefixes, structure).

## Output

A report grouped by rule and ADR, with:

- the id of the rule (`{ aip-... }`) or the ADR number,
- severity,
- file and line where applicable,
- a short explanation.

End with a verdict: compliant, minor issues, or needs fixes.

## Rules

- [MUST] cite the rule id or ADR number for every finding. { audit-code-principles.cite-ids }
- [MUST] check only ADRs with status `accepted`; ignore `proposed`, `deprecated`, and `superseded`. { audit-code-principles.accepted-adrs }
- [SHOULD] suggest concrete fixes, not just problems. { audit-code-principles.fixes }
- [NICE] summarize the result with a simple table. { audit-code-principles.summary-table }
