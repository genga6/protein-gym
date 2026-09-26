#!/usr/bin/env bash

set -euo pipefail
cd "$(dirname "$0")/.."

uv sync
bash scripts/download_data.sh

echo "claude: start"

export PATH="$HOME/.local/bin:$PATH"

if command -v claude >/dev/null 2>&1; then
  echo "claude: already installed"
else
  curl -fsSL https://claude.ai/install.sh | bash
  export PATH="$HOME/.local/bin:$PATH"
fi

claude --version

echo "claude: done"
