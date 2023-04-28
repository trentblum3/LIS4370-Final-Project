library(ggplot2)

# Load data (using example data)
data <- read.csv("rays2022stats.csv")
data2023 <- read.csv("rays2023stats.csv")

# Create linear regression model
model <- lm(R ~ OPS, data = data)

# Summarize model
summary(model)

# Plot data and regression line
ggplot(data, aes(x = OPS, y = R)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE)


#Find the amount of runs scored per OPS
slope <- coef(model)["OPS"]
print(slope)

#Find the mean team OPS
mean_OPS <- mean(data$OPS)
print(mean_OPS)

#Use y-intercept to find average player's Runs scored in a season, multiply it by number of players to find predicted runs for 2022 season.
predicted_runs <- (slope*mean_OPS - 51.81) * nrow(data)
print(predicted_runs)

#Actual runs scored in 2022 season.
total_runs <- sum(data$R)
print(total_runs)

#Predicted runs for 2023 based on current season's stats:
model23 <- lm(R ~ OPS, data = data2023)
slope23 <- coef(model23)["OPS"]
print(slope23)
mean_OPS23 <- mean(data2023$OPS)
print(mean_OPS23)
predicted_runs23 <- (slope23*mean_OPS23 - 4.02) * nrow(data2023)
print(predicted_runs23)
