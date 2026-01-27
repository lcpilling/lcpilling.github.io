# Use R to download a file to the UK Biobank RAP

Use R to download a file to the UK Biobank RAP (really just a wrapper
for \`dx download\`)

## Usage

``` r
download_from_rap(file, verbose = FALSE)
```

## Arguments

- file:

  A string. Filename of the file to be downloaded (character)

- verbose:

  Logical. Be verbose, `default=FALSE`

## Value

NA

## Author

Luke Pilling

## Examples

``` r
readr::write_tsv(data.frame(x=1:10,y=11:20), "ukbrap.dummy.20231114.txt.gz")

# download file to RAP storage
download_from_rap(file="ukbrap.dummy.20231114.txt.gz", dir="extracts/")
```
