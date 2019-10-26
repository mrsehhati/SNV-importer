#!/bin/bash
bedfile=$1
samtools=/opt/bin/samtools
ref=$2
res=$3

awk '{ print $1 ":" $2 "-" $3 }' $bedfile | xargs -r -i $samtools faidx $ref {} >> $res
