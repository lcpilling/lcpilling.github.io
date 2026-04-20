# Get UK Biobank participant Electronic Medical Records (EMR) data in a RAP Spark environment

This function is completely removed. Better to use \`get_diagnoses()\`.
Use a historic release of this package if you really need it
https://github.com/lcpilling/ukbrapR/releases

## Usage

``` r
get_emr_spark(
  codes_df = NULL,
  spark_master = "spark://master:41000",
  verbose = FALSE
)
```

## Arguments

- codes_df:

  A data frame. Contains two columns: \`code\` and \`vocab_id\` i.e., a
  list of diagnostic codes, and an indicator of the vocabulary. Other
  columns are ignored.

- spark_master:

  A string. The \`master\` argmuent passed to
  \`sparklyr::spark_connect()\`. `default='spark://master:41000'`

- verbose:

  Logical. Be verbose, `default=FALSE`

## Value

Returns nothing

## Author

Luke Pilling
