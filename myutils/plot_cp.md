# This function creates a visualization of cp in a dataset.

## Description

This function creates a visualization of cp in a dataset.

## Usage

```r
plot_cp(est, observed_data, iso_code, CI = NULL)
```

## Arguments

* `data`: A data frame or matrix containing the data to analyze.
* `change_points`: A numeric vector indicating the positions of CP.
* `title`: A character string for the plot title. Defaults to "CP Plot".
* `color`: A character string specifying the color of change point lines. Defaults to "red".

## Value

A ggplot object displaying the data.

