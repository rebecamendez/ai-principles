# aip-scoped-bash

> Scope: bash: applies to any shell script.

## Context

Shell scripts fail silently; make them strict and predictable.

## Rules

- [MUST] start with shebang `#!/usr/bin/env bash`. { aip-scoped-bash.shebang }
- [MUST] use `set -euo pipefail`. { aip-scoped-bash.strict-mode }
- [MUST] always quote variables: `"$var"`, `"$@"`. { aip-scoped-bash.quoting }
- [SHOULD] declare `local` for function variables. { aip-scoped-bash.local-vars }
- [SHOULD] fail with a clear message and a non-zero exit code. { aip-scoped-bash.failure }
- [NICE] pass `shellcheck` without errors. { aip-scoped-bash.shellcheck }
