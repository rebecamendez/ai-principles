# aip-scoped-typescript

> Scope: typescript: applies only to TypeScript projects.

## Context

TypeScript is only worth it if you use it: the type system is documentation that runs.

## Rules

- [MUST] set `strict: true` in `tsconfig.json`. { aip-scoped-typescript.strict }
- [MUST] explicitly type the system boundaries: API inputs/outputs, public functions, and external data. { aip-scoped-typescript.explicit-boundaries }
- [MUST] avoid `any`; if the type is unknown, use `unknown` with narrowing. { aip-scoped-typescript.no-any }
- [SHOULD] prefer `satisfies` over type casts when possible. { aip-scoped-typescript.satisfies }
- [SHOULD] run formatter and linter before committing. { aip-scoped-typescript.lint }
- [NICE] use `as const` and discriminated unions for shared state. { aip-scoped-typescript.advanced-types }
