# atacSeqExamples
An example script for working with ATAC-seq data. It requires installing the custom R packages [BSgenome.Crobusta.HT.KY](https://github.com/ChristiaenLab/BSgenome.Crobusta.HT.KY), [CrobustaMotifs](https://github.com/kewiechecki/CrobustaMotifs), [dirfns](https://github.com/kewiechecki/dirfns), [moreComplexHeatmap](https://github.com/kewiechecki/moreComplexHeatmap), [peakToGene](https://github.com/kewiechecki/peakToGene), and [tfenrichr](https://github.com/kewiechecki/tfenrichr). All of these can be installed by cloning the repositories and running `make`. 

Installation requires R version 3.6 and C++11.

The pipeline depends on the packages `circlize`, `ComplexHeatmap`, `DBI`, `GenomicFeatures`, `motifmatchr`, `rtracklayer`, and `SummarizedExperiment` all of which should be installed automatically. If they aren't, try

```{r}
BiocManager::install('circlize','ComplexHeatmap','DBI','GenomicFeatures','motifmatchr','rtracklayer','SummarizedExperiment')
```

If you still have trouble installing these, make sure your versions of R and C++ are up-to-date.

# Usage
```{bash}
# Running the example script requires the KY2019 GFF. The download instructions are in the Makefile.
make
# Rscript runs the script non-interactively. To run it interactively, simply open the file in RStudio.
Rscript rnfExample.Rmd
```
