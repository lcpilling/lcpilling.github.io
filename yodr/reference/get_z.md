# Get Z-statistic from p-value

Return a z-statistic from a given p-value

## Usage

``` r
get_z(p, two_sided = TRUE)
```

## Arguments

- p:

  a p-value

- two_sided:

  Logical, default=TRUE. Return two-sided z-value?

## Value

Returns a Z-statistic (numeric)

## Author

The internet (anon)

## Examples

``` r
p = 1e-10
get_z(p)
#> [1] 6.466951
```
