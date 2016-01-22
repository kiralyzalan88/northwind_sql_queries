SELECT o.OrderID, SUM((od.UnitPrice * od.Quantity * (1 - (od.Discount / 100)))) AS OrderTotal
FROM Orders AS o INNER JOIN OrderDetails AS od ON o.OrderID = od.OrderID GROUP BY o.OrderID
ORDER BY OrderID;