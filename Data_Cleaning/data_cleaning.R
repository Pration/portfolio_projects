#combining data frame
cyclist_trip_data_df <- rbind(may_2022, june_2022, july_2022, august_2022, september_2022, october_2022, november_2022, december_2022, january_2023, febuary_2023, march_2023, april_2023)
cyclist_trip_data_df <- rbind(may_2022, june_2022, july_2022, august_2022, september_2022, october_2022, november_2022, december_2022, January_2023, Febuary_2023, March_2023, April_2023)

#inspect new data frame
colnames(cyclist_trip_data_df)
head(cyclist_trip_data_df)
tail(cyclist_trip_data_df)

#Data characteristics
dim(cyclist_trip_data_df)
nrow(cyclist_trip_data_df)
ncol(cyclist_trip_data_df)

#Add new columns for proper analysis
cyclist_trip_data_df$date <- as.Date(cyclist_trip_data_df$started_at)
cyclist_trip_data_df$date <- as.Date(cyclist_trip_data_df$started_at)
cyclist_trip_data_df$year <- format(as.Date(cyclist_trip_data_df$date), "%Y")
cyclist_trip_data_df$month <- format(as.Date(cyclist_trip_data_df$date), "%m")
cyclist_trip_data_df$day <- format(as.Date(cyclist_trip_data_df$date), "%d")

#Add ride length - Calculate the length of each ride
cyclist_trip_data_df$ride_length <- difftime(cyclist_trip_data_df$ended_at, cyclist_trip_data_df$started_at, units = "mins")
#calculate the day of the week that each ride started
cyclist_trip_data_df$weekday <- format(as.Date(cyclist_trip_data_df$date), "%A")

#Additional column for time
cyclist_trip_data_df$time <- as.POSIXct(cyclist_trip_data_df$started_at, format = "%Y-%m-%d %H:%M:%S")
cyclist_trip_data_df$time <- format(cyclist_trip_data_df$time, format = "%H:%M:%S")

#Rounding up ride length to zero decimal places
cyclist_trip_data_df$ride_length<- round(cyclist_trip_data_df$ride_length, digits = 0)

#removing n/a values and duplicate data
#create a second version of the dataframe in order to presserve the opriginal data
colSums(is.na(cyclist_trip_data_df))
cyclist_trip_data_df2 <- cyclist_trip_data_df[complete.cases(cyclist_trip_data_df), ]
cyclist_trip_data_df2 <- distinct(cyclist_trip_data_df2)
cyclist_trip_data_df2<- cyclist_trip_data_df2 %>% filter(started_at < ended_at)
cyclist_trip_data_df2 <- drop_na(cyclist_trip_data_df2)
cyclist_trip_data_df2 <- remove_empty(all_rides,which = c("cols"))
cyclist_trip_data_df2 <- remove_empty(cyclist_trip_data_df2,which = c("cols"))
cyclist_trip_data_df2 <- remove_empty(cyclist_trip_data_df2,which = r("rows"))
cyclist_trip_data_df2 <- remove_empty(cyclist_trip_data_df2,which = c("rows"))

#excludes rows where the "ride_length" column is less than 0.
cyclist_trip_data_df2 <- cyclist_trip_data_df[!(cyclist_trip_data_df$ride_length_s < 0), ]
cyclist_trip_data_df2 <- cyclist_trip_data_df[!(cyclist_trip_data_df$ride_length < 0), ]
nrow(cyclist_trip_data_df2) - nrow(cyclist_trip_data_df)

#converting the "ride_length" column in the data frame to numeric format
# Convert ride_length to numeric
cyclist_trip_data_df$ride_length <- as.numeric(as.character(cyclist_trip_data_df$ride_length))

# Calculate ride duration as a time difference
cyclist_trip_data_df$ride_duration <- difftime(cyclist_trip_data_df$ended_at, cyclist_trip_data_df$started_at, units = "mins")

# Calculate hours and minutes from ride duration
cyclist_trip_data_df$hours <- as.integer(cyclist_trip_data_df$ride_duration) %/% 60
cyclist_trip_data_df$minutes <- as.integer(cyclist_trip_data_df$ride_duration) %% 60

# Format ride duration as HH:MM:SS
cyclist_trip_data_df$ride_length_hms <- sprintf("%02d:%02d:00", cyclist_trip_data_df$hours, cyclist_trip_data_df$minutes)

# Remove intermediate columns
cyclist_trip_data_df <- cyclist_trip_data_df[, -c("hours", "minutes", "ride_duration")]

# Convert ride length to numeric if needed (you might have done this earlier)
cyclist_trip_data_df$ride_length <- as.numeric(as.character(cyclist_trip_data_df$ride_length))


##Sorting Dataframe.
cyclist_trip_data_df <- cyclist_trip_data_df[order(cyclist_trip_data$started_at), ]
cyclist_trip_data_df <- cyclist_trip_data_df[order(cyclist_trip_data_df$started_at), ]
cyclist_trip_data_df <- cyclist_trip_data_df[order(cyclist_trip_data_df$date), ]

##checking the new data frame.
colnames(cyclist_trip_data_df2)

#Rename column to better understand the data
cyclist_trip_data_df2 <- rename(cyclist_trip_data_df2, costumer_type = member_casual, bike_type = rideable_type, Start_time = time,)

#Adding end time column
cyclist_trip_data_df$end_time <- as.POSIXct(cyclist_trip_data_df$ended_at, format = "%Y-%m-%d %H:%M:%S")
cyclist_trip_data_df$end_time <- format(cyclist_trip_data_df$end_time, format = "%H:%M:%S")

#Checking column names
colnames(cyclist_trip_data_df2)
colnames(cyclist_trip_data_df)

#Modifying Column names
cyclist_trip_data_df2 <- rename(cyclist_trip_data_df2, customer_type = member_casual)
cyclist_trip_data_df2 <- rename(cyclist_trip_data_df2, customer_type = costumer_type)

#view final clean data
colnames(cyclist_trip_data_df2)
head(cyclist_trip_data_df2)
tail(cyclist_trip_data_df2)
dim(cyclist_trip_data_df2)
summary(cyclist_trip_data_df2)
colSums(is.na(cyclist_trip_data_df2))
cyclist_trip_data_df2 <- remove_missing(cyclist_trip_data_df2)
colSums(is.na(cyclist_trip_data_df2))
