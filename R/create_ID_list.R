# Create list with all valid IDs per country
creat_ID_list <- function(envelope_codes){
  all_codes <- get_envelope_codes(seed = 1) %>%
    mutate(Site = "Peru") %>%
    bind_rows(get_envelope_codes(seed = 32) %>%
                mutate(Site = "Svalbard"))
  return(all_codes)
}
