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
input_file <- file.path(encode_dir, "mm10-cCREs_LOGRCm39.bed")
output_file <- file.path(encode_dir, "GRCm39-cCRE-colors18062026.bed")

# GRCm39 cCREs

if (!file.exists(input_file)) {
  stop("Input file not found: ", input_file)
}

GRCm39_cCREs <- read.delim(input_file, header = FALSE)
head(GRCm39_cCREs)

names(GRCm39_cCREs) <- c('chr', 'start', 'end', 'oldName', 'name', 'type')
# Because we need to change the bed type format, we need to add missing fields

GRCm39_cCREs %>%
  select(-oldName) %>%
  mutate(score = 0,
         strand = '.',
         thickStart = start,
         thickEnd = end) -> GRCm39_cCREs

# We will define the colors based on the ones displayed in the cCREs help page 

cCREs_colors <- c("CA" = "6,218,147",
                  "CA-CTCF" = "0,176,240",
                  "CA-H3K4me3" = "255,170,170" ,
                  "CA-TF" = "190,40,229",
                  "dELS" = "255,205,0",
                  "pELS" = "255,167,0",
                  "PLS" = "255,0,0",
                  "TF" = "216,118,236")
GRCm39_cCREs %>%
  mutate(color = cCREs_colors[type]) %>%
  select(chr, start, end, name, score, strand, thickStart, thickEnd,
         color, type) -> GRCm39_cCREs

write.table(GRCm39_cCREs, file = output_file,
            row.names = FALSE, col.names = FALSE, quote = FALSE, sep = "\t")




  
