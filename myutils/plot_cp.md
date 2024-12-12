# This function returns a ggplot with or without confidence interval.

## Description

This function returns a ggplot with or without confidence interval.

## Usage

```r
plot_cp(est, observed_data, iso_code, CI = NULL)
```

## Arguments

* `est`: ibble which contains mCPR estimates. Columns: “Country or area”, iso, Year, Median, U95,L95
* `iso_code`: the countrys iso code number
* `data`: A olumns: iso, year, cp
* `COnfidence`: Interval can be NA or number

## Value

A ggplot object displaying the data.

