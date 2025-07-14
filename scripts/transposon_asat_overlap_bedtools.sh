# =============================================
# Script: transposon_asat_overlap_bedtools.sh
# Purpose: Find overlaps between active transposons and merged alpha-satellite regions on chr6 using BEDTools.
# =============================================

# ---------- Commands used ----------
# Merge alpha-satellite regions with ≤10,000 bp gaps
bedtools merge -d 10000 -i chr6_data/alpha_satellite.bed > chr6_data/alpha_satellite_merged.bed

# Intersect active transposons with merged alpha-satellite regions
bedtools intersect -a chr6_data/active_transposons.bed -b chr6_data/alpha_satellite_merged.bed > chr6_data/transposons_in_asat.bed

# ---------- Reproducible version ----------
# Define input files
TRANSPOSONS="chr6_data/active_transposons.bed"
MERGED_ASAT="chr6_data/alpha_satellite_merged.bed"

# Define output file
OUTPUT="chr6_data/transposons_in_asat.bed"

# Run intersection
bedtools intersect -a "$TRANSPOSONS" -b "$MERGED_ASAT" > "$OUTPUT"

# Confirm to user
echo "Intersected transposons with merged alpha-satellite regions. Output written to: $OUTPUT"
