CREATE DATABASE IF NOT EXISTS Uber;

USE Uber;

SHOW TABLES;

DESCRIBE bookings;

SELECT * FROM bookings;


-- 1. Retrieve all successful bookings:
CREATE VIEW Successful_Bookings AS
SELECT * 
FROM bookings
WHERE Booking_Status = "Success";

SELECT * FROM Successful_Bookings;

-- 2. Find the average ride distance for each vehicle type:
CREATE VIEW Avg_Ride_Distance AS
SELECT Vehicle_Type, AVG(Ride_Distance) AS Avg_Ride_Distance
FROM bookings
GROUP BY Vehicle_Type;

SELECT * FROM Avg_Ride_Distance;

-- 3. Get the total number of cancelled rides by customers:
CREATE VIEW Ride_Cancelled_by_Customers AS
SELECT COUNT(*)
FROM bookings
WHERE Booking_Status = "Cancelled by Customer";

SELECT * FROM Ride_Cancelled_by_Customers;


-- 4. List the top 5 customers who booked the highest number of rides:
CREATE VIEW Top_5_Customers_by_Rides AS
SELECT Customer_ID, COUNT(Booking_ID) AS Total_Rides
FROM bookings
GROUP BY Customer_ID
ORDER BY Total_Rides DESC
LIMIT 5;

SELECT * FROM Top_5_Customers_by_Rides;

-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
SELECT DISTINCT(Cancelled_Rides_by_Driver) FROM bookings;

CREATE VIEW Ride_Cancel_Due_To_Peronnel_and_Car_Related_Issues AS
SELECT COUNT(*)
FROM bookings
WHERE Cancelled_Rides_by_Driver = "Personulll & Car related issues";

SELECT * FROM Ride_Cancel_Due_To_Peronnel_and_Car_Related_Issues;


-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
SELECT DISTINCT(Driver_Ratings) FROM bookings;

CREATE VIEW Max_Min_Driver_Rating_for_Prime_Sedan AS
SELECT MAX(Driver_Ratings) AS Max_Driver_Rating, 
	   MIN(Driver_Ratings) AS Min_Driver_Rating
FROM bookings
WHERE Vehicle_Type = "Prime Sedan";

SELECT * FROM Max_Min_Driver_Rating_for_Prime_Sedan;

-- 7. Retrieve all rides where payment was made using UPI:
CREATE VIEW UPI_Payment_Ride AS
SELECT * 
FROM bookings
WHERE Payment_Mode = "UPI";

SELECT * FROM UPI_Payment_Ride;


-- 8. Find the average customer rating per vehicle type:

CREATE VIEW Average_Customer_Rating_Per_Vehicle_Type AS
SELECT Vehicle_Type, AVG(Customer_Rating) AS Avg_Customer_Rating
FROM bookings
GROUP BY Vehicle_Type;

SELECT * FROM Average_Customer_Rating_Per_Vehicle_Type;

-- 9. Calculate the total booking value of rides completed successfully:

CREATE VIEW Total_Booking_Value_for_Successful_Rides AS
SELECT SUM(Booking_Value) AS Total_Booking_Value
FROM bookings
WHERE Booking_Status = "Success";

SELECT * FROM Total_Booking_Value_for_Successful_Rides;

-- 10. List all incomplete rides along with the reason:
SELECT DISTINCT(Booking_Status) FROM bookings;

CREATE VIEW Incomplete_Rides_with_Reason AS
SELECT Booking_ID, Incomplete_Rides_Reason 
FROM bookings
WHERE Incomplete_Rides = "Yes";

SELECT * FROM Incomplete_Rides_with_Reason;










