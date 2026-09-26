#!/usr/bin/env bash
# Sets up the Python env (uv) and downloads ProteinGym data.
# Safe to re-run: skips work that is already done.
set -euo pipefail
cd "$(dirname "$0")/.."

uv sync
bash scripts/download_data.sh

log "claude: start"
if command -v claude >/dev/null 2>&1; then
  log "claude: already installed"
  return
fi
curl -fsSL https://claude.ai/install.sh | bash
log "claude: done"
