# dependencies
library(BSgenome.Crobusta.HT.KY)
library(atacSeqFns)

# get KH-to-KY table
kh.ky <- read.table('KH2012_KY2019.txt',stringsAsFactors = F)
names(kh.ky) <- c('KHID',"KYID")
kh.ky$KHID <- paste0("KH2013:",kh.ky$KHID)
kh.ky$KYID <- paste0("KY2019:",kh.ky$KYID)

# read genomic features
htky <- getFeatures('HT.Gene.gff3')

# read peak data
peaks <- import('accessomeKY.bed')

# plot peak lengths
dir.hist(width(peaks),'peaklength_total')
# plot only 99% quantile of peak lengths
dir.hist(width(peaks),'peaklength',quant=.99)

# find motifs in each peak
matches <- getMatches(peaks,Crobusta,'scores')

# find which peaks overlap which features
overlaps <- lapply(htky,getOverlaps,peaks)
featpeaks <- sapply(overlaps, function(x) unique(x[,1]))

# use poisson test to find motif enrichment in each feature with whole accessome as background
pois <- lapply(featpeaks,matchPois,matches)

#write test results to folder enrichmentByFeature
dir.apply(pois,'enrichmentByFeature')

# read expression data
rnf <- read.csv('toptags_rnfko_KH_UniqieName.csv',row.names=2)[,-1]

# merge expression data with KHID
rnfky <- merge(rnf,kh.ky,by.x=0,by.y="KHID")
names(rnfky)[1] <- "KHID"

# select significant genes
sig <- rnfky[rnfky$FDR<.05,]

# merge DE genes with peaks by feature
rnfpeaks <- lapply(overlaps,function(x){
	merge(x,sig,by.x="GeneID",by.y="KYID")
})

upreg <- lapply(rnfpeaks,function(x) x[x$logFC>0,])
downreg <- lapply(rnfpeaks,function(x) x[x$logFC<0,])
bg <- lapply(featpeaks,function(x) matches[x,])

# test for motif enrichment in each feature in DE genes using all peaks in a feature as background
uptest <- mapply(matchPois, lapply(upreg,'[',,"PeakID"), bg, SIMPLIFY=F)
dir.apply(uptest,'upregEnrichment')

downtest <- mapply(matchPois, lapply(downreg,'[',,"PeakID"), bg, SIMPLIFY=F)
dir.apply(downtest,'downregEnrichment')

mergeStats <- function(colname, tests){
  sapply(tests,'[',,colname)
}

downmat <- lapply(colnames(downtest[[1]]), mergeStats, downtest)
names(downmat) <- colnames(downtest[[1]])

hmdot(
  downmat$log2OR,
  downmat$padj,
  downmat$testMotifPerKbp,
  'downregEnrichment',
  height=50
)

#limit to enriched motifs (positive OR)
sel <- apply(downmat$log2OR,1, function(x)any(x>0)) & apply(downmat$padj,1, function(x)any(x<.05))
downmat <- lapply(downmat,'[',sel,)

hmdot(
  downmat$log2OR,
  downmat$padj,
  downmat$testMotifPerKbp,
  'downregEnrichmentSig',
  height=15
)

hmdot(
  downmat$log2OR,
  downmat$padj,
  downmat$testMotifPerKbp/downmat$bgMotifPerKbp,
  'downregEnrichmentScaled',
  height=15
)