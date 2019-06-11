#! /bin/bash
# author: Belfegas Mehdi
# date:   22/05/2019
# This script consitute the full analysis for the investigation of ALDH2
#

## Make sure to run this script from the <script> directory

## Clean up the working directory
echo "Clean up directory"
rm -r ../data/align/*.*
rm  ../data/reference/NM_000690.3.fa.fai

## Alignement 
bbmap.sh \
        ref="../data/reference/NM_000690.3.fa" \
        in="../data/reads/NM_000690.3.fasta.fq" \
        out="../data/align/NM_000690.3.sam" \
        nodisk

## Samtools transformation for IGV ready output
echo "SAM to BAM"
samtools view -b -u  \
../data/align/NM_000690.3.sam  \
-o ../data/align/NM_000690.3.bam

## Sort reads per position
echo "Sort BAM"
samtools sort -o ../data/align/NM_000690.3_sorted.bam ../data/align/NM_000690.3.bam

## Indexing BAM file
echo "Indexing BAM"
samtools index ../data/align/NM_000690.3_sorted.bam
