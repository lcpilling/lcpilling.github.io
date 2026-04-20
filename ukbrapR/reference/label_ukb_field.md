# Update UK Biobank field with \`title\` and \`label\` from the schema

Variables such as education and ethnicity are provided as integers but
have specific codes.

The UK Biobank schema are machine-readable dictionaries and mappings
defining the internal structure of the online Showcase.
https://biobank.ctsu.ox.ac.uk/crystal/schema.cgi

This function updates a field in a data frame of UK Biobank with
information from the Schema.

## Usage

``` r
label_ukb_field(d, field, field_id = NULL, verbose = FALSE)
```

## Arguments

- d:

  A data frame. The data frame containing the \`field\` to update.

- field:

  A string. The field (e.g., \`p54_i0\`) in the provided data frame to
  update.

- field_id:

  A string. If the field has been renamed (to e.g.,"assessment_centre")
  provide the field id here (e.g., "54"). `default=NULL`

- verbose:

  Logical. Be verbose, `default=FALSE`

## Value

Returns a data frame.

## Author

Luke Pilling

## Examples

``` r
# update the Assessment Centre variable
ukb <- ukbrapR::label_ukb_field(ukb, field="p54_i0")

table(ukb$p54_i0)                   # tabulates the values
table(haven::as_factor(ukb$p54_i0)) # tabulates the labels
haven::print_labels(ukb$p54_i0)     # show the value:label mapping for this variable

# if the variable has been renamed, provide the "field" and "field_id" e.g.,
ukb <- ukbrapR::label_ukb_field(ukb, field="assessment_centre", field_id="54")
```
