--Highest-sales small business customer
SELECT TOP 1 
    Customer_Name, 
    SUM(Sales) AS TotalSales
FROM [KMS Sql Case Study]
WHERE Customer_Segment = 'Small Business'
GROUP BY Customer_Name
ORDER BY TotalSales DESC;
