---
name: audit-rules
description: Use when auditing, reviewing, or checking the quality and consistency of the rules in this repo. Trigger words: "audit rules", "revisar reglas", "check rules", "consistency".
---

# Audit the rules

A checklist to keep the rule set healthy, consistent, and easy to maintain.

## 1. Format

Every rule file must follow the template:

- Has a title matching the file name (`# aip-global-<name>` or `# <repo-file>`).
- Has a `> Scope:` line declaring where it applies (global / tech / repo).
- Has a `## Context` paragraph in plain domain language.
- Has a `## Rules` list.
- Written in English, human-friendly tone, no em dashes (`—`).

## 2. Bullets

For every rule bullet, check:

- Prefixed with `[MUST]`, `[SHOULD]`, or `[NICE]`.
- Ends with a readable id `{ <file>.<rule> }`.
- The id's file part matches the file name.
- Ids are unique across the whole repo: `grep -rho '{ [a-z.-]* }' principles/rules rules | sort | uniq -d`.
- No id is missing or duplicated.

## 3. Index

- `principles/rules/index.md` lists every global and scoped rule, with matching name and scope.
- `principles/adrs/index.md` lists every ADR, with its status.
- `rules/index.md` lists every repo rule.
- Every file in `principles/rules/`, `principles/adrs/`, and `rules/` is referenced (no orphans).
- Every rule id referenced in prose (`{ ... }`) belongs to a rule or ADR that exists.

## 4. Consistency

- No contradictions between rules. If two rules clash, the more specific wins: `repo > scoped > global`. Note the conflict in the less specific one.
- No duplicated rules in different files. Merge them.
- Scoped rules only mention things tied to that tech; anything general belongs in a global rule.

## 5. Repository health

- Run `make doctor`; all links and the hook must be present.
- After adding or editing any principle, `make install` must have been run.
- Run `make version` and make sure the last commit includes the expected rule changes.

Report findings as a list of issues with the file and id, and a final verdict per area (format, bullets, index, consistency).
