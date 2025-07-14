#!/bin/bash

# This script finds overlaps between transposon insertions and a-satellite regions on chr6 using bedtools.

# Input BED files
TRANSPOSONS="chr6_data/active_transposons.bed"
ASAT="chr6_data/alpha_satellite.bed"

# Output file
OUTPUT="chr6_data/transposons_in_asat.bed"

# Run bedtools intersect
bedtools intersect -a "$TRANSPOSONS" -b "$ASAT" > "$OUTPUT"

echo "Intersected transposons with a-satellite regions. Output written to $OUTPUT"