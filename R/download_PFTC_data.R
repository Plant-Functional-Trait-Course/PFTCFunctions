#' @title download PFTC data
#' @description Function to download PFTC data
#' @param country name of country
#' @param datatype name of datatype
#' @param path path for downloaded files
#' @importFrom dplyr filter select %>%
#' @importFrom purrr pwalk
#' @importFrom dataDownloader get_file
#' @export


download_PFTC_data <- function(country, datatype, path){

  # warning if country is missing
  if(missing(country)) {stop("Country needed")}

  # load location file
  location <- get(load(file = "data/location.rda"))

  # select data
  location <- location %>%
    filter(.data$Country %in% {{country}})

  if(missing(datatype)){
    location <- location %>%
      filter(.data$DataType %in% c("community", "trait"))

  } else {
    location <- location %>%
      filter(.data$DataType == {{datatype}})
  }

  location <- location %>%
    select(-.data$Country, -.data$DataType, -.data$Remark)

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

