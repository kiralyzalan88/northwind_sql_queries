SELECT 
    YEAR(o.OrderDate) AS YearOfIncome,
    c.CategoryName,
    p.ProductName,
    SUM((od.UnitPrice * od.Quantity * ((1 - (od.Discount) / 100)))) AS ProductSale
FROM
    Categories AS c
        INNER JOIN
    Products AS p ON c.CategoryID = p.CategoryID
        INNER JOIN
    OrderDetails AS od ON p.ProductID = od.ProductID
        INNER JOIN
    Orders AS o ON od.OrderID = o.OrderID
GROUP BY YearOfIncome, p.ProductName
ORDER BY ProductName, YearOfIncome;