# Tutorial Setup Guide

This document describes how to prepare your computer before attending the tutorial.

Please complete the setup **before the workshop** to ensure you can participate in all hands-on exercises.

---

# 1. Download the tutorial material

Clone the repository using Git:

```bash
git clone https://gitlab.ebi.ac.uk/<group>/<repository>.git
```

Alternatively, you can download the repository as a ZIP archive:

1. Open the project page.
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

Before starting the hands-on exercises, uncompress the following files:

```text
data/
└── cres_annotation/
    ├── ENCODE/
    │   ├── GRCh38-cCRE-colors18062026.bed.gz
    │   ├── GRCm39-cCRE-colors18062026.bed.gz
    │   └── mm10-cCRE-colors18062026.bed.gz
    │
    └── Ensembl_Regulation/
        ├── Homo_sapiens.GRCh38.regulatory_features.v116.gff3.gz
        └── Mus_musculus.GRCm39.regulatory_features.v116.gff3.gz
```

The remaining files (e.g. `.bed`, `.bb`, `.bw` and `.idx`) do **not** require decompression.

You may extract these files in one of two ways:

### Option 1 — Graphical interface (recommended)

Navigate to the corresponding directory and extract each `.gz` file using your operating system's file manager (for example, by double-clicking the file or selecting **Extract** from the context menu).

### Option 2 — Terminal (Linux/macOS)

From the root directory of the repository, run:

```bash
gzip -d data/cres_annotation/ENCODE/*.bed.gz
gzip -d data/cres_annotation/Ensembl_Regulation/*.gff3.gz
```

If you want, you can also add the `-k` option to keep the original compressed files while creating the uncompressed versions.

After extraction, the corresponding `.bed` and `.gff3` files should be present \(alongside the original `.gz` files if `-k` was used).

These uncompressed files will be used during the R and Python hands-on exercises.

---

# 3. Install Google Chrome (recommended)

Although any modern web browser should work, **Google Chrome** is recommended for the Google Colab exercises.

---

# 4. Install IGV

Follow the instructions in the [genome-browsers](genome-browsers.md) document to download IGV or to know how to access to its web version.

---

# 5. Google Colab

The tutorial provides Google Colab notebooks for the Python and R exercises. To runt them you need to have a Google account.

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
