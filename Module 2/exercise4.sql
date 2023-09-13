-- a procedure to add a booking [Task 1]
DROP PROCEDURE AddBooking;
DELIMITER //
CREATE PROCEDURE AddBooking (IN AddBookingID INT, IN AddBookingDate DATE, IN AddTableNo INT, IN AddCustomerID INT, IN AddEmployeeNum INT)
BEGIN
INSERT INTO Bookings (BookingID, BookingDate, TableNumber, CustomerID, EmployeeID)
VALUES (AddBookingID, AddBookingDate, AddTableNo, AddCustomerID, AddEmployeeNum);
SELECT CONCAT("New Booking ID ", AddBookingID, " Added.") AS Confirmation;
END//
DELIMITER ;
-- call the procedure 
CALL AddBooking(5, "2022-12-30", 4, 3, 1);

-- update booking procedure [Task 2]
DROP PROCEDURE UpdateBooking;
DELIMITER //
CREATE PROCEDURE UpdateBooking(IN UpdateID INT, IN TableNo INT)
UPDATE Bookings
SET TableNumber = TableNo
WHERE BookingID = UpdateID;
DELIMITER ;
CALL UpdateBooking(6, 1);
SELECT * FROM Bookings;

-- stored procedure to cancel a booking  [Task 3]
DROP procedure CancelBooking;
DELIMITER //
CREATE PROCEDURE CancelBooking(IN CancelID INT)
BEGIN
DELETE FROM Bookings WHERE BookingID = CancelID;
SELECT CONCAT("Order ",CancelID, " is cancelled.") AS Confirmation FROM Bookings;
END//
DELIMITER ;

CALL CancelBooking(5);
