# Extract variants from bulk data and load to memory

Use user-provided list of genetic variants to extract from imputed BGEN
files (field 22828) or WGS DRAGEN BGEN files (field 24309) data and load
as data.frame

If selecting the DRAGEN data as the source, this assumes your project
has access to the WGS BGEN files released April 2025. If not, run
\`ukbrapR:::make_dragen_bed_from_pvcfs()\` to use \[tabix\] and
\[plink\] to subset the \[DRAGEN WGS pVCF files\].

## Usage

``` r
extract_variants(
  in_file,
  out_bed = "tmp",
  source = "imputed",
  use_imp_pos = FALSE,
  overwrite = FALSE,
  progress = FALSE,
  verbose = FALSE,
  very_verbose = FALSE
)
```

## Arguments

- in_file:

  A data frame or file path. Contains rsid, chr, and pos. For imputed
  genos pos is build 37. For DRAGEN pos is build 38. Other columns are
  ignored.

- out_bed:

  A string. Prefix for output files (optional) `default="tmp"`

- source:

  A string. Either "imputed" or "dragen" - indicating whether the
  variants should be from "UKB imputation from genotype" (field 22828)
  or "DRAGEN population level WGS variants, PLINK format \[500k
  release\]" (field 24308) `default="imputed"`

- use_imp_pos:

  Logical. If source imputed, use position instead of rsID to extract
  variants?, `default=FALSE`

- overwrite:

  Logical. Overwrite output BED files? (If output prefix is left as
  'tmp' overwrite is set to TRUE), `default=FALSE`

- progress:

  Logical. Show progress through each individual file, `default=FALSE`

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
liver_variants <- extract_variants(in_file=system.file("files", "pgs_liver_cirrhosis.txt", package="ukbrapR"), out_bed="liver_cirrhosis.imputed.variants")
```
