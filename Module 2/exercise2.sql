-- creating max quantity procedure [Task 1]
DELIMITER //
DROP PROCEDURE IF EXISTS GetMaxQuantity//
CREATE PROCEDURE GetMaxQuantity()
BEGIN 
SELECT MAX(Quantity) AS 'MAX Qunatity in Order' FROM Orders;
END//
DELIMITER ;
CALL GetMaxQuantity();
-- creating prepared statement to get order details [Task 2]
PREPARE GetOrderDetail FROM 'SELECT OrderID, Quantity, BillAmount AS "Cost" 
FROM Orders INNER JOIN Bookings ON Orders.BookingID = Bookings.BookingID WHERE Bookings.CustomerID = ?';
SET @id = 16;
EXECUTE GetOrderDetail USING @id;
-- creating procedure to cancel order [Task 3]
DELIMITER //
DROP PROCEDURE IF EXISTS CancelOrder//
CREATE PROCEDURE CancelOrder(IN orderid INT)
BEGIN 
DELETE FROM Orders WHERE OrderID = orderid;
END //
DELIMITER ;
CALL CancelOrder(5);