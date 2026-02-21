# Export diagnosis files to RAP persistent storage

In the UK Biobank RAP export tables for HES, GP, death, and cancer
registry data, plus self-reported illness fields, using the
table-exporter. This is essentially a wrapper function to submit jobs to
the table exporter.

Suggest executing in an RStudio session. ~10Gb of text files are
created. This will cost ~£0.15 per month to store in the RAP standard
storage.

## Usage

``` r
export_tables(
  submit = FALSE,
  ignore_warnings = FALSE,
  file_paths = ukbrapR:::ukbrapr_paths,
  dataset = NULL,
  verbose = FALSE
)
```

## Arguments

- submit:

  Logical. Actually submit \`dx\` commands. Default is FALSE i.e., just
  check inputs & file paths, then print the commands, `default=FALSE`

- ignore_warnings:

  Logical. If an exported table already exists do not submit the
  table-exporter command unless this is TRUE, `default=FALSE`

- file_paths:

  A data frame. Columns must be \`object\` and \`path\` containing paths
  to outputted files. If blank, will use the default paths,
  `default=ukbrapR:::ukbrapr_paths`

- dataset:

  A string. If you wish to specify dataset. If blank, will use the most
  recently dispensed dataset in the main project directory.
  `default=app#####_#####.dataset`

- verbose:

  Logical. Be verbose, `default=FALSE`

## Value

NA

## Author

Luke Pilling

## Examples

``` r
# To keep files organised this package assumes the following file structure
#  This object is not actually required but illstrates the defaults to be
#  created in your RAP space (override by providing a new `file_paths`):
ukbrapr_paths = data.frame(
  object=c("death","death_cause","hesin","hesin_diag","hesin_oper","gp_clinical","gp_scripts","selfrep_illness","cancer_registry","baseline_dates"),
  path=c(
    "ukbrapr_data/death.tsv",
    "ukbrapr_data/death_cause.tsv",
    "ukbrapr_data/hesin.tsv",
    "ukbrapr_data/hesin_diag.tsv",
    "ukbrapr_data/hesin_oper.tsv",
    "ukbrapr_data/gp_clinical.tsv",
    "ukbrapr_data/gp_scripts.tsv",
    "ukbrapr_data/selfrep_illness.tsv",
    "ukbrapr_data/cancer_registry.tsv",
    "ukbrapr_data/baseline_dates.tsv"
  )
)
ukbrapr_paths

# test run to see `dx run table-exporter` commands - but will not submit jobs
export_tables()

# Submit all `dx run table-exporter` commands. ~10Gb of text files are created. This will cost ~£0.15 per month to store in the RAP standard storage.
export_tables(submit=TRUE)
```
