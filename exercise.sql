USE littlelemondm;
CREATE 'OrdersView' AS SELECT Orders.OrderID, Orders.Qunatity, Orders.BillAmount AS 'Cost'
FROM Orders WHERE Orders.Qunatity >= 2;
SELECT * FROM OrdersView;
SELECT Customers.CustomerID, CONCAT(Customers.FirstName, ' ', Customers.LastName) AS 'FullName', Orders.OrderID, Orders.BillAmount AS Cost,
Menu.MenuName, MenuItems.CourseName FROM Menu INNER JOIN MenuItems ON Menu.ItemID = MenuItems.ItemID 
INNER JOIN Orders ON Menu.MenuID = Orders.MenuID INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID;
SELECT MenuName FROM Menu WHERE MENUID = ANY ( SELECT MenuID FROM Orders WHERE Qunatity >= 2);
DELIMITER //
CREATE PROCEDURE GetMaxQuantity()
BEGIN 
SELECT MAX(Quantity) AS 'MAX Qunatity in Order' FROM Orders;
END//
DELIMITER ;
CALL GetMaxQuantity();
PREPARE GetOrderDetail FROM 'SELECT OrderID, Quantity, BillAmount AS "Cost" FROM Orders WHERE CustomerID = ?';
SET @id = 1;
EXECUTE GetOrderDetail USING @id;
DELIMITER //
CREATE PROCEDURE CancelOrder(IN orderid INT)
BEGIN 
DELETE FROM Orders WHERE OrderID = orderid;
END //
DELIMITER ;
CALL CancelOrder(5);