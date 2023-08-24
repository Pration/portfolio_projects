##attach packages for data cleaning, analysis and visualizations.
library(tidyverse)
library(skimr)
library(janitor)
library(lubridate)
library(data.table)
library(readxl)

##import data from excel into R
may_2022 <- read_excel("C:/Users/User/Desktop/Cyclist_trip_data/_XSL File/202205-divvy-tripdata.xlsx")
june_2022 <- read_excel("C:/Users/User/Desktop/Cyclist_trip_data/_XSL File/202206-divvy-tripdata.xlsx")
july_2022 <- read_excel("C:/Users/User/Desktop/Cyclist_trip_data/_XSL File/202207-divvy-tripdata.xlsx")
august_2022 <- read_excel("C:/Users/User/Desktop/Cyclist_trip_data/_XSL File/202208-divvy-tripdata.xlsx")
september_2022 <- read_excel("C:/Users/User/Desktop/Cyclist_trip_data/_XSL File/202209-divvy-publictripdata.xlsx")
october_2022 <- read_excel("C:/Users/User/Desktop/Cyclist_trip_data/_XSL File/202210-divvy-tripdata.xlsx")
november_2022 <- read_excel("C:/Users/User/Desktop/Cyclist_trip_data/_XSL File/202211-divvy-tripdata.xlsx")
december_2022 <- read_excel("C:/Users/User/Desktop/Cyclist_trip_data/_XSL File/202212-divvy-tripdata.xlsx")
January_2023 <- read_excel("C:/Users/User/Desktop/Cyclist_trip_data/_XSL File/202301-divvy-tripdata.xlsx")
Febuary_2023 <- read_excel("C:/Users/User/Desktop/Cyclist_trip_data/_XSL File/202302-divvy-tripdata.xlsx")
March_2023 <- read_excel("C:/Users/User/Desktop/Cyclist_trip_data/_XSL File/202303-divvy-tripdata.xlsx")
April_2023 <- read_excel("C:/Users/User/Desktop/Cyclist_trip_data/_XSL File/2023o4-divvy-tripdata.xlsx")
April_2023 <- read_excel("C:/Users/User/Desktop/Cyclist_trip_data/_XSL File/202304-divvy-tripdata.xlsx")

##Cobining all 12 datasets to make cleaning and analysis easier
##Data Validation
##Comparing column names
colnames(october_2022)
colnames(may_2022)
colnames(june_2022)
colnames(july_2022)
colnames(august_2022)
colnames(september_2022)
colnames(october_2022)
colnames(november_2022)
colnames(december_2022)
colnames(January_2023)
colnames(Febuary_2023)
colnames(March_2023)
colnames(April_2023)

##View internal structure of the datasets
str(may_2022)
str(june_2022)
str(july_2022)
str(august_2022)
str(september_2022)
str(october_2022)
str(november_2022)
str(december_2022)
str(January_2023)
str(Febuary_2023)
str(March_2023)
str(April_2023)

