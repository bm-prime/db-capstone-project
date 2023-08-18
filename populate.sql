USE littlelemondm;
INSERT INTO MenuItems (ItemID, CourseName, MenuType, Price)
VALUES
(1, 'Olives','Starters',5),
(2, 'Flatbread','Starters', 5),
(3, 'Minestrone', 'Starters', 8),
(4, 'Tomato bread','Starters', 8),
(5, 'Falafel', 'Starters', 7),
(6, 'Hummus', 'Starters', 5),
(7, 'Greek salad', 'Main Courses', 15),
(8, 'Bean soup', 'Main Courses', 12),
(9, 'Pizza', 'Main Courses', 15),
(10, 'Greek yoghurt','Desserts', 7),
(11, 'Ice cream', 'Desserts', 6),
(12, 'Cheesecake', 'Desserts', 4),
(13, 'Athens White wine', 'Drinks', 25),
(14, 'Corfu Red Wine', 'Drinks', 30),
(15, 'Turkish Coffee', 'Drinks', 10),
(16, 'Turkish Coffee', 'Drinks', 10),
(17, 'Kabasa', 'Main Courses', 17);
SELECT * FROM MenuItems;
INSERT INTO Menu (MenuID,ItemID,Cuisine)
VALUES
(1, 1, 'Greek'),
(1, 7, 'Greek'),
(1, 10, 'Greek'),
(1, 13, 'Greek'),
(2, 3, 'Italian'),
(2, 9, 'Italian'),
(2, 12, 'Italian'),
(2, 15, 'Italian'),
(3, 5, 'Turkish'),
(3, 17, 'Turkish'),
(3, 11, 'Turkish'),
(3, 16, 'Turkish');
SELECT * FROM Menu;
INSERT INTO Staff (StaffID, EmployeeName, EmployeeRole, ContactNumber, Email, AnnualSalary)
VALUES
(01,'Mario Gollini','Manager',351258074,'Mario.g@littlelemon.com',70000),
(02,'Adrian Gollini','Assistant Manager',351474048,'Adrian.g@littlelemon.com',65000),
(03,'Giorgos Dioudis','Head Chef',351970582,'Giorgos.d@littlelemon.com',50000),
(04,'Fatma Kaya','Assistant Chef',351963569,'Fatma.k@littlelemon.com',45000),
(05,'Elena Salvai','Head Waiter',351074198,'Elena.s@littlelemon.com',40000),
(06,'John Millar','Receptionist',351584508,'John.m@littlelemon.com',35000);
SELECT * FROM Staff;
INSERT INTO Customers(CustomerID, CustomerName, ContactNumber, Email)
VALUES
(2,'Anna Iversen', 126636738, 'Anna2000@gmail.com'),
(5,'Joakim Iversen', 127396749, 'Joakim00Ine@gmail.com'),
(16,'Vanessa McCarthy', 102947033, 'VanessaCarthy@yahoo.com'),
(17,'Marcos Romero', 137390389, 'Mark23rome@pm.me'),
(18,'Hiroki Yamane', 384349839, 'Hiroki@yamane.com');
SELECT * FROM Customers;
INSERT INTO Bookings (BookingID, TableNo, CustomerID, BookingDate, StaffID)
VALUES
(1, 12, 2,'2022-10-10',1),
(2, 12, 5, '2022-10-11', 1),
(3, 19, 16, '2022-10-11', 3),
(4, 15,  17, '2022-10-13', 4),
(5, 5,  18, '2022-10-13', 2);
SELECT * FROM bookings;
INSERT INTO Delivery(DeliveryID, DeliveryDate, DeliveryAddress, DeliveryStatus, DeliveryPrice)
VALUES 
(12, '2022-10-11', '724, Parsley Lane, Old Town, Chicago, IL', 'Pending', 12),
(19, '2022-10-12', '334, Dill Square, Lincoln Park, Chicago, IL', 'Pending', 20),
(15, '2022-10-13', '879 Sage Street, West Loop, Chicago, IL', 'Pending', 10),
(5, '2022-10-01', '132  Bay Lane, Chicago, IL', 'Delivered', 25),
(8, '2022-10-06', '989 Thyme Square, EdgeWater, Chicago, IL', 'Delivered', 18);
SELECT * FROM Delivery;
INSERT INTO Orders (OrderID, DeliveryID, MenuID, BookingID, Quantity, BillAmount)
VALUES
(1, 12, 1, 1, 2, 86),
(2, 19, 2, 2, 1, 37),
(3, 15, 2, 3, 1, 37),
(4, 5, 3, 4, 1, 40),
(5, 8, 1, 5, 1, 43);
SELECT * FROM Orders;
