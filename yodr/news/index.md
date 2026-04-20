# Changelog

## yodr 1.1.0 (17th March 2026)

#### New features

- `phewas` can now utilise more cores by running with `parallel=TRUE`
- {parallelly} package added to dependencies
- New function `estimate_ld` to estimate haplotype frequencies and LD
  statistics between two biallelic variants
- New function `paf` to estimate attributable fraction in the exposed
  (AFE) and population attributable fraction (PAF) with 95% CIs for a
  binary exposure (coded 0/1)
  - Can be a simple binary outcome (prevalence / risk) or a
    time-to-event outcome (incidence) and uses a Cox proportional
    hazards model

## yodr 1.0.0 (22nd Feb 2026)

#### Changes

- Package renamed to something 55% shorter but 100% better. Follows the
  general \*nix rule that if a command is \>4 characters it’s not worth
  typing. Also, yoda.
- Renamed `tidy_ci` to `tidy` and `get_assoc` to `est` in the same
  spirit (couldn’t work out how to make these Star Wars themed whilst
  also being max 4 characters)
- Together, this means where before I kept having to type
  `lukesRlib::tidy_ci(fit)` now I can type `yodr::tidy(fit)` and be
  happer
- Original package lcpilling/lukesRlib still there and unchanged so all
  my old scripts still work
