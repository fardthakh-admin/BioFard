library(BioFard)

celldata <- BioFard::getCellData('D:/Projects/Bioinformatics/Fardthakh/BioinfoFardthakh/testdata/HD_counts_star_trimmed.csv')
metadata <- BioFard::getMetaFile('D:/Projects/Bioinformatics/Fardthakh/BioinfoFardthakh/testdata/meta.csv')

BioFardObj <- BioFard::prepareBioFardObject(celldata,metadata)
dds <- BioFard::run(BioFardObj)

dds <- DESeqDataSetFromMatrix(countData=BioFardObj$cells, colData=BioFardObj$meta, as.formula(paste("~",colnames(BioFardObj$meta[1]))))
