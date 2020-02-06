#' @title creates unique envelope codes
#' @description Function to create unique hashcodes (Peru: seed = 1; Svalbard: seed = 32; Chile seed = 6)
#' @param seed integer seed value
#' @return tibble with IDs
#' @examples
#' get_PFTC_envelope_codes(seed = 1)
#' @importFrom dplyr mutate select %>% row_number
#' @importFrom tidyr crossing
#' @export

get_PFTC_envelope_codes <- function(seed){
  if(getRversion() < "3.6.0") { # default seed mechanism changed in R 3.6.0. We want to use old method for consistency
    set.seed(seed = seed)
  } else {  
    suppressWarnings(set.seed(seed = seed, sample.kind = "Rounding"))
  }
  all_codes <- crossing(A = LETTERS, B = LETTERS, C = LETTERS) %>%
    mutate(code = paste0(A, B, C),
           hash = row_number() %% 10000L,
           hash = sample(hash),
           hash = formatC(hash, width = 4, format = "d", flag = "0"),
           hashcode = paste0(code, hash)) %>%
    select(hashcode)
  return(all_codes)
}

