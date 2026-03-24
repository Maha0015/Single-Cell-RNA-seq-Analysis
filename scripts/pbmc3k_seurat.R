library(Seurat)
library(dplyr)
library(ggplot2)

pbmc.data <- Read10X(data.dir = "data/pbmc")

pbmc <- CreateSeuratObject(
  counts = pbmc.data,
  project = "pbmc3k",
  min.cells = 3,
  min.features = 200
)

pbmc[["percent.mt"]] <- PercentageFeatureSet(pbmc, pattern = "^MT-")

png("results/qc_violin.png", width = 1200, height = 500)
VlnPlot(pbmc, features = c("nFeature_RNA", "nCount_RNA", "percent.mt"), ncol = 3)
dev.off()

pbmc <- subset(pbmc, subset = nFeature_RNA > 200 & nFeature_RNA < 2500 & percent.mt < 5)

pbmc <- NormalizeData(pbmc)
pbmc <- FindVariableFeatures(pbmc, selection.method = "vst", nfeatures = 2000)

all.genes <- rownames(pbmc)
pbmc <- ScaleData(pbmc, features = all.genes)

pbmc <- RunPCA(pbmc, features = VariableFeatures(object = pbmc))

png("results/elbow_plot.png", width = 900, height = 700)
ElbowPlot(pbmc)
dev.off()

pbmc <- FindNeighbors(pbmc, dims = 1:10)
pbmc <- FindClusters(pbmc, resolution = 0.5)
pbmc <- RunUMAP(pbmc, dims = 1:10)

png("results/umap_clusters.png", width = 900, height = 700)
DimPlot(pbmc, reduction = "umap", label = TRUE)
dev.off()

markers <- FindAllMarkers(pbmc, only.pos = TRUE, min.pct = 0.25, logfc.threshold = 0.25)
write.csv(markers, "results/pbmc3k_markers.csv", row.names = FALSE)

png("results/featureplot_markers.png", width = 1200, height = 800)
FeaturePlot(pbmc, features = c("CD3D", "MS4A1", "NKG7", "LYZ"))
dev.off()

saveRDS(pbmc, "results/pbmc3k_seurat_object.rds")