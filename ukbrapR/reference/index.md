# Package index

## Export required data

- [`export_tables()`](https://lcpilling.github.io/ukbrapR/reference/export_tables.md)
  : Export diagnosis files to RAP persistent storage

## Extract genetic variants

- [`extract_variants()`](https://lcpilling.github.io/ukbrapR/reference/extract_variants.md)
  : Extract variants from bulk data and load to memory
- [`get_imputed_variant_info()`](https://lcpilling.github.io/ukbrapR/reference/get_imputed_variant_info.md)
  : Get variant info from UK Biobank imputed genotype MFI files
- [`make_imputed_bed()`](https://lcpilling.github.io/ukbrapR/reference/make_imputed_bed.md)
  : Extract variants from imputed genotype file(s) into single BED file
- [`make_dragen_bed()`](https://lcpilling.github.io/ukbrapR/reference/make_dragen_bed.md)
  : Extract variants from DRAGEN BGEN file(s) into single BED file
- [`load_bed()`](https://lcpilling.github.io/ukbrapR/reference/load_bed.md)
  : Load BED file into memory

## Create polygenic score

- [`create_pgs()`](https://lcpilling.github.io/ukbrapR/reference/create_pgs.md)
  : Create a polygenic score

## Ascertain diagnoses and determine date first diagnosed

- [`get_diagnoses()`](https://lcpilling.github.io/ukbrapR/reference/get_diagnoses.md)
  : Get UK Biobank participant diagnosis data
- [`get_df()`](https://lcpilling.github.io/ukbrapR/reference/get_df.md)
  : Get UK Biobank participant Date First (DF) diagnosis

## Working with UK Biobank data fields

- [`fields_to_phenos()`](https://lcpilling.github.io/ukbrapR/reference/fields_to_phenos.md)
  : Check UK Biobank field IDs
- [`label_ukb_fields()`](https://lcpilling.github.io/ukbrapR/reference/label_ukb_fields.md)
  : Update a data frame containing UK Biobank fields with \`title\` and
  \`label\` from the schema
- [`label_ukb_field()`](https://lcpilling.github.io/ukbrapR/reference/label_ukb_field.md)
  : Update UK Biobank field with \`title\` and \`label\` from the schema

## Upload/download from RAP/worker storage

- [`upload_to_rap()`](https://lcpilling.github.io/ukbrapR/reference/upload_to_rap.md)
  : Use R to upload a file to the UK Biobank RAP
- [`download_from_rap()`](https://lcpilling.github.io/ukbrapR/reference/download_from_rap.md)
  : Use R to download a file to the UK Biobank RAP

## Spark

- [`get_rap_phenos()`](https://lcpilling.github.io/ukbrapR/reference/get_rap_phenos.md)
  : Get UK Biobank participant phenotype data
- [`get_selfrep_illness_spark()`](https://lcpilling.github.io/ukbrapR/reference/get_selfrep_illness_spark.md)
  : Get UK Biobank participant self-reported illness/year data for
  specific codes
- [`get_emr_spark()`](https://lcpilling.github.io/ukbrapR/reference/get_emr_spark.md)
  : Get UK Biobank participant Electronic Medical Records (EMR) data in
  a RAP Spark environment
