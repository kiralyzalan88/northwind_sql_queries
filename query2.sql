SELECT 
    City, CompanyName, ContactName, 'Customer' AS Relationship
FROM
    Customers 
UNION SELECT 
    City, CompanyName, ContactName, 'Supplier' AS Relationship
FROM
    Suppliers
ORDER BY City , ContactName;