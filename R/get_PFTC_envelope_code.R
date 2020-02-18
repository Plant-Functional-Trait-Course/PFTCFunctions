#' @title creates unique envelope codes
#' @description Function to create unique hashcodes
#' @param seed integer seed value
#' @details Peru - PFTC3 and Peru - Puna: seed = 1; Svalbard - PFTC4: seed = 32; Peru - PFTC5 seed = 6
#' @return tibble with IDs
#' @examples
#' get_PFTC_envelope_codes(seed = 1)
#' @importFrom dplyr mutate select %>% row_number
#' @importFrom tidyr crossing
#' @importFrom rlang .data
#' @export

get_PFTC_envelope_codes <- function(seed){
  suppressWarnings(set.seed(seed = seed, sample.kind = "Rounding"))
  all_codes <- crossing(A = LETTERS, B = LETTERS, C = LETTERS) %>%
    mutate(code = paste0(.data$A, .data$B, .data$C),
           hash = row_number() %% 10000L,
           hash = sample(.data$hash),
           hash = formatC(.data$hash, width = 4, format = "d", flag = "0"),
           hashcode = paste0(.data$code, .data$hash)) %>%
    select(.data$hashcode)
  return(all_codes)
}

