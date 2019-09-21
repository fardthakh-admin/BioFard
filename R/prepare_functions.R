
#' Create BioFard Object, filter count data and checks meta data
#'
#' @param cell_object Cell Object File
#' @param meta_object Meta Object File
#'
#' @return a BioFard Data Object
#' @export
#'
prepareBioFardObject = function(cell_object, meta_object) {
    columnIndex <- getCountIndex(cell_object)
    cellNames_CountObject <- colnames(cell_object)[columnIndex:length(colnames(cell_object))]
    cellNames_metaObject <- rownames(meta_object)
    #check if the meta object and count object are valid
    ##TODO: Sort both columns before running
    if (identical(cellNames_metaObject,cellNames_CountObject) == FALSE) {
        stop("Cell data names doesn't match meta data, check you cell counts and meta provided")
    }
    ##check if condition columns exists
    ##TODO: search for condition or let the user pass the column name or number
    if (colnames(meta_object[1]) != "condition") {
        stop("The first column of meta object must correspond to the condition of samples. Ex: (Case, Control)")
    }
    #Keep only gene counts
    allcells <- as.matrix(cell_object)
    rownames(allcells) <- cell_object[,columnIndex-1]
    allcells <- cell_object[columnIndex:length(colnames(cell_object))]
    #Convert All gene counts to numeric instead of strings(character)
    allcells <- apply(allcells,2,as.numeric)
    # Create an S3 class object containing both data objects.
    combinedFiles <- list(cells=allcells, meta=meta_object)
    class(combinedFiles) <- "BioFard"
    return (combinedFiles)
}
#' get the start index of a count file, tested on featureCounts only
#'
#' @param cell_data
#'
#' @return The index of start column.
#'
#'
getCountIndex = function(cell_data) {
   prohibited <- c("Chr","Start","End","Strand","Length","gene_name")
   columns <- colnames(cell_data)
   columnsCount <- length(columns)
   index <- 1
   for (i in 1:columnsCount+1) {
       if (columns[i] %in% prohibited){
           index <- index + 1
           next()
       } else {
           return (index+1)
       }
   }
}
