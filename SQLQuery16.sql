--6. Most valuable customers and what they buy
-- Top 5 by profit
SELECT TOP 5 
    Customer_Name, 
    SUM(Profit) AS TotalProfit
FROM [KMS Sql Case Study]
GROUP BY Customer_Name
ORDER BY TotalProfit DESC;

-- What categories they buy
SELECT 
    Customer_Name,
    Product_Category,
    COUNT(*) AS PurchaseCount
FROM [KMS Sql Case Study]
WHERE Customer_Name IN (
    SELECT TOP 5 Customer_Name
    FROM [KMS Sql Case Study]
    GROUP BY Customer_Name
    ORDER BY SUM(Profit) DESC
)
GROUP BY Customer_Name, Product_Category
ORDER BY Customer_Name, PurchaseCount DESC;
