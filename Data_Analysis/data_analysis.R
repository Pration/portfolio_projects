#conducting descriptive analyses
mean(cyclist_trip_data_df2$ride_length)
median(cyclist_trip_data_df2$ride_length)
View(describe(cyclist_trip_data_df2$ride_length, fast=TRUE))
min(cyclist_trip_data_df2$ride_length)
max(cyclist_trip_data_df2$ride_length)

#Compare the average ride duration between annual members and casual riders using the mean() function.
# Subset the dataframe for annual members and casual riders
annual_members <- cyclist_trip_data_df2[cyclist_trip_data_df2$customer_type == "Annual Member", ]
casual_riders <- cyclist_trip_data_df2[cyclist_trip_data_df2$customer_type == "Casual Rider", ]

# Calculate the average ride duration for annual members and casual riders
average_duration_annual <- mean(annual_members$ride_length, na.rm = TRUE)
average_duration_casual <- mean(casual_riders$ride_length, na.rm = TRUE)

# Print the results
print("Average Ride Duration for Annual Members:")
print(average_duration_annual)

print("Average Ride Duration for Casual Riders:")
print(average_duration_casual)

#Compare the average ride distance between annual members and casual riders using the mean() function.
#need to calculate ride distance
# Function to calculate the distance between two coordinates using the Haversine formula
# Define the haversine_distance function
haversine_distance <- function(lat1, lon1, lat2, lon2) {
  R <- 6371  # Earth's radius in kilometers
  phi1 <- deg2rad(lat1)
  phi2 <- deg2rad(lat2)
  delta_phi <- deg2rad(lat2 - lat1)
  delta_lambda <- deg2rad(lon2 - lon1)
  a <- sin(delta_phi/2)^2 + cos(phi1) * cos(phi2) * sin(delta_lambda/2)^2
  c <- 2 * atan2(sqrt(a), sqrt(1 - a))
  distance <- R * c
  return(distance)
}

# Define the deg2rad function
deg2rad <- function(degrees) {
  return(degrees * pi / 180)
}

# Calculate ride distance using the haversine_distance function
ride_distance <- haversine_distance(
  cyclist_trip_data_df2$start_lat, cyclist_trip_data_df2$start_lng,
  cyclist_trip_data_df2$end_lat, cyclist_trip_data_df2$end_lng
)

# Add ride_distance to the dataframe
cyclist_trip_data_df2$ride_distance <- ride_distance

# Calculate the average ride distance for annual members and casual riders
average_distance_member <- mean(cyclist_trip_data_df2$ride_distance[cyclist_trip_data_df2$customer_type == "Annual Member"], na.rm = TRUE)
average_distance_casual <- mean(cyclist_trip_data_df2$ride_distance[cyclist_trip_data_df2$customer_type == "Casual Rider"], na.rm = TRUE)

# Print the results
print("Average Ride Distance for Annual Members:")
print(average_distance_member)

print("Average Ride Distance for Casual Riders:")
print(average_distance_casual)

# Create a frequency table for rides by day of the week for annual members
annual_members_freq <- table(cyclist_trip_data_df2$day_of_week[cyclist_trip_data_df2$customer_type== "member"])
annual_members_freq <- table(cyclist_trip_data_df2$weekday[cyclist_trip_data_df2$customer_type== "member"])
casual_members_freq <- table(cyclist_trip_data_df2$weekday[cyclist_trip_data_df2$customer_type== "casual"])

##Calculate the number of rides by user type and bike type
ride_counts <- cyclist_trip_data_df2 %>%
  group_by(customer_type, bike_type) %>%
  summarise(number_of_rides = n())
View(ride_counts)

#calculate the number of rides by user type and weekday
ride_counts <- cyclist_trip_data_df2 %>%
  group_by(customer_type, weekday) %>%
  summarise(number_of_rides = n())
View(ride_counts)

#Analyze top start and end stations
top_start_stations <- cyclist_trip_data_df2 %>%
  group_by(customer_type, start_station_name) %>%
  count() %>%
  top_n(1, wt = n) %>%
  ungroup()
top_end_stations <- cyclist_trip_data_df2 %>%
  group_by(customer_type, end_station_name) %>%
  count() %>%
  top_n(1, wt = n) %>%
  ungroup()
# View the results
print(top_start_stations)
print(top_end_stations
      
# Find the busiest days for each customer type based on ride counts
busiest_days <- ride_counts %>%
group_by(customer_type) %>%
filter(number_of_rides == max(ride_counts)) %>%
select(customer_type, weekday, ride_counts)

#Saving data for visualization
# Write dataframes to CSV files
write.csv(cyclist_trip_data_df2, "cyclist_trip_data_df2.csv", row.names = FALSE)
write.csv(ride_counts, "ride_counts.csv", row.names = FALSE)
write.csv(ride_counts2, "ride_counts2.csv", row.names = FALSE)
write.csv(average_duration, "average_duration.csv", row.names = FALSE)
write.csv(top_end_stations, "top_end_stations.csv", row.names = FALSE)
write.csv(top_start_stations, "top_start_stations.csv", row.names = FALSE)
write.csv(busiest_days, "busiest_days.csv", row.names = FALSE)

      