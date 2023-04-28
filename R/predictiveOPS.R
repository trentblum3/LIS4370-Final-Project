# Load the CSV file containing the player stats
team_stats <- read.csv("rays2023stats.csv")

# Calculate the team's OPS using the calculate_stats function
team_ops <- calculate_stats(hits = team_stats$H, walks = team_stats$BB, at_bats = team_stats$AB,
                            singles = team_stats$H - team_stats$X2B - team_stats$X3B - team_stats$HR,
                            doubles = team_stats$X2B, triples = team_stats$X3B, home_runs = team_stats$HR)$OPS


# Load the previous season's dataset
previous_season_data <- data.frame(read.csv("rays2022stats.csv")[1:24,])

# Fit a linear model with OPS as the response variable and other variables as predictors
model <- lm(OPS ~ previous_season_data$H + previous_season_data$BB + previous_season_data$AB, data = previous_season_data)

# Predict the team's OPS for the current season using the model and the partial dataset
predicted_ops <- predict(model, newdata = data.frame(Variable1 = hits, Variable2 = walks, Variable3 = at_bats, OPS = team_ops))

# Print the predicted OPS for the current season
print(predicted_ops)
