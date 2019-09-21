#' Cell Data
#'
#' @param count_file Path to the csv file that contains the count files
#' @param separator The separtor used in the csv file
#'
#' @return A data frame with all the cell counts
#' @description Creates a data frame of all the cell data required
#' @export
#'
#'
getCellData = function (count_file, separator = ",") {
    celldata <- read.csv(file = count_file,sep = separator, header = TRUE, row.names = 1)
    return (celldata)
    }
