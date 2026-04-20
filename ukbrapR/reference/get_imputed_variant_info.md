# Get variant info from UK Biobank imputed genotype MFI files

For a given set of genomic coordinates (position in build 37) get the UK
Biobank imputed genotype variant IDs from the MFI files.

## Usage

``` r
get_imputed_variant_info(varlist, verbose = FALSE)
```

## Arguments

- varlist:

  A data frame. Contains at least two columns: \`chr\` and \`pos\`
  (b37). Other columns are ignored.

- verbose:

  Logical. Be verbose (show individual steps), `default=FALSE`

## Value

A data frame of variants with added "ukb_rsid" column (also returns
alleles, MAF and INFO)

## Author

Luke Pilling

## Examples

``` r
# Example where RSID is only known for some variants
varlist1 <- data.frame(rsid=c("","rs564086017",""), chr=c(1,2,22), pos=c(10616, 10180, 16050435))
varlist2 <- get_imputed_variant_info(varlist1)
```
