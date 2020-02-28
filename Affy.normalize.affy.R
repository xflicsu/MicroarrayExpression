library("GEOquery")
a=getGEOSuppFiles("GSE27366",makeDirectory = TRUE, baseDir = getwd())
cmd="tar xf GSE27366/GSE27366_RAW.tar -C GSE27366"
system(cmd, intern = T)
library(affy)
data <- ReadAffy(celfile.path="GSE27366") 

#eset <- rma(data)

eset <- expresso(data,bgcorrect.method="rma",
normalize.method="quantiles",
pmcorrect.method="pmonly",
summary.method="medianpolish")

write.exprs(eset,file="E-GEOD-27366.txt")
