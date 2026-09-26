#!/usr/bin/env bash
# Fetch ProteinGym v1.3 DMS substitution assays + reference file into data/.
set -euo pipefail
cd "$(dirname "$0")/.."
mkdir -p data
cd data

REF_URL="https://raw.githubusercontent.com/OATML-Markslab/ProteinGym/main/reference_files/DMS_substitutions.csv"
ZIP_URL="https://marks.hms.harvard.edu/proteingym/ProteinGym_v1.3/DMS_ProteinGym_substitutions.zip"

[ -f DMS_substitutions.csv ] || { echo "==> Downloading reference file"; curl -sSLO "$REF_URL"; }
if [ ! -d DMS_ProteinGym_substitutions ]; then
  echo "==> Downloading DMS substitutions (~45MB)"
  curl -sSLO "$ZIP_URL"
  unzip -q -o DMS_ProteinGym_substitutions.zip
  rm -f DMS_ProteinGym_substitutions.zip
fi
echo "==> Data ready: $(ls DMS_ProteinGym_substitutions | wc -l) assays"
