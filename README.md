# atacSeqExamples
An example script for working with ATAC-seq data. It requires installing the custom R packages [BSgenome.Crobusta.HT.KY](https://github.com/ChristiaenLab/BSgenome.Crobusta.HT.KY), [CrobustaMotifs](https://github.com/kewiechecki/CrobustaMotifs), [dirfns](https://github.com/kewiechecki/dirfns), [moreComplexHeatmap](https://github.com/kewiechecki/moreComplexHeatmap), [peakToGene](https://github.com/kewiechecki/peakToGene), and [tfenrichr](https://github.com/kewiechecki/tfenrichr). All of these can be installed by cloning the repositories and running `make`. Installation requires the `devtools` package.
They depend on the packages `circlize`, `ComplexHeatmap`, `DBI`, `GenomicFeatures`,`GenomicRanges`,`motifmatchr`,`rtracklayer`,`SummarizedExperiment`, and `TFBSTools`, all of which should be installed automatically.
It also requires the KY2019 GFF, which can be obtained by running `make`. 
```{bash}
wget -U firefox http://ghost.zool.kyoto-u.ac.jp/datas/HT.KYGene.gff3.zip
unzip HT.KYGene.gff3.zip
```

# Usage
```{bash}
Rscript rnfExample.R
```
