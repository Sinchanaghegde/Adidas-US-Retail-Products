# 🏷️ Adidas Retail Analytics Dashboard (MySQL + Power BI)

This project demonstrates **Retail Analytics** using **MySQL** for data processing and **Power BI** for interactive dashboard visualization.  
It answers key business questions such as top-performing categories, customer insights, price segmentation, and overall product performance.

⚠️ **Note:** The Power BI dashboard is built using the **Adidas US Retail Products CSV dataset** (not a direct MySQL connection).

---

## 🚀 Project Workflow

### 🗄️ Database Creation (MySQL)
- Created **adidas_analytics** database.  
- Designed the **products** table with attributes like product name, category, price, discount, rating, color, and availability.  
- Loaded the cleaned CSV dataset into MySQL for data exploration and analysis.

---

### 🧠 SQL Analysis
Performed SQL-based analytics to extract business insights including:
- Price segmentation and product distribution  
- Top-selling categories and products  
- Average selling price and discount analysis  
- Customer behavior insights using review data  
- Revenue proxy calculations for business decisions  
- Key Performance Indicators (KPIs): Total Products, Avg Selling Price, Avg Rating, Total Revenue Proxy

---

### 📊 Power BI Dashboard (CSV Import)
Used the **adidas_cleaned.csv** dataset directly in Power BI.  
Developed an interactive and insight-driven dashboard that includes:

- 📌 **KPI Cards:** Total Products, Average Selling Price, Average Rating, Total Revenue (Proxy)  
- 💰 **Price Range Analysis (Donut Chart)**  
- 📈 **Monthly Price Trend (Line Chart)**  
- 🧩 **Category-wise Revenue (Clustered Column + Line Chart)**  
- 👥 **Customer Insight (Scatter Chart: Discount %, Rating, Revenue)**  
- 📋 **Product Details Table:** Displays top products by revenue proxy  
- 🎛️ **Slicers:** Category, Color, Availability, Price Range filters for easy interaction

---

## 📊 Dashboard Preview
![Dashboard Screenshot](<img width="862" height="493" alt="Screenshot (48)(1)" src="https://github.com/user-attachments/assets/3b75534b-cd44-4b9f-a32d-e435999d8c8a" />
)
"C:\Users\sinch\OneDrive\Pictures\Screenshots\Screenshot (48).png"

---

## 📂 Files in this Repository
- `sql_queries/adidas_analysis.sql` → All MySQL queries used for analysis  
- `powerbi_dashboard/adidas_dashboard.pbix` → Power BI dashboard file  
- `dataset/adidas_cleaned.csv` → Cleaned Adidas retail dataset  
- `README.md` → Complete project documentation  

---

## 🔑 Key Insights
- The **Medium ($50–$100)** price range had the most products.  
- **Shoes and Clothing** categories generated the highest sales proxy.  
- **Discounts** influenced customer engagement and reviews.  
- **Average rating** remained consistent across most price ranges.  
- The **Total Revenue Proxy** correlates strongly with review count and price.

---

## 🛠 Tech Stack
- **Database:** MySQL  
- **Visualization Tool:** Power BI (CSV Import)  
- **Language:** SQL  
- **Dataset:** Adidas US Retail Products Dataset  

---

## 📌 How to Run
1. Import the `adidas_cleaned.csv` dataset into MySQL using the provided table schema.  
2. Execute SQL queries from `sql_queries/adidas_analysis.sql` for insights.  
3. Open `adidas_dashboard.pbix` in Power BI Desktop.  
4. Load the CSV dataset and refresh visuals to view the dashboard.  

---

## 🧠 Business Insights
This dashboard enables Adidas to:
- Identify **top-selling categories and products**  
- Understand **price-performance relationships**  
- Measure **customer satisfaction via ratings**  
- Analyze the **impact of discounts on sales**  
- Support **data-driven marketing and pricing decisions**

---

## 👩‍💻 Author
**Name:** Sinchana Hegde
**Role:** Data Analyst | Power BI Developer  
**Skills:** MySQL, Power BI, Data Cleaning, SQL Analytics  
