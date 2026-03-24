# Single-Cell-RNA-seq-Analysis

🧬 Single-Cell RNA-seq Analysis of PBMC Immune Cells (Seurat)

This project performs an end-to-end single-cell RNA sequencing (scRNA-seq) analysis of human peripheral blood mononuclear cells (PBMCs) using the Seurat framework in R. The workflow includes quality control, normalization, dimensionality reduction, clustering, and cell-type annotation.

🚀 Overview
Dataset: 10x Genomics PBMC (~5K cells)
Goal: Identify and annotate immune cell populations
Tools: R, Seurat, dplyr, ggplot2
🔬 Workflow
Data Loading
Imported 10x Genomics feature-barcode matrix using Read10X()
Quality Control
Filtered cells based on:
Gene count (nFeature_RNA)
UMI count (nCount_RNA)
Mitochondrial percentage (percent.mt)
Preprocessing
Normalization (NormalizeData)
Feature selection (FindVariableFeatures)
Scaling (ScaleData)
Dimensionality Reduction
Principal Component Analysis (PCA)
Elbow plot used to select significant PCs
Clustering
Nearest-neighbor graph construction
Louvain clustering
Visualization
UMAP projection for cluster visualization
Marker Identification
Differential expression analysis using FindAllMarkers
Cell-Type Annotation
Annotated clusters using canonical marker genes:
T cells: CD3D, GATA3
B cells: MS4A1, IGHD
NK cells: NKG7, KLRF1
Monocytes: LYZ, FCGR3A, CD14
Additional clusters labeled as provisional/rare populations
📊 Results
🔹 Quality Control

🔹 UMAP Clustering

🔹 Annotated Cell Types

🔹 Marker Gene Expression
