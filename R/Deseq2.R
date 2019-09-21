

#' Title
#'
#' @param FilteredBioFard
#'
#' @return runs the analysis
#' @export
#' @importFrom DESeq2 DESeqDataSetFromMatrix
#' @importFrom DESeq2 DESeq
#' @examples
run = function(FilteredBioFard) {
    ##Prepare a Deseq Matrix, the condition is the default design (Required).
    dds <- DESeqDataSetFromMatrix(countData=FilteredBioFard$cells, colData=FilteredBioFard$meta, as.formula(paste("~",colnames(FilteredBioFard$meta[1]))))
    #filter empty rows
    dds <- dds[rowSums(counts(dds)) > 1, ]
    # Run DESeq
    dds <- DESeq(dds)
    return (dds)
}
