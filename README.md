# Farlowella Tables Repository

## Description

Repository containing the R code used for generating summary tables in taxonomic papers of Farlowella

## Usage and credits

Please cite this repository as online reference when using the model table and script (Ballen, G.A. (2016) Farlowella tables repository. Available from https://github.com/gaballench/FarlowellaTables, Accessed on: dd-mm-yyyy). In case you need to use a specific dataset and/or script from a particular folder, you should note that these are supplementary materials for published papers, so please cite the paper where they were presented. Such information will be unambiguously found both in this repo and inside the dataset file. You are allowed to used and modify all the materials herein available provided that the proper credit is given and that they will not be used for profit. For further details click on the creative commons license below.

## Contents of this repository

There are two files provided:
* A `dataset.csv` table used to store the data to be imported into R. It can be opened and edited in any spreadsheet software (libreoffice encouraged as it is free software). After saving the data again in csv format, the can be imported into R.

* A script `analyses.R` that imports the `dataset.csv` dataset into R. If run completely it will generate an xls table almost completely formatted for inclussion in manuscripts. The model follows Ballen & Mojica (2014) and will be incorporated in Ballen et al. (in prep.).

Please note that the model table also include fields for meristic data that are not subject to statistical summary as they show very little variation and are seldom included in summary tables. The script handles such columns ignoring them so the user does not need to remove them by hand from the raw data file.

This repository, its scripts and associated data were created before carrying out the manuscript for Ballen et al. (Farlowella mitoupibo, in press), where two columns from the model table (i.e., species and sex) were missing. For sake of reproducibility a separate script and dataset will be provided herein as soon as the article is accepted for publication.

## Datasets available

# Farlowella gianetii

Please navigate to the Fgianetii folder to find the dataset and script used in this study.

Cite as:

Ballen, G.A., Pastana, M.N.L. & Peixoto, L.A.W. 2016 (2016). A new species of *Farlowella* (Siluriformes: Loricariidae) of the *F. nattereri* species-group from the rio Xingu basin, Mato Grosso, Brazil, with comments on *Farlowella jauruensis* Eigenmann & Vance, a poorly-known species from the upper rio Paraguai basin. Neotropical Ichthyology 14(3):e160046.

# Farlowella mitoupibo

Please navigate to the Fmitoupibo folder to find the dataset and script used in this study.

Cite as:

Ballen, G.A., Urbano-Bonilla, A. & Zamudio, J.E. 2016 (in press). *Farlowella mitoupibo*, a new species of stick catfish from the upper Guaviare River, Orinoco basin, Colombia (Teleostei: Loricariidae). Ichthyological Exploration of Freshwaters 27(4):325-332.

<a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/">Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License</a>.
