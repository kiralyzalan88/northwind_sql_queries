SELECT 
    c.CategoryName,
    (SELECT ProductName FROM Products p_inner WHERE p_inner.CategoryID = c.CategoryID ORDER BY p_inner.UnitPrice LIMIT 1) AS CheapestProduct,
    min(p.unitprice) AS MinCategoryPrice
FROM
    Categories AS c
        INNER JOIN
    Products AS p ON c.CategoryID = p.CategoryID
    group by CategoryName;