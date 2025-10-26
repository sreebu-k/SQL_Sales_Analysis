CREATE DATABASE amazon_sales_db;
USE amazon_sales_db;

SELECT * FROM amazon_sales_db.`amazon_sales_data 2025`;

SELECT * FROM `amazon_sales_data 2025` LIMIT 10;

SELECT SUM(Quantity) AS total_quantity_sold
FROM `amazon_sales_data 2025`;

SELECT SUM(Quantity) AS total_quantity
FROM `amazon_sales_data 2025`
WHERE Category = 'Electronics';

SELECT Product, SUM(`Total Sales`) AS total_revenue
FROM `amazon_sales_data 2025`
GROUP BY Product
ORDER BY total_revenue DESC
LIMIT 5;

SELECT Category, SUM(`Total Sales`) AS total_revenue
FROM `amazon_sales_data 2025`
GROUP BY Category
ORDER BY total_revenue DESC;

-- Suppose customer_info table exists
SELECT a.`Order ID`, a.Product, a.`Total Sales`, c.`Customer Location`
FROM `amazon_sales_data 2025` AS a
INNER JOIN customer_info AS c
ON a.`Customer Name` = c.`Customer Name`;

SELECT Product, SUM(`Total Sales`) AS total_revenue
FROM `amazon_sales_data 2025`
GROUP BY Product
HAVING total_revenue > (
    SELECT AVG(`Total Sales`)
    FROM `amazon_sales_data 2025`
);

SELECT Category, ROUND(AVG(`Total Sales`),2) AS avg_order_value
FROM `amazon_sales_data 2025`
GROUP BY Category;

CREATE VIEW category_summary AS
SELECT Category,
       COUNT(DISTINCT `Order ID`) AS total_orders,
       SUM(Quantity) AS total_quantity,
       SUM(`Total Sales`) AS total_revenue,
       ROUND(AVG(`Total Sales`),2) AS avg_order_value
FROM `amazon_sales_data 2025`
GROUP BY Category;

SELECT * FROM category_summary;


