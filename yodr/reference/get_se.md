# Get Standard Error from Confidence Intervals

Return SE from CIs

## Usage

``` r
get_se(lci, uci, log = FALSE, denominator = 3.919928)
```

## Arguments

- lci:

  The lower confidence interval

- uci:

  The lower confidence interval

- log:

  Log the CI values? (default=FALSE)

- denominator:

  The standard error of the sample mean (default=3.92... well actually,
  3.919928 from `2*get_z(0.05)`)

## Value

Returns SE (numeric)

## Author

The internet (anon)

## Examples

``` r
lci = 0.1
uci = 0.3
get_se(lci, uci)
#> [1] 0.05102135
```
