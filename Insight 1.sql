-- 1. Product category with the highest sales --
SELECT 
    Product_Category, 
    SUM(Sales) AS TotalSales
FROM [KMS Sql Case Study]
GROUP BY Product_Category
ORDER BY TotalSales DESC;

