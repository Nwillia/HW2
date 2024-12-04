
plot_cp <- #' Plot
  #'
  #' This function creates a visualization of cp in a dataset.
  #'
  #'@param data A data frame or matrix containing the data to analyze.
#' @param change_points A numeric vector indicating the positions of CP.
#' @param title A character string for the plot title. Defaults to "CP Plot".
#' @param color A character string specifying the color of change point lines. Defaults to "red".
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
}
