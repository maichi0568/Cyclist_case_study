# Cyclist_case_study
This case study focuses on Cyclistic, a bike-share company in Chicago. In order to answer the business tasks, I will follow the six phases of the data analysis procress: Ask, Prepare, Process, Analyze, Share and Act
# Background
## About the company
In 2016, Cyclistic launched a successful bike-share oŦering. Since then, the program has grown to a feet of 5,824 bicycles that aregeotracked and locked into a network of 692 stations across Chicago. The bikes can be unlocked from one station and returned toany other station in the system anytime. Until now, Cyclistic’s marketing strategy relied on building general awareness and appealing to broad consumer segments. One approach that helped make these things possible was the Ųexibility of its pricing plans: single-ride passes, full-day passes, and annual memberships. Customers who purchase single-ride or full-day passes are referred to as casual riders. Customers who purchase annual memberships are Cyclistic members. Cyclistic’s ůnance analysts have concluded that annual members are much more profitable than casual riders. Although the pricing Ųexibility helps Cyclistic attract more customers, Moreno believes that maximizing the number of annual members will be key to future growth. Rather than creating a marketing campaign that targets all-new customers, Moreno believes there is a very good chance to convert casual riders into members. She notes that casual riders are already aware of the Cyclistic program and have chosen Cyclistic for their mobility needs. Moreno has set a clear goal: Design marketing strategies aimed at converting casual riders into annual members. In order to do that, however, the marketing analyst team needs to better understand how annual members and casual riders diŦer, why casual
riders would buy a membership, and how digital media could affect their marketing tactics. Moreno and her team are interested in analyzing the Cyclistic historical bike trip data to identify trends.
## Scenario
I am a junior data analyst working in the marketing analyst team at Cyclistic, a bike-share company in Chicago. The director of marketing believes the company’s future success depends on maximizing the number of annual memberships. Therefore, my team wants to understand how casual riders and annual members use Cyclistic bikes differently. From these insights, my team will
design a new marketing strategy to convert casual riders into annual members. But first, Cyclistic executives must approve my recommendations, so they must be backed up with compelling data insights and professional data visualizations.
## Characters and teams
**Cyclistic:** A bike-share program that features more than 5,800 bicycles and 600 docking stations. Cyclistic sets itself apart by also offering reclining bikes, hand tricycles, and cargo bikes, making bike-share more inclusive to people with disabilities and riders who can’t use a standard two-wheeled bike. The majority of riders opt for traditional bikes; about 8% of riders use the assistive options. Cyclistic users are more likely to ride for leisure, but about 30% use them to commute to work each day.

**Lily Moreno:** The director of marketing and your manager. Moreno is responsible for the development of campaigns and initiatives to promote the bike-share program. These may include email, social media, and other channels.

**Cyclistic marketing analytics team:** A team of data analysts who are responsible for collecting, analyzing, and reporting data that helps guide Cyclistic marketing strategy. You joined this team six months ago and have been busy learning about Cyclistic’s mission and business goals — as well as how you, as a junior data analyst, can help Cyclistic achieve them.

**Cyclistic executive team:** The notoriously detail-oriented executive team will decide whether to approve the recommended marketing program.
# Ask
## Business task
The purpose of this project is to create marketing strategies that convert casual drives to annual members.
## Stakeholder’s key
This insight can help the marketing team to increase the annual members.
## Deliverable
Identify the differences between the casual drivers and the annual members in order to guiding the merketing team to the strategies that can increase the amount of the two types of drivers.
# Prepare
## Data source
The data is located in the [link](https://divvy-tripdata.s3.amazonaws.com/index.html). The data is about the users from Jan, 2022 to Dec, 2022. It is the first-party which is collectd by Cyclist so it is low chance of bias. The data is open source and it is provided by Cyclist, you can see the liscence [here](https://divvybikes.com/data-license-agreement).
## Data organization
There is 12 files with naming yyyymm-divvy-tripdata. Each file of data have 13 colums: ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng and member_casual.
# Process
I am using SQL, PostgresSQL and Spreadsheets for processing, analyzing and visualizing the data due to the size of the database is too large that we can’t use spreadsheet doing these tasks.
## Load the data into SQL
The code is in the file Load_data.sql
## Data combining
After combining 12 files, the total rows of the new table is 5667717 equal to the total rows of the 12 files.
The code is in file Data_combining.sql
## Data exploration
The code is in file Data_Exploration.sql
This step includes 
* Test if ride_id is validation
* Check the riding-time
* Check the validation of the year, month and day
* Check the start_time and the end_time
* Check the start_statiom, end_station
* Check the start_lat, start_lng, end_lat, end_lng
Through these steps, we get some results:
* The ride_ids are validation
* The year and the month are validation
* 5361 row not that end_day not equal to start_day
* 1 row that the end_day is less than the start_day -> need to be removed
* There are 5360 rows that the end_day is more than the start_day
* Total 833064 rows that start_station_name and start_station_id null -> need to be removed
* Total 892742 rows that end_station_name and end_station_id null -> need to be removed
* Toatl 5858 rows that end_lat and end_lng null -> need to be removed
## Data process
The code is in the file Data_Process.sql
This step includes:
* Remove that the end_day is less than the start_day
* Remove the row that both start_station_name and start_station_id are null
* Remove the row that both end_station_name and end_station_id are null
* Remove the row that both end_lat and end_lng are null
* Update for the row that have the end_day is more than the start_day
# Analyze
## First of all, member and casual riders are compared by the type of bikes they are using.
[docked_bike_vs_member_casual](https://scontent.fsgn5-8.fna.fbcdn.net/v/t1.15752-9/381508155_295497883114203_6790646712262889420_n.png?_nc_cat=100&ccb=1-7&_nc_sid=ae9488&_nc_ohc=hSzFo1zZvlcAX_2xBvA&_nc_ht=scontent.fsgn5-8.fna&_nc_e2o=s&oh=03_AdR_m-zcs7VptSc0ei0P-hv2STxNaXcAMCh8w6Pwrk_5zQ&oe=6537AC80)


