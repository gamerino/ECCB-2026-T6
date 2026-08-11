# Google Colab Notebooks

This directory contains the Google Colab notebooks used during the Session 4 hands-on exercises of the tutorial.

Participants may choose either the **R** or **Python** workflow. Both notebooks cover the same practical exercises and learning objectives, differing only in the programming language and associated libraries.

## Available notebooks

| Notebook | Description |
|----------|-------------|
| `colab_regulatory_annotation_R.ipynb` | Hands-on exercises implemented in **R**, using packages such as **rtracklayer**, **GenomicRanges**, and **dplyr**. |
| `colab_regulatory_annotation_python.ipynb` | Hands-on exercises implemented in **Python**, using packages such as **pandas** and **PyRanges**. |

### Downloading the notebooks

[![R notebook - download](https://img.shields.io/badge/R%20notebook-download-blue?logo=r)](https://gitlab.ebi.ac.uk/ensembl-regulation/ECCB-2026-T6/-/raw/main/notebooks/colab_regulatory_annotation_R.ipynb)

[![Python notebook - download](https://img.shields.io/badge/Python%20notebook-download-blue?logo=python)](https://gitlab.ebi.ac.uk/ensembl-regulation/ECCB-2026-T6/-/raw/main/notebooks/colab_regulatory_annotation_python.ipynb)

## Running the notebooks

The notebooks are designed to run directly in **Google Colab** so you need to have a Google account for using them.

### Uploading a notebook to Colab

1. Download the R or Python notebook using the buttons above.
2. Go to [Google Colab](https://colab.research.google.com/).
3. Select **File → Upload notebook** and choose the downloaded `.ipynb` file.
4. If prompted, sign in with your Google account.
5. Execute the cells sequentially from top to bottom and follow the instructions provided within the notebook.

Alternatively, open the [notebooks folder in GitLab](https://gitlab.ebi.ac.uk/ensembl-regulation/ECCB-2026-T6/-/tree/main/notebooks), select a notebook, download it, and upload it to Colab.

The required datasets are automatically downloaded on your Google Drive during execution. No local installation of R or Python is required.

## During the tutorial

The notebooks are introduced during **Session 4 – From browsers to files**, where participants learn how to:

- Read regulatory annotation files.
- Explore BED and GFF3 formats.
- Filter regulatory annotations.
- Perform genomic interval overlaps.
- Export and interpret analysis results.

Participants are encouraged to complete either the **R** or the **Python** workflow. The concepts and expected outputs are equivalent.

## Requirements

The notebooks require:

- A Google account.
- A modern web browser.
- Internet access.
