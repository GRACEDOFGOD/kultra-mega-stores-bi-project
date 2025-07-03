--3. Total sales of appliances in Ontario
SELECT 
    SUM(Sales) AS TotalSales_Appliances_Ontario
FROM [KMS Sql Case Study]
WHERE 
    Product_Category = 'Appliances' 
    AND Province = 'Ontario';

