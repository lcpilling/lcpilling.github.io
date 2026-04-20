# Z-transform a variable

Z-transform a variable. Mean=0, SD=1. Maintains original distribution.

## Usage

``` r
z_trans(x)
```

## Arguments

- x:

  a numeric vector to be z-transformed

## Value

Returns a vector

## Author

Luke Pilling

## Examples

``` r
summary(example_data$sbp)
#>    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#>    80.0   116.0   130.0   132.8   144.0   270.0 
sbp_in = z_trans(example_data$sbp)
summary(sbp_in)
#>    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#> -2.3142 -0.7353 -0.1213  0.0000  0.4927  6.0187 
```
