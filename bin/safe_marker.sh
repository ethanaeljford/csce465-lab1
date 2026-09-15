#!/usr/bin/env bash
set -euo pipefail

# Target path is derived from the script's own location, never from input.
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
HW1_DIR="$(dirname -- "$SCRIPT_DIR")"
MARKER_DIR="$HW1_DIR/markers"
MARKER_FILE="$MARKER_DIR/marker.txt"

# Exactly one argument.
if [[ $# -ne 1 ]]; then
  printf 'error: expected exactly 1 argument, got %d\n' "$#" >&2
  exit 2
fi

# That argument must be the one allowed literal.
if [[ "$1" != "course-marker" ]]; then
  printf 'error: argument rejected\n' >&2
  exit 2
fi

mkdir -p -- "$MARKER_DIR"
printf 'course-marker written at %s\n' "$(date -Is)" > "$MARKER_FILE"
printf 'ok: wrote %s\n' "$MARKER_FILE"
