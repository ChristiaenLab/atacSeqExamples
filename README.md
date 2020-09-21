# atacSeqExamples
An example script for working with ATAC-seq data. It requires installing a few custom R packages.
```{bash}
git clone https://github.com/kewiechecki/atacSeqFns
R CMD INSTALL atacSeqFns

git clone https://github.com/ChristiaenLab/BSgenome.Crobusta.HT.KY
cd BSgenome.Crobusta.HT.KY
make
```
It also requires the KY2019 GFF.
````{bash}
wget -U firefox http://ghost.zool.kyoto-u.ac.jp/datas/HT.KYGene.gff3.zip
unzip HT.KYGene.gff3.zip
```
`atacSeqFns` depends on the packages `circlize`, `ComplexHeatmap`, `DBI`, `GenomicFeatures`,`GenomicRanges`,`motifmatchr`,`rtracklayer`,`SummarizedExperiment`, and `TFBSTools`, all of which should be installed automatically.

# Usage
```{bash}
Rscript rnfExample.R
```
