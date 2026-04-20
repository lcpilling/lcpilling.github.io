# Get -log10 p-value (using Z & N)

Get -log10 p-value from a provided z statistic (or p-value) and n

## Usage

``` r
get_p_neglog10_n(z, n, is_p = FALSE)
```

## Arguments

- z:

  a z (or t) statistic

- n:

  the sample size used to estimate the z (or t) statistic

- is_p:

  Logical. Default=FALSE. Is this a p-value?

## Value

Returns a -log 10 p-value

## Author

The internet (anon)

## Examples

``` r
z = 50
n = 100000
get_p_neglog10_n(z, n)
#> [1] 537.9851
```
