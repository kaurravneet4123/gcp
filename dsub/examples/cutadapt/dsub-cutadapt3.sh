#!/bin/bash

set -o errexit #exit on error
set -o nounset #treat unset variables as error



#cutadapt parameters
QUALITY=30
MIN_LENGTH=75
N_LIMIT=0
MIN_OVERLAP=5
ADAPTER=CTGTCTCTTATACACATCT


# Run cutadapt v3.3
echo "Starting trimming with cutadapt v3.3"

 cutadapt \
        -q $QUALITY \
        --minimum-length=$MIN_LENGTH \
        --max-n=$N_LIMIT \
        --overlap=$MIN_OVERLAP \
        -a $ADAPTER \
        -A $ADAPTER \
        -o "$FASTQ_TRIM_R1" \
        --paired-output "$FASTQ_TRIM_R2" \
        "$FASTQ_R1" "$FASTQ_R2"
