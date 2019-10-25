#' @title creates unique envelope codes
#' @description Function to create unique hashcodes (Peru: seed = 1; Svalbard: seed = 32; Chile seed = 6)
#' @param seed
#' @return
#' @examples
#' @importFrom dplyr mutate select %>%
#' @importFrom tidyr crossing
#' @importFrom R.utils withSeed
#' @export

get_PFTC_envelope_codes <- function(seed){
  all_codes <- crossing(A = LETTERS, B = LETTERS, C = LETTERS) %>%
    mutate(code = paste0(A, B, C),
           hash = (1L:n()) %% 10000L,
           hash = suppressWarnings(withSeed(sample(hash), seed, sample.kind = "Rounding")),
           hash = formatC(hash, width = 4, format = "d", flag = "0"),
           hashcode = paste0(code, hash)) %>%
    select(hashcode)
  return(all_codes)
}

