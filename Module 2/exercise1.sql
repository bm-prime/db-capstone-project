USE littlelemondm;
-- Creating view [Task 1]
CREATE VIEW OrdersView AS SELECT Orders.OrderID, Orders.Qunatity, Orders.BillAmount AS 'Cost'
FROM Orders WHERE Orders.Qunatity >= 2;
SELECT * FROM OrdersView;
-- displaying all the orders with bill amount greater than 150  [Task 2]
SELECT MenuItems.ItemID, Customers.CustomerID, Customers.CustomerName AS 'FullName', Orders.OrderID, Orders.BillAmount AS Cost, MenuItems.CourseName 
FROM Menu  JOIN MenuItems ON Menu.ItemID = MenuItems.ItemID 
LEFT JOIN Orders ON Menu.MenuID = Orders.MenuID LEFT JOIN Bookings ON Bookings.BookingID = Orders.BookingID
LEFT JOIN Customers ON Bookings.CustomerID = Customers.CustomerID WHERE Orders.BillAmount >= 150;
-- displaying join of table with quantity greater than 2 [Task 3]
SELECT MenuItems.CourseName, Menu.Cuisine FROM Menu INNER JOIN MenuItems ON Menu.ItemID = MenuItems.ItemID 
WHERE MenuID = ANY ( SELECT MenuID FROM Orders WHERE Quantity >=2)
