#' @title download PFTC data
#' @description Function to download PFTC data
#' @param country name of country
#' @param datatype name of datatype
#' @param path path for downloaded files
#' @importFrom dplyr filter select %>%
#' @importFrom purrr pwalk
#' @importFrom dataDownloader get_file
#' @importFrom utils data
#' @export


download_PFTC_data <- function(country, datatype, path = ".") {
  # warning if country is missing
  if (missing(country)) {
    stop("Country needed")
  }

  # load PFTC_data_location file
  data("PFTC_data_location", package = "PFTCFunctions", envir = environment())

  # select data
  PFTC_data_location <- PFTC_data_location %>%
    filter(.data$Country %in% {{ country }})

  if (missing(datatype)) {
    PFTC_data_location <- PFTC_data_location %>%
      filter(.data$DataType %in% c("community", "trait"))
  } else {
    PFTC_data_location <- PFTC_data_location %>%
      filter(.data$DataType == {{ datatype }})
  }

  PFTC_data_location <- PFTC_data_location %>%
    select(-.data$Country, -.data$DataType, -.data$Remark)

  print(PFTC_data_location)
  # download data
  pwalk(PFTC_data_location, function(remote_path, ...) {
    if (is.na(remote_path) | remote_path == "") {
      remote_path <- NULL
    }

    get_file(remote_path, ...)
  }, path = path)
}
