# 📄 Blinkit Sales Analysis – Detailed Case Study

## 🟠 Problem
Blinkit, a leading quick-commerce grocery delivery platform, wanted to analyze its sales performance across products and outlets.  
The objective was to identify **high-performing categories**, evaluate **outlet efficiency**, and uncover **actionable insights** that could help optimize inventory, improve customer satisfaction, and drive sales growth.  

---

## 🟠 Data
- Source: Blinkit Grocery dataset (CSV file, ~8,500 rows)  
- Key columns:  
  - Item details: `Item_Type`, `Item_Fat_Content`, `Item_Identifier`, `Item_MRP`, `Item_Outlet_Sales`, `Item_Weight`  
  - Ratings: `Rating`  
  - Outlet details: `Outlet_Type`, `Outlet_Size`, `Outlet_Location_Type`, `Outlet_Establishment_Year`  

This dataset provided a balanced mix of **product attributes**, **customer feedback (ratings)**, and **outlet characteristics**, enabling both micro and macro-level analysis.  

---

## 🟠 Approach
1. **Data Cleaning**  
   - Standardized inconsistent values (e.g., “LF” → “Low Fat”).  
   - Checked for missing/null values.  

2. **KPI Analysis (SQL Queries)**  
   - Total Sales, Average Sales, Total Items, Average Rating.  

3. **Segmented Analysis**  
   - Sales by Fat Content, Item Type, Outlet Size, Location, Type, and Establishment Year.  

4. **Visualization**  
   - Exported key findings into dashboards/charts for business storytelling.  

---

## 🟠 Visuals
Below are three key visuals from the analysis:  

**1. KPI Overview**  
![KPI Dashboard](visuals/kpi_dashboard.png)  

**2. Sales by Outlet Type & Size**  
![Outlet Sales](visuals/outlet_sales.png)  

**3. Sales Contribution by Item Fat Content**  
![Fat Content Analysis](visuals/fat_content.png)  


---

## 🟠 Key Insights
- **Low Fat items** contribute ~60% of total sales, but **Standard Fat items** achieve higher average ratings.  
- **Medium-sized outlets** generate the highest sales, outperforming both small and large outlets.  
- Outlets established **before 2000** show declining sales performance compared to newer ones.  
- Tier 2 & Tier 3 locations contribute significantly, highlighting Blinkit’s penetration beyond metros.  

---

## 🟠 Business Actions
- **Promote Standard Fat items** with premium positioning to leverage high ratings.  
- **Use Medium-sized outlets** as the blueprint for expansion in new regions.  
- **Upgrade or relocate older outlets** to modernize operations and sustain sales.  
- **Boost marketing in Tier 2 & Tier 3 cities**, where demand is strong and growing.  

---

✅ This case study showcases how SQL + data analysis can uncover patterns in consumer demand and guide **data-driven decisions** for growth.
