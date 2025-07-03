--Customer with the highest order from 2009 t0 2012
SELECT TOP 2 
    Customer_Name, 
    COUNT(DISTINCT Order_ID) AS OrderCount
FROM [KMS Sql Case Study]
WHERE Customer_Segment = 'Corporate'
GROUP BY Customer_Name
ORDER BY OrderCount DESC;
