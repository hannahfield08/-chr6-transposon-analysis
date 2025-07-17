# chr6-transposon-analysis
Analysis of different types and numbers of transposon insertions within the alpha-satellite region in chromosome 6 across 10 different cenhaps (samples). 

## Contents

## Goals

- Identify active transposons (Alu, L1, SVA, HERV-K)
- Isolate alpha-satellite regions (ALR)
- Compare insertion patterns across cenhaps

## Files

All project data files are stored in the [`chr6_data`](chr6_data/) folder:

- RepeatMasker annotations: [Download](chr6_data/RepeatMasker.filtered.bed)
- Active transposons: [Download](chr6_data/active_transposons.bed)
- Alu (SINE) elements: [Download](chr6_data/Alu_elements.bed)
- LINE-1 elements: [Download](chr6_data/L1_elements.bed)
- SVA elements: [Download](chr6_data/SVA_elements.bed)
- HERV-K (ERVK-labeled) LTRs: [Download](chr6_data/HERVK.bed)
- Alpha-satellite region of chr6: [Download](chr6_data/alpha_satellite.bed)
- Merged alpha-satellite regions: [Download](chr6_data/alpha_satellite_merged.bed)
- Transposons in alpha satellites: [Download](chr6_data/transposons_in_asat.bed)
- Repeat family counts per sample: [Download](chr6_data/repeat_family_counts_per_sample.csv)

All scripts are stored in the [`scripts`](scripts/) folder:

- Filtering notes: [filtering_notes.md](scripts/filtering_notes.md)
- Shell script to intersect ASATs and TEs using BEDTools: [transposon_asat_overlap_bedtools.sh](scripts/transposon_asat_overlap_bedtools.sh)
- Python script for counting transposons: [count_transposons.py](scripts/count_transposons.py)
