#!/usr/bin/env bash
set -x          # BURAYI EKLE!
set -euo pipefail

KEY="${1}"
OUTPUT="${2}"

if [[ -z "$KEY" ]]; then
  echo "Error: KEY not specified." >&2
  exit 1
fi

if [[ -z "$OUTPUT" ]]; then
  echo "Error: OUTPUT not specified." >&2
  exit 1
fi

echo "$OUTPUT=$(jq --raw-output "$KEY" package.json)" >> "$GITHUB_OUTPUT"
