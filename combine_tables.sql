USE littlelemondm;
SELECT Menu.MenuID, MenuItems.ItemID, MenuItems.CourseName, Orders.OrderID, Orders.BillAmount, Delivery.DeliveryStatus, 
Delivery.DeliveryDate, Bookings.BookingID, Bookings.BookingDate, Customers.CustomerID, Customers.CustomerName, 
Staff.StaffID, Staff.EmployeeName
FROM MenuItems INNER JOIN Menu ON Menu.ItemID = MenuItems.ItemID INNER JOIN Orders ON Orders.MenuID = Menu.MenuID
INNER JOIN Delivery ON Orders.DeliveryID = Delivery.DeliveryID INNER JOIN Bookings ON Bookings.BookingID = Orders.BookingID
INNER JOIN Customers ON Customers.CustomerID = Bookings.CustomerID INNER JOIN Staff ON Staff.StaffID = Bookings.StaffID;