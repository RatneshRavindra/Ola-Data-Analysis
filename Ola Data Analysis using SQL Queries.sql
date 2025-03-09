CREATE DATABASE Ola;
Use Ola;

#1. Retrieve all successful bookings
CREATE VIEW Successful_Bookings as
SELECT * FROM bookings
WHERE Booking_Status = 'Success'
SELECT * FROM Successful_Bookings

#2. Find the average ride distance for each vehicle type
CREATE VIEW avg_ride_distance_for_each_vehicle_type as
SELECT AVG(Ride_Distance) as avg_distance, Vehicle_Type FROM bookings
GROUP BY Vehicle_Type
SELECT * FROM avg_ride_distance_for_each_vehicle_type

#3. Get the total number of cancelled rides by customer
CREATE VIEW cancelled_rides_by_customer as
SELECT COUNT(*) FROM bookings
WHERE Booking_Status = 'Canceled by Customer'
SELECT * FROM cancelled_rides_by_customer


#4. List top 5 customers who booked highest number of rides
CREATE VIEW top_5_customers_who_booked_highest_number_of_rides AS
SELECT Customer_ID, COUNT(Booking_ID) as total_rides 
FROM bookings
GROUP BY Customer_ID
ORDER BY total_rides DESC LIMIT 5
SELECT * FROM top_5_customers_who_booked_highest_number_of_rides


#5. Get the number of rides cancelled by drivers due to personal and car-related issues:
CREATE VIEW number_of_rides_cancelled_by_drivers AS
SELECT COUNT(Booking_Status) FROM bookings
WHERE Booking_Status = 'Canceled by Driver'
AND Canceled_Rides_by_Driver = 'Personal & Car related issue'
GROUP BY Booking_Status
SELECT * FROM number_of_rides_cancelled_by_drivers


#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
CREATE VIEW max_and_min_driver_ratings AS
SELECT MAX(Driver_Ratings), MIN(Driver_Ratings) FROM bookings
WHERE Vehicle_Type = 'Prime Sedan'
SELECT * FROM max_and_min_driver_ratings 


#7. Retrieve all rides where payment was made using UPI:
CREATE VIEW payment_via_upi AS
SELECT COUNT(*) FROM bookings
WHERE Payment_Method = 'UPI'
SELECT * FROM payment_via_upi


#8. Find the average customer rating per vehicle type:
CREATE VIEW avg_cust_rating_per_vehicle AS
SELECT AVG(Customer_Rating), Vehicle_Type FROM bookings
GROUP BY Vehicle_Type
SELECT * FROM avg_cust_rating_per_vehicle


#9. Calculate the total booking value of rides completed successfully:
CREATE VIEW total_successful_ride_value AS
SELECT Booking_Status, SUM(Booking_Value) FROM bookings
WHERE Booking_Status = 'Success'
GROUP BY Booking_Status
SELECT * FROM total_successful_ride_value


#10. List all incomplete rides along with the reason:
CREATE VIEW incomplete_rides_along_with_the_reason AS
SELECT Booking_ID, Incomplete_Rides_Reason FROM bookings
WHERE Incomplete_Rides = 'Yes'
SELECT * FROM incomplete_rides_along_with_the_reason