library("tidyverse")
library("dataDownloader")


download_PFTC_data <- function(country, datatype, path, downloadAll = FALSE){

  # load location file
  location <- read_csv(file = "data/LocationOfPFTCData.csv")

  # select data
  location <- location %>%
    filter(Country == country, DataType == datatype)

  # download data
  get_file(node = location$node,
           remote_path = location$remote_path,
           file = location$file,
           path = path)

}

download_PFTC_data(country = "Peru", datatype = "community", path = "output")
