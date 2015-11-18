# Farlowella Tables Repository

## Description

Repository containing the R code used for generating summary tables in taxonomic papers of Farlowella

## Contents of this repository

There are two files provided, a `Farlowella data.csv` table used to import data to R. It can be opened and edited in any spreadsheet software (libreoffice encouraged as it is free software). After saving the data again in csv format, the can be imported into R.

The script `measurements.R` imports the csv dataset into R. If run completely it will generate an xls table almost completely formatted for inclussion in manuscripts. The model follows Ballen & Mojica (2014) and will be incorporated in Ballen et al. (in prep.).

Please note that the model table also include fields for meristic data that are not subject to statistical summary as they show very little variation and are seldom included in summary tables. The script handles such columns ignoring them so the user does not need to remove them by hand from the raw data file.

This repository, its scripts and associated data were created before carrying out the manuscript for Ballen et al. (Farlowella mxxxxxxxx, in prep), where two collumns from the model table (i.e., species and sex) were missing. For sake of reproducibility a separate script and dataset will be provided herein as soon as the article is accepted for publication.

<a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/">Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License</a>.
