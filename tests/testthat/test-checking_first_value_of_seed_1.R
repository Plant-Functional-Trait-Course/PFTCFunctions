context("testing with seed = 1")
library("dplyr")

test_that("multiplication works", {
  expect_equal(get_PFTC_envelope_codes(seed = 1) %>% slice(1) %>% pull(hashcode),
               "AAA4667")
})
