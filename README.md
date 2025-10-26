CREATE DATABASE amazon_sales_db;
USE amazon_sales_db;

SELECT * FROM amazon_sales_db.`amazon_sales_data 2025`;

SELECT * FROM `amazon_sales_data 2025` LIMIT 10;

<img width="1136" height="166" alt="image" src="https://github.com/user-attachments/assets/4c485114-5df2-4431-aea8-4c1e7f275cf3" />

SELECT SUM(Quantity) AS total_quantity_sold
FROM `amazon_sales_data 2025`;

<img width="211" height="66" alt="image" src="https://github.com/user-attachments/assets/d95179c6-a844-42b9-ab03-5993dcfcbdcf" />

SELECT SUM(Quantity) AS total_quantity
FROM `amazon_sales_data 2025`
WHERE Category = 'Electronics';

<img width="179" height="66" alt="image" src="https://github.com/user-attachments/assets/778fbbfa-8112-41ee-9cb5-8418d732f7ce" />

--?the top 5 highest-grossing products

SELECT Product, SUM(`Total Sales`) AS total_revenue
FROM `amazon_sales_data 2025`
GROUP BY Product
ORDER BY total_revenue DESC
LIMIT 5;

<img width="324" height="183" alt="image" src="https://github.com/user-attachments/assets/52068f99-8089-4f14-bafb-ea089bc78723" />


--?identify which categories contribute most to overall sales.

SELECT Category, SUM(`Total Sales`) AS total_revenue
FROM `amazon_sales_data 2025`
GROUP BY Category
ORDER BY total_revenue DESC;

<img width="318" height="195" alt="image" src="https://github.com/user-attachments/assets/1208fe9b-957d-4577-bd11-c6c63e15e2b0" />

-- Suppose customer_info table exists
SELECT a.`Order ID`, a.Product, a.`Total Sales`, c.`Customer Location`
FROM `amazon_sales_data 2025` AS a
INNER JOIN customer_info AS c
ON a.`Customer Name` = c.`Customer Name`;


--?identifying top-performing products.

SELECT Product, SUM(`Total Sales`) AS total_revenue
FROM `amazon_sales_data 2025`
GROUP BY Product
HAVING total_revenue > (
    SELECT AVG(`Total Sales`)
    FROM `amazon_sales_data 2025`
);

<img width="331" height="192" alt="image" src="https://github.com/user-attachments/assets/62bb5261-f483-4ee4-823c-574a71ed1db2" />


--?identify which categories have higher average spending per order.

SELECT Category, ROUND(AVG(`Total Sales`),2) AS avg_order_value
FROM `amazon_sales_data 2025`
GROUP BY Category;

<img width="342" height="173" alt="image" src="https://github.com/user-attachments/assets/5133b267-f459-4a04-bb8d-0554654048b2" />


--?to get a ready summary table of category performance.

CREATE VIEW category_summary AS
SELECT Category,
       COUNT(DISTINCT `Order ID`) AS total_orders,
       SUM(Quantity) AS total_quantity,
       SUM(`Total Sales`) AS total_revenue,
       ROUND(AVG(`Total Sales`),2) AS avg_order_value
FROM `amazon_sales_data 2025`
GROUP BY Category;

SELECT * FROM category_summary;

<img width="714" height="166" alt="image" src="https://github.com/user-attachments/assets/dd5ee092-da53-4633-871e-bb69b3412cb5" />








