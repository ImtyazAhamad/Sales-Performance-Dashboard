# 📊 Sales Performance Dashboard | Python, SQL, Power BI

![Power BI](https://img.shields.io/badge/Power%20BI-Dashboard-F2C811?logo=powerbi&logoColor=black)
![SQL](https://img.shields.io/badge/SQL-Analysis-336791?logo=postgresql&logoColor=white)
![Python](https://img.shields.io/badge/Python-Data%20Cleaning%20%26%20EDA-3776AB?logo=python&logoColor=white)
![Status](https://img.shields.io/badge/Project-Completed-success)
![Portfolio](https://img.shields.io/badge/Use%20Case-Portfolio%20Project-blueviolet)

An end-to-end **Sales Analytics Project** built using **Python, SQL, and Power BI** to analyze revenue, profit, orders, products, categories, regions, and city-level sales performance.  
This project demonstrates the complete workflow of a **Data Analyst** — from **data cleaning and exploratory analysis** to **SQL-based business insights** and an **interactive Power BI dashboard**.

---

# 📌 Table of Contents
- [Project Overview](#-project-overview)
- [Business Objectives](#-business-objectives)
- [Tools & Technologies](#️-tools--technologies)
- [Project Workflow](#-project-workflow)
  - [1. Data Cleaning & Preparation (Python)](#1-data-cleaning--preparation-python)
  - [2. Exploratory Data Analysis (EDA)](#2-exploratory-data-analysis-eda)
  - [3. SQL Analysis](#3-sql-analysis)
  - [4. Power BI Dashboard](#4-power-bi-dashboard)
- [Dashboard KPIs](#-dashboard-kpis)
- [Dashboard Preview](#-dashboard-preview)
- [Key Insights](#-key-insights)
- [Example SQL Queries](#-example-sql-queries)
- [Project Structure](#-project-structure)
- [Project Outcome](#-project-outcome)

---

# 📖 Project Overview
This project focuses on analyzing a retail sales dataset to uncover meaningful business insights related to:

- **Revenue**
- **Profit**
- **Orders**
- **Quantity Sold**
- **Category Performance**
- **Top Products**
- **Regional Contribution**
- **City-Level Revenue Trends**
- **Monthly Sales Performance**

The project was built as a **portfolio-ready data analytics project** to showcase practical skills in:

- **Python** for data cleaning and exploratory data analysis
- **SQL** for solving business questions and validating insights
- **Power BI** for building an interactive executive sales dashboard

The final deliverable is a **Sales Performance Dashboard** that provides a high-level view of business performance and supports data-driven decision-making.

---

# 🎯 Business Objectives
The dashboard and analysis were designed to answer the following business questions:

1. What is the **total revenue**, **profit**, and **profit margin**?
2. How many **orders** were placed and how much **quantity** was sold?
3. Which **product categories** generate the highest revenue?
4. Which **products** are the top contributors to sales?
5. Which **regions** contribute the most revenue?
6. Which **cities** are the highest revenue-generating locations?
7. How does revenue change over time based on **monthly sales trends**?

---

# 🛠️ Tools & Technologies

| Tool / Technology | Purpose |
|------------------|---------|
| **Python (Pandas, NumPy, Matplotlib)** | Data cleaning, preprocessing, exploratory data analysis |
| **SQL (PostgreSQL)** | Business analysis, aggregations, KPI validation |
| **Power BI** | Dashboard development, KPI cards, DAX measures, interactivity |
| **CSV / Excel** | Dataset source |

---

# 📂 Project Workflow

## **1. Data Cleaning & Preparation (Python)**
The dataset was first cleaned and transformed using **Python** to make it analysis-ready.

### Tasks performed:
- Checked dataset structure and column data types
- Converted `order_date` into proper date format
- Standardized column names for consistency
- Reviewed null values and inconsistencies
- Validated key business columns such as:
  - `total_sales`
  - `profit`
  - `quantity`
  - `category`
  - `product`
  - `city`
  - `region`
- Prepared a clean dataset for SQL analysis and Power BI reporting

---

## **2. Exploratory Data Analysis (EDA)**
Performed exploratory analysis in Python to understand patterns in the data and identify business trends.

### EDA focused on:
- Revenue and profit distribution
- Sales performance by category
- Top-selling products by revenue
- Region-wise contribution
- City-level sales analysis
- Monthly revenue trend
- Order and quantity performance

---

## **3. SQL Analysis**
SQL was used to answer business questions and validate the metrics used in the Power BI dashboard.

### SQL analysis covered:
- Total Revenue
- Total Profit
- Total Orders
- Quantity Sold
- Profit Margin
- Monthly Sales Trend
- Sales by Category
- Top 5 Products by Revenue
- Sales by Region
- Top 5 Cities by Revenue

---

## **4. Power BI Dashboard**
A fully interactive **Sales Performance Dashboard** was built in Power BI to present business insights in a clear and visual format.

### Dashboard components:
- KPI cards for:
  - **Total Revenue**
  - **Total Profit**
  - **Total Orders**
  - **Quantity Sold**
  - **Profit Margin**
- **Monthly Sales Trend** line chart
- **Sales by Category** chart
- **Top 5 Products by Revenue**
- **Sales by Region** donut chart
- **Top 5 Cities by Revenue**
- Interactive slicers for:
  - Date
  - Category
  - Sales Channel
  - Payment Method
- **Clear Filters** button using bookmarks

---

# 📊 Dashboard KPIs

| KPI | Value |
|-----|------:|
| **Total Revenue** | **$30.10M** |
| **Total Profit** | **$7.45M** |
| **Total Orders** | **4.94K** |
| **Quantity Sold** | **28.40K** |
| **Profit Margin** | **24.74%** |

---

# 🖼️ Dashboard Preview
<img width="602" height="335" alt="Sales_Dashboard" src="https://github.com/user-attachments/assets/f9e1cba9-f6ea-423b-9343-fb938af5fa6c" />

# 🔍 Key Insights

- **Electronics** is the highest revenue-generating category, contributing the largest share of total sales among all product categories.
- **Top-performing products** such as **Printer, Mouse, Smartwatch, Tablet, and Smartphone** generate a significant portion of total revenue.
- The **East region** contributes the highest revenue compared to other regions, making it the strongest performing region in the dataset.
- The **monthly sales trend** shows fluctuations across 2024–2025, helping identify stronger and weaker sales periods over time.
- City-level analysis highlights a few high-performing cities such as **Tucson, Las Vegas, Spokane, Oakland, and Boise** as major revenue contributors.
- The dashboard reveals a healthy **profit margin of 24.74%**, indicating strong profitability relative to total sales.
- Combining category, product, region, and city-level insights helps provide a complete view of overall business performance.

# 🧮 Example SQL Queries

The complete SQL analysis used in this project is available in:

```text
sql/sales_analysis_queries.sql
```

Below are a few sample queries used to calculate key business metrics.

## 1) Total Revenue
```sql
SELECT ROUND(SUM(total_sales), 2) AS total_revenue
FROM sales_data;
```

## 2) Profit Margin
```sql
SELECT ROUND((SUM(profit) / SUM(total_sales)) * 100, 2) AS profit_margin
FROM sales_data;
```

## 3) Monthly Sales Trend
```sql
SELECT 
    TO_CHAR(order_date, 'Mon YYYY') AS month_year,
    ROUND(SUM(total_sales), 2) AS revenue
FROM sales_data
GROUP BY TO_CHAR(order_date, 'Mon YYYY'), DATE_TRUNC('month', order_date)
ORDER BY DATE_TRUNC('month', order_date);
```

# 📁 Project Structure

```text
sales-performance-dashboard-powerbi-sql-python/
├── data/
│   └── sales_data.csv
├── python/
│   └── sales_data_cleaning_eda.ipynb
├── sql/
│   └── sales_analysis_queries.sql
├── powerbi/
│   └── Sales_Performance_Dashboard.pbix
├── dashboard_screenshot.png
└── README.md
```

🚀 **Project Outcome**

This project demonstrates a complete end-to-end data analytics workflow using Python, SQL, and Power BI.

Through this project, raw sales data was transformed into meaningful business insights by:

cleaning and preparing the dataset using Python
performing exploratory analysis to identify trends and patterns
writing SQL queries to answer key business questions and validate KPIs
building an interactive Power BI dashboard to track revenue, profit, orders, product performance, regional contribution, and monthly sales trends

