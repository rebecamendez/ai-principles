# aip-global-documentation

> Scope: global: applies to every project.

## Context

Documentation is part of the code: keep it up to date alongside it and review it on every relevant change. Write it the way a senior tech lead explains something over a coffee: business first, code after, honest about what we know and what we do not.

## At a glance

```
<project>/
├── README.md                  [MUST]   the front door and navigation
├── AGENTS.md                  [MUST]   pointers to rules/ and docs/ for agents
├── rules/                     [MUST]   the project's own rules
│   ├── index.md                       the only gateway to rules/
│   └── <prefix>-*.md                  one prefixed file per repo rule
├── docs/
│   ├── index.md               [MUST]   map of docs/
│   ├── onboarding.md          [SHOULD] getting started for new teammates
│   ├── context/               [SHOULD] business context
│   │   ├── domain.md                  why it exists, who the actors are
│   │   └── modules.md                 domain modules with use-cases
│   ├── architecture/          [MUST]   how the system is built
│   │   ├── system.md                  big picture with C4/LikeC4 diagram
│   │   ├── code.md                    modules, boundaries, golden samples
│   │   ├── testing.md                 testing strategy by layer
│   │   └── diagrams/                  diagram sources (LikeC4, images)
│   └── adrs/                  [MUST]   decisions with trade-offs
│       ├── index.md                   decision list
│       └── aip-0001-...               one file per decision
└── src/ ...                 the code
```

## Project structure

Every project ships the same skeleton so agents and new people always know where to look.

- [MUST] keep the skeleton: `README.md`, `AGENTS.md`, `rules/`, and a `docs/` folder. { aip-global-documentation.structure }
- [MUST] keep the project's own rules in `rules/`: an `index.md` as the only gateway and one prefixed file per rule. { aip-global-documentation.rules-dir }
- [MUST] `README.md` is the navigation: intro, quick setup, and deployment, linking to the index of each section, with every doc reachable from it. { aip-global-documentation.readme }
- [MUST] `AGENTS.md` mirrors that navigation with relative links, pointing to `rules/index.md` and the docs indexes. { aip-global-documentation.agents-pointers }
- [MUST] `docs/index.md` maps the whole `docs/` folder. { aip-global-documentation.docs-index }
- [SHOULD] `docs/onboarding.md` gets new teammates oriented: where to start and who to ask. { aip-global-documentation.onboarding }
- [SHOULD] `docs/context/` holds business context: `domain.md` (why it exists, who the actors are) and `modules.md` (domain modules with use-cases). { aip-global-documentation.context-dir }
- [MUST] `docs/architecture/system.md` shows the big picture with a C4/LikeC4 diagram and links to the diagram sources. { aip-global-documentation.architecture-system }
- [MUST] `docs/architecture/code.md` maps modules and boundaries with golden samples. { aip-global-documentation.architecture-code }
- [MUST] `docs/architecture/testing.md` explains the testing strategy and what each layer covers. { aip-global-documentation.architecture-testing }
- [MUST] keep diagram sources in `docs/architecture/diagrams/`, even if empty when there are none yet. { aip-global-documentation.architecture-diagrams }
- [MUST] record decisions in `docs/adrs/`: one numbered, scope-prefixed file per decision, listed in `docs/adrs/index.md`. { aip-global-documentation.adr }

## Writing style

- [MUST] be concise and accessible: short paragraphs and lists, only the information needed to act. { aip-global-documentation.concise }
- [MUST] lead with the business outcome before implementation details: what problem it solves and who cares. { aip-global-documentation.domain-first }
- [MUST] use a human-friendly tone: natural and warm, never robotic or like a manual. { aip-global-documentation.human-friendly }
- [MUST] never invent: only state verified facts, label guesses as guesses, and skip unverifiable details. { aip-global-documentation.dont-invent }
- [MUST] write in American English spelling and terms (color, center, standardize). { aip-global-documentation.american-english }
- [MUST] not use em dashes (`—`); use a colon or a period instead. { aip-global-documentation.no-em-dashes }
- [MUST] document only what is not obvious; do not duplicate what the code already explains. { aip-global-documentation.no-duplication }
- [SHOULD] include one golden sample per topic: a short, complete, runnable code example that shows the canonical way. { aip-global-documentation.golden-sample }
- [SHOULD] add a simple diagram (ASCII or Mermaid) before the long explanation whenever it helps visualize the flow. { aip-global-documentation.diagrams }
- [SHOULD] explain like mentoring a colleague: show the reasoning behind choices, not just the result. { aip-global-documentation.mentoring }
- [NICE] reuse the same example across a document to make it easier to follow. { aip-global-documentation.one-example }
- [NICE] use emojis very occasionally to add a warm touch. { aip-global-documentation.emojis }
