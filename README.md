# 📊 customer-churn-analysis
This project analyses a customer churn dataset using python, sql and powerbi.

## Dataset
Download customer_churn_dataset-testing-master.csv from kaggle then place it in the python folder: 
https://www.kaggle.com/datasets/muhammadshahidazeem/customer-churn-dataset?select=customer_churn_dataset-testing-master.csv

## 🚀 Tools Used 
- Python
- SQL
- PowerBI

## 📂 Project Structure
- Python : main analyses file
- SQL : sql queries
- Power BI : Screenshots of visualizations

## 📊 Analysis 
- Churn Rate by Usage Frequency Group
- Churn Rate by Support Calls Group
- Churn Rate by Subscription Type
- Churn Rate by Payment Delay Group
- Churn Rate by Contract Length and Subscription Type
- Churn Rate by Tenure Group
- Churn Rate by Risk Band
- Customer Segmentation
- Lost Revenue by Risk Band

## 📈 Insights

- The churn rate is 56.71%, showing that retention is a major issue.
  Churn is mainly driven by customer experience factors. Higher usage reduces churn, while more support calls and payment delays increase it. Customers with 1–2     years of tenure show the highest churn risk, as this is the stage where they decide whether to stay or leave after fully experiencing the product. Monthly         subscribers also churn more compared to longer contracts.
  High-risk customers (with low usage, high support calls, and payment delays) account for most of the revenue loss.


- Recommendations:
   Improve customer support to resolve issues faster and reduce repeat calls. Strengthen onboarding to reduce early churn. Encourage longer contracts through         incentives. Closely monitor customers in the 1–2 year tenure segment and offer targeted retention actions. Also, increase engagement to improve usage and          reduce churn.

## ▶️ How to Run
- Download the project files : download main.py from python folder and 01_database_setup.sql, 02_customer_churn_views.sql from sql folder.
- Prepare the dataset: Download the dataset and place it in the project directory.
- Run python file and SQl queries to process and transform the data.
- For running python file with no error install dependencies : pip install pandas numpy sqlalchemy pymysql
- Load data into PowerBI: Import the processed data from SQL into Power BI and finally load the data for visualization and analysis.

## 👨‍💻 Author
Mahya
