VULNERABLE_SCRIPT_CONTENT = r"""#!/usr/bin/env bash

set -x # Enable command tracing for verification
set -e
set -u
set -o pipefail

KEY="${1}"
OUTPUT="${2}"

if [[ -z $KEY ]]; then
  echo "Error: KEY not specified."
  exit 1
fi

if [[ -z $OUTPUT ]]; then
  echo "Error: OUTPUT not specified."
  exit 1
fi

# VULNERABLE LINE: $KEY is directly interpolated within double quotes inside
# a command substitution, allowing arbitrary commands to be executed.
echo "$OUTPUT=$(jq --raw-output "$KEY" package.json)" >> "$GITHUB_OUTPUT"
