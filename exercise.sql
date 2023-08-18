USE littlelemondm;
CREATE VIEW OrdersView AS SELECT Orders.OrderID, Orders.Qunatity, Orders.BillAmount AS 'Cost'
FROM Orders WHERE Orders.Qunatity >= 2;
SELECT * FROM OrdersView;
SELECT MenuItems.ItemID, Customers.CustomerID, Customers.CustomerName AS 'FullName', Orders.OrderID, Orders.BillAmount AS Cost, MenuItems.CourseName 
FROM Menu  JOIN MenuItems ON Menu.ItemID = MenuItems.ItemID 
LEFT JOIN Orders ON Menu.MenuID = Orders.MenuID LEFT JOIN Bookings ON Bookings.BookingID = Orders.BookingID
LEFT JOIN Customers ON Bookings.CustomerID = Customers.CustomerID WHERE Orders.BillAmount >= 150;
SELECT MenuItems.CourseName, Menu.Cuisine FROM Menu INNER JOIN MenuItems ON Menu.ItemID = MenuItems.ItemID 
WHERE MenuID = ANY ( SELECT MenuID FROM Orders WHERE Quantity >=2)
DELIMITER //
DROP PROCEDURE IF EXISTS GetMaxQuantity//
CREATE PROCEDURE GetMaxQuantity()
BEGIN 
SELECT MAX(Quantity) AS 'MAX Qunatity in Order' FROM Orders;
END//
DELIMITER ;
CALL GetMaxQuantity();
PREPARE GetOrderDetail FROM 'SELECT OrderID, Quantity, BillAmount AS "Cost" 
FROM Orders INNER JOIN Bookings ON Orders.BookingID = Bookings.BookingID WHERE Bookings.CustomerID = ?';
SET @id = 16;
EXECUTE GetOrderDetail USING @id;
DELIMITER //
DROP PROCEDURE IF EXISTS CancelOrder//
CREATE PROCEDURE CancelOrder(IN orderid INT)
BEGIN 
DELETE FROM Orders WHERE OrderID = orderid;
END //
DELIMITER ;
CALL CancelOrder(5);