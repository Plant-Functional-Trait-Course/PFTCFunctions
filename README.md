
<!-- README.md is generated from README.Rmd. Please edit that file -->
PFTCFunctions
=============

<!-- badges: start -->
<!-- badges: end -->
The goal of PFTCFunctions is to create unique hashcodes for each individual leaf (envelope) from the Plant Functional Trait Course.

| Country  |  seed| Campaign |
|:---------|-----:|:---------|
| Peru     |     1| PFTC3    |
| Peru     |     1| Puna     |
| Svalbard |    32| PFTC4    |
| Peru     |     6| PFTC5    |

Installation
------------

You can install PFTCFunctions from [GitHub](https://github.com/) with:

``` r
# install.packages("remotes")
remotes::install_github("audhalbritter/PFTCFunctions")
```

Example
-------

This is a basic example which shows you how to solve a common problem:

``` r
library(PFTCFunctions)
## create list with all envelope codes. And show the first five values
all_codes <- get_PFTC_envelope_codes(seed = 1)
all_codes$hashcode[1:5]
#> [1] "AAA4667" "AAB6541" "AAC0068" "AAD5960" "AAE3544"
```
