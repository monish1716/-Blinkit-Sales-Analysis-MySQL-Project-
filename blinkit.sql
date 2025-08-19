CREATE DATABASE BLINKIT_DB;
USE BLINKIT_DB;

SELECT * FROM BLINKIT;

SELECT COUNT(*) FROM BLINKIT;

#for cleaning the data

UPDATE BLINKIT
SET Item_Fat_Content =
CASE 
WHEN Item_Fat_Content IN ('LF','low fat') THEN 'Low Fat'
WHEN Item_Fat_Content = 'reg' THEN 'Regular'
ELSE Item_Fat_Content
END;

SELECT DISTINCT(Item_fat_content) FROM BLINKIT;

# Total Sales: The overall revenue generated from all items sold

SELECT SUM(Total_Sales)AS total_sales FROM blinkit;

#(if answer u want is in millions)

SELECT CAST(SUM(total_sales)/1000000 AS DECIMAL(10,2)) AS Total_Sales_Millions 
FROM blinkit;

#sum of sales for low fat or regular
SELECT CAST(SUM(total_sales)/1000000 AS DECIMAL(10,2)) AS Total_Sales_Millions 
FROM blinkit
WHERE ITEM_FAT_CONTENT = 'LOW FAT';

#sum of sales according to year

SELECT CAST(SUM(total_sales)/1000000 AS DECIMAL(10,2)) AS Total_Sales_Millions 
FROM blinkit
WHERE Outlet_Establishment_Year = 2022;

#Average Sales: The average revenue per sale
SELECT AVG(TOTAL_SALES) AS AVG_SALES FROM BLINKIT;

#TO ROUND OFF THE ANSWER
SELECT CAST(AVG(TOTAL_SALES) AS DECIMAL(10,0)) AS AVG_SALES  FROM BLINKIT;


#Number of Items: The total count of different items sold.
SELECT COUNT(*) AS NUMBER_OF_ITEMS  FROM BLINKIT;


#Average Rating: The average customer rating for items sold. 
SELECT cast(avg(RATING)AS decimal(10,2)) AS AVG_Rating from blinkit;

# Total Sales by Fat Content

SELECT ITEM_FAT_CONTENT,
 CAST(SUM(TOTAL_SALES)AS DECIMAL(10,2)) AS TOTAL_SALES
FROM blinkit
GROUP BY ITEM_FAT_CONTENT
ORDER BY TOTAL_SALES DESC ;

# Total Sales ,AVG SALES,NUMBER_OF_ITEM,AVG RATING by Fat Content
SELECT ITEM_FAT_CONTENT,
	CAST(SUM(TOTAL_SALES)/1000 AS DECIMAL(10,2)) AS TOTAL_SALES_THOUSANDS,
	CAST(AVG(TOTAL_SALES) AS DECIMAL(10,0)) AS AVG_SALES,
	COUNT(*) AS NUMBER_OF_ITEM,
	cast(avg(RATING)AS decimal(10,2))AS AVG_RATING
FROM blinkit
GROUP BY ITEM_FAT_CONTENT
ORDER BY TOTAL_SALES_THOUSANDS DESC ;

# Total Sales ,AVG SALES,NUMBER_OF_ITEM,AVG RATING by Fat Content with WHERE condition
SELECT ITEM_FAT_CONTENT,
 CAST(SUM(TOTAL_SALES)AS DECIMAL(10,2)) AS TOTAL_SALES,
 CAST(AVG(TOTAL_SALES) AS DECIMAL(10,0)) AS AVG_SALES,
 COUNT(*) AS NUMBER_OF_ITEM,
 cast(avg(RATING)AS decimal(10,2))AS AVG_RATING
FROM blinkit
WHERE Outlet_Establishment_Year=2020
GROUP BY ITEM_FAT_CONTENT
ORDER BY TOTAL_SALES DESC ;

#Total Sales by Item Type:

SELECT ITEM_TYPE,
	CAST(SUM(TOTAL_SALES) AS DECIMAL(10,2)) AS TOTAL_SALES,
	CAST(AVG(TOTAL_SALES) AS DECIMAL(10,0)) AS AVG_SALES,
	COUNT(*) AS NUMBER_OF_ITEM,
	cast(avg(RATING)AS decimal(10,2))AS AVG_RATING
FROM blinkit
GROUP BY ITEM_TYPE
ORDER BY TOTAL_SALES ASC
LIMIT 5;

#Fat Content by Outlet for Total Sales:\

SELECT Outlet_Location_Type,Item_Fat_Content,
	CAST(SUM(TOTAL_SALES) AS DECIMAL(10,2)) AS TOTAL_SALES
FROM blinkit
GROUP BY Outlet_Location_Type,Item_Fat_Content
ORDER BY TOTAL_SALES ASC;

#SECOND METHOD

#SELECT Outlet_Location_Type, 
#       ISNULL([Low Fat], 0) AS Low_Fat, 
#      ISNULL([Regular], 0) AS Regular
#FROM 
#(
#   SELECT Outlet_Location_Type, Item_Fat_Content, 
#         CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales
# FROM blinkit
#    GROUP BY Outlet_Location_Type, Item_Fat_Content
#) AS SourceTable
#PIVOT 
#(
#SUM(Total_Sales) 
#    FOR Item_Fat_Content IN ([Low Fat], [Regular])
#) AS PivotTable
#ORDER BY Outlet_Location_Type;


#Total Sales by Outlet Establishment:

SELECT OUTLET_ESTABLISHMENT_YEAR,
	CAST(SUM(TOTAL_SALES) AS DECIMAL(10,2)) AS TOTAL_SALES
FROM blinkit
GROUP BY OUTLET_ESTABLISHMENT_YEAR
ORDER BY OUTLET_ESTABLISHMENT_YEAR ASC;

#EXAMPLE 2 

SELECT OUTLET_ESTABLISHMENT_YEAR,
	CAST(SUM(TOTAL_SALES) AS DECIMAL(10,2)) AS TOTAL_SALES,
    CAST(AVG(TOTAL_SALES) AS DECIMAL(10,0)) AS AVG_SALES,
	COUNT(*) AS NUMBER_OF_ITEM,
    CAST(avg(RATING)AS decimal(10,2))AS AVG_RATING
FROM blinkit
GROUP BY OUTLET_ESTABLISHMENT_YEAR
ORDER BY OUTLET_ESTABLISHMENT_YEAR ASC; 

#Percentage of Sales by Outlet Size:

SELECT 
    Outlet_Size, 
    CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales,
    CAST((SUM(Total_Sales) * 100.0 / SUM(SUM(Total_Sales)) OVER()) AS DECIMAL(10,2)) AS Sales_Percentage
FROM blinkit
GROUP BY Outlet_Size
ORDER BY Total_Sales DESC;

#Sales by Outlet Location:

SELECT Outlet_Location_Type,
	CAST(SUM(TOTAL_SALES) AS DECIMAL(10,2)) AS TOTAL_SALES,
    CAST(AVG(TOTAL_SALES) AS DECIMAL(10,0)) AS AVG_SALES,
    CAST((SUM(Total_Sales) * 100.0 / SUM(SUM(Total_Sales)) OVER()) AS DECIMAL(10,2)) AS Sales_Percentage,
	COUNT(*) AS NUMBER_OF_ITEM,
    CAST(avg(RATING)AS decimal(10,2))AS AVG_RATING
FROM blinkit
GROUP BY Outlet_Location_Type
ORDER BY TOTAL_SALES DESC; 

#All Metrics by Outlet Type:

SELECT Outlet_Type,
	CAST(SUM(TOTAL_SALES) AS DECIMAL(10,2)) AS TOTAL_SALES,
    CAST(AVG(TOTAL_SALES) AS DECIMAL(10,0)) AS AVG_SALES,
    CAST((SUM(Total_Sales) * 100.0 / SUM(SUM(Total_Sales)) OVER()) AS DECIMAL(10,2)) AS Sales_Percentage,
	COUNT(*) AS NUMBER_OF_ITEM,
    CAST(avg(RATING)AS decimal(10,2))AS AVG_RATING
FROM blinkit
GROUP BY Outlet_Type
ORDER BY TOTAL_SALES DESC; 