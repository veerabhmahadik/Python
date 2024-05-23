# Read the training and testing data
setwd("/Users/veerabhmahadik/Desktop")
training_data<-read.csv("Train.csv")
test_data <- read.csv("Test.csv")

# Question 1
# Load necessary libraries
library(corrplot)

# Scatterplot matrix
pairs(training_data[, -1], pch = 16, main = "Scatterplot Matrix")

# Correlation matrix
correlation_matrix <- cor(training_data[, -1])
corrplot(correlation_matrix, method = "circle")

# Question 2
# Fit a linear regression model using all predictor variables
model <- lm(y ~ ., data = training_data)

# Make predictions for both training and test sets
training_predictions <- predict(model, newdata = training_data)
test_predictions <- predict(model, newdata = test_data)

# Create a data frame to combine actual and predicted values along with group labels
combined_data <- data.frame(
  Group = c(rep("Training", nrow(training_data)), rep("Test", nrow(test_data))),
  Actual = c(training_data$y, test_data$y),
  Predicted = c(training_predictions, test_predictions)
)

# Scatter plot of actual vs predicted values, distinguishing training and test groups
plot(
  Predicted ~ Actual,
  data = combined_data,
  pch = ifelse(combined_data$Group == "Training", 16, 17),
  col = ifelse(combined_data$Group == "Training", "green", "red"),
  xlab = "Actual Weight",
  ylab = "Predicted Weight",
  main = "Actual vs Predicted Weight"
)

# Add a legend
legend("topright", legend = c("Training", "Test"), pch = c(16, 17), col = c("green", "red"))

# Question 3
# Make predictions for the test set
test_predictions <- predict(model, newdata = test_data, interval = "prediction", level = 0.95)

# Extract predicted values and prediction intervals
predicted_values <- test_predictions[, 1]
prediction_intervals <- test_predictions[, c(2, 3)]

# Calculate prediction errors
prediction_errors <- test_data$y - predicted_values

# Output prediction intervals and prediction errors
print("Prediction Intervals:")
print(prediction_intervals)
print("Prediction Errors:")
print(prediction_errors)

# Question 4
# Calculate standardized residuals
training_residuals <- rstandard(model)

# Plot standardized residuals vs fitted values
plot(fitted(model), training_residuals, 
     xlab = "Fitted Values", ylab = "Standardized Residuals", 
     main = "Standardized Residuals vs Fitted Values")

# Add a horizontal line at y = 0 for reference
abline(h = 0, col = "red")

# Add a smoothed line (loess fit) to check for patterns
lines(lowess(fitted(model), training_residuals), col = "green")

# Question 5
# Problem 2: Fit Regression Models
# Fit regression model with only predictor variables x1 and x2
model_two_predictors <- lm(y ~ x1 + x2, data = training_data)

# Make predictions for the test set using both models
test_predictions_eight_predictors <- predict(model, newdata = test_data)
test_predictions_two_predictors <- predict(model_two_predictors, newdata = test_data)

# Problem 3: Calculate Prediction Intervals and Errors
# Calculate prediction intervals and errors for both models
prediction_intervals_eight_predictors <- predict(model, newdata = test_data, interval = "prediction", level = 0.95)
prediction_errors_eight_predictors <- test_data$y - prediction_intervals_eight_predictors[, 1]

prediction_intervals_two_predictors <- predict(model_two_predictors, newdata = test_data, interval = "prediction", level = 0.95)
prediction_errors_two_predictors <- test_data$y - prediction_intervals_two_predictors[, 1]

# Problem 4: Plot Standardized Residuals vs Fitted Values
# Calculate standardized residuals for both models
training_residuals_two_predictors <- rstandard(model_two_predictors)

# Plot standardized residuals vs fitted values for the two-predictor model
plot(fitted(model_two_predictors), training_residuals_two_predictors, 
     xlab = "Fitted Values", ylab = "Standardized Residuals", 
     main = "Standardized Residuals vs Fitted Values (Two-Predictor Model)")

abline(h = 0, col = "red")
lines(lowess(fitted(model_two_predictors), training_residuals_two_predictors), col = "green")

# Construct side-by-side box plots of the two sets of prediction errors for the test data
# Combine prediction errors into a data frame
prediction_errors_data <- data.frame(
  Model = c(rep("Eight Predictors", length(prediction_errors_eight_predictors)), 
            rep("Two Predictors", length(prediction_errors_two_predictors))),
  Prediction_Error = c(prediction_errors_eight_predictors, prediction_errors_two_predictors)
)

# Create side-by-side box plots
boxplot(Prediction_Error ~ Model, data = prediction_errors_data, 
        xlab = "Model", ylab = "Prediction Error",
        main = "Prediction Errors for Test Data")

# Question 6
# Fit the full model with all predictors
full_model <- lm(y ~ ., data = training_data)

# Fit the reduced model excluding predictors x3 through x8
reduced_model <- lm(y ~ x1 + x2, data = training_data)

# Calculate the sums of squares for both models
ss_full <- sum(residuals(full_model)^2)
ss_reduced <- sum(residuals(reduced_model)^2)

# Calculate the extra sum of squares
extra_ss <- ss_reduced - ss_full

# Calculate degrees of freedom for the F-test
df_full <- df.residual(full_model)
df_reduced <- df.residual(reduced_model)
df_extra <- df_reduced - df_full

# Perform the F-test
F_stat <- (extra_ss / df_extra) / (ss_full / df_full)
p_value <- pf(F_stat, df_extra, df_full, lower.tail = FALSE)

# Results
cat("Extra Sum of Squares:", extra_ss, "\n")
cat("F-statistic:", F_stat, "\n")
cat("p-value:", p_value, "\n")

