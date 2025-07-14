#!/bin/bash

# =============================================
# This script finds overlaps between active transposons and alpha-satellite regions on chr6 using BEDTools.
# =============================================

# ---------- Original command used in terminal ----------
bedtools intersect -a chr6_data/active_transposons.bed -b chr6_data/alpha_satellite.bed > chr6_data/transposons_in_asat.bed

# ---------- Reproducible version ----------
# Define input files
TRANSPOSONS="chr6_data/active_transposons.bed"
ASAT="chr6_data/alpha_satellite.bed"

# Define output
OUTPUT="chr6_data/transposons_in_asat.bed"

# Execute the intersection using bedtools
bedtools intersect -a "$TRANSPOSONS" -b "$ASAT" > "$OUTPUT"

# Confirm to user
echo "Intersected transposons with a-satellite regions. Output written to: $OUTPUT"
