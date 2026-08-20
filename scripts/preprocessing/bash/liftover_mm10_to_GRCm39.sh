#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd -- "${SCRIPT_DIR}/../../.." && pwd)"
ENCODE_DIR="${REPO_ROOT}/data/cres_annotation/ENCODE"

#########################################
# Configuration
#########################################

INPUT="${ENCODE_DIR}/mm10-cCREs.bed"
OUTPUT="${ENCODE_DIR}/mm10-cCREs_LOGRCm39.bed"
UNMAPPED="${ENCODE_DIR}/mm10-cCREs.unmapped.bed"

CHAIN="mm10ToMm39.over.chain.gz"
CHAIN_URL="https://hgdownload.soe.ucsc.edu/goldenPath/mm10/liftOver/${CHAIN}"
CHAIN_PATH="${ENCODE_DIR}/${CHAIN}"

LIFTOVER="${SCRIPT_DIR}/liftOver"

#########################################
# Download mm10 cCREs if necessary
#########################################

if [ ! -f "${INPUT}" ]; then
    echo "Downloading mm10 cCREs..."

    wget \
      "https://downloads.wenglab.org/Registry-V4/mm10-cCREs.bed" \
      -O "${INPUT}"

fi

#########################################
# Download liftOver if necessary
#########################################

if [ ! -x "${LIFTOVER}" ]; then
    echo "Downloading UCSC liftOver..."

    wget https://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/liftOver

    chmod +x "${LIFTOVER}"
fi

#########################################
# Download chain file
#########################################

if [ ! -f "${CHAIN_PATH}" ]; then
    echo "Downloading chain file..."

    wget "${CHAIN_URL}" -O "${CHAIN_PATH}"

fi

#########################################
# Run liftOver
#########################################

echo "Running liftOver..."

"${LIFTOVER}" \
    -bedPlus=3 \
    -tab \
    "${INPUT}" \
    "${CHAIN_PATH}" \
    "${OUTPUT}" \
    "${UNMAPPED}"

#########################################
# Summary
#########################################

echo
echo "Finished."
echo

echo "Lifted regions:"
wc -l "${OUTPUT}"

echo
echo "Unmapped regions:"
wc -l "${UNMAPPED}"
