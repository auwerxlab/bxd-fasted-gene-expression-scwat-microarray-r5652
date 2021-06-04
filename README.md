# BXD fasted gene expression scWAT microarray R5652

<a rel="license" href="http://creativecommons.org/licenses/by/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by/4.0/">Creative Commons Attribution 4.0 International License</a>.

© Copyright 2021 Laboratory of Integrative Systems Physiology, EPFL, Switzerland

This project is based on the following template: https://github.com/auwerxlab/renku-project-template/tree/master/R-renv (deb856b)

This is a Renku project, see https://renku.readthedocs.io for details.

**Authors:** Alexis Rapin (alexis.rapin@epfl.ch), Alexis Bachmann (alexis.bachmann@epfl.ch), Maroun Bou Sleiman (maroun.bousleiman@epfl.ch)

## Description

This R project generates expression matrices for microarray assays estimating genes expression in subcutaneous adipose tissue samples collected on the BXD mouse genetic diversity model.

Microarray assays intensities CEL files are downloaded from public sources (Gene Expression Omnibus) and are processed into expression matrices using the Array Power Tool (APT) suite. All the processing is done within R notebooks located in the ``notebooks/`` directory.

## Ressources

- Knowledge base of the associated study: https://sv-renku-git.epfl.ch/lisp/bxd-fasted-knowledge-base

## Get this project

You can clone this project from https://sv-renku-git.epfl.ch.
```
$ git clone https://sv-renku-git.epfl.ch/lisp/bxd-fasted-gene-expression-scwat-microarray-r5652.git
```

If it is private, you would need a valid Gitlab token. Contact the authors if needed.
```
$ git clone https://< gitlab_token_name >:< gitlab_token >@sv-renku-git.epfl.ch/lisp/bxd-fasted-gene-expression-scwat-microarray-r5652.git
```

You can get an archive of this project from https://github.com.
```
$ git clone https://github.com/auwerxlab/bxd-fasted-gene-expression-scwat-microarray-r5652.git
```

## Requirements

- This is a Renku project, see https://renku.readthedocs.io for details
- R version 4.0.0
- renv R package
- See ``renv.lock`` for the complete list of R packages dependencies
- Array Power Tool binaries for the processing of microarray data (stored in ``opt/apt_2.11.3_linux_64_bit_x86_binaries``): https://downloads.thermofisher.com/APT/APT_2.11.3/apt_2.11.3_linux_64_bit_x86_binaries.zip
- See ``Dockerfile`` for more system requirements
- A table of microarrays runs, in tab-delimited text format (included in the associated study knowledge base at https://sv-renku-git.epfl.ch/lisp/bxd-fasted-knowledge-base).
See table below for format:

| Description                                                   | Format                                  | Example                                                                                                        | Requirement |
|---------------------------------------------------------------|-----------------------------------------|----------------------------------------------------------------------------------------------------------------|-------------|
| Data type                                                     | Free text                               | Gene expression                                                                                                | Optional    |
| Assay technology                                              | Free text                               | microarray                                                                                                     | Optional    |
| Assay technology                                              | http://purl.obolibrary.org/obo/obi.owl  | microarray                                                                                                     | Desired     |
| http://purl.obolibrary.org/obo/obi.owl                        | URL                                     | http://purl.obolibrary.org/obo/OBI_0400147                                                                     | Optional    |
| Platform name                                                 | Free text                               | Affymetrix Mouse Gene 1.0 ST Array                                                                             | Required    |
| Platform accession number                                     | GEO accession number (GPLxxxx)          | GPL6246                                                                                                        | Required    |
| Unique run ID                                                 | Free text                               | R1234                                                                                                          | Required    |
| Platform manufacturer provided support files                  | URL                                     | http://media.affymetrix.com/analysis/downloads/lf/wt/                                                          | Required    |
| Platform manufacturer provided probesets annotation file      | URL                                     | https://sec-assets.thermofisher.com/TFS-Assets/LSG/Support-Files/MoGene-1_0-st-v1-na36-mm10-transcript-csv.zip | Optional    |
| Platform manufacturer provided probesets annotation file      | URL                                     | https://sec-assets.thermofisher.com/TFS-Assets/LSG/Support-Files/MoGene-1_0-st-v1-na36-mm10-probeset-csv.zip   | Optional    |
| Run CEL files private location                                | Directory URL                           | https://< server_name >:< path/to/run/data >/                                                                  | Optional    |
| Location of run expression matrix                             | File URL                                | https://< server_name >:< path/to/run/data >/                                                                  | Optional    |
| Location of run expression matrix computed with probe masking | File URL                                | https://< server_name >:< path/to/run/data >/                                                                  | Optional    |
| Run samples metadata table                                    | File URL                                | https://< server_name >:< path/to/run/metadata_file.txt >                                                      | Required    |
| Run protocols description table                               | File URL                                | https://< server_name >:< path/to/run/metadata_file.txt >                                                      | Desired     |
| Public run data database name                                 | Short name, see https://fairsharing.org | GEO                                                                                                            | Desired     |
| Public run data database DOI                                  | DOI, see https://fairsharing.org        | 10.25504/FAIRsharing.5hc8vt                                                                                    | Desired     |
| Public run data accession number                              | Accession number                        | GSE60149                                                                                                       | Required    |
| DOI of associated publications                                | DOI                                     | 10.1126/science.aad0189                                                                                        | Desired     |
| Any additional field                                          |                                         |                                                                                                                | Optional    |

(Table created with https://www.tablesgenerator.com)

- Recommended minimal memory: 4GB

## Data

Only essential data are archived. These include:

- **Expression matrices:** The expression matrix generated within this R project is available in ``data/matrix/gc-sst-rma-sketch.summary.txt``.

Data that are not archived include:

- **Microarray assay data:** CEL files are not included. See ``data/microarray_runs.txt`` for the original data provenance.
- **Microarray platform support files:** Support files are not included. See ``data/microarray_runs.txt`` for sources.
- **Transcript annotations:** Transcript annotations are not included. See ``data/microarray_runs.txt`` for sources.

## Usage

Run ``notebook/generate_expression_matrix.Rmd``.

Render notebooks and archive essential files using ``make``:

```
$ make
render               render all R notebooks located in notebooks/
commit               run git commit
archive              create an archive of this project in archive/ (CAUTION: will not include LFS objects)
```

## Structure

<pre>
.
├── archive                   Archives of this repos (not available in an archive)
├── data                      
│   ├── matrix                Expression values matrix
│   ├── raw                   Raw data (CEL files) (not available in an archive)
│   └── platform_files        
│       └── < platform_id >   Platform support files (not available in an archive)
├── lib                       Project R library
├── notebooks                 R notebooks
└── renv                      renv directory (set as a symbolic link in renku projects, not available in an archive)
</pre>

