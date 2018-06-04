library(lumi)
# download GSE25323_Nov2009_non-normalized.txt.gz from GEO
fileName <- "GSE25323_Nov2009_non-normalized.txt.gz"
x.lumi <- lumiR.batch(fileName)
pData(phenoData(x.lumi))
lumi.N.Q <- lumiExpresso(x.lumi)
dataMatrix <- exprs(lumi.N.Q)
write.table(dataMatrix,file="E-GEOD-25323.txt")
