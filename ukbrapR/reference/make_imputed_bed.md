# Extract variants from imputed genotype file(s) into single BED file

For a given set of identifiers (RSID or "build37 position") extract from
the UK Biobank imputed genotypes (BGEN files, field 22828) into a single
BED file.

## Usage

``` r
make_imputed_bed(
  in_file,
  out_bed,
  use_pos = FALSE,
  progress = TRUE,
  verbose = FALSE,
  very_verbose = FALSE
)
```

## Arguments

- in_file:

  A data frame or file path. Contains at least two columns: (\`rsID\`
  and \`CHR\`) OR (\`CHR\` and \`POS\`). Other columns are ignored.

- out_bed:

  A string. Output BED file prefix.

- use_pos:

  Logical. Use genomic position (CHR and POS) instead of RSID,
  `default=FALSE`

- progress:

  Logical. Show progress through each individual file, `default=TRUE`

- verbose:

  Logical. Be verbose (show individual steps), `default=FALSE`

- very_verbose:

  Logical. Be very verbose (show individual steps & show terminal output
  from Plink etc), `default=FALSE`

## Value

A single merged BED file (and BIM and FAM files)

## Author

Luke Pilling

## Examples

``` r
# Example list of variants
#    only RSID and CHR are provided
varlist <- data.frame(rsid=c("rs1800562","rs429358"), chr=c(6,19))

make_imputed_bed(in_file=varlist, out_bed="example_variants_by_rsid")

# Above example works fine if the imputed BGEN contains the provided rsid

# However if you have a list of variants defined by genomic position (CHR and POS)
# then use the `use_pos=TRUE` argument

# Example list of variants using position (build 37) not rsid
varlist_pos <- data.frame(chr=c(6,19), pos=c(26093141,45411941))

# if you provide an rsid it is ignored when `use_pos=TRUE`
make_imputed_bed(in_file=varlist_pos, out_bed="example_variants_by_pos", use_pos=TRUE)
```
