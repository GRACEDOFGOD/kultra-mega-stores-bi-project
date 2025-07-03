SELECT TOP 10 
    Customer_Name, 
    SUM(Sales) AS TotalSales
FROM [KMS Sql Case Study]
GROUP BY Customer_Name
ORDER BY TotalSales ASC;

--This bottom customers can receive a special discount offers or promoton to encourage them to buy more products. Thank you
