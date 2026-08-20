#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd -- "${SCRIPT_DIR}/../../.." && pwd)"
EVIDENCE_DIR="${REPO_ROOT}/data/evidence/Ensembl_Regulation"
BIGBED_TO_BED="${SCRIPT_DIR}/bigBedToBed"

#########################################
# Download bigBedToBed if necessary
#########################################

if [[ ! -x "${BIGBED_TO_BED}" ]]; then
    echo "Downloading UCSC bigBedToBed..."
    wget \
        https://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/bigBedToBed \
        -O "${BIGBED_TO_BED}"
    chmod +x "${BIGBED_TO_BED}"
fi

#########################################
# Convert all BigBed files
#########################################

echo "Converting BigBed files..."

find "${EVIDENCE_DIR}" -type f -name "*.bb" -print0 | while IFS= read -r -d '' bb
do

    bed="${bb%.bb}.bed"

    echo "  ${bb}"
    echo "      -> ${bed}"

    "${BIGBED_TO_BED}" "${bb}" "${bed}"

done

#########################################
# Summary
#########################################

echo
echo "Finished."

echo
echo "Generated BED files:"

find "${EVIDENCE_DIR}" -type f -name "*.bed"

rm -f "${BIGBED_TO_BED}"
