# Newfood and Quality Control Analysis

## Description

### Project Overview
This project encompasses two main analyses: the Newfood case and the Quality Control case. The Newfood case involves evaluating the market potential and optimal marketing strategy for a new food product. The Quality Control case focuses on identifying factors affecting product defects in a manufacturing process. Both analyses employ statistical techniques, including regression and clustering, to derive actionable insights.

### Usage
The project can be used to:
- Predict the sales performance of new products under different marketing conditions.
- Identify key factors contributing to product defects in a manufacturing process.
- Provide recommendations for marketing strategies and process improvements based on data analysis.

### Issues and Limitations
- The results are based on historical data and may not account for future changes in market conditions or manufacturing processes.
- The accuracy of the models depends on the quality and completeness of the data.

### Future Features
- Incorporate real-time data to enhance the predictive capabilities of the models.
- Develop interactive dashboards for continuous monitoring and analysis of sales and quality control metrics.
- Implement advanced machine learning techniques to improve prediction accuracy.

## Technologies
- **R**: Provides robust statistical analysis tools and is ideal for regression and clustering tasks.

## Details about Use

### Newfood Case
Mr. Conrad Ulcer, the newly appointed New Products Marketing Director for Concorn Kitchens, is considering the introduction of a new highly nutritional food product, Newfood. The product has multiple potential uses and no direct competitors. A six-month market test was conducted in four markets with varying prices, advertising expenditures, and product placement locations to estimate first-year sales and study marketing variables.

#### Analysis Steps
1. Compute the correlation matrix to understand relationships between variables.
2. Run multiple regression analyses to predict sales based on different combinations of variables (price, advertising, location, volume).
3. Evaluate the impact of each variable on sales and determine the optimal marketing strategy.

### Quality Control Case
This case involves analyzing factors contributing to product defects in a manufacturing process. Data includes temperature variability, product density, production rate, shift (morning or afternoon), and defect rate. The goal is to identify significant predictors of defect rate and provide recommendations for process improvements.

#### Analysis Steps
1. Generate a scatterplot matrix and a correlation matrix to visualize and interpret relationships between variables.
2. Run multiple regression analyses to predict defect rate based on the other variables.
3. Evaluate the significance of each predictor and check for multicollinearity.
4. Perform further analysis as needed and provide recommendations for process improvements.

## Dependencies
- R
- Rstudio
