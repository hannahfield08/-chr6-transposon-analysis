# Filtering commands used in chr6 transposon analysis
#Goal: Filter and organize different DNA elements from the original RepeatMasker file.

##Alpha Satellite Elements

# Extract all elements where column 7 is labeled "satellite"
awk 'tolower($7) == "satellite"' chr6_RepeatMasker.filtered.bed > alpha_satellite_only.bed

# Then further restrict to alpha satellites labeled with ALR in column 4
awk '$4 ~ /^ALR/' chr6_RepeatMasker.filtered.bed > alpha_satellite_only.bed

# =========================
# Active Transposons (TEs)
# =========================

# Extract all TEs: any with family names like LINE/SINE/LTR or matching active subtypes
awk 'tolower($7) ~ /line|sine|ltr/ || $8 ~ /L1|Alu|HERV|SVA/' chr6_RepeatMasker.filtered.bed > active_transposons.bed

# Strict version: match only if column 8 is exactly one of the active TE names
awk '$8 == "L1" || $8 == "Alu" || $8 == "HERV" || $8 == "SVA"' chr6_RepeatMasker.filtered.bed > active_transposons.bed

# =====================
# Separate TE Families
# =====================

# Extract individual TE types into their own files
awk '$8 ~ /L1/'   chr6_RepeatMasker.filtered.bed > L1_elements.bed
awk '$8 ~ /Alu/'  chr6_RepeatMasker.filtered.bed > Alu_elements.bed
awk '$8 ~ /HERV/' chr6_RepeatMasker.filtered.bed > HERV_elements.bed
awk '$8 ~ /SVA/'  chr6_RepeatMasker.filtered.bed > SVA_elements.bed

# ===================================================
# Final active TE filtering with corrected HERV-K handling
# ===================================================

awk '
  # Alu (SINE)
  toupper($7)=="SINE"        && toupper($4) ~ /^ALU/    { print; next }
  # LINE-1
  toupper($7)=="LINE"        && toupper($4) ~ /^L1/     { print; next }
  # SVA
  toupper($7)=="RETROPOSON"  && toupper($4) ~ /^SVA/    { print; next }
  # HERV-K (LTR, labeled as ERVK)
  toupper($7)=="LTR"         && toupper($8)=="ERVK"     { print; next }
' chr6_RepeatMasker.filtered.bed > chr6_active_transposons.bed
