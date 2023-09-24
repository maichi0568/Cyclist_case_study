-- Load the data into PostgreSQL
CREATE TABLE datatrip_202201(
ride_id character(50) PRIMARY KEY,
rideable_type character varying,
started_at timestamp,
ended_at timestamp,
start_station_name character varying,
start_station_id character varying,
end_station_name character varying,
end_station_id character varying,
start_lat numeric,
start_lng numeric,
end_lat numeric,
end_lng numeric,
member_casual character varying
);

CREATE TABLE datatrip_202202(
ride_id character(50) PRIMARY KEY,
rideable_type character varying,
started_at timestamp,
ended_at timestamp,
start_station_name character varying,
start_station_id character varying,
end_station_name character varying,
end_station_id character varying,
start_lat numeric,
start_lng numeric,
end_lat numeric,
end_lng numeric,
member_casual character varying
);

CREATE TABLE datatrip_202203(
ride_id character(50) PRIMARY KEY,
rideable_type character varying,
started_at timestamp,
ended_at timestamp,
start_station_name character varying,
start_station_id character varying,
end_station_name character varying,
end_station_id character varying,
start_lat numeric,
start_lng numeric,
end_lat numeric,
end_lng numeric,
member_casual character varying
);

CREATE TABLE datatrip_202204(
ride_id character(50) PRIMARY KEY,
rideable_type character varying,
started_at timestamp,
ended_at timestamp,
start_station_name character varying,
start_station_id character varying,
end_station_name character varying,
end_station_id character varying,
start_lat numeric,
start_lng numeric,
end_lat numeric,
end_lng numeric,
member_casual character varying
);

CREATE TABLE datatrip_202205(
ride_id character(50) PRIMARY KEY,
rideable_type character varying,
started_at timestamp,
ended_at timestamp,
start_station_name character varying,
start_station_id character varying,
end_station_name character varying,
end_station_id character varying,
start_lat numeric,
start_lng numeric,
end_lat numeric,
end_lng numeric,
member_casual character varying
);

CREATE TABLE datatrip_202206(
ride_id character(50) PRIMARY KEY,
rideable_type character varying,
started_at timestamp,
ended_at timestamp,
start_station_name character varying,
start_station_id character varying,
end_station_name character varying,
end_station_id character varying,
start_lat numeric,
start_lng numeric,
end_lat numeric,
end_lng numeric,
member_casual character varying
);

CREATE TABLE datatrip_202207(
ride_id character(50) PRIMARY KEY,
rideable_type character varying,
started_at timestamp,
ended_at timestamp,
start_station_name character varying,
start_station_id character varying,
end_station_name character varying,
end_station_id character varying,
start_lat numeric,
start_lng numeric,
end_lat numeric,
end_lng numeric,
member_casual character varying
);

CREATE TABLE datatrip_202208(
ride_id character(50) PRIMARY KEY,
rideable_type character varying,
started_at timestamp,
ended_at timestamp,
start_station_name character varying,
start_station_id character varying,
end_station_name character varying,
end_station_id character varying,
start_lat numeric,
start_lng numeric,
end_lat numeric,
end_lng numeric,
member_casual character varying
);

CREATE TABLE datatrip_202209(
ride_id character(50) PRIMARY KEY,
rideable_type character varying,
started_at timestamp,
ended_at timestamp,
start_station_name character varying,
start_station_id character varying,
end_station_name character varying,
end_station_id character varying,
start_lat numeric,
start_lng numeric,
end_lat numeric,
end_lng numeric,
member_casual character varying
);

CREATE TABLE datatrip_202210(
ride_id character(50) PRIMARY KEY,
rideable_type character varying,
started_at timestamp,
ended_at timestamp,
start_station_name character varying,
start_station_id character varying,
end_station_name character varying,
end_station_id character varying,
start_lat numeric,
start_lng numeric,
end_lat numeric,
end_lng numeric,
member_casual character varying
);

CREATE TABLE datatrip_202211(
ride_id character(50) PRIMARY KEY,
rideable_type character varying,
started_at timestamp,
ended_at timestamp,
start_station_name character varying,
start_station_id character varying,
end_station_name character varying,
end_station_id character varying,
start_lat numeric,
start_lng numeric,
end_lat numeric,
end_lng numeric,
member_casual character varying
);

CREATE TABLE datatrip_202212(
ride_id character(50) PRIMARY KEY,
rideable_type character varying,
started_at timestamp,
ended_at timestamp,
start_station_name character varying,
start_station_id character varying,
end_station_name character varying,
end_station_id character varying,
start_lat numeric,
start_lng numeric,
end_lat numeric,
end_lng numeric,
member_casual character varying
);

select * from datatrip_202213

-- Combine 12 tables
CREATE TABLE IF NOT EXISTS datatrip_2022 AS
(select * from datatrip_202201 
union all select * from datatrip_202202
union all select * from datatrip_202203
union all select * from datatrip_202204
union all select * from datatrip_202205 
union all select * from datatrip_202206
union all select * from datatrip_202207 
union all select * from datatrip_202208
union all select * from datatrip_202209 
union all select * from datatrip_202210 
union all select * from datatrip_202211 
union all select * from datatrip_202212)
--total rows 5667717

-- Test if ride_id is validation
-- Test if ride_id is null
select * from datatrip_2022
where ride_id is null 
--total 0 -> no null in ride_id

-- Test if ride_id is duplicate
select distinct * from datatrip_2022
--total 5667717, equal to total rows-> no duplicate

-- Check the length of the ride_id
select count(*) as total from(
select length(ride_id) as length from datatrip_2022 group by ride_id) as length_ where length=16
--total 5667717, equal to total rows -> all the ride_id are 16 chars length

-- Check the riding-time
-- Check the validation of the year
select count(*) as total from(
select (extract(year from (ended_at - started_at)))
	as year_time from datatrip_2022) as year
where year_time=0 --> total 5667717 -> no error of the year

-- Check the validation of the month
select count(*) as total from(
select (extract(month from (ended_at - started_at)))
	as month_time from datatrip_2022) as month
where month_time=0 --> total 5667717 -> no error of the month

-- Check the validation of the day
select count(*) as total from(
select (extract(day from (ended_at - started_at)))
	as day_time from datatrip_2022) as day
where day_time=0 --> total 5662356 while the total rows are 5667717 -> 5361 row not that end_day not equal to start_day

-- Remove
select count(*) as total from(
select (extract(day from (ended_at - started_at)))
	as day_time from datatrip_2022) as day
where day_time<0 --> 1 row that the end_day is less than the start_day -> need to be removed

-- There are 5360 rows that the end_day is more than the start_day

--Check if start_station_name and start_station_id null
SELECT COUNT(ride_id) AS rows_with_start_station_null         
FROM datatrip_2022
WHERE start_station_name IS NULL and start_station_id IS NULL;
-- total 833064 rows -> need to be removed

SELECT COUNT(ride_id) AS rows_with_end_station_null         
FROM datatrip_2022
WHERE end_station_name IS NULL and end_station_id IS NULL;
-- total 892742 rows -> need to be removed

--Check if start_lad and start_lng null
SELECT COUNT(ride_id) AS rows_with_lat        
FROM datatrip_2022
WHERE start_lat IS NULL and start_lng IS NULL; --> 0 row

SELECT COUNT(ride_id) AS rows_with_lat        
FROM datatrip_2022
WHERE end_lat IS NULL and end_lng IS NULL; --> 5858 rows  -> need to be removed

-- Types of bikes
select distinct rideable_type from datatrip_2022