SQL Queries

SELECT * FROM sales;

SELECT COUNT(*) FROM sales;

PRAGMA table_info(sales);


--1. Total Sales & Total Profit (KPI)
SELECT 
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM sales;

--2. Sales by Category


SELECT 
    category,
    SUM(sales) AS total_sales
FROM sales
GROUP BY category
ORDER BY total_sales DESC;

--3. Sales by Region

SELECT 
    region,
    SUM(sales) AS total_sales
FROM sales
GROUP BY region
ORDER BY total_sales DESC;

--4. Top 10 Customers by Sales

SELECT 
    customer_name,
    SUM(sales) AS total_sales
FROM sales
GROUP BY customer_name
ORDER BY total_sales DESC
LIMIT 10;

--5. Top 10 Products by Sales

SELECT 
    product_name,
    SUM(sales) AS total_sales
FROM sales
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 10;


--6. Loss-Making Orders
SELECT *
FROM sales
WHERE profit < 0;


--7. Number of Loss-Making Orders
SELECT COUNT(*) AS loss_orders
FROM sales
WHERE profit < 0;


--8. Average Discount by Category

SELECT 
    category,
    AVG(discount) AS avg_discount
FROM sales
GROUP BY category;

--9. Monthly Sales Trend
SELECT 
    strftime('%Y-%m', order_date) AS month,
    SUM(sales) AS total_sales
FROM sales
GROUP BY month
ORDER BY month;


--10. Profit Margin
SELECT 
    ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_margin_percentage
FROM sales;



