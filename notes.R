dds <- DESeqDataSetFromMatrix(colData = colData,
                              countData = countData,
                              design = ~ resistance + infection)

dds <- DESeq(dds)

RvS <- results(dds, contrast = c("resistance", "R", "S"))
rTvC <- results(dds, contrast = c("infection", "TRT", "CTRL"))

DESeq2::plotMA(RvS)


dds_rlog <- rlog(dds)
DESeq2::plotPCA(object = dds_rlog, intgroup = c("resistance", "infection"))


RvS$symbol <- mapIds(os.db,keys = rownames(RvS), keytype = 
                     )