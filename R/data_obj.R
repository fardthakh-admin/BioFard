#' Data Obj
#'
#' @param count_file Path to the csv file that contains the meta data
#' @param separator The separtor used in the csv file
#'
#' @return A meta data as Data frame object to be included in the main function
#' @export
#'
#'
getMetaFile = function (count_file, separator = ",") {
    dataobj <- read.csv(file = count_file,sep = separator, header = TRUE, row.names = 1)
    return (dataobj)
    }
