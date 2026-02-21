# Get UK Biobank participant Date First (DF) diagnosis

For each participant identify the date of first diagnosis from all
available electronic medical records & self-reported data.

If \`use_baseline_dates=TRUE\` (the default) then will also produce a
binary 0/1 variable, indicating the controls (people without a
diagnosis) and setting the date first \`\_df\` field to the date of
censoring (see options - default is HES England or date of death if
died).

## Usage

``` r
get_df(
  diagnosis_list,
  prefix = NULL,
  group_by = NULL,
  include_selfrep_illness = TRUE,
  include_death_cause = TRUE,
  include_gp_clinical = TRUE,
  include_hesin_diag = TRUE,
  include_hesin_oper = TRUE,
  include_cancer_registry = TRUE,
  use_baseline_dates = TRUE,
  use_death_dates = TRUE,
  file_paths = NULL,
  censoring_date = "31-03-2023",
  verbose = FALSE
)
```

## Arguments

- diagnosis_list:

  A list of data frames. The output of \`get_diagnoses()\` i.e., the raw
  diagnosis and self-reported illness data that matched the provided
  codes list.

- prefix:

  String. Prefix to add to variable names (e.g., if prefix="chd" the
  output variables would be "chd_gp_df", "chd_hes_df", "chd_df" etc.)
  `default=NULL`

- group_by:

  String. If the codes list provided to \`get_diagnoses()\` (i.e., in
  diagnosis_list\$codes_df) contained a grouping/condition variable,
  indicate the variable name here. "Date first" variables will be
  created for each prefix in the grouping variable. The \`prefix\`
  option is ignored, in favour of the names in the grouping variable.
  `default=NULL`

- include_selfrep_illness:

  logical. Include self-reported diagnosesin the combined Date First
  output? If present in \`diagnosis_list\` will still provide a separate
  \`\_df\` variable `default=TRUE`

- include_death_cause:

  logical. Include the cause of death in the combined Date First output?
  If present in \`diagnosis_list\` will still provide a separate
  \`\_df\` variable `default=TRUE`

- include_gp_clinical:

  logical. Include the GP data in the combined Date First output? If
  present in \`diagnosis_list\` will still provide a separate \`\_df\`
  variable `default=TRUE`

- include_hesin_diag:

  logical. Include the HES diagnosis data in the combined Date First
  output? If present in \`diagnosis_list\` will still provide a separate
  \`\_df\` variable `default=TRUE`

- include_hesin_oper:

  logical. Include the HES OPCS (operations) data in the combined Date
  First output? If present in \`diagnosis_list\` will still provide a
  separate \`\_df\` variable `default=TRUE`

- include_cancer_registry:

  logical. Include the cancer registry data in the combined Date First
  output? If present in \`diagnosis_list\` will still provide a separate
  \`\_df\` variable `default=TRUE`

- use_baseline_dates:

  logical. If \`baseline_dates\` available in file paths, produce a
  binary 0/1 variable, indicating the controls (people without a
  diagnosis) and setting the date first \`\_df\` field to the date of
  censoring (currently see \`censoring_date\` option). `default=TRUE`

- use_death_dates:

  logical. If \`death\` data available then use date of death for the
  date of censoring. `default=TRUE`

- file_paths:

  A data frame. Columns must be \`object\` and \`path\` containing paths
  to outputted files. If not provided will use those in
  \`ukbrapr_paths\` `default=NULL`

- censoring_date:

  A string. If using baseline data to infer control participants,
  include a censoring date (set to NA if not desired). Use dd-mm-yyyy
  format. Default is the (current) HES England date.
  `default="31-03-2023"`

- verbose:

  Logical. Be verbose, `default=FALSE`

## Value

Returns a single, "wide" data frame: the participant data for the
requested diagnosis codes with "date first" \`\_df\` variables. One for
each source of data, and a combined variable.

## Author

Luke Pilling

## Examples

``` r
###############################################
# example 1. haemochromatosis

# get diagnosis data - returns list of data frames (one per source)
diagnosis_list <- get_diagnoses(ukbrapR:::codes_df_hh)

# for each participant, get Date First diagnosed with the condition
diagnosis_df <- get_df(diagnosis_list, prefix="hh")

###############################################
# example 2. get multiple diseases at once
#            don't have to all have the same code types/data sources

codes = rbind(ukbrapR:::codes_df_hh, ukbrapR:::codes_df_ckd)
print(codes)

# get diagnosis data - returns list of data frames (one per source)
diagnosis_list <- get_diagnoses(codes)

# for each participant, get Date First diagnosed with the condition
diagnosis_df <- get_df(diagnosis_list, group_by="condition")
```
