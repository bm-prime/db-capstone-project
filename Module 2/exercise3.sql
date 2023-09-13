USE littlelemondm;
-- create a procedure to check if a table is booked [Task 2]
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
-- create a procedure to add a booking [Task 3]
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

