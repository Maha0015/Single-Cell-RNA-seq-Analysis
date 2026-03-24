# 🧬 Single-Cell RNA-seq Analysis of PBMC Immune Cells (Seurat)

This project performs an end-to-end single-cell RNA sequencing (scRNA-seq) analysis of human PBMCs using the Seurat framework in R.

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

## 🧠 Biological Interpretation

Clustering of PBMC cells revealed distinct immune cell populations that align with known biology.

- **T cells (Cluster 1):** High expression of CD3D and GATA3 confirms T-cell identity.
- **B cells (Cluster 2):** Strong expression of MS4A1 (CD20) and IGHD indicates naïve/mature B cells.
- **NK cells (Cluster 5):** Enriched expression of NKG7 and KLRF1 supports natural killer cell identity.
- **Monocytes (Cluster 7):** High LYZ, FCGR3A, and CD14 expression consistent with myeloid lineage cells.
- **Erythroid-like cells (Cluster 3):** Expression of hemoglobin-related genes (e.g., HBD, HBM) suggests erythroid contamination or rare circulating precursors.

Some clusters showed less distinct marker profiles and were labeled as “Unassigned,” indicating potential mixed populations or lower-quality cells.

Overall, the clustering and marker expression patterns are consistent with known PBMC cell-type composition, validating the robustness of the analysis pipeline.
This demonstrates the ability to integrate computational analysis with biological interpretation for downstream hypothesis generation.
---

## 📦 Data

Download dataset from:
https://www.10xgenomics.com/datasets

Use PBMC 5k dataset.

Place files in:
```
data/pbmc/
```
Required files:
- barcodes.tsv.gz
- features.tsv.gz
- matrix.mtx.gz

---

## 📁 Project Structure

```
scrna/
├── scripts/
│   └── pbmc3k_seurat.R
├── results/
│ ├── qc_violin.png
│ ├── umap_clusters.png
│ ├── umap_annotated.png
│ ├── featureplot_markers.png
│ ├── pbmc3k_markers.csv
│ └── pbmc3k_seurat_object.rds
├── README.md
```
## 🛠️ Requirements

Install required packages in R:

```r
install.packages(c("Seurat", "dplyr", "ggplot2", "patchwork"))

```


---

## ▶️ Run
```
Rscript scripts/pbmc3k_seurat.R
```
