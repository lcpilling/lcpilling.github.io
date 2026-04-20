# Extract variants from DRAGEN BGEN file(s) into single BED file

For a given set of genomic coordinates extract the UK Biobank WGS DRAGEN
variant calls (from the BGEN format, field 24309) into a single BED
file.

This assumes your project has access to the WGS BGEN files released
April 2025. If not, run \`ukbrapR:::make_dragen_bed_from_pvcfs()\` to
use \[tabix\] and \[plink\] to subset the \[DRAGEN WGS pVCF files\].

## Usage

``` r
make_dragen_bed(
  in_file,
  out_bed,
  progress = TRUE,
  verbose = FALSE,
  very_verbose = FALSE
)
```

## Arguments

- in_file:

  A data frame or file path. Contains at least two columns: \`chr\` and
  \`pos\` (in build 38). Other columns are ignored.

- out_bed:

  A string.

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
make_dragen_bed(in_file=system.file("files", "pgs_liver_cirrhosis.txt", package="ukbrapR"), out_bed="liver_cirrhosis.dragen.variants")
```
