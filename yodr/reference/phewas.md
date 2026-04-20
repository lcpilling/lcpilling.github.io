# PheWAS of exposure(s) on outcome(s) with tidy model output

To easily get tidy model output (from linear or logistic GLM, or CoxPH)
for a categorical or continuous exposure, including sample size (and N
cases if logistic), outcome, and model info. Idea is to make quick
PheWAS trivially easy.

For all exposures, it gets the N. For categorical exposures, the N is
split by group, and a row is included for the reference category

Can provide multiple exposures and/or outcomes

Options to scale or inverse normal transform the exposure and/or
outcome, and to winsorize the exposure and/or outcome (values beyond N
SDs from the mean are set to N).

Options to return model fit statistic (R^2 for linear, pseudo-R^2 for
logistic, C-statistic for CoxPH) and to include the regression formula
in the output.

Options to return estimates for all independent variables in the model
(not just the exposure of interest) and to include interaction terms
with a specified variable.

## Usage

``` r
phewas(
  d,
  x,
  y,
  z = "",
  model = "lm",
  af = FALSE,
  af_base = FALSE,
  note = "",
  get_fit = FALSE,
  extreme_ps = FALSE,
  include_formula = FALSE,
  scale_x = FALSE,
  scale_y = FALSE,
  inv_norm_x = FALSE,
  inv_norm_y = FALSE,
  winsorize_x = FALSE,
  winsorize_y = FALSE,
  winsorize_n = 5,
  return_all_terms = FALSE,
  interacts_with = "",
  parallel = FALSE,
  n_child = floor(parallelly::availableCores()/3),
  progress = TRUE,
  verbose = FALSE,
  ...
)

get_assoc(x, ...)
```

## Arguments

- d:

  A `data.frame` or `tibble`. The data.

- x:

  A string or vector of strings. The exposure variable name(s), found in
  `d`. (character)

- y:

  A string. The outcome variable name, found in `d` – if model is
  'coxph' then paste the survival object here e.g., 'Surv(time, event)'
  where `time` and `event` are variables in `d`. (character)

- z:

  A string. The covariate formula (e.g., " + age + sex"), found in `d`.
  Default is no covariates. `default=""` (character)

- model:

  A string. The type of model to perform. Can be "lm", "logistic" or
  "coxph". `default="lm"` (character)

- af:

  Logical. Is `x` categorical? I.e., include in formula like
  `haven::as_factor(x)`. To use base R
  [`as.factor()`](https://rdrr.io/r/base/factor.html) instead set option
  "af_base" to TRUE `default=FALSE`

- af_base:

  Logical. Use base R
  [`as.factor()`](https://rdrr.io/r/base/factor.html) instead of
  `haven::as_factor(x)`? `default=FALSE`

- note:

  A string. If you want to include a note like "All", "Males", "C282Y
  homozygotes" to describe the model or sample. `default=""` (character)

- get_fit:

  Logical. Default is FALSE. Get model fit? (for each model: lm=R2,
  logistic=McFadden's pseudo-R2, coxph=Harrell's c-statistic).
  `default=FALSE`

- extreme_ps:

  Logical. Default is FALSE. If p==0 then return "extreme p-values" as
  strings. `default=FALSE`

- include_formula:

  Logical. Default is FALSE. Include the regression formula in the
  output? `default=FALSE`

- scale_x:

  Logical. Default is FALSE. Apply scale() function to exposure?
  `default=FALSE`

- scale_y:

  Logical. Default is FALSE. Apply scale() function to outcome?
  `default=FALSE`

- inv_norm_x:

  Logical. Apply inv_norm() function to exposure? `default=FALSE`

- inv_norm_y:

  Logical. Apply inv_norm() function to outcome? `default=FALSE`

- winsorize_x:

  Logical. Apply Winzorization to exposure? `default=FALSE`

- winsorize_y:

  Logical. Apply Winzorization to outcome? `default=FALSE`

- winsorize_n:

  Numeric. Standard deviations from the mean to Winzorize. I.e.,
  participants with values beyond this N will be set to N. `default=5`

- return_all_terms:

  Logical. Return estimates for all independent variables (terms) in the
  model? If TRUE, includes an adddition column 'term' `default=FALSE`

- interacts_with:

  A string. A variable found in `d`. Will add to regression formula like
  `x*i` and catch output `default=""` (character)

- parallel:

  Logical. Run in parallel using parallelly package? If FALSE, will run
  sequentially. Parallel processing can speed up the analysis when you
  have many exposures and/or outcomes, but be aware it uses more RAM and
  can be slower for small numbers of exposures/outcomes due to overhead
  of parallelization. `default=FALSE`

- n_child:

  Numeric. Number of child processes to create for parallel processing.
  Default is a fraction of the total cores available to avoid crashing
  cloud instances due to RAM limits. `default=(total cores available)/3`

- progress:

  Logical. Show progress bar from purrr
  [`map()`](https://purrr.tidyverse.org/reference/map.html) function
  (useful when multiple exposures/outcomes provided). `default=TRUE`

- verbose:

  Logical. Be verbose, `default=FALSE`

- ...:

  Other
  [`tidy_ci()`](https://lcpilling.github.io/yodr/reference/tidy.md)
  options

## Value

Returns a tibble - summary statistics from a model

## Functions

- `get_assoc()`: Alias for phewas

## Author

Luke Pilling

## Examples

``` r
# for one outcome, equivalent to `tidy_ci(glm(sbp ~ bmi +age+sex, d=example_data))` - with added `n`
phewas(x="bmi", y="sbp", z="+age+sex", d=example_data)
#> ℹ yodr v1.1.0
#> → Getting 1 association
#> ✔ Finished. Time taken: 64ms.
#> # A tibble: 1 × 10
#>   outcome exposure estimate std.error statistic  p.value conf.low conf.high
#>   <chr>   <chr>       <dbl>     <dbl>     <dbl>    <dbl>    <dbl>     <dbl>
#> 1 sbp     bmi          1.49    0.0730      20.4 5.42e-89     1.35      1.64
#> # ℹ 2 more variables: n <int>, model <chr>

# categorical exposure, binary outcome, and stratified analysis (with note)
#  - note that data can be passed using the pipe if desired
example_data |> dplyr::filter(sex==1) |>
  phewas(x="bmi_cat", y="event", z="+age", model="logistic", af=TRUE, note="Males only")  |> print(width=500)
#> ℹ yodr v1.1.0
#> → Getting 1 association
#> ✔ Finished. Time taken: 43ms.
#> # A tibble: 3 × 12
#>   outcome exposure           estimate std.error statistic    p.value conf.low
#>   <chr>   <chr>                 <dbl>     <dbl>     <dbl>      <dbl>    <dbl>
#> 1 event   bmi_cat-Normal        NA      NA          NA    NA            NA   
#> 2 event   bmi_cat-Overweight     1.50    0.0986      4.09  0.0000426     1.23
#> 3 event   bmi_cat-Obese          1.93    0.154       4.27  0.0000194     1.43
#>   conf.high     n n_cases model    note      
#>       <dbl> <dbl>   <dbl> <chr>    <chr>     
#> 1     NA      803     268 logistic Males only
#> 2      1.82  1018     443 logistic Males only
#> 3      2.60   226     111 logistic Males only

# multiple exposures and/or outcomes - get pseudo R^2
x_vars = c("bmi","sbp","dbp","scl")
y_vars = c("event","sex")
phewas(x=x_vars, y=y_vars, z="+age", d=example_data, model="logistic", get_fit=TRUE)  |> print(width=500)
#> ℹ yodr v1.1.0
#> → Getting 8 associations
#> ✔ Finished. Time taken: 594ms.
#> # A tibble: 8 × 13
#>   outcome exposure estimate std.error statistic  p.value conf.low conf.high
#>   <chr>   <chr>       <dbl>     <dbl>     <dbl>    <dbl>    <dbl>     <dbl>
#> 1 event   bmi         1.07   0.00791       9.07 1.19e-19    1.06       1.09
#> 2 sex     bmi         1.04   0.00736       5.09 3.54e- 7    1.02       1.05
#> 3 event   sbp         1.01   0.00149       8.86 7.80e-19    1.01       1.02
#> 4 sex     sbp         0.998  0.00141      -1.12 2.61e- 1    0.996      1.00
#> 5 event   dbp         1.03   0.00259       9.73 2.33e-22    1.02       1.03
#> 6 sex     dbp         1.01   0.00240       4.98 6.35e- 7    1.01       1.02
#> 7 event   scl         1.01   0.000749      9.47 2.69e-21    1.01       1.01
#> 8 sex     scl         0.999  0.000692     -1.08 2.82e- 1    0.998      1.00
#>       n n_cases fit_stat fit_stat_se model   
#>   <int>   <int>    <dbl> <lgl>       <chr>   
#> 1  4690    1472 0.0317   NA          logistic
#> 2  4690    2047 0.00454  NA          logistic
#> 3  4699    1473 0.0310   NA          logistic
#> 4  4699    2049 0.000666 NA          logistic
#> 5  4699    1473 0.0338   NA          logistic
#> 6  4699    2049 0.00435  NA          logistic
#> 7  4666    1466 0.0331   NA          logistic
#> 8  4666    2042 0.000649 NA          logistic

# if desired, can also return estimates for other independent variables (terms) in the model
x_vars = c("bmi","sbp","dbp")
phewas(x=x_vars, y="event", z="+age+sex", d=example_data, model="logistic", return_all_terms=TRUE)  |> print(width=500)
#> ℹ yodr v1.1.0
#> → Getting 3 associations
#> ✔ Finished. Time taken: 132ms.
#> # A tibble: 9 × 12
#>   outcome exposure term  estimate std.error statistic  p.value conf.low
#>   <chr>   <chr>    <chr>    <dbl>     <dbl>     <dbl>    <dbl>    <dbl>
#> 1 event   bmi      bmi       1.07   0.00801      8.66 4.74e-18     1.06
#> 2 event   bmi      age       1.04   0.00388      8.95 3.47e-19     1.03
#> 3 event   bmi      sex       2.10   0.0654      11.3  1.02e-29     1.84
#> 4 event   sbp      sbp       1.01   0.00152      9.47 2.86e-21     1.01
#> 5 event   sbp      age       1.03   0.00412      6.15 7.89e-10     1.02
#> 6 event   sbp      sex       2.23   0.0658      12.2  4.15e-34     1.96
#> 7 event   dbp      dbp       1.02   0.00261      9.24 2.43e-20     1.02
#> 8 event   dbp      age       1.03   0.00394      8.07 7.03e-16     1.02
#> 9 event   dbp      sex       2.10   0.0655      11.3  1.01e-29     1.85
#>   conf.high     n n_cases model   
#>       <dbl> <int>   <int> <chr>   
#> 1      1.09  4690    1472 logistic
#> 2      1.04    NA      NA logistic
#> 3      2.38    NA      NA logistic
#> 4      1.02  4699    1473 logistic
#> 5      1.03    NA      NA logistic
#> 6      2.53    NA      NA logistic
#> 7      1.03  4699    1473 logistic
#> 8      1.04    NA      NA logistic
#> 9      2.39    NA      NA logistic
```
