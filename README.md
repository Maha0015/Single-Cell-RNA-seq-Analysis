# 🧬 Single-Cell RNA-seq Analysis of PBMC Immune Cells (Seurat)

This project performs an end-to-end single-cell RNA sequencing (scRNA-seq) analysis of human PBMCs using Seurat in R.

---

## 🚀 Overview

- Dataset: 10x Genomics PBMC (~5K cells)
- Goal: Identify and annotate immune cell populations
- Tools: R, Seurat, dplyr, ggplot2

---

## 🔬 Workflow

### Data Loading
- Read 10x matrix using `Read10X()`

### Quality Control
- Filtered based on:
  - nFeature_RNA
  - nCount_RNA
  - percent.mt

### Preprocessing
- NormalizeData
- FindVariableFeatures
- ScaleData

### Dimensionality Reduction
- PCA
- Elbow Plot

### Clustering
- FindNeighbors
- FindClusters

### Visualization
- UMAP

### Marker Identification
- FindAllMarkers

### Annotation
- T cells: CD3D, GATA3
- B cells: MS4A1, IGHD
- NK cells: NKG7
- Monocytes: LYZ

---

## 📊 Results

### Quality Control
![QC](results/qc_violin.png)

### UMAP Clustering
![UMAP](results/umap_clusters.png)

### Annotated Clusters
![Annotated](results/umap_annotated.png)

### Marker Expression
![Markers](results/featureplot_markers.png)

---

## 📦 Data

Download dataset from:
https://www.10xgenomics.com/datasets

Use PBMC 5k dataset.

Place files in:

data/pbmc/


Required files:
- barcodes.tsv.gz
- features.tsv.gz
- matrix.mtx.gz

---

## 📁 Project Structure

```
scrna/
├── scripts/
│ └── pbmc3k_seurat.R
├── results/
│ ├── qc_violin.png
│ ├── umap_clusters.png
│ ├── umap_annotated.png
│ ├── featureplot_markers.png
│ ├── pbmc3k_markers.csv
│ └── pbmc3k_seurat_object.rds
├── README.md
```

---

## ▶️ Run


Rscript scripts/pbmc3k_seurat.R
