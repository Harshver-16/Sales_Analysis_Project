-- Create the SalesData table
CREATE TABLE SalesData (
    TransactionID INT PRIMARY KEY,
    Date DATE,
    CustomerID VARCHAR(20),
    Gender VARCHAR(10),
    Age INT,
    ProductCategory VARCHAR(100),
    Quantity INT,
    PricePerUnit DECIMAL(10, 2),
    TotalAmount DECIMAL(12, 2),
    Month VARCHAR(10),
    Day VARCHAR(10),
    Year INT
);

-- 1. Calculate total revenue
SELECT SUM(TotalAmount) AS Total_Revenue
FROM SalesData;

-- 2. Calculate revenue per month (sorted by month name descending)
SELECT Month, SUM(TotalAmount) AS Revenue
FROM SalesData
GROUP BY Month
ORDER BY 
  CASE Month
    WHEN 'Jan' THEN 1
    WHEN 'Feb' THEN 2
    WHEN 'Mar' THEN 3
    WHEN 'Apr' THEN 4
    WHEN 'May' THEN 5
    WHEN 'Jun' THEN 6
    WHEN 'Jul' THEN 7
    WHEN 'Aug' THEN 8
    WHEN 'Sep' THEN 9
    WHEN 'Oct' THEN 10
    WHEN 'Nov' THEN 11
    WHEN 'Dec' THEN 12
    ELSE 13
  END;

-- 3. Top 5 product categories by total revenue
SELECT ProductCategory, SUM(TotalAmount) AS Revenue
FROM SalesData
GROUP BY ProductCategory
ORDER BY Revenue DESC
LIMIT 5;

-- 4. Total revenue by gender
SELECT Gender, ROUND(SUM(TotalAmount)) AS Revenue
FROM SalesData
GROUP BY Gender;

-- 5. Age group-based customer count and revenue
SELECT 
  CASE 
    WHEN Age < 20 THEN 'Teen'
    WHEN Age BETWEEN 20 AND 29 THEN '20s'
    WHEN Age BETWEEN 30 AND 39 THEN '30s'
    WHEN Age BETWEEN 40 AND 49 THEN '40s'
    ELSE '50+'
  END AS AgeGroup,
  COUNT(*) AS CustomerCount,
  SUM(TotalAmount) AS Revenue
FROM SalesData
GROUP BY AgeGroup;

-- 6. Average quantity sold per product category
SELECT ProductCategory, AVG(Quantity) AS AvgQuantity
FROM SalesData
GROUP BY ProductCategory;

-- 7. Number of transactions by day of the week
SELECT Day, COUNT(*) AS Transactions
FROM SalesData
GROUP BY Day
ORDER BY Day DESC;

-- 8. Monthly revenue sorted by calendar month order
SELECT Month, SUM(TotalAmount) AS Revenue
FROM SalesData
GROUP BY Month
ORDER BY 
  CASE Month
    WHEN 'Jan' THEN 1
    WHEN 'Feb' THEN 2
    WHEN 'Mar' THEN 3
    WHEN 'Apr' THEN 4
    WHEN 'May' THEN 5
    WHEN 'Jun' THEN 6
    WHEN 'Jul' THEN 7
    WHEN 'Aug' THEN 8
    WHEN 'Sep' THEN 9
    WHEN 'Oct' THEN 10
    WHEN 'Nov' THEN 11
    WHEN 'Dec' THEN 12
    ELSE 13
  END;

-- 9. Top 5 most frequent customers by number of transactions
SELECT CustomerID, COUNT(*) AS Transactions, SUM(TotalAmount) AS TotalSpent
FROM SalesData
GROUP BY CustomerID
ORDER BY Transactions DESC
LIMIT 5;

-- 10. Top 5 highest-spending customers
SELECT CustomerID, SUM(TotalAmount) AS TotalSpent
FROM SalesData
GROUP BY CustomerID
ORDER BY TotalSpent DESC
LIMIT 5;

-- 11. Most sold product categories (by total quantity)
SELECT ProductCategory, SUM(Quantity) AS TotalUnitsSold
FROM SalesData
GROUP BY ProductCategory
ORDER BY TotalUnitsSold DESC;

-- 12. Average monthly revenue
SELECT Month, AVG(TotalAmount) AS AvgRevenue
FROM SalesData
GROUP BY Month
ORDER BY Month DESC;

-- 13. Average purchase amount by gender
SELECT Gender, AVG(TotalAmount) AS AvgPurchase
FROM SalesData
GROUP BY Gender;

-- 14. Top 5 days of the week by total sales
SELECT Day, SUM(TotalAmount) AS TotalSales
FROM SalesData
GROUP BY Day
ORDER BY TotalSales DESC
LIMIT 5;

-- 15. Age group analysis: transactions, total spent, and average spent
SELECT 
  CASE 
    WHEN Age BETWEEN 18 AND 25 THEN '18-25'
    WHEN Age BETWEEN 26 AND 35 THEN '26-35'
    WHEN Age BETWEEN 36 AND 45 THEN '36-45'
    ELSE '46+'
  END AS AgeGroup,
  COUNT(*) AS Transactions,
  SUM(TotalAmount) AS TotalSpent,
  AVG(TotalAmount) AS AvgSpent
FROM SalesData
GROUP BY AgeGroup;
