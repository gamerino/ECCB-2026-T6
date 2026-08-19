# ECCB 2026 Tutorial T6
# Making the most of cis-regulatory annotations for genome-scale analysis

Welcome to the repository for the **ECCB 2026 Tutorial T6: Making the most of cis-regulatory annotations for genome-scale analysis**.

This repository contains all the material required for the tutorial, including lecture slides, hands-on exercises, Google Colab notebooks, scripts, and example datasets. The repository is intended to remain available after the workshop as a reusable educational resource for the genomics and bioinformatics community.

---

## Overview

*Cis-regulatory elements* (CREs) such as promoters and enhancers play a central role in gene regulation. Large-scale efforts such as [ENCODE](https://www.encodeproject.org/) and [FAANG](https://data.faang.org/home) have generated extensive collections of epigenomic data that are freely accessible to the community. CREs catalogues like [Ensembl Regulation](https://regulation.ensembl.org/) and [ENCODE cCREs](https://screen.wenglab.org/) provides standardized annotation supported by these epigenomic data. While these resources are publicly available, selecting, interpreting and integrating them into genomic analyses remains challenging.

This tutorial provides a practical introduction to the exploration, interpretation and analysis of regulatory annotations using community resources and reproducible workflows in **R** and **Python**.

---

## Learning objectives

By the end of this tutorial participants will be able to:

- Understand how regulatory annotations are inferred from epigenomic evidence.
- Explore regulatory annotations using [Ensembl Regulation](https://regulation.ensembl.org/) and [ENCODE SCREEN](https://screen.wenglab.org/).
- Retrieve and analyse regulatory annotation files in R or Python.
- Visualise regulatory annotations and supporting evidence in [IGV](https://igv.org/).
- Integrate multiple evidence layers to interpret candidate regulatory regions and non-coding variants.

---

## Repository structure

```
├── data/                      Tutorial datasets
├── docs/                      Installation guides and additional documentation
├── hands-on-solutions/        Presentations with hands-on exercises solutions
├── notebooks/                 Google Colab notebooks
├── scripts/                   R, Python and shell scripts
├── slides/                    Presentation slides
└── tutorial_information/      Tutorial programme and schedule
```

---

## Tutorial programme

The tutorial consists of six sessions:

1. Regulatory Genomics and Epigenomic Evidence
2. Multi-species Catalogues of Regulatory Elements: ENCODE Experimental Data, cCREs and SCREEN
3. Multi-species Catalogues of Regulatory Elements: Ensembl Regulation, Regulatory Builds and Evidence
4. Alternative Access to Regulatory Annotations
5. Visualisation with Genome Browsers
6. Integrative case study: Non-coding variant interpretation

A detailed programme is available in the [`tutorial_information/`](tutorial_information/) directory.

---

## Before attending

Participants are encouraged to complete the setup before the tutorial.

- Install the required software.
- Download the tutorial datasets.
- Install IGV (or use IGV-Web).

Detailed instructions are available in the [`docs/`](docs/) directory.

---

## Data

The repository contains the annotation and example datasets required for the exercises.

Files provenance and any processing done after downloading for the purposes of the tutorial are documented in the [data/files_provenance_ECCB-2026-T6](data/files_provenance_ECCB-2026-T6.xlsx) file. Files processing steps are detailed in [scripts/README.md](scripts/README.md).

---

## Tutorial slides

Presentations for all the tutorial sessions are available in the [slides/](slides/) folder in both, PowerPoint and PDF formats.

---

## Hands-on activities

Each session includes one planned hands-on activity and solutions are available for all of them. For Session 1, the solution is included in the tutorial slides, while for Sessions 2, 3, 5 and 6, separate solution documents are available in the [hands-on-solutions/](hands-on-solutions/) folder.

---


## Google Colab notebooks

The hands-on exercises for Session 4 are available as Google Colab notebooks.

- GRCh38 R notebook [`notebooks/colab_regulatory_annotation_GRCh38_R.ipynb`](notebooks/colab_regulatory_annotation_GRCh38_R.ipynb)
- GRCh38 Python notebook [`notebooks/colab_regulatory_annotation_GRCh38_python.ipynb`](notebooks/colab_regulatory_annotation_GRCh38_python.ipynb)

---

## Contributing

Suggestions, corrections and improvements are welcome.

If you identify an issue or would like to propose an enhancement, please open an **Issue** or submit a **Merge Request**. All contributions will be reviewed by the tutorial maintainers before being incorporated into the official material.

---

## Organisers and speakers

- [Gabriela A. Merino](https://www.ebi.ac.uk/people/person/gabriela-merino/) (EMBL-EBI)
- [Garth Ilsley](https://www.ebi.ac.uk/people/person/garth-ilsley/) (EMBL-EBI)
- [Louisse Paola Mirabueno](https://www.ebi.ac.uk/people/person/louisse-mirabueno/) (EMBL-EBI)

---

## Citation

If you use these materials in teaching or training, please cite this repository [https://gitlab.ebi.ac.uk/ensembl-regulation/ECCB-2026-T6](https://gitlab.ebi.ac.uk/ensembl-regulation/ECCB-2026-T6) and acknowledge the ECCB 2026 Tutorial.

---

## License

Detailed in [`LICENSE`](LICENSE).
