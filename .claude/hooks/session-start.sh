#!/bin/bash
set -euo pipefail

if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

cd "$CLAUDE_PROJECT_DIR"

uv sync --dev --all-extras

# Forward OPENAI_API_KEY to the session if set in environment config
if [ -n "${OPENAI_API_KEY:-}" ] && [ -n "${CLAUDE_ENV_FILE:-}" ]; then
  echo "export OPENAI_API_KEY=$OPENAI_API_KEY" >> "$CLAUDE_ENV_FILE"
fi
