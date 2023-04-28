# Load the required library
library(ggplot2)

#Load player stats
player_stats <- read.csv("rays2023stats.csv")

# Subset the predicted_ops variable to the first 14 rows
predicted_ops_subset <- head(predicted_ops, n = 14)

# Create a data frame with the predicted OPS subset and the hits
data <- data.frame(predicted_ops = predicted_ops_subset, hits = player_stats$H)

# Create a scatterplot with a linear regression line
ggplot(data, aes(x = hits, y = predicted_ops)) +
  geom_point() +
  geom_smooth(method = "lm") +
  xlab("Hits") +
  ylab("Predicted OPS") +
  ggtitle("Linear Regression Model of Predicted OPS") +
  theme_bw()
