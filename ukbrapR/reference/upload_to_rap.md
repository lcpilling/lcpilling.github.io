# Use R to upload a file to the UK Biobank RAP

Use R to upload a file to the UK Biobank RAP (really just a wrapper for
\`dx upload\`)

## Usage

``` r
upload_to_rap(file, dir = "FALSE", verbose = FALSE)
```

## Arguments

- file:

  A string. Filename of the file to be uploaded (character)

- dir:

  A string. Target directory in the RAP space. If blank, the current
  working directory (character)

- verbose:

  Logical. Be verbose, `default=FALSE`

## Value

NA

## Author

Luke Pilling

## Examples

``` r
readr::write_tsv(data.frame(x=1:10,y=11:20), "ukbrap.dummy.20231114.txt.gz")

# upload file to RAP storage
upload_to_rap(file="ukbrap.dummy.20231114.txt.gz", dir="extracts/")
```
