# **AMRFinder Pipeline**

# Overview:
This repository contains scripts and documentation for antimicrobial resistance (AMR) analysis using AMRFinder outputs.

# Repository Structure:
amrfinder_pipeline/

1. scripts/
```
      antibiotic class interpretation.R;
   
      gene-level interpretation.R

      heatmaps_graphs.R
```
2. documentation/
```
      class_level_full.pdf

      gene_level_documentation.pdf

      heatmaps_graphs_documentation.pdf
```
 # Scripts:
1. antibiotic class interpretation.R

Generates:
```
AMR_class_presence_absence.tsv;
AMR_class_summary.tsv;
beta_lactam_subclasses_summary.tsv
```
2. gene-level interpretation.R

Generates:
```
gene_level_AMR_frequency.csv
```
3. heatmaps_graphs.R

Generates:
```
a. AMR_class_distribution.png;
b. AMR_presence_absence_heatmap.png;
c. beta_lactam_subclasses_distribution.png
```
# Requirements:
R packages required:

          a. dplyr
          b. readr
          c. tidyr
          d. ggplot2
          e. pheatmap

# How to Run:
```
source("scripts/antibiotic class interpretation.R");

source("scripts/gene-level interpretation.R");

source("scripts/heatmaps_graphs.R");
```
**Author:
Nidhi Guntgatti**
