# Package index

## PheWAS

Get associations between a number of exposures and outcomes.

- [`phewas()`](https://lcpilling.github.io/yodr/reference/phewas.md)
  [`get_assoc()`](https://lcpilling.github.io/yodr/reference/phewas.md)
  : PheWAS of exposure(s) on outcome(s) with tidy model output

## Get summary statistics

‘Tidy’ model output with confidence intervals and other useful
information.

- [`tidy()`](https://lcpilling.github.io/yodr/reference/tidy.md)
  [`tidy_ci()`](https://lcpilling.github.io/yodr/reference/tidy.md) :
  Get tidy model output with fast CIs

## Attributable fraction

Estimate attributable fraction in the exposed (AFE) and population
attributable fraction (PAF) with 95% CIs.

- [`paf()`](https://lcpilling.github.io/yodr/reference/paf.md) :
  Estimate attributable fraction in the exposed (AFE) and population
  attributable fraction (PAF)

## Working with test statistics

Derived p-value, standard error (etc.) from other test statistics.

- [`get_p()`](https://lcpilling.github.io/yodr/reference/get_p.md) : Get
  p-value from Z-statistic
- [`get_p_extreme()`](https://lcpilling.github.io/yodr/reference/get_p_extreme.md)
  : Get extreme p-value
- [`get_p_neglog10()`](https://lcpilling.github.io/yodr/reference/get_p_neglog10.md)
  : Get -log10 p-value (using Z only)
- [`get_p_neglog10_n()`](https://lcpilling.github.io/yodr/reference/get_p_neglog10_n.md)
  : Get -log10 p-value (using Z & N)
- [`get_se()`](https://lcpilling.github.io/yodr/reference/get_se.md) :
  Get Standard Error from Confidence Intervals
- [`get_z()`](https://lcpilling.github.io/yodr/reference/get_z.md) : Get
  Z-statistic from p-value

## Transform data

Manipulate variables.

- [`carrec()`](https://lcpilling.github.io/yodr/reference/carrec.md) :
  Recode a Variable
- [`inv_norm()`](https://lcpilling.github.io/yodr/reference/inv_norm.md)
  : Inverse normalize a variable
- [`z_trans()`](https://lcpilling.github.io/yodr/reference/z_trans.md) :
  Z-transform a variable

## Genetic epidemiology

Tools for genetics

- [`estimate_ld()`](https://lcpilling.github.io/yodr/reference/estimate_ld.md)
  : Estimate haplotype frequencies and LD statistics from two biallelic
  variants

## Plotting related

For working with plots.

- [`annotate_textp()`](https://lcpilling.github.io/yodr/reference/annotate_textp.md)
  : Annotate a ggplot2 plot with text
- [`theme_minimal_modified()`](https://lcpilling.github.io/yodr/reference/theme_minimal_modified.md)
  : Modified theme_minimal for ggplots

## Example data

Small dataset used in examples.

- [`example_data`](https://lcpilling.github.io/yodr/reference/example_data.md)
  : The Framingham Heart Study
