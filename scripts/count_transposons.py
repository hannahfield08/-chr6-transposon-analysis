import pandas as pd

df = pd.read_csv("../chr6_data/transposons_in_asat.bed", sep="\t", header=None) #load the transposons BED file as a DataFrame

df.columns = [ #assign column names to the DataFrame
    "contig",
    "start",
    "end",
    "repeat_name",
    "length",
    "strand",
    "repeat_class",
    "repeat_family",
    "score",
    "rmsk_id",
]

#df["sample_id"] = df["contig"].apply(lambda x: x.split("#")[0])
#df["sample_id"] = df["contig"].apply(lambda x: x.split("#")[:2]) #originally the number was 0, but I changed it because of there being two samples with the same sample ID
df["sample_id"] = df["contig"].apply(lambda x: "#".join(x.split("#")[:2])) #join the first two elements of the contig column to get the sample ID

summary = df.groupby(["sample_id", "repeat_family"]).size().reset_index() #group by sample ID and repeat family and count the number of transposons in each repeat family
summary.columns = ["sample_id", "repeat_family", "count"] #rename the columns

summary.to_csv("../chr6_data/repeat_family_counts_per_sample.csv", index=False) #save the summary to a CSV file
print("Saved repeat family counts per sample") #print confirmation message