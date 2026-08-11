# aip-global-0001: Portable Markdown over per-agent native rules

- Status: accepted
- Date: 2026-08-11
- Name: `{ aip-global-0001.portable-markdown-over-native }`

## Context

The principles reach four different agents (Claude Code, opencode, Gemini CLI, Codex). All of them read Markdown instruction files natively (`CLAUDE.md`, `AGENTS.md`, `GEMINI.md`), but each also has its own native rule machinery (for example Claude Code-specific rule directives and tooling). We must decide whether to author principles once as portable Markdown or once per agent in each agent's native format.

## Decision

Author principles once as plain Markdown in `principles/` and install them via symlinks. Only the entry file is agent-specific: `CLAUDE.md`, `AGENTS.md`, or `GEMINI.md` depending on the tool. Skills use the shared `SKILL.md` format with frontmatter, which Claude Code and opencode already recognize.

## Consequences

Good:

- One source of truth: edit once, every agent follows it.
- No conversion, no copies, no drift; symlinks keep everything in sync automatically.
- Works across all four agents today with zero extra tooling.

Costs:

- No agent-exclusive features. Rules that only one agent can express natively (for example Claude Code-only syntax) are out of scope.
- We depend on each agent honoring its Markdown entry file; a native mechanism could enforce more strictly.
- If an agent changes how it loads instruction files, we must adapt.

## Alternatives

- Author rules per agent in each native format: maximum per-agent power, but four copies to maintain and a drift problem we are already avoiding with symlinks.
- One combined file per agent (entry file with rules inlined): fewer files, but loses per-rule file granularity and the shared source.
