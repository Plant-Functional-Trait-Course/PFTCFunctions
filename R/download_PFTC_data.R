#' @title download PFTC data
#' @description Function to download PFTC data
#' @param country name of country
#' @param datatype name of datatype
#' @param path path for downloaded files
#' @importFrom readr read_csv
#' @importFrom dplyr filter select %>%
#' @importFrom purrr pwalk
#' @importFrom dataDownloader get_file
#' @export


download_PFTC_data <- function(country, datatype, path){

  # warning if country is missing
  if(missing(country)) {stop("Country needed")}

  # load location file
  location <- read_csv(file = "data-raw/LocationOfPFTCData.csv")

  # select data
  location <- location %>%
    filter(Country %in% {{country}})

  if(missing(datatype)){
    location <- location %>%
      filter(DataType %in% c("community", "trait"))

  } else {
    location <- location %>%
      filter(DataType == {{datatype}})
  }

  location <- location %>%
    select(-Country, -DataType, -Remark)

  print(location)
  # download data
  #pwalk(.l = location, .f = get_file, path = path)
  pwalk(location, function(remote_path, ...){

    if(is.na(remote_path) | remote_path == "") {

      remote_path <- NULL

    }

    get_file(remote_path, ...)

  }, path = path)
}

