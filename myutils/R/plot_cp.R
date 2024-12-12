
plot_cp <- #' Plot
  #'
  #' This function returns a ggplot with or without confidence interval.
  #'
  #'@param data A olumns: iso, year, cp
#' @param est ibble which contains mCPR estimates. Columns: “Country or area”, iso, Year, Median, U95,L95
#' @param iso_code the countrys iso code number
#' @param COnfidence Interval can be NA or number
#'
#' @return A ggplot object displaying the data.
#' @export


  function(est, observed_data, iso_code, CI = NULL) {
  est_filtered <- est %>%
    filter(iso == iso_code)

  observed_filtered <- observed_data %>%
    filter(division_numeric_code == iso_code)

  p <- ggplot(est_filtered, aes(x = Year, y = Median)) +
    geom_line(color = "blue") +
    labs(x = "Time", y = "Modern use (%)", title = est_filtered$`Country or area`[1]) +
    geom_point(data = observed_filtered, aes(x = year, y = cp), color = "red")

  if (!is.null(CI)) {
    if (CI == 95) {
      p <- p + geom_ribbon(aes(ymin = L95, ymax = U95), alpha = 0.2, fill = "indianred")
    } else if (CI == 80) {
      p <- p + geom_ribbon(aes(ymin = L80, ymax = U80), alpha = 0.2, fill = "darkgrey")
    }
  }

  return(p)
  # Check if est and observed_data contain required variables
  required_variables <- c("iso", "Year", "Median", "L95", "U95", "L80", "U80")
  if (!all(required_variables %in% names(est))) {
    stop("Input data file est must contain variables iso, Year, Median, L95, U95, L80, and U80.")
  }

  required_variables <- c("iso", "year", "cp")
  if (!all(required_variables %in% names(observed_data))) {
    stop("Input data file observed_data must contain variables iso, year, and cp.")
  }

  # Check if iso_code is found in est and observed_data
  if (!any(est$iso == iso_code)) {
    stop("iso_code not found in est.")
  }

  if (!any(observed_data$iso == iso_code)) {
    stop("iso_code not found in observed_data.")
  }

  # Check if cp is numeric
  if (!is.numeric(observed_data$cp)) {
    stop("Input cp in data file observed_data must be numeric.")
  }

  # Check if CI is valid
  if (!is.null(CI) && !CI %in% c(80, 95)) {
    stop("CI must be 80, 95, or NA.")
  }

  plot_cp <- function(est, observed_data, iso_code, CI = NULL) {
    # Check if est and observed_data contain required variables
    required_variables <- c("iso", "Year", "Median", "L95", "U95", "L80", "U80")
    if (!all(required_variables %in% names(est))) {
      stop("Input data file est must contain variables iso, Year, Median, L95, U95, L80, and U80.")
    }

    required_variables <- c("iso", "year", "cp")
    if (!all(required_variables %in% names(observed_data))) {
      stop("Input data file observed_data must contain variables iso, year, and cp.")
    }

    # Check if iso_code is found in est and observed_data
    if (!any(est$iso == iso_code)) {
      stop("iso_code not found in est.")
    }


  }
  }






