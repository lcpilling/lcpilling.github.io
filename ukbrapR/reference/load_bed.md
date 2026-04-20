# Load BED file into memory

Use Plink to convert BED to RAW then easily load it

## Usage

``` r
load_bed(in_bed, verbose = FALSE, very_verbose = FALSE)
```

## Arguments

- in_bed:

  A string. BED prefix

- verbose:

  Logical. Be verbose (show individual steps), `default=FALSE`

- very_verbose:

  Logical. Be very verbose (show individual steps & show terminal output
  from Plink etc), `default=FALSE`

## Value

A data frame

## Author

Luke Pilling

## Examples

``` r
liver_variants <- load_bed(in_bed="liver_cirrhosis.imputed.variants")
```
