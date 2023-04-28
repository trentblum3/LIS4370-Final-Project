#' Calculate Current Season Runs
#'
#' @param mean_OPS Average On Base Plus Slugging percentage for a player.
#' @param n_players Number of players.
#' @param mean_G Average games played per player.
#'
#' @return The amount of runs your team should have scored so far this season.
#' @export
#'
#' @examples

calculate_runs <- function(mean_OPS, n_players, mean_G) {
  # Compute predicted runs
  predicted_runs <- (mean_OPS ^ 2 * n_players * mean_G)

  # Return predicted runs
  return(predicted_runs)
}

data <- read.csv("rays2022stats.csv")
calculate_runs(mean(data$OPS), nrow(data), mean(data$G))
