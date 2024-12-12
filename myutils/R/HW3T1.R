#' Calculate the widths of the uncertainty intervals for a country
#'
#' @param est A data frame containing the estimated values
#' @param iso_code The ISO code of the country
#' @param coverage The coverage level of the uncertainty interval (80 or 95)
#'
#' @return A data frame with the year and the corresponding interval width
get_width_ci <- function(est, iso_code, coverage) {
  # Filter the data for the specified country
  est_filtered <- est %>%
    filter(iso == iso_code)

  # Calculate the interval width
  if (coverage == 95) {
    interval_width <- est_filtered$U95 - est_filtered$L95
  } else if (coverage == 80) {
    interval_width <- est_filtered$U80 - est_filtered$L80
  } else {
    stop("Invalid coverage level. Please specify 80 or 95.")
  }

  # Create a data frame with the year and the interval width
  interval_width_df <- data.frame(
    Year = est_filtered$Year,
    Width = interval_width
  )

  return(interval_width_df)
}
