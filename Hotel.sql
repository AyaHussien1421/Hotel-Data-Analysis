use [Hotal data]
-- What is the cancellation rate for each year?
SELECT COUNT(*) FROM [dbo].[All hotel_revenue_historical_full-2] WHERE [reservation_status] = 'Canceled'

-- What is the average lead time?
SELECT COUNT(*) FROM [dbo].[All hotel_revenue_historical_full-2] WHERE [reservation_status] != 'Canceled'

-- How many countries does the visitor come from?
SELECT COUNT(DISTINCT[country]) FROM [dbo].[All hotel_revenue_historical_full-2] 

-- How many Company does the visitor come from?
SELECT COUNT(DISTINCT[company]) FROM [dbo].[All hotel_revenue_historical_full-2] 

-- What is the highest and lowest month for tourists to visit ?
SELECT TOP 1 [arrival_date_month], COUNT(*) AS VisitCount
FROM [dbo].[All hotel_revenue_historical_full-2]
GROUP BY [arrival_date_month]
ORDER BY VisitCount DESC;

SELECT TOP 1 [arrival_date_month], COUNT(*) AS VisitCount
FROM [dbo].[All hotel_revenue_historical_full-2]
GROUP BY [arrival_date_month]
ORDER BY VisitCount ASC;

-- What is the highest and lowest Day in month for tourists to visit ?
SELECT TOP 1 [arrival_date_day_of_month] , COUNT(*) AS VisitCount
FROM [dbo].[All hotel_revenue_historical_full-2]
GROUP BY [arrival_date_day_of_month]
ORDER BY VisitCount DESC;

SELECT TOP 1 [arrival_date_day_of_month], COUNT(*) AS VisitCount
FROM [dbo].[All hotel_revenue_historical_full-2]
GROUP BY [arrival_date_day_of_month]
ORDER BY VisitCount ASC;

-- What is the highest and lowest Market Segment for tourists ?
SELECT TOP 1 [market_segment] , COUNT(*) AS Max_Market
FROM [dbo].[All hotel_revenue_historical_full-2]
GROUP BY [market_segment]
ORDER BY Max_Market DESC;

SELECT TOP 1 [market_segment] , COUNT(*) AS MIN_Market
FROM [dbo].[All hotel_revenue_historical_full-2]
GROUP BY [market_segment]
ORDER BY MIN_Market ASC;


-- What is Count Adult and Childern and Baby come to Hotel ?
select Count ([adults])as Adults , Count ([children]) as Child , count ([babies]) as Babies 
from [dbo].[All hotel_revenue_historical_full-2]


-- What is the highest and lowest Meal Profit ?
--Max
select top 1 Alll.meal , sum ([dbo].[Meal_Cost].Cost) as Max_cost
from [dbo].[All hotel_revenue_historical_full-2] Alll
join [dbo].[Meal_Cost] on Alll.meal = [dbo].[Meal_Cost].meal
group by Alll.meal
order by Max_cost Desc;

--Min
select top 1 Alll.meal , sum ([dbo].[Meal_Cost].Cost) as Min_cost
from [dbo].[All hotel_revenue_historical_full-2] Alll
join [dbo].[Meal_Cost] on Alll.meal = [dbo].[Meal_Cost].meal
group by Alll.meal
order by Min_cost Asc;


-- What is the country with the highest and lowest number of visitors?
select top 1 [country],count (*) as Max_Country
from [dbo].[All hotel_revenue_historical_full-2]
group by [country]
order by Max_Country desc  

select top 1 [country],count (*) as Min_Country
from [dbo].[All hotel_revenue_historical_full-2]
group by [country]
order by Min_Country ASC  


-- What is the Company with the highest and lowest number of visitors?
select top 2 [company],count (*) as Max_Company
from [dbo].[All hotel_revenue_historical_full-2]
group by [company]
order by Max_Company desc  

select top 1 [company],count (*) as Min_Coumpany
from [dbo].[All hotel_revenue_historical_full-2]
where company!= NULL
group by [company]
order by Min_Coumpany ASC  


-- count of previous_cancellations ?
select count ([previous_cancellations]) as Count_pre_cancel
from [dbo].[All hotel_revenue_historical_full-2]
where [previous_cancellations] != 0


-- count of previous booking is not cancellations ?
select count ([previous_bookings_not_canceled]) as Count_pre_booking_notcancel
from [dbo].[All hotel_revenue_historical_full-2]
where [previous_bookings_not_canceled]!= 0

-- count of Agent ?
select count (distinct [agent]) as Count_of_Agent
from [dbo].[All hotel_revenue_historical_full-2]


-- count of booking changes ?
select count ([booking_changes]) as booking_changes
from [dbo].[All hotel_revenue_historical_full-2]


-- What is avgrage of adr?
select avg ([adr]) as avg_adr
from [dbo].[All hotel_revenue_historical_full-2]

-- count of Not repeated guest ?
select Count ([is_repeated_guest]) as is_Not_Repeated
from [dbo].[All hotel_revenue_historical_full-2]
where [is_repeated_guest] = 0
--count of repeated guest ?
select Count ([is_repeated_guest]) as is_Repeated
from [dbo].[All hotel_revenue_historical_full-2]
where [is_repeated_guest] = 1


--count of distribution_channel ?
select Count ([distribution_channel]), [distribution_channel]
from [dbo].[All hotel_revenue_historical_full-2]
group by [distribution_channel]


--count of customer_type?
select Count ([customer_type]) as count_Customer, [customer_type]
from [dbo].[All hotel_revenue_historical_full-2]
group by [customer_type]
order by count_Customer desc

--count of deposit_type?
select Count ([deposit_type]) as count_deposite , [deposit_type]
from [dbo].[All hotel_revenue_historical_full-2]
group by [deposit_type]
order by count_deposite desc

-- count of reserved_room_type
select Count ([reserved_room_type]) as count_reserved_room , [reserved_room_type]
from [dbo].[All hotel_revenue_historical_full-2]
group by [reserved_room_type]
order by count_reserved_room desc


-- count of Assigned_room_type
select Count ([assigned_room_type]) as count_Assigned_room , [assigned_room_type]
from [dbo].[All hotel_revenue_historical_full-2]
group by [assigned_room_type]
order by count_Assigned_room desc



-- What is the days in waiting list?
select top 1 [days_in_waiting_list] ,count (*) as Max_Watting_list
from [dbo].[All hotel_revenue_historical_full-2]
where [days_in_waiting_list] != 0
group by [days_in_waiting_list]
order by Max_Watting_list desc  

select top 1 [days_in_waiting_list] ,count (*) as Min_Watting_list
from [dbo].[All hotel_revenue_historical_full-2]
where [days_in_waiting_list] != 0
group by [days_in_waiting_list]
order by Min_Watting_list asc  


-- count of total_of_special_requests
select Count ([total_of_special_requests]) as count_total_special_requests , [total_of_special_requests]
from [dbo].[All hotel_revenue_historical_full-2]
group by [total_of_special_requests]
order by count_total_special_requests desc


-- count of required_car_parking_spaces
select Count ([required_car_parking_spaces]) as count_required_car_parking_spaces , [required_car_parking_spaces]
from [dbo].[All hotel_revenue_historical_full-2]
group by [required_car_parking_spaces]
order by count_required_car_parking_spaces desc

 
 -- What is the market segment and discount ?
select Alll.[market_segment] , sum ([dbo].[market_segment].[Discount]) as sum_discount
from [dbo].[All hotel_revenue_historical_full-2] Alll
join [dbo].[market_segment] on Alll.market_segment = [dbo].[market_segment].market_segment
group by Alll.[market_segment]
order by sum_discount Desc;


