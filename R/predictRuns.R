#' Predict Future Runs
#'
#' @param mean_OPS Average On Base Plus Slugging percentage per player.
#' @param nrow_data Number of players on the team.
#' @param mean_G Average games played per player.
#'
#' @return Returns the number of runs team will score over the course of their whole season given the data for the games they've played so far.
#' @export
#'
#' @examples
predict_runs <- function(mean_OPS, nrow_data, mean_G) {
  expected_runs <- (162/mean_G)*mean_OPS*nrow_data
  predicted_runs <- expected_runs*(162/26)
  return(predicted_runs)
}

data <- read.csv("rays2023stats.csv")

predicted_runs <- predict_runs(mean(data$OPS), nrow(data), mean(data$G))
print(predicted_runs)
