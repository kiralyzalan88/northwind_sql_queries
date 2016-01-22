SELECT 
    c.CategoryName,
    p.ProductName,
    p.QuantityPerUnit,
    p.UnitsInStock
FROM
    Categories AS c
        INNER JOIN
    Products AS p ON c.CategoryID = p.CategoryID
WHERE
    p.UnitsInStock > 0 
GROUP BY CategoryName, ProductName;