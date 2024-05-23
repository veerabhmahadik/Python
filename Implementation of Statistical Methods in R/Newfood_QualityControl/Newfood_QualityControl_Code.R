# Newfood
getwd()
setwd("/Users/veerabhmahadik/Desktop")
newfood<-read.csv("newfood.csv")

# Question1
# Correlation matrix
correlation_matrix <- cor(newfood)
print(correlation_matrix)

# Question 2 
#Regression of sales on price alone, price and ad, price, ad, and loc
regression_price <- lm(sales ~ price, data = newfood)
regression_price_ad <- lm(sales ~ price + ad, data = newfood)
regression_price_ad_loc <- lm(sales ~ price + ad + loc, data = newfood)

# Coefficients of price
print(summary(regression_price)$coefficients[, "Estimate"])
print(summary(regression_price_ad)$coefficients[, "Estimate"])
print(summary(regression_price_ad_loc)$coefficients[, "Estimate"])

# Coefficients of ad
print(summary(regression_price_ad)$coefficients[, "Estimate"])
print(summary(regression_price_ad_loc)$coefficients[, "Estimate"])

# Question 3 
# Regression of sales against price, ad, loc, and volume
regression_price_ad_loc_volume <- lm(sales ~ price + ad + loc + volume, data = newfood)
print(summary(regression_price_ad_loc_volume)$coefficients[, "Estimate"])

# Question 4 
# Regression with all variables
regression_full <- lm(sales ~ price + ad + loc + volume + income + city, data = newfood)
print(summary(regression_full)$coefficients)

# Question 5 
# Additional regression runs
# Regression with interaction between price and advertising
regression_interaction <- lm(sales ~ price * ad + loc + volume, data = newfood)
summary(regression_interaction)

library(car)

# Multicollinearity - Variance Inflation Factor (VIF)
vif_values <- car::vif(regression_full)
print(vif_values)

# Heteroscedasticity 
# The red horizontal line represents the line at y = 0, indicating the ideal scenario where the residuals have constant variance around zero. 
# the points should be randomly scattered around the red line with no clear pattern. 
# This indicates that the variance of the residuals is constant across all levels of the independent variable.
# Obtain residuals from the regression model
residuals <- residuals(regression_full)

# Plot residuals against fitted values
plot(fitted(regression_full), residuals,
     xlab = "Fitted values", ylab = "Residuals",
     main = "Residuals vs Fitted Values")

# Add a horizontal line at y = 0 for reference
abline(h = 0, col = "red", lwd = 2)

# Quality Control
quality<-read.csv("quality.csv")
library(corrplot)

# Question 1
scatterplot_matrix <- pairs(quality)
correlation_matrix_quality <- cor(quality)

# Plot correlation matrix
corrplot(correlation_matrix_quality, method = "circle", type = "upper", tl.col = "black", tl.srt = 45)

# Question 2 
# Run multiple regression
model <- lm(defect ~ temp + density + rate + am, data = quality)
summary(model)  # Check overall significance and significance of predictors

# Compute VIF
vif_results <- car::vif(model)
print(vif_results)

# Question 3
temp_model <- lm(defect ~ temp, data = quality)
density_model <- lm(defect ~ density, data = quality)
rate_model <- lm(defect ~ rate, data = quality)
am_model <- lm(defect ~ am, data = quality)

summary(temp_model)
summary(density_model)
summary(rate_model)
summary(am_model)

# Question 4
# Check appropriateness of regressing defect on the first component
pca <- prcomp(~ temp + density + rate + am, data = quality, scale. = TRUE)
summary(pca)

# Question 5
# Extract PC1 from PCA results
PC1 <- pca$x[, 1]

# Define response variable
Y <- quality$defect

# Fit regression model using PC1 as predictor
pc_model <- lm(Y ~ PC1)

# Print summary of the regression model
summary(pc_model)

# The regression model appears to be a good fit for the data. 
# The coefficients are significant, and the model explains a large proportion of the variance in the defect rate. 
# Additionally, the low p-value associated with the F-statistic indicates that the model as a whole is statistically significant.

# Homoscedascticity findings:
# The red horizontal line represents the line at y = 0, indicating the ideal scenario where the residuals have constant variance around zero. 
# the points should be randomly scattered around the red line with no clear pattern. 
# This indicates that the variance of the residuals is constant across all levels of the independent variable.
plot(fitted(model), residuals(model), main = "Residuals vs. Fitted", xlab = "Fitted Values", ylab = "Residuals")
abline(h = 0, col = "red")

# Check Normality of Residuals
# Plot histogram findings:
# Residuals are normally distributed around zero
hist(residuals(model), main = "Histogram of Residuals", xlab = "Residuals")

# QQ Plots findings:
# It suggests that the residuals are normally distributed. This indicates that the assumption of normality is met.
# It indicates positive skewness, suggesting that the residuals have heavier tails on the right side
qqnorm(residuals(model))
qqline(residuals(model))

