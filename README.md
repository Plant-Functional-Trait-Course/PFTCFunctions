
<!-- README.md is generated from README.Rmd. Please edit that file -->
PFTCFunctions
=============

<!-- badges: start -->
<!-- badges: end -->
The goal of PFTCFunctions is to create unique hashcodes for each individual leaf (envelope) from the Plant FUnctional Trait Course. Peru: seed = 1 Svalbard: seed = 32 Chile seed = 6

Installation
------------

You can install PFTCFunctions from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("audhalbritter/PFTCFunctions")
```

Example
-------

This is a basic example which shows you how to solve a common problem:

``` r
library(PFTCFunctions)
#> Registered S3 method overwritten by 'R.oo':
#>   method        from       
#>   throw.default R.methodsS3
## create list with all envelope codes. And show the first five values
all_codes <- get_PFTC_envelope_codes(seed = 1)
all_codes$hashcode[1:5]
#> [1] "AAA4667" "AAB6541" "AAC0068" "AAD5960" "AAE3544"
```
