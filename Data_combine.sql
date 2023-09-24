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