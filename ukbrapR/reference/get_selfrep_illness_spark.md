# Get UK Biobank participant self-reported illness/year data for specific codes

For a specific self-reported illness code or codes, identify whether the
participant has self-reported at any visit, and identify the year.
Intended for use on the UK Biobank DNnexus Research Analysis Platform,
but if the user provides their own dataframe of UK Biobank self-reported
fields this works on any system.

## Usage

``` r
get_selfrep_illness_spark(
  codes_df,
  vocab_col = "vocab_id",
  codes_col = "code",
  ukb_dat = NULL,
  n_cancer_arrays = 5,
  n_noncancer_arrays = 30,
  verbose = FALSE
)
```

## Arguments

- codes_df:

  A data frame. Contains the \`vocab_col\` and \`codes_col\` i.e., an
  indicator of the vocabulary and the diagnostic codes.

- vocab_col:

  A string. Column name in \`codes_df\` that contains the vocabulary
  indicator for the code (for self-reported it needs to be either
  "ukb_cancer" or "ukb_noncancer"). `default='vocab_id'`

- codes_col:

  A string. Column name in \`codes_df\` that contains the self-reported
  disease code (e.g., 1507). `default='code'`

- ukb_dat:

  A data frame. Optional. If not provided, will get the phenotypes from
  the RAP. Contains the self-reported illness fields e.g.,
  \`p20008_i0_a0\`. `default=NULL`

- n_cancer_arrays:

  An integer. It is not trivial to determine the max number of arrays to
  request from Spark for the self-reported illnesses. The defaults match
  the currently (Feb 2024) available data but may need increasing in the
  future. `default=5`

- n_noncancer_arrays:

  An integer. It is not trivial to determine the max number of arrays to
  request from Spark for the self-reported illnesses. The defaults match
  the currently (Feb 2024) available data but may need increasing in the
  future. `default=30`

- verbose:

  Logical. Be verbose, `default=FALSE`

## Value

Returns a data frame with four variables: eid, selfrep \[binary, codes
identified?\], selfrep_df \[date of reported illness\], selfrep_i
\[instance the illness was first reported\]

## Author

Luke Pilling

## Examples

``` r
# example diagnostic codes for haemochromatosis
print(codes_df_hh)

# get self-reported data - a data frame
selfrep_df <- get_selfrep_illness_spark(codes_df_hh)

# inspect variables
table(selfrep_df$selfrep)
summary(selfrep_df$selfrep_df)
table(selfrep_df$selfrep_i)
```
