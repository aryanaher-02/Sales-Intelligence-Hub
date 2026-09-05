USE SalesIntelligence;

SELECT * FROM dbo.vw_KPI_Summary;
SELECT * FROM dbo.vw_KPI_Annual;
SELECT * FROM dbo.vw_KPI_Category;
SELECT * FROM dbo.vw_KPI_Region;


USE SalesIntelligence;
GO

-- Query 01: Show the first 10 rows.
SELECT TOP 10 *
FROM dbo.SalesData;
GO

-- Query 02: Count all rows.
SELECT COUNT(*) AS TotalRows
FROM dbo.SalesData;
GO

-- Query 03: Calculate total sales.
SELECT SUM(TotalSalesAmount) AS TotalSales
FROM dbo.SalesData;
GO

-- Query 04: Calculate total profit.
SELECT SUM(NetProfit) AS TotalProfit
FROM dbo.SalesData;
GO

-- Query 05: Count orders and customers.
SELECT
    COUNT(DISTINCT OrderID) AS TotalOrders,
    COUNT(DISTINCT CustomerID) AS TotalCustomers
FROM dbo.SalesData;
GO

-- Query 06: Calculate profit margin percentage.
SELECT
    SUM(NetProfit) * 100.0 / SUM(TotalSalesAmount) AS ProfitMarginPercent
FROM dbo.SalesData;
GO

-- Query 07: Calculate average order value.
SELECT
    SUM(TotalSalesAmount) / COUNT(DISTINCT OrderID) AS AverageOrderValue
FROM dbo.SalesData;
GO

-- Query 08: Sales and profit by year.
SELECT
    YEAR(OrderDate) AS OrderYear,
    SUM(TotalSalesAmount) AS TotalSales,
    SUM(NetProfit) AS TotalProfit
FROM dbo.SalesData
GROUP BY YEAR(OrderDate)
ORDER BY OrderYear;
GO

-- Query 09: Sales and profit by product category.
SELECT
    ProductCategory,
    SUM(TotalSalesAmount) AS TotalSales,
    SUM(NetProfit) AS TotalProfit
FROM dbo.SalesData
GROUP BY ProductCategory
ORDER BY TotalSales DESC;
GO

-- Query 10: Sales and profit by region.
SELECT
    RegionName,
    SUM(TotalSalesAmount) AS TotalSales,
    SUM(NetProfit) AS TotalProfit
FROM dbo.SalesData
GROUP BY RegionName
ORDER BY TotalSales DESC;
GO

-- Query 11: Sales by client segment.
SELECT
    ClientSegment,
    SUM(TotalSalesAmount) AS TotalSales
FROM dbo.SalesData
GROUP BY ClientSegment
ORDER BY TotalSales DESC;
GO

-- Query 12: Top 10 products by sales.
SELECT TOP 10
    ProductName,
    SUM(TotalSalesAmount) AS TotalSales
FROM dbo.SalesData
GROUP BY ProductName
ORDER BY TotalSales DESC;
GO

-- Query 13: Top 10 customers by sales.
SELECT TOP 10
    CustomerName,
    SUM(TotalSalesAmount) AS TotalSales
FROM dbo.SalesData
GROUP BY CustomerName
ORDER BY TotalSales DESC;
GO

-- Query 14: Top 10 states by sales.
SELECT TOP 10
    StateName,
    SUM(TotalSalesAmount) AS TotalSales
FROM dbo.SalesData
GROUP BY StateName
ORDER BY TotalSales DESC;
GO

-- Query 15: Orders and sales by shipping mode.
SELECT
    ShipMode,
    COUNT(DISTINCT OrderID) AS TotalOrders,
    SUM(TotalSalesAmount) AS TotalSales
FROM dbo.SalesData
GROUP BY ShipMode
ORDER BY TotalOrders DESC;
GO

-- Query 16: Monthly sales trend.
SELECT
    YEAR(OrderDate) AS OrderYear,
    MONTH(OrderDate) AS OrderMonth,
    SUM(TotalSalesAmount) AS TotalSales
FROM dbo.SalesData
GROUP BY YEAR(OrderDate), MONTH(OrderDate)
ORDER BY OrderYear, OrderMonth;
GO
