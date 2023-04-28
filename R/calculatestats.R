#' Calculate Player Stats
#'
#' @param hits
#' @param walks
#' @param at_bats
#' @param singles
#' @param doubles
#' @param triples
#' @param home_runs
#'
#' @return Returns the advanced stats of an individual player like Slugging Percentage, and On Base Percentage.
#' @export
#'
#' @examples

calculate_stats <- function(hits, walks, at_bats, singles, doubles, triples, home_runs) {
  # Calculate On Base Percentage (OBP)
  plate_appearances <- at_bats + walks
  total_hits <- singles + doubles + triples + home_runs
  obp <- (hits + walks) / plate_appearances

  # Calculate Slugging Percentage (SLG)
  total_bases <- singles + (2 * doubles) + (3 * triples) + (4 * home_runs)
  slg <- total_bases / at_bats

  # Calculate On-base Plus Slugging (OPS)
  ops <- obp + slg

  # Return a list containing the calculated stats
  return(list(OBP = obp, SLG = slg, OPS = ops))
}

# Sample stats for a baseball player
hits <- 120
walks <- 40
at_bats <- 400
singles <- 70
doubles <- 30
triples <- 5
home_runs <- 15

# Calculate the player's stats
player_stats <- calculate_stats(hits, walks, at_bats, singles, doubles, triples, home_runs)

# Print the calculated stats
print(player_stats)
