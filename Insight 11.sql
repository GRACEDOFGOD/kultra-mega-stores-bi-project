SELECT 
    Order_Priority,
    Ship_Mode,
    COUNT(*) AS OrderCount,
    SUM(Shipping_Cost) AS TotalShippingCost,
    AVG(Shipping_Cost) AS AvgShippingCost
FROM [KMS Sql Case Study]
GROUP BY Order_Priority, Ship_Mode
ORDER BY Order_Priority, TotalShippingCost DESC;

--From insight five delivery cost might be slower but it is stil the most expensive shipping mode
--It is advisabe to use regular air normally because its it is the most used and it it not as costly as the delivery cost yet ver effective
--Hence to have maximum profit i ths company it is more advisable to alwasy use Regular air Shipping mode becaus its faster and less cost than oher modes, which coud only mean one thing: Maximum profit!
--Thank you
