--Which consumer sustomer was  the most profited
SELECT TOP 1
    Customer_Name, 
    SUM(Profit) AS TotalProfit
FROM [KMS Sql Case Study]
WHERE Customer_Segment = 'Consumer'
GROUP BY Customer_Name
ORDER BY TotalProfit DESC;
