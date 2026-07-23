#!/usr/bin/env bash

set -euo pipefail

#########################################
# Configuration
#########################################

INPUT="mm10-cCREs.bed"
OUTPUT="mm10-cCREs_LOGRCm39.bed"
UNMAPPED="mm10-cCREs.unmapped.bed"

CHAIN="mm10ToMm39.over.chain.gz"
CHAIN_URL="https://hgdownload.soe.ucsc.edu/goldenPath/mm10/liftOver/${CHAIN}"

LIFTOVER="./liftOver"

#########################################
# Download mm10 cCREs if necessary
#########################################

if [ ! -f "${INPUT}" ]; then
    echo "Downloading mm10 cCREs..."

    wget \
      https://downloads.wenglab.org/Registry-V4/${INPUT} \

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

if [ ! -f "${CHAIN}" ]; then
    echo "Downloading chain file..."

    wget "${CHAIN_URL}" 

fi

#########################################
# Run liftOver
#########################################

echo "Running liftOver..."

"${LIFTOVER}" \
    -bedPlus=3 \
    -tab \
    "${INPUT}" \
    "${CHAIN}" \
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
