library(dplyr)

script_file <- sub(
  "^--file=",
  "",
  commandArgs(trailingOnly = FALSE)[
    grepl("^--file=", commandArgs(trailingOnly = FALSE))
  ][1]
)
script_dir <- dirname(normalizePath(script_file))
repo_root <- normalizePath(file.path(script_dir, "../../.."))
encode_dir <- file.path(repo_root, "data", "cres_annotation", "ENCODE")
input_file <- file.path(encode_dir, "GRCh38-cCREs.bed")
output_file <- file.path(encode_dir, "GRCh38-cCRE-colors18062026.bed")

# GRCh38 cCREs

if (!file.exists(input_file)) {
  stop("Input file not found: ", input_file)
}

GRCh38_cCREs <- read.delim(input_file, header = FALSE)
head(GRCh38_cCREs)

names(GRCh38_cCREs) <- c('chr', 'start', 'end', 'oldName', 'name', 'type')
# Because we need to change the bed type format, we need to add missing fields

GRCh38_cCREs %>%
  select(-oldName) %>%
  mutate(score = 0,
         strand = '.',
         thickStart = start,
         thickEnd = end) -> GRCh38_cCREs

# We will define the colors based on the ones displayed in the cCREs help page 

cCREs_colors <- c("CA" = "6,218,147",
                  "CA-CTCF" = "0,176,240",
                  "CA-H3K4me3" = "255,170,170" ,
                  "CA-TF" = "190,40,229",
                  "dELS" = "255,205,0",
                  "pELS" = "255,167,0",
                  "PLS" = "255,0,0",
                  "TF" = "216,118,236")
GRCh38_cCREs %>%
  mutate(color = cCREs_colors[type]) %>%
  select(chr, start, end, name, score, strand, thickStart, thickEnd,
         color, type) -> GRCh38_cCREs

write.table(GRCh38_cCREs, file = output_file,
            row.names = FALSE, col.names = FALSE, quote = FALSE, sep = '\t')




  
