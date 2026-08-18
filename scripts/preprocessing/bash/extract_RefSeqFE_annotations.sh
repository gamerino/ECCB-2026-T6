#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd -- "${SCRIPT_DIR}/../../.." && pwd)"

INPUT="${REPO_ROOT}/data/cres_annotation/RefSeq/GCF_000001405.40_GRCh38.p14_genomic.gff"
OUTPUT="${REPO_ROOT}/data/cres_annotation/RefSeq/GCF_000001405.40_GRCh38.p14_genomic.RefSeqFE.gff.gz"
TEMP_OUTPUT="${OUTPUT}.tmp"

if [[ ! -f "${INPUT}" ]]; then
    echo "Input file not found: ${INPUT}" >&2
    exit 1
fi

echo "Filtering RefSeq annotations..."
echo "  Input:  ${INPUT}"
echo "  Output: ${OUTPUT}"

# Build a mapping from RefSeq region sequence IDs (for example,
# NC_000001.11) to chromosome names (for example, 1), then retain RefSeqFE
# rows except biological_region features. Comment/directive lines are kept.
rm -f "${TEMP_OUTPUT}"

awk -F '\t' '
    BEGIN { OFS = "\t" }
    FNR == NR {
        if ($0 !~ /^#/ && NF >= 9 && $2 == "RefSeq" && $3 == "region") {
            n = split($9, attributes, ";")
            for (i = 1; i <= n; i++) {
                if (attributes[i] ~ /^chromosome=/) {
                    sub(/^chromosome=/, "", attributes[i])
                    chromosome[$1] = attributes[i]
                    break
                }
            }
        }
        next
    }
    /^#/ { print; next }
    NF >= 9 && $2 == "RefSeqFE" && $3 != "biological_region" {
        if ($1 in chromosome) {
            $1 = chromosome[$1]
        }
        print
    }
' "${INPUT}" "${INPUT}" | gzip -c > "${TEMP_OUTPUT}"

mv "${TEMP_OUTPUT}" "${OUTPUT}"

echo
echo "Finished."
echo "Output size: $(du -h "${OUTPUT}" | cut -f1)"
echo "RefSeqFE feature rows: $(gzip -cd "${OUTPUT}" | awk '!/^#/ {n++} END {print n+0}')"
