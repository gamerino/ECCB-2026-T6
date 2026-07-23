#!/usr/bin/env bash

set -euo pipefail

#########################################
# Download bigBedToBed if necessary
#########################################

echo "Downloading UCSC bigBedToBed..."
 wget \
    https://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/bigBedToBed \
    -O bigBedToBed
chmod +x bigBedToBed

#########################################
# Convert all BigBed files
#########################################

echo "Converting BigBed files..."

find . -type f -name "*.bb" | while read -r bb
do

    bed="${bb%.bb}.bed"

    echo "  ${bb}"
    echo "      -> ${bed}"

    ./bigBedToBed "${bb}" "${bed}"

done

#########################################
# Summary
#########################################

echo
echo "Finished."

echo
echo "Generated BED files:"

find . -type f -name "*.bed"

rm bigBedToBed