USE littlelemondm;
-- create a procedure to check if a table is booked
DROP PROCEDURE IF EXISTS CheckBooking;
DELIMITER //
CREATE PROCEDURE CheckBooking(IN b_date DATE, IN table_no INT)
BEGIN
DECLARE response INT;
SET @response = CONCAT('Table ', table_no, ' is already booked');
SELECT CASE WHEN TableNO = table_no AND BookingDate = b_date
THEN @response
ELSE 'Table is free to book' 
END AS BookingStatus FROM Bookings WHERE TableNO = table_no AND BookingDate = b_date;
END//
CALL CheckBooking('2022-10-13', 15);
-- create a procedure to add a booking
DROP PROCEDURE IF EXISTS AddValidBooking;
DELIMITER //
CREATE PROCEDURE AddValidBooking(IN b_date DATE, IN table_no INT)
BEGIN
START TRANSACTION;
CASE WHEN (SELECT BookingID FROM Bookings WHERE BookingDate = b_date AND TableNo = table_no) IS NULL
THEN INSERT INTO Bookings(BookingID, CustomerID, StaffID, BookingDate, TableNo) 
VALUES (last_insert_id(), last_insert_id(), 4, b_date, table_no);
ELSE ROLLBACK;
COMMIT;
END CASE;
END//
DELIMITER ;
CALL AddValidBooking('2022-10-16', 22);
-- stored procedure to cancel a booking
DROP procedure CancelBooking;
DELIMITER //
CREATE PROCEDURE CancelBooking(IN CancelID INT)
BEGIN
DELETE FROM Bookings WHERE BookingID = CancelID;
SELECT CONCAT("Order ",CancelID, " is cancelled.") AS Confirmation FROM Bookings;
END//
DELIMITER ;

CALL CancelBooking(5);

-- update booking procedure
CREATE PROCEDURE UpdateBooking(IN UpdateID INT, IN TableNo INT)
UPDATE Bookings
SET TableNumber = TableNo
WHERE BookingID = UpdateID;

CALL UpdateBooking(6, 1);

SELECT * FROM Bookings;
DROP PROCEDURE AddBooking;
-- a procedure to add a booking
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

DELIMITER //
CREATE PROCEDURE MakeBooking (booking_id INT, customer_id INT, table_no int, booking_date date)
BEGIN
INSERT INTO Bookings (BookingID, BookingDate, TableNumber, CustomerID) 
VALUES (booking_id, booking_date, table_no, customer_id);
SELECT "New booking added" AS "Confirmation";
END//
DELIMITER ;
CALL MakeBooking(5, "2022-12-30", 4, 3, 1);
SELECT * FROM Bookings
