#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "${BASH_SOURCE[0]}")/.."

fails=0

check() {
  local desc="$1"
  shift
  local out
  out="$("$@" 2>&1 || true)"
  if [ -n "$out" ]; then
    printf '[lint] FAIL %s\n%s\n' "$desc" "$out"
    fails=$((fails + 1))
  else
    printf '[lint] ok   %s\n' "$desc"
  fi
}

no_em_dashes() {
  grep -rn $'\u2014' --include='*.md' --include='*.sh' --include='Makefile' --include='*.yml' --exclude-dir=.git --exclude-dir=node_modules . 2>/dev/null | grep -v 'em dashes' || true
}

ids_match() {
  for f in principles/rules/aip-*.md rules/*.md; do
    [ -f "$f" ] || continue
    b=$(grep -cE '^\- \[[A-Z]+\]' "$f")
    i=$(grep -cE '\{ [a-z0-9.-]+ \}$' "$f")
    [ "$b" -eq "$i" ] || printf '  %s: bullets=%s ids=%s\n' "$f" "$b" "$i"
  done
}

unique_ids() {
  grep -rho '{ [a-z0-9.-]* }' principles/rules principles/adrs 2>/dev/null | sort | uniq -d || true
}

indexed() {
  for dir in rules adrs; do
    for f in "principles/$dir"/aip-*.md; do
      [ -f "$f" ] || continue
      grep -q "$(basename "$f")" "principles/$dir/index.md" || printf '  missing from principles/%s/index.md: %s\n' "$dir" "$(basename "$f")"
    done
  done
}

check "shell syntax" bash -n scripts/aip.sh scripts/lint.sh
check "no em dashes" no_em_dashes
check "rule ids match bullets" ids_match
check "unique rule ids" unique_ids
check "every rule and ADR indexed" indexed

if [ "$fails" -eq 0 ]; then
  printf '[lint] all checks passed\n'
else
  printf '[lint] %s check(s) failed\n' "$fails"
  exit 1
fi
