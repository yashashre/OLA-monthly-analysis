use Ola;
# 1 retrive all successful bookings using View:
create view Successful_Bookings As 
select*from Bookings where Booking_Status ="Success";
# View
select * from Successful_Bookings;

# 2 Find Average ride distance for each Vehicle type:
create view Avg_d as
select Vehicle_Type, avg(Ride_Distance) as avg_dis from Bookings
group by Vehicle_Type;
# View
select * from Avg_d;

# 3 Get Total number of cancelled rides by customres:
Create view count_cancelled_rides_by_customres as
select count(*) from bookings where Booking_Status="Canceled by Customer";
# view
select * from count_cancelled_rides_by_customres;

# 4 List top 5 customers who booked highest number of rides:
create view top_5_customers as
select Customer_ID, count(Booking_ID) as total_bookings
from bookings 
group by Customer_ID
order by total_bookings desc limit 5;
# View
select * from top_5_customers;

# 5 Get the number of rides cancelled by driver due to personal and Car-related issue:
create view cancelled_by_driver_due_to_personal_and_Car_related_issue as 
select count(*) from bookings 
where Canceled_Rides_by_Driver='Personal & Car related issue' ;
# view
select * from cancelled_by_driver_due_to_personal_and_Car_related_issue;

# 6 Find Minimum and Maximum Driver Ratings for Prime Sedan:
create view Min_Max_rating_Prime_Sedan as
select max(Driver_Ratings) as Max_rating, min(Driver_Ratings) as Min_rating from bookings;
# View 
select * from Min_Max_rating_Prime_Sedan;

# 7 Retrive all rides where payment was made using UPI:
create view payment_using_UPI as
select * from bookings where Payment_Method="UPI";
# View
select*from payment_using_UPI;

# 8 Find avg customer rating per vehicle:
create view avg_customer_rating_per_vehicle as
select Vehicle_Type, avg(Customer_Rating) as avg_rating 
from bookings
group by Vehicle_Type;
# View 
select * from avg_customer_rating_per_vehicle;

# 9 Calculate total bookings value of rides completed successfully:
create view cal_total_bookings_value_of_rides_completed_successful as
select sum(Booking_Value) as total_booking_value
from bookings where Booking_Status="Success";
# view 
select * from cal_total_bookings_value_of_rides_completed_successful;

drop view total_bookings_value_of_rides_completed_successful;

# 10 List all incomplete rides along with reason:
create view all_incomplete_rides_along_with_reason as 
select Booking_ID, Incomplete_Rides_Reason from bootb12kings
where Incomplete_Rides='Yes';
# view
select * from all_incomplete_rides_along_with_reason;