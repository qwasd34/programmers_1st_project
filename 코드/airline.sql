-- select * from airline
-- where Type_of_travel = 'B';

#고객 테이블
select id, Gender,	case 
		when Age between 0 and 9 then '0~9'
		when Age between 10 and 19 then '10~19'
		when Age between 20 and 29 then '20~29'
		when Age between 30 and 39 then '30~39'
		when Age between 40 and 49 then '40~49'
		when Age between 50 and 59 then '50~59'
		when Age >=60 then '60+'
		end as age_group
        ,Customer_Type, Type_of_Travel, Class, Flight_Distance, Departure_Delay, Arrival_Delay
from airline;

##고객 테이블 생성
create table customers
select (select id, Gender,	case 
		when Age between 0 and 9 then '0~9'
		when Age between 10 and 19 then '10~19'
		when Age between 20 and 29 then '20~29'
		when Age between 30 and 39 then '30~39'
		when Age between 40 and 49 then '40~49'
		when Age between 50 and 59 then '50~59'
		when Age >=60 then '60+'
		end as age_group
        ,Customer_Type, Type_of_Travel, Class, Flight_Distance, Departure_Delay, Arrival_Delay
from airline)
from airline;

#만족도 테이블 생성
create table satisfaction
SELECT id,
    Inflight_wifi_service, Departure_Arrival_time_convenient,
    Ease_of_Online_booking, Gate_location, Food_and_drink,
    Online_boarding, Seat_comfort, Inflight_entertainment,
    Onboard_service, Legroom_service, Baggage_handling,
    Checkin_service, Inflight_service, Cleanliness,
    Satisfaction
FROM airline;

select * from customers;
select * from satisfaction;

#고객 그룹 별 만족도항목
select age_group, 
	count(satisfaction) as Satisfaction,
	avg(Inflight_wifi_service)as Inflight_wifi_service, 
    avg(Departure_Arrival_time_convenient) as Departure_Arrival_time_convenient,
    avg(Ease_of_Online_booking)as Ease_of_Online_booking,
    avg(Gate_location)as Gate_location,
    avg(Food_and_drink)as Food_and_drink,
    avg(Online_boarding)as Online_boarding,
    avg(Seat_comfort)as Seat_comfort,
    avg(Inflight_entertainment)as Inflight_entertainment,
    avg(Onboard_service)as Onboard_service,
    avg(Legroom_service)as Legroom_service,
    avg(Baggage_handling)as Baggage_handling,
    avg(Checkin_service)as Checkin_service,
    avg(Inflight_service)as Inflight_service,
    avg(Cleanliness)as Cleanliness
from customers inner join satisfaction on
customers.id = satisfaction.id
where satisfaction = 'S'
group by age_group;

-- 만족도　ｓ／ｄ별　총점　평균
