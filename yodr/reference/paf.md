# Estimate attributable fraction in the exposed (AFE) and population attributable fraction (PAF)

Computes the attributable fraction in the exposed (AFE) and the
population attributable fraction (PAF) with 95% Confidence Intervals
(95% CIs) for a binary exposure (coded 0/1) and either:

- a binary outcome (prevalence / risk) when `y_t` is `NULL`, or

- a time-to-event outcome (incidence) using a Cox proportional hazards
  model when `y_t` is provided.

For the binary-outcome case, risks are estimated as group-wise means and
the relative risk (RR) is `risk_exposed / risk_unexposed`. Wald 95%
confidence intervals are calculated on the log(RR) scale using a
delta-method standard error, then transformed to RR, AFE, and PAF.

For the time-to-event case, a Cox model is fitted and the hazard ratio
(HR) for exposure is used as the effect measure. Wald 95% confidence
intervals are taken from the Cox model, then transformed to AFE and PAF.
Crude incidence rates (per 1,000 person-years) are also returned by
exposure group (assumes time is in years).

## Usage

``` r
paf(d, x, y, y_t = NULL, z = "", verbose = FALSE)
```

## Arguments

- d:

  A data frame containing exposure, outcome, and (optionally) follow-up
  time and covariates.

- x:

  Character string. Column name of the exposure variable (expected 0/1).

- y:

  Character string. Column name of the outcome variable (0/1; event
  indicator for survival).

- y_t:

  Character string. Optional column name of follow-up time for
  time-to-event analyses. Ideally this is in years, as crude incidence
  rates (per 1,000 person-years) are also returned. If not provided then
  treats `y` as a binary outcome and estimates RR-based AFE/PAF.
  `default=NULL` (character)

- z:

  A string. The covariate formula (e.g., "+age+sex") for variables found
  in `d`. Only used for time-to-event. If not provided then the survival
  model runs without adjustment. `default=""` (character)

- verbose:

  Logical. Be verbose, `default=FALSE`

## Value

A data frame containing AFE and PAF (as proportions and percentages)
with 95% CIs and p-values, plus supporting statistics (RR/HR, group
risks or rates, counts, and exposure prevalence).

## Details

**Coding assumptions:**

1.  `x` should be coded 0/1 (unexposed/exposed).

2.  For the binary-outcome case, `y` should be 0/1.

3.  For the time-to-event case, `y` is the event indicator (0/1) and
    `y_t` is follow-up time (in years if you want rates per 1,000
    person-years).

Model note (time-to-event): the Cox model is not adjusted by default.
User can provide covariae string.

## Author

Luke Pilling

## Examples

``` r
# Binary exposure
example_data$hypertension <- dplyr::if_else(example_data$sbp>=140, 1, 0)

# Binary outcome (prevalence / risk)
result_1 <- paf(
  d = example_data,
  x = "hypertension",
  y = "event"
)
cat(sprintf("PAF: %.2f%% (95%% CI: %.2f%% to %.2f%%)\n",
            result_1$paf_percent,
            result_1$paf_ci_lower_percent,
            result_1$paf_ci_upper_percent))
#> PAF: 13.75% (95% CI: 10.84% to 16.71%)

# Time-to-event outcome (incidence)
result_2 <- paf(
  d = example_data,
  x = "hypertension",
  y = "event",
  y_t = "time",
  z = "age+sex"
)
cat(sprintf("PAF: %.2f%% (95%% CI: %.2f%% to %.2f%%)\n",
            result_2$paf_percent,
            result_2$paf_ci_lower_percent,
            result_2$paf_ci_upper_percent))
#> PAF: 17.43% (95% CI: 13.56% to 21.36%)
```
