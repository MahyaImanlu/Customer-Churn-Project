# Customer Churn Project
# Author: Mahya


# --- Imports ---
from sqlalchemy import create_engine
import pandas as pd
import numpy as np


# Connect to MySQL
password = input('inter your Mysql password: ')
engine = create_engine(f"mysql+pymysql://root:{password}@localhost/customer_churn")



# Download the dataset and place it in the project folder
try:
    df = pd.read_csv("customer_churn_dataset-training-master.csv")
except FileNotFoundError:
    print("Dataset file not found. Please download the dataset and place it in the project folder.")


# Data cleaning

df = df.dropna(how='all')

df = df.replace([" ", "NULL", "null", "?"], np.nan)


num_cols = [
    'CustomerID','Age','Tenure','Usage Frequency',
    'Support Calls','Payment Delay','Last Interaction',
    'Total Spend','Churn'
]

for col in num_cols:
    df[col] = pd.to_numeric(df[col], errors='coerce')


df = df.dropna()

print(df.shape)
print(df.isna().sum())


# Export data to MySQL
df.to_sql(
    name="customer_churn",
    con=engine,
    if_exists="replace",
    index=False
)