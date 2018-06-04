library("GEOquery")
a=getGEOSuppFiles("GSE66875",makeDirectory = TRUE, baseDir = getwd())
cmd="tar xf GSE66875/GSE66875_RAW.tar -C GSE66875"
system(cmd, intern = T)
library("limma")
#""" targets.txt (delet #)
#FileName       Condition
#GSM1633676_HippocampeWT1.txt.gz        Hipp1_WT_CT0
#GSM1633677_HippocampeWT2.txt.gz        Hipp2_WT_CT0
#GSM1633678_HippocampeWT3.txt.gz        Hipp3_WT_CT0
#GSM1633679_HippocampeWT5.txt.gz        Hipp5_WT_CT6
#GSM1633680_HippocampeWT6.txt.gz        Hipp6_WT_CT6
#GSM1633681_HippocampeWT7.txt.gz        Hipp7_WT_CT6
#GSM1633682_HippocampeWT10.txt.gz       Hipp10_WT_CT12
#GSM1633683_HippocampeWT11.txt.gz       Hipp11_WT_CT12
#GSM1633684_HippocampeWT12.txt.gz       Hipp12_WT_CT12
#GSM1633685_HippocampeWT14.txt.gz       Hipp14_WT_CT18
#GSM1633686_HippocampeWT15.txt.gz       Hipp15_WT_CT18
#GSM1633687_HippocampeWT16.txt.gz       Hipp16_WT_CT18
#"""

targets <- readTargets("targets.txt")
dat <- read.maimages(files=targets$FileName,path="/BIC/Pipeline/lxf/cir/add/mouse/E-GEOD-66875/GSE66875/",source="agilent", green.only=T)
y <- backgroundCorrect(dat,method="normexp")
y <- normalizeBetweenArrays(y,method="quantile")
write.table(y,file="E-GEOD-66875.txt",sep="\t",quote=FALSE, row.names=F)
