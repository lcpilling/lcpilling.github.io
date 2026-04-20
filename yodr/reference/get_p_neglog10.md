# Get -log10 p-value (using Z only)

Get -log10 p-value from a provided z statistic (or p-value)

## Usage

``` r
get_p_neglog10(z, is_p = FALSE)
```

## Arguments

- z:

  Numeric. A z statistic or p-value.

- is_p:

  Logical. Default=FALSE. Is this a p-value?

## Value

Returns a -log 10 p-value

## Author

The internet (anon)

## Examples

``` r
z = 50
get_p_neglog10(z)
#> [1] 544.6653
```
