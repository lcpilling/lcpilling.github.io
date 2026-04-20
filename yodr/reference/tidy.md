# Get tidy model output with fast CIs

By default the (amazing) `broom` package uses the
[`confint()`](https://rdrr.io/r/stats/confint.html) function to
calculate CIs. For GLMs this calculates confidence intervals via profile
likelihood by default. When using large datasets this takes a long time
and does not meaningfully alter the CIs compared to simply calculating
using 1.96*SE. This function `tidy()` runs
[`broom::tidy()`](https://generics.r-lib.org/reference/tidy.html) and
returns the tidy estimates with CIs calculated as EST +/- 1.96*SE.
(Well, actually 1.959964)

The function also does a few other nice/useful things to the output:
hides the intercept by default, automatically detects logistic/CoxPH/CRR
models and exponentiates the estimates, and if p=0 returns the extreme p
as a string. Other optional outputs include -log10 p-values.

Not tested for models other than
[`glm()`](https://rdrr.io/r/stats/glm.html) and
[`survival::coxph()`](https://rdrr.io/pkg/survival/man/coxph.html) where
it seems to work very well and produces consistent CIs. Also works well
for [`cmprsk::crr()`](https://rdrr.io/pkg/cmprsk/man/crr.html).

For linear mixed-effects models `lmer()` from package lme4 this can
display the fixed-effects with p-values and Wald CIs.

## Usage

``` r
tidy(
  x,
  ci = TRUE,
  ci_denominator = 1.959964,
  exp = FALSE,
  intercept = FALSE,
  tidy_factors = TRUE,
  extreme_ps = TRUE,
  neglog10p = FALSE,
  check_model = TRUE,
  n = NA,
  get_r2 = TRUE,
  conf.int = FALSE,
  quiet = FALSE,
  ...
)

tidy_ci(x, ...)
```

## Arguments

- x:

  object containing model output to be tidied e.g., from a
  [`glm()`](https://rdrr.io/r/stats/glm.html) or
  [`survival::coxph()`](https://rdrr.io/pkg/survival/man/coxph.html).

- ci:

  Logical. Default is TRUE. Calculate CIs using 1.96\*SE method - where
  1.96 can be modified using `ci_denominator`.

- ci_denominator:

  Numeric. Default is 1.96 (actually 1.959964). The standard error of
  the sample mean.

- exp:

  Logical. Default is FALSE. Exponentiate estimate and CIs – also see
  `check_model`.

- intercept:

  Logical. Default is FALSE. Exclude intercept for tidier output.

- tidy_factors:

  Logical. Default is TRUE. Tidy `as.factor(x_var)#` terms to `x_var-#`.

- extreme_ps:

  Logical. Default is TRUE. If p=0 then return "extreme p-values" as
  strings.

- neglog10p:

  Logical. Default is FALSE. Provides negative log10 p-values (if input
  is class `glm` or `coxph` or `crr` – user can provide sample size
  `n=#` to override).

- check_model:

  Logical. Default is TRUE. Set `exp=TRUE` if `glm(family=binomial)` or
  [`survival::coxph()`](https://rdrr.io/pkg/survival/man/coxph.html) or
  [`cmprsk::crr()`](https://rdrr.io/pkg/cmprsk/man/crr.html) was
  performed.

- n:

  Numeric. Default is NA. The N for `neglog10p` is extracted
  automatically for `glm` or `coxph` objects - override here if
  required.

- get_r2:

  Logical. Default is TRUE. get R^2 value if model is linear, or
  C-statistic if model is CoxPH

- quiet:

  Logical. Default is FALSE. Suppress text output

- ...:

  Other `tidy()` options

## Value

Returns a tibble - summary statistics from a model

## Functions

- `tidy_ci()`: Alias for tidy

## Author

Luke Pilling

## Examples

``` r
fit_linear = glm(sbp ~ age + sex + as.factor(bmi_cat), data = example_data)
tidy(fit_linear)
#> Linear model (estimate=coefficient) :: N=4690 :: R2=0.21
#> # A tibble: 4 × 7
#>   term      estimate std.error statistic   p.value conf.low conf.high
#>   <chr>        <dbl>     <dbl>     <dbl>     <dbl>    <dbl>     <dbl>
#> 1 age          0.951    0.0353     26.9  1.45e-148    0.882     1.02 
#> 2 sex         -1.48     0.606      -2.44 1.48e-  2   -2.67     -0.291
#> 3 bmi_cat-1    7.40     0.652      11.4  1.70e- 29    6.13      8.68 
#> 4 bmi_cat-2   16.3      0.940      17.3  2.78e- 65   14.4      18.1  

fit_logistic = glm(event ~ age + sex + bmi, data = example_data, family = binomial)
tidy(fit_logistic)   # detect model and exponentiate automatically
#> Binomial model (estimate=Odds Ratio) :: N=4690, Ncases=1472
#> # A tibble: 3 × 7
#>   term  estimate std.error statistic  p.value conf.low conf.high
#>   <chr>    <dbl>     <dbl>     <dbl>    <dbl>    <dbl>     <dbl>
#> 1 age       1.04   0.00388      8.95 3.47e-19     1.03      1.04
#> 2 sex       2.10   0.0654      11.3  1.02e-29     1.84      2.38
#> 3 bmi       1.07   0.00801      8.66 4.74e-18     1.06      1.09
```
