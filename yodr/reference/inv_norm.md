# Inverse normalize a variable

Inverse normalize a variable (force a normal distribution)

## Usage

``` r
inv_norm(x)
```

## Arguments

- x:

  a numeric vector to be inverse normalized

## Value

Returns a vector

## Author

Luke Pilling

## Examples

``` r
summary(example_data$sbp)
#>    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#>    80.0   116.0   130.0   132.8   144.0   270.0 
sbp_in = inv_norm(example_data$sbp)
summary(sbp_in)
#>      Min.   1st Qu.    Median      Mean   3rd Qu.      Max. 
#> -3.414738 -0.700332  0.058712  0.000381  0.664977  3.703302 
```
