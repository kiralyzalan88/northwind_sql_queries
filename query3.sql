SELECT 
       `Orders`.`ShipName` AS `ShipName`,
       `Orders`.`ShipAddress` AS `ShipAddress`,
       `Orders`.`ShipCity` AS `ShipCity`,
       `Orders`.`ShipRegion` AS `ShipRegion`,
       `Orders`.`ShipPostalCode` AS `ShipPostalCode`,
       `Orders`.`ShipCountry` AS `ShipCountry`,
       `Orders`.`CustomerID` AS `CustomerID`,
       `Customers`.`CompanyName` AS `CustomerName`,
       `Customers`.`Address` AS `Address`,
       `Customers`.`City` AS `City`,
       `Customers`.`Region` AS `Region`,
       `Customers`.`PostalCode` AS `PostalCode`,
       `Customers`.`Country` AS `Country`,
       CONCAT(`Employees`.`FirstName`,
               ' ',
               `Employees`.`LastName`) AS `Salesperson`,
       `Orders`.`OrderID` AS `OrderID`,
       `Orders`.`OrderDate` AS `OrderDate`,
       `Orders`.`RequiredDate` AS `RequiredDate`,
       `Orders`.`ShippedDate` AS `ShippedDate`,
       `Shippers`.`CompanyName` AS `ShipperName`,
       `OrderDetails`.`ProductID` AS `ProductID`,
       `Products`.`ProductName` AS `ProductName`,
       `OrderDetails`.`UnitPrice` AS `UnitPrice`,
       `OrderDetails`.`Quantity` AS `Quantity`,
       `OrderDetails`.`Discount` AS `Discount`,
       ((((`OrderDetails`.`UnitPrice` * `OrderDetails`.`Quantity`) * (1 - `OrderDetails`.`Discount`)) / 100) * 100) AS `Total`,
       `Orders`.`Freight` AS `Freight`
   FROM
       (((((`Customers`
       JOIN `Orders` ON ((`Customers`.`CustomerID` = `Orders`.`CustomerID`)))
       JOIN `Employees` ON ((`Employees`.`EmployeeID` = `Orders`.`EmployeeID`)))
       JOIN `OrderDetails` ON ((`Orders`.`OrderID` = `OrderDetails`.`OrderID`)))
       JOIN `Products` ON ((`Products`.`ProductID` = `OrderDetails`.`ProductID`)))
       JOIN `Shippers` ON ((`Shippers`.`ShipperID` = `Orders`.`ShipVia`)))
   ORDER BY `Customers`.`CustomerID` , `Orders`.`OrderDate` , `Products`.`ProductID`;