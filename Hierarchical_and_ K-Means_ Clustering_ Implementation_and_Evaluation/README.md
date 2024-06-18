# Hierarchical and K-Means Clustering: Implementation and Evaluation

## Description

### Project Overview
This project focuses on implementing and evaluating hierarchical and K-means clustering algorithms on multiple datasets. The project aims to generate clusters, evaluate the clustering performance using validation metrics, and visualize the data points according to their original and allocated classes. The datasets contain data points with class information, and the goal is to explore how well the clustering algorithms can group similar data points.

### Usage
The project can be used to:
- Understand and apply hierarchical and K-means clustering techniques.
- Evaluate clustering performance using external and internal validation metrics.
- Visualize clustering results in 2D or 3D plots.
- Group similar countries based on selected attributes using clustering methods.

### Issues and Limitations
- Clustering results can be sensitive to the choice of parameters (e.g., number of clusters).
- High-dimensional data can be challenging to visualize effectively.
- The evaluation of clustering performance depends on the availability of true class labels.

### Future Features
- Implement additional clustering algorithms (e.g., DBSCAN, Gaussian Mixture Models).
- Develop an interactive dashboard for real-time clustering analysis and visualization.
- Incorporate feature selection techniques to improve clustering performance.

## Technologies

- **Python**: Offers a rich ecosystem of libraries for data analysis, machine learning, and visualization.
- **Jupyter Notebook**: Facilitates interactive development and allows for easy exploration and visualization of clustering results.
- **Pandas**: Used for data manipulation and preprocessing.
- **Scikit-learn**: Provides efficient implementations of clustering algorithms and validation metrics.
- **Matplotlib/Seaborn**: Used for creating 2D and 3D visualizations of clustering results.

## Details about Use

### Task 1
For the datasets `Data1.csv` to `Data8.csv`, the following steps are performed:
1. Use K-means and hierarchical clustering methods to generate clusters.
2. Evaluate the performance of the clustering algorithms using external validation metrics.
3. Plot the data points for each dataset in 2D or 3D and color them according to the original class.
4. Plot the data points for each dataset in 2D or 3D and color them according to the class allocated by the clustering algorithm.

### Task 2
For the world indicators dataset:
1. Use K-means and hierarchical clustering methods to group similar countries based on selected attributes.
2. Use internal validation metrics to report the cluster quality.
3. Report the best clustering solution and provide a detailed list of all groups and the countries included within each group.
4. Generate three different scatter plots of your choice and color the data points according to the group.

## Dependencies
- Python 3.x
- Jupyter Notebook
- Pandas
- Scikit-learn
- Matplotlib
- Seaborn
