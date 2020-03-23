#' Location file
#'
#' A dataset containing the data type and location of the data sets
#'
#' @format A data frame with 32 rows and 6 variables:
#' \describe{
#'   \item{Country}{country name}
#'   \item{DataType}{data type name}
#'   \item{node}{node name}
#'   \item{file}{file name}
#'   \item{remote_path}{remot path name}
#'   \item{Remark}{remark name}
#' }
"location"

#' @examples
#' require("dplyr")
#' data("location")
#' location %>% select(Country, DataType) %>% View()
