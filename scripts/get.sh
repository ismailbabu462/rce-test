# scripts/get-package-json-key.sh
#!/bin/bash
set -euo pipefail
KEY="${1}"
OUTPUT="${2}"
echo "$$ OUTPUT= $$(jq --raw-output "$KEY" package.json)" >> "$GITHUB_OUTPUT"
