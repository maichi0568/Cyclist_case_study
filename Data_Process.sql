-- Remove that the end_day is less than the start_day
WITH remove_less_than_0 AS (
  SELECT ride_id
  FROM datatrip_2022
  WHERE EXTRACT(DAY FROM (ended_at - started_at)) < 0
)
DELETE FROM datatrip_2022
WHERE ride_id IN (SELECT ride_id FROM remove_less_than_0);

-- Remove the row that both start_station_name and start_station_id are null
with remove_start as (
SELECT ride_id        
FROM datatrip_2022
WHERE start_station_name IS NULL and start_station_id IS NULL)
delete from datatrip_2022
where ride_id in (select ride_id from remove_start)

-- Remove the row that both end_station_name and end_station_id are null
with remove_end as (
SELECT ride_id        
FROM datatrip_2022
WHERE end_station_name IS NULL and end_station_id IS NULL)
delete from datatrip_2022
where ride_id in (select ride_id from remove_end)

-- Remove the row that both end_lat and end_lng are null
with remove_end_l as (
SELECT ride_id        
FROM datatrip_2022
WHERE end_lat IS NULL and end_lng IS NULL)
delete from datatrip_2022
where ride_id in (select ride_id from remove_end_l)

--Update for the row that have the end_day is more than the start_day
UPDATE datatrip_2022
SET ended_at = CASE
WHEN extract(day from (ended_at - started_at)) > 0 THEN ended_at + interval '24 hour'
ELSE ended_at
END;