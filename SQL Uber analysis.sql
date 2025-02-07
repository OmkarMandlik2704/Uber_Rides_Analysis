# PROJECT [{UBER DATA ANALYSIS}]
create database UBER;
use UBER;

#1. Retrieve all Completed bookings: 

create view Completed_Bookings as    #VIEW
 select * from updated_uber_final
 where booking_status='Completed';
 
 select * from Completed_Bookings;
 
 #2. Find the average ride distance for each vehicle type: 
 create view ride_distance_for_each_vehicle as
 Select Vehicle_Type, avg(Ride_Distance)
 as avg_distance from updated_uber_final
 group by Vehicle_Type;
 
 select * from ride_distance_for_each_vehicle;
 
 #3. Get the total number of cancelled rides by customers:
 create view total_number_of_cancelled_rides_by_customers as
 select count(*) from updated_uber_final
 where Booking_Status = 'Canceled by Customer';
 
 select * from total_number_of_cancelled_rides_by_customers;
 
 #4. List the top 5 customers who booked the highest number of rides:
 Create View  top_5_customers as 
 
 select Customer_ID, count(Booking_ID) as Total_rides
 from updated_uber_final
 Group by Customer_ID
 order by Total_rides DESC LIMIT 5;

select * from  top_5_customers;

#5. Get the number of rides cancelled by drivers due to personal and car-related issues: 
create view rides_cancelled_by_drivers as

select count(*) from updated_uber_final
where Incomplete_Rides_Reason ='Cancelled due to traffic '&"Customer no-show"&"Driver no-show"&"No-show";

select * from rides_cancelled_by_drivers;

#6. Find the maximum and minimum driver ratings for Uber Black SUV bookings: 
create view  maximum_and_minimum_driver_ratings as

select max(Driver_Ratings) as max_ratings,
min(Driver_Ratings) as min_rating 
from updated_uber_final 
where Vehicle_Type='Uber Black SUV'&'Uber Moto'&'Uber Go'&'Uber Green'&'Uber eBike'&'Uber Comfort';

select * from maximum_and_minimum_driver_ratings ;

#7. Retrieve all rides where payment was made using UPI: 
create view payment_using_UPI as
select * from updated_uber_final
where Payment_Method ='UPI';

create view count_payment_using_UPI as
select count(*) from updated_uber_final
where Payment_Method ='UPI';

#8. Find the average customer rating per vehicle type: 
create view average_customer_rating as

Select Vehicle_Type, avg(Customer_Rating)
 as avg_Ratings from updated_uber_final
 group by Vehicle_Type;
 
 select * from average_customer_rating;
 
 #9. Calculate the total booking value of rides completed successfully: 
 create view total_booking_value_of_rides_completed as
 
 select count(Booking_Value) as total_completed_value from 
 updated_uber_final 
 where Booking_Status ='Completed';
 
 select * from  total_booking_value_of_rides_completed;
 
 #10. List all incomplete rides along with the reason:
 create view  incomplete_rides as
 
 select count(Booking_Value) as total_completed_value from 
 updated_uber_final 
 where Booking_Status ='Canceled by Customer';