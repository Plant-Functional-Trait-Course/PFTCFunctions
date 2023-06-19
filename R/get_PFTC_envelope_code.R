#' @title creates unique envelope codes
#' @description Function to create unique hashcodes
#' @param seed integer seed value
#' @param as.3.5 logical using 3.5 version or not
#' @details Peru - PFTC3 and Peru - Puna: seed = 1; Svalbard - PFTC4: seed = 32; Peru - PFTC5 seed = 6, PFTC6 = 49 + as.3.5 = FALSE. Codes are not guaranteed to be unique between the different seeds, unless you use the \code{unique_PFTC_envelope_codes}
#' @return tibble with IDs
#' @examples
#' get_PFTC_envelope_codes(seed = 1)
#' @importFrom dplyr mutate select %>% row_number
#' @importFrom tidyr crossing
#' @importFrom rlang .data
#' @export

get_PFTC_envelope_codes <- function(seed, as.3.5 = TRUE) {
  if (getRversion() < "3.6.0") { # default seed mechanism changed in R 3.6.0. We want to use old method for consistency
    set.seed(seed = seed)
  } else if (isFALSE(as.3.5)) { #
    suppressWarnings(set.seed(seed = seed, sample.kind = "Rejection"))
  } else {
    suppressWarnings(set.seed(seed = seed, sample.kind = "Rounding"))
  }
  all_codes <- crossing(A = LETTERS, B = LETTERS, C = LETTERS) %>%
    mutate(
      code = paste0(.data$A, .data$B, .data$C),
      hash = row_number() %% 10000L,
      hash = sample(.data$hash),
      hash = formatC(.data$hash, width = 4, format = "d", flag = "0"),
      hashcode = paste0(.data$code, .data$hash)
    ) %>%
    select(.data$hashcode)
  return(all_codes)
}





#' @title unique envelope codes across seeds
#' @description Function checking that envelope codes (hashcodes) are unique across seeds.
#' It selects away non unique codes.
#' @param newseed integer newseed value
#' @param oldseeds integer oldseeds value
#' @return tibble with unique IDs
#' @examples
#' unique_PFTC_envelope_codes(newseed = 1, oldseeds = 32)
#' @importFrom dplyr anti_join %>%
#' @importFrom purrr map_df
#' @export


unique_PFTC_envelope_codes <- function(newseed, oldseeds) {
  oldhash <- map_df(oldseeds, get_PFTC_envelope_codes)
  uniqueIDs <- get_PFTC_envelope_codes(newseed) %>%
    anti_join(oldhash, by = "hashcode")

  return(uniqueIDs)
}
