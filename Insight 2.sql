--2. Top 3 and Bottom 3 regions by sales--
SELECT TOP 3 
    Region, 
    SUM(Sales) AS TotalSales
FROM [KMS Sql Case Study]
GROUP BY Region
ORDER BY TotalSales DESC;

-- Bottom 3
SELECT TOP 3 
    Region, 
    SUM(Sales) AS TotalSales
FROM [KMS Sql Case Study]
GROUP BY Region
ORDER BY TotalSales ASC;
