# Tutorial Setup Guide

This document describes how to prepare your computer before attending the tutorial.

Please complete the setup **before the workshop** to ensure you can participate in all hands-on exercises.

---

# 1. Download the tutorial material

Clone the repository using Git:

```bash
https://gitlab.ebi.ac.uk/ensembl-regulation/ECCB-2026-T6.git
```

Alternatively, you can download the repository as a ZIP archive:

1. Open the [project page](https://gitlab.ebi.ac.uk/ensembl-regulation/ECCB-2026-T6).
2. Select **Code** → **Download source code**.
3. Extract the archive to a convenient location.

---

After cloning or downloading the repository, the directory structure should look similar to:

```text
ECCB-2026-T6/
├── data/
├── docs/
├── hands-on-solutions/
├── notebooks/
├── scripts/
├── slides/
└── tutorial_information/
```

---

# 2. Uncompress annotation files

Some annotation files are distributed in **gzip-compressed** (`.gz`) format to reduce the repository size.

If you are running the analyses locally, uncompress the annotation files before
starting the hands-on exercises. The compressed files are located in several
subdirectories under `data/cres_annotation/`:

```text
data/
└── cres_annotation/
    ├── ENCODE/
    │   ├── GRCh38-cCRE-colors18062026.bed.gz
    │   ├── GRCm39-cCRE-colors18062026.bed.gz
    │   ├── HCT116-cCRE.chr8.bed.gz
    │   └── mm10-cCRE-colors18062026.bed.gz
    ├── Ensembl_Regulation/
    │   ├── Homo_sapiens.GRCh38.regulatory_features.v116.gff3.gz
    │   └── Mus_musculus.GRCm39.regulatory_features.v116.gff3.gz
    ├── Fantom5/
    │   └── F5.hg38.enhancers.bed.gz
    └── RefSeq/
        └── GCF_000001405.40_GRCh38.p14_genomic.RefSeqFE.gff.gz
```

The `.gz` files under `data/evidence/` are evidence tracks that will be decompressed on the Google Colab sessions and
are not part of this annotation decompression step. If you want to load these files on IGV it is recommended to use their bigBed version also present in the same folders. 

You may extract these files in one of two ways:

### Option 1 — Graphical interface

Navigate to the corresponding directories and extract each `.gz` file using
your operating system's file manager (for example, by double-clicking the file
or selecting **Extract** from the context menu).

### Option 2 — Terminal (Linux/macOS, recommended)

From the root directory of the repository, run the following command to
uncompress all annotation files while keeping the original `.gz` files:

```bash
find data/cres_annotation -type f -name '*.gz' -print0 |
while IFS= read -r -d '' file; do
    gzip -dc "$file" > "${file%.gz}"
done
```

After extraction, the corresponding uncompressed annotation files should be
present alongside the original `.gz` files.

If you are using the Google Colab notebooks, no manual decompression is
required. The notebooks download and uncompress the required input files
automatically in the Colab session.

---

# 3. Install Google Chrome (recommended)

Although any modern web browser should work, **Google Chrome** is recommended for the Google Colab exercises.

---

# 4. Install IGV

Follow the instructions in the [genome-browsers](genome-browsers.md) document to download IGV or to know how to access to its web version.

---

# 5. Google Colab

The tutorial provides Google Colab notebooks for the Python and R exercises. To run them you need to have a Google account.

No local Python/R installation is required if you choose to use Google Colab.

Instructions for running the notebooks are available in the [notebooks/README.md](../notebooks/README.md) document.

---

# 6. Verify your setup

Before the tutorial, please verify that:

- [ ] The repository has been downloaded or cloned.
- [ ] The tutorial datasets are available.
- [ ] IGV opens successfully.
- [ ] Google Colab notebooks can be opened.

---

# Troubleshooting

If you encounter any problems before the tutorial:

- Open an issue in the GitLab repository.
- Contact the tutorial organisers.
