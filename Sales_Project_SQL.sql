CREATE TABLE sales_data (
    order_id VARCHAR(20),
    order_date DATE,
    customer_name VARCHAR(255),
    city VARCHAR(100),
    region VARCHAR(100),
    product VARCHAR(255),
    category VARCHAR(100),
    quantity NUMERIC(10,2),
    unit_price NUMERIC(10,2),
    discount_percent NUMERIC(10,2),
    total_sales NUMERIC(12,2),
    profit NUMERIC(12,2),
    payment_method VARCHAR(100),
    sales_channel VARCHAR(100),
    sales_rep VARCHAR(255)
);

select * from sales_data;

-- Total Revenue
SELECT SUM(total_sales) FROM sales_data;

-- Total Profit
SELECT SUM(profit) FROM sales_data;

-- Total Sales
SELECT SUM(total_sales) AS total_revenue FROM sales_data;

-- Total Profit
SELECT SUM(profit) AS total_profit FROM sales_data;

-- Total Orders
SELECT COUNT(*) AS total_orders FROM sales_data;

-- Top 10 Products by Sales
SELECT
    product,
    SUM(total_sales) AS revenue
FROM sales_data
GROUP BY product
ORDER BY revenue DESC
LIMIT 10;

-- Sales by Category
SELECT
    category,
    SUM(total_sales) AS revenue
FROM sales_data
GROUP BY category
ORDER BY revenue DESC;

-- Profit by Category
SELECT
    category,
    SUM(profit) AS profit
FROM sales_data
GROUP BY category
ORDER BY profit DESC;

-- Sales by Region
SELECT
    region,
    SUM(total_sales) AS revenue
FROM sales_data
GROUP BY region
ORDER BY revenue DESC;

-- Top Cities by Revenue
SELECT
    city,
    SUM(total_sales) AS revenue
FROM sales_data
GROUP BY city
ORDER BY revenue DESC
LIMIT 10;

-- Monthly Sales Trend
SELECT
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(total_sales) AS revenue
FROM sales_data
GROUP BY month
ORDER BY month;

-- Monthly Profit Trend
SELECT
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(profit) AS profit
FROM sales_data
GROUP BY month
ORDER BY month;

-- Best Payment Method
SELECT
    payment_method,
    COUNT(*) AS orders
FROM sales_data
GROUP BY payment_method
ORDER BY orders DESC;

-- Sales Channel Performance
SELECT
    sales_channel,
    SUM(total_sales) AS revenue,
    SUM(profit) AS profit
FROM sales_data
GROUP BY sales_channel;

-- Top 10 Sales Representatives
SELECT
    sales_rep,
    SUM(total_sales) AS revenue
FROM sales_data
GROUP BY sales_rep
ORDER BY revenue DESC
LIMIT 10;

-- Top 10 Products by Revenue
SELECT
    product,
    SUM(total_sales) AS total_revenue
FROM sales_data
GROUP BY product
ORDER BY total_revenue DESC
LIMIT 10;

-- Top 10 Products by Profit
SELECT
    product,
    SUM(profit) AS total_profit
FROM sales_data
GROUP BY product
ORDER BY total_profit DESC
LIMIT 10;

-- Average Order Value
SELECT
    ROUND(AVG(total_sales),2) AS avg_order_value
FROM sales_data;

-- Highest Discount Products
SELECT
    product,
    ROUND(AVG(discount_percent),2) AS avg_discount
FROM sales_data
GROUP BY product
ORDER BY avg_discount DESC;

-- Rank products by sales
SELECT
    product,
    SUM(total_sales) AS revenue,
    RANK() OVER(
        ORDER BY SUM(total_sales) DESC
    ) AS product_rank
FROM sales_data
GROUP BY product;

-- Running Revenue
SELECT
order_date,
SUM(total_sales) OVER(
ORDER BY order_date
) AS running_sales
FROM sales_data;

-- Revenue Contribution %
SELECT product,
ROUND(
SUM(total_sales)*100/
(SUM(SUM(total_sales)) OVER()),
2
) AS revenue_percent FROM sales_data
GROUP BY product;

-- Top Product in Each Category
WITH cte AS (
SELECT category, product,
SUM(total_sales) revenue,
RANK() OVER(PARTITION BY category ORDER BY SUM(total_sales) DESC) rnk
FROM sales_data
GROUP BY category,product
)
SELECT * FROM cte
WHERE rnk=1;


















