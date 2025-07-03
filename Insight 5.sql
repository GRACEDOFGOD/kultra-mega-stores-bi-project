--Shipping method with the highest cost
SELECT 
    Ship_Mode, 
    SUM(Shipping_Cost) AS TotalShippingCost
FROM [KMS Sql Case Study]
GROUP BY Ship_Mode
ORDER BY TotalShippingCost DESC;
