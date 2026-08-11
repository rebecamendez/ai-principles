#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SHARED_DIR="$REPO_DIR/principles"
MARKER_START="### aip-daily-update ###"
MARKER_END="### end aip-daily-update ###"

TARGETS=(
  "claude|$HOME/.claude|CLAUDE.md"
  "opencode|$HOME/.config/opencode|AGENTS.md"
  "gemini|$HOME/.gemini|GEMINI.md"
  "codex|$HOME/.codex|AGENTS.md"
)

log() { printf '[aip] %s\n' "$*"; }

profile_file() {
  local shell_name
  shell_name="$(basename "${SHELL:-}")"
  case "$shell_name" in
    zsh) printf '%s\n' "$HOME/.zshrc" ;;
    bash) printf '%s\n' "$HOME/.bashrc" ;;
    *) printf '%s\n' "$HOME/.profile" ;;
  esac
}

is_ours() {
  [ -L "$1" ] && case "$(readlink "$1")" in
    "$REPO_DIR"/*) return 0 ;;
  esac
  return 1
}

install() {
  for t in "${TARGETS[@]}"; do
    IFS='|' read -r name cfg_dir rule_file <<<"$t"
    mkdir -p "$cfg_dir/rules" "$cfg_dir/skills" "$cfg_dir/adrs"
    ln -sfn "$SHARED_DIR/AGENTS.md" "$cfg_dir/$rule_file"
    ln -sfn "$SHARED_DIR/rules/index.md" "$cfg_dir/rules/index.md"
    for f in "$SHARED_DIR"/rules/aip-*.md; do
      [ -f "$f" ] && ln -sfn "$f" "$cfg_dir/rules/$(basename "$f")"
    done
    ln -sfn "$SHARED_DIR/adrs/index.md" "$cfg_dir/adrs/index.md"
    ln -sfn "$SHARED_DIR/adrs/template.md" "$cfg_dir/adrs/template.md"
    for f in "$SHARED_DIR"/adrs/aip-*.md; do
      [ -f "$f" ] && ln -sfn "$f" "$cfg_dir/adrs/$(basename "$f")"
    done
    for s in "$SHARED_DIR"/skills/*; do
      [ -d "$s" ] && ln -sfn "$s" "$cfg_dir/skills/$(basename "$s")"
    done
    log "installed: $name -> $cfg_dir"
  done
  hook install
  log "done. Restart your shell or run: source $(profile_file)"
}

uninstall() {
  for t in "${TARGETS[@]}"; do
    IFS='|' read -r name cfg_dir rule_file <<<"$t"
    if is_ours "$cfg_dir/$rule_file"; then
      rm -f "$cfg_dir/$rule_file"
      log "removed: $name/$rule_file"
    fi
    for f in "$cfg_dir"/rules/aip-*.md "$cfg_dir"/rules/index.md; do
      { [ -e "$f" ] || [ -L "$f" ]; } && is_ours "$f" && rm -f "$f"
    done
    for f in "$cfg_dir"/adrs/aip-*.md "$cfg_dir"/adrs/index.md "$cfg_dir"/adrs/template.md; do
      { [ -e "$f" ] || [ -L "$f" ]; } && is_ours "$f" && rm -f "$f"
    done
    for s in "$cfg_dir"/skills/*; do
      { [ -e "$s" ] || [ -L "$s" ]; } && is_ours "$s" && rm -rf "$s"
    done
  done
  hook remove
  rm -rf "$HOME/.cache/aip"
  log "done"
}

hook() {
  local rc_file
  rc_file="$(profile_file)"
  case "$1" in
    install)
      grep -qF "$MARKER_START" "$rc_file" 2>/dev/null && { log "hook already installed"; return; }
      cat >> "$rc_file" <<SNIPPET

$MARKER_START
__aip() {
  _s="$REPO_DIR/scripts/aip.sh"
  [ -x "\$_s" ] && bash "\$_s" update >/dev/null 2>&1 &
}
__aip
$MARKER_END
SNIPPET
      log "hook installed in $rc_file"
      ;;
    remove)
      [ -f "$rc_file" ] && sed -i "/$MARKER_START/,/$MARKER_END/d" "$rc_file"
      log "hook removed from $rc_file"
      ;;
  esac
}

update() {
  local stamp="$HOME/.cache/aip/last-update"
  local today
  today="$(date +%Y-%m-%d)"
  [ -f "$stamp" ] && [ "$(cat "$stamp")" = "$today" ] && return 0
  [ -d "$REPO_DIR/.git" ] || return 0

  (cd "$REPO_DIR" && git pull --ff-only --quiet 2>/dev/null || true)
  install >/dev/null 2>&1 || true

  mkdir -p "$(dirname "$stamp")"
  printf '%s\n' "$today" > "$stamp"
}

doctor() {
  local fail=0
  for t in "${TARGETS[@]}"; do
    IFS='|' read -r name cfg_dir rule_file <<<"$t"
    if is_ours "$cfg_dir/$rule_file"; then
      log "ok: $name -> $cfg_dir/$rule_file"
    else
      log "MISSING: $name -> $cfg_dir/$rule_file"
      fail=1
    fi
  done
  if grep -qF "$MARKER_START" "$(profile_file)" 2>/dev/null; then
    log "ok: profile hook in $(profile_file)"
  else
    log "MISSING: profile hook in $(profile_file)"
    fail=1
  fi
  [ "$fail" -eq 0 ] && log "all ok" || { log "run: make install"; exit 1; }
}

version() {
  [ -d "$REPO_DIR/.git" ] || { log "not a git repo: $REPO_DIR"; return 1; }
  log "commit: $(git -C "$REPO_DIR" log -1 --format=%H)"
  log "date:   $(git -C "$REPO_DIR" log -1 --format=%ad --date=short)"
  log "msg:    $(git -C "$REPO_DIR" log -1 --format=%s)"
}

usage() {
  cat <<EOF
Usage: aip.sh <install|uninstall|doctor|update|version>
EOF
  exit 1
}

case "${1:-}" in
  install) install ;;
  uninstall) uninstall ;;
  doctor) doctor ;;
  update) update ;;
  version) version ;;
  *) usage ;;
esac
