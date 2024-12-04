' Plot Contraceptive Use with Optional Confidence Intervals
#'
#' @param est Data frame with model estimates including columns 'Year', 'Median', 'L95', 'U95', 'L80', 'U80'.
#' @param observed_data Data frame with observed data including columns 'division_numeric_code', 'year', 'cp'.
#' @param iso_code Numeric ISO code for the country to plot.
#' @param CI Optional numeric value for confidence intervals (95 or 80). Set to NA for no intervals.
#'
#' @return A ggplot object displaying the plot.
#' @examples
#' plot_cp(dat, est, iso_code = 4)
#' plot_cp(dat, est, iso_code = 4, CI = False)
#' plot_cp(dat, est, iso_code = 404, CI = 80)
#'
