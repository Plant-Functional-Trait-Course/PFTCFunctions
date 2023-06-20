#' get seed from prompt
#'
#' @param seed integer Default value for seed
#' @returns Integer to use as seed
#' @importFrom glue glue
#' @export


get_seed <- function(seed) {
  finished <- FALSE
  while (!finished) {
    new_seed <- readline(glue("seed is {seed}\n Type integer to change or leave blank to accept"))
    if (new_seed == "") {
      finished <- TRUE
    } else if (!grepl("^\\d+$", new_seed)) {
      finished <- FALSE
      cat(glue("seed must be an integer, not '{new_seed}\n'"))
    } else {
      cat("\n")
      seed <- as.integer(new_seed)
      finished <- FALSE
    }
  }
  seed
}
