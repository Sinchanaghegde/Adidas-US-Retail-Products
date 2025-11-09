/*===============================================================
  - Creates a clean workspace named 'adidas_analytics'
  - All tables and queries will run inside this schema
================================================================*/
CREATE DATABASE adidas_analytics;


/*===============================================================
  - Stores the Adidas product details
  - Matches structure of the uploaded CSV file (adidas_cleaned.csv)
================================================================*/
USE adidas_analytics;
SHOW TABLES;
CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    url TEXT,
    name VARCHAR(255),
    sku VARCHAR(50),
    selling_price FLOAT,
    original_price FLOAT,
    currency VARCHAR(10),
    availability VARCHAR(50),
    color VARCHAR(50),
    category VARCHAR(100),
    source VARCHAR(100),
    average_rating FLOAT,
    reviews_count INT,
    discount_percent FLOAT,
    price_range VARCHAR(20),
    rating_level VARCHAR(20),
    review_popularity VARCHAR(20)
);

/*===============================================================
  - Make sure the CSV file is placed inside the MySQL Uploads folder
  - This command imports all product data into the 'products' table.
================================================================*/
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/adidas_cleaned.csv'
INTO TABLE products
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
IGNORE 1 ROWS
(url, name, sku, selling_price, original_price, currency, availability, color, category,
 source, average_rating, reviews_count, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, crawled_at);
 
 /*---------------------------------------------------------------
  A. PRICE RANGE DISTRIBUTION
  → Used for Donut Chart visualization in Power BI
----------------------------------------------------------------*/
SELECT 
  CASE 
    WHEN selling_price < 50 THEN 'Low ($0–$50)'
    WHEN selling_price BETWEEN 50 AND 100 THEN 'Medium ($50–$100)'
    WHEN selling_price BETWEEN 100 AND 150 THEN 'High ($100–$150)'
    ELSE 'Premium ($150+)' 
  END AS Price_Range,
  COUNT(*) AS Total_Products
FROM adidas_cleaned
WHERE selling_price IS NOT NULL
GROUP BY 
  CASE 
    WHEN selling_price < 50 THEN 'Low ($0–$50)'
    WHEN selling_price BETWEEN 50 AND 100 THEN 'Medium ($50–$100)'
    WHEN selling_price BETWEEN 100 AND 150 THEN 'High ($100–$150)'
    ELSE 'Premium ($150+)' 
  END
ORDER BY Total_Products DESC;


/*---------------------------------------------------------------
  B. REVENUE (PROXY) BY CATEGORY
  → Helps identify high-value categories (Clustered Column Chart)
----------------------------------------------------------------*/
SELECT 
  category,
  COUNT(name) AS Product_Count,
  SUM(selling_price * reviews_count) AS Total_Revenue_Proxy
FROM adidas_cleaned
GROUP BY category
ORDER BY Total_Revenue_Proxy DESC;


/*---------------------------------------------------------------
  C. MONTHLY PRICE TREND
  → For Line Chart visualization showing price fluctuation
----------------------------------------------------------------*/
SELECT 
  DATE_FORMAT(crawled_at, '%Y-%m') AS Month,
  ROUND(AVG(selling_price), 2) AS Avg_Selling_Price
FROM adidas_cleaned
GROUP BY Month
ORDER BY Month;


/*---------------------------------------------------------------
  D. TOP 5 PRODUCTS BY REVENUE
  → Displayed in Table Visual (sorted by Total Revenue Proxy)
----------------------------------------------------------------*/
SELECT 
  name,
  category,
  selling_price,
  average_rating,
  (selling_price * reviews_count) AS Total_Revenue_Proxy,
  RANK() OVER (ORDER BY (selling_price * reviews_count) DESC) AS Product_Revenue_Rank
FROM adidas_cleaned
LIMIT 5;


/*---------------------------------------------------------------
  E. AVERAGE SELLING PRICE BY CATEGORY
  → Used in Bar Chart or KPI comparison
----------------------------------------------------------------*/
SELECT 
    category,
    ROUND(AVG(selling_price), 2) AS avg_selling_price
FROM adidas_cleaned 
GROUP BY category
ORDER BY avg_selling_price DESC;


/*---------------------------------------------------------------
  F. TOP REVIEWED PRODUCTS
  → For customer popularity insight
----------------------------------------------------------------*/
SELECT 
    name,
    category,
    reviews_count,
    average_rating
FROM adidas_cleaned 
ORDER BY reviews_count DESC
LIMIT 10;


/*---------------------------------------------------------------
  G. CATEGORY-WISE RATING AND PRODUCT VOLUME
  → Used for bubble or comparison chart
----------------------------------------------------------------*/
SELECT 
    category,
    ROUND(AVG(discount_percent), 2) AS avg_discount
FROM adidas_cleaned 
GROUP BY category
ORDER BY avg_discount DESC;


/*---------------------------------------------------------------
  H. PRODUCT AVAILABILITY SUMMARY
  → For Slicer or KPI cards showing stock levels
----------------------------------------------------------------*/
SELECT 
    availability, COUNT(*) AS total_products
FROM products 
GROUP BY availability;


SELECT 
    color,
    COUNT(*) AS product_count
FROM adidas_cleaned 
GROUP BY color
ORDER BY product_count DESC
LIMIT 10;

SELECT 
    category,
    ROUND(AVG(average_rating), 2) AS avg_rating,
    COUNT(*) AS total_products
FROM adidas_cleaned 
GROUP BY category
ORDER BY avg_rating DESC;

SELECT 
    CASE 
        WHEN discount_percent < 10 THEN 'Low Discount'
        WHEN discount_percent BETWEEN 10 AND 30 THEN 'Medium Discount'
        ELSE 'High Discount'
    END AS discount_level,
    ROUND(AVG(average_rating), 2) AS avg_rating,
    COUNT(*) AS product_count
FROM adidas_cleaned 
GROUP BY discount_level
ORDER BY avg_rating DESC;

SELECT 
    availability, COUNT(*) AS total_products
FROM adidas_cleaned 
GROUP BY availability;

SELECT 
    name,
    category,
    crawled_at
FROM adidas_cleaned 
ORDER BY crawled_at DESC
LIMIT 10;

SELECT 
    name,
    category,
    average_rating,
    reviews_count
FROM adidas_cleaned 
WHERE average_rating >= 4.5
ORDER BY reviews_count DESC
LIMIT 10;

SELECT 
    CASE 
        WHEN selling_price < 50 THEN 'Low'
        WHEN selling_price BETWEEN 50 AND 100 THEN 'Medium'
        WHEN selling_price BETWEEN 100 AND 200 THEN 'High'
        ELSE 'Premium'
    END AS price_range,
    COUNT(*) AS total_products
FROM adidas_cleaned 
GROUP BY price_range
ORDER BY total_products DESC;

SELECT
    COUNT(*) AS total_products,
    ROUND(AVG(selling_price), 2) AS avg_price,
    ROUND(AVG(average_rating), 2) AS avg_rating,
    ROUND(AVG(discount_percent), 2) AS avg_discount
FROM adidas_cleaned ;


SHOW TABLES;
SELECT * FROM adidas_cleaned LIMIT 10;
SHOW DATABASES;













