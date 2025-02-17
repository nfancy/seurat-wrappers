% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/scVI.R
\name{scVIIntegration}
\alias{scVIIntegration}
\title{Run scVI in seurat5}
\usage{
scVIIntegration(
  object,
  groups = NULL,
  features = NULL,
  layers = "counts",
  conda_env = NULL,
  new.reduction = "integrated.dr",
  ndims = 30,
  nlayers = 2,
  gene_likelihood = "nb",
  max_epochs = NULL,
  ...
)
}
\arguments{
\item{object}{A merged Seurat object}

\item{groups}{A one-column data frame with grouping information}

\item{features}{features to use}

\item{layers}{Layers to use}

\item{conda_env}{conda environment to run scVI}

\item{new.reduction}{Name to store resulting DimReduc object as}

\item{...}{Arguments passed to other methods}
}
\value{
A Seurat object with embeddings and loadings
}
\description{
Run scVI in seurat5
}
\note{
This function requires the
\href{https://docs.scvi-tools.org/en/stable/installation.html}{\pkg{scvi-tools}} package
to be installed
}
\examples{
\dontrun{
# Preprocessing
obj <- SeuratData::LoadData("pbmcsca")
obj[["RNA"]] <- split(obj[["RNA"]], f = obj$Method)
obj <- NormalizeData(obj)
obj <- FindVariableFeatures(obj)
obj <- ScaleData(obj)
obj <- RunPCA(obj)

# After preprocessing, we integrate layers, specifying a conda environment
obj <- IntegrateLayers(object = obj, method = scVIIntegration, new.reduction = 'integrated.scvi',
                       conda_env = '../miniconda3/envs/scvi-env', verbose = FALSE)
}

# Alternatively, we can integrate SCTransformed data
obj <- SCTransform(object = obj)
obj <- IntegrateLayers(object = obj, method = scVIIntegration,
          orig.reduction = "pca", new.reduction = 'integrated.scvi',
           assay = "SCT", conda_env = '../miniconda3/envs/scvi-env', verbose = FALSE)

}
\seealso{
\href{https://docs.scvi-tools.org/en/stable/tutorials/notebooks/scvi_in_R.html}{scVI}
}
