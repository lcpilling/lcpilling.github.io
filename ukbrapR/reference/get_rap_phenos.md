# Get UK Biobank participant phenotype data

Using a Spark node/cluster on the UK Biobank Research Analysis Platform
(DNAnexus), use R to extract a provided set of variables. Using code
from the UK Biobank DNAnexus team
https://github.com/UK-Biobank/UKB-RAP-Notebooks/blob/main/NBs_Prelim/105_export_participant_data_to_r.ipynb

## Usage

``` r
get_rap_phenos(
  names,
  value_coding = "replace",
  names_are_titles = FALSE,
  record = NULL,
  verbose = FALSE
)
```

## Arguments

- names:

  A string or vector of strings. The variable name(s) required. e.g.,
  c("eid","p31","p21003_i0")

- value_coding:

  A string. How to handle coded fields. "replace" if a coding value
  exists, replace the raw value with the code; "raw" export the raw
  values of the field; "exclude" if a coding value exists, do not export
  the value (most commonly used with sparse fields). `default="replace"`

- names_are_titles:

  Logical. Passing DNAnexus variable "titles" e.g., c("Age at
  recruitment", "Standing height \| Instance 0"). `default=FALSE`

- record:

  A string. The \`dnanexus_link\` file descriptor of the .dataset to
  use. Default (if left as NULL) is to use the most recently dispensed
  dataset. `default=most recent dataset`

- verbose:

  Logical. Be verbose, `default=FALSE`

## Value

Returns a data.frame (the participant data for the requested variables)

## Author

Luke Pilling

## Examples

``` r
# get phenotype data
ukb <- get_rap_phenos(c("eid","p31","p21003_i0","p53_i0"))

# save to file on the RAP worker node
readr::write_tsv(ukb, "ukbrap.phenos.20231114.txt.gz")

# upload data to RAP storage
upload_to_rap(file="ukbrap.phenos.20231114.txt.gz", dir="")
```
