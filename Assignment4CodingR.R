install.packages("tidyr")
install.packages("dplyr")                  
install.packages("lubridate")
library("dplyr")
library("lubridate")
library("tidyr")
#Here I install and load all the packages that I need for the assignment.

################################################################################

#1.Read the data into a data frame (make sure that column names do not have spaces in them).
ufodata <- read.csv("ufo_subset.csv")
names(ufodata) <- make.names(names(ufodata), unique = TRUE) 
ufodata$country[ufodata$country == ""] <- NA 
ufodata$shape[ufodata$shape == ""] <- NA 
#I read the dataset using read.csv(), assign the dataset to the ufodata variable 
#and then I use the make.names() function to remove spaces in columns.
#I also replace empty cells in the country and shape column with NA values.

################################################################################

#2. Find the rows where Shape information is missing and impute with "unknown".
#3. Remove the rows that do not have Country information.
#4. Convert Datetime and Date_posted columns into appropriate formats
#'5. NUFORC officials comment on sightings that may be hoax.  Figure out a way 
#'(go through the Comments and decide how a proper filter should look like) to 
#'identify possible hoax reports. Create a new boolean column "is_hoax", and populate 
#'this column with TRUE if the sighting is a possible hoax, FALSE otherwise.
ufodata <- ufodata %>%
  mutate(shape = ifelse(is.na(shape), "unknown", shape)) %>%
  drop_na(country) %>%
  mutate(datetime = as.POSIXct(datetime)) %>%
  mutate(date_posted = lubridate::parse_date_time(date_posted, orders = c("mdy", "ymd", "dmy"))) %>%
  mutate(is_hoax = grepl("NUFORC Note", comments, ignore.case = TRUE)) 
#'Here I create a pipe that first creates a shape column that replaces any missing 
#'values with the value "unknown", this is done by using the ifelse() and identifying the missing cells 
#'with the is.na() function, then having them replaced witth "unknown". I then use the
#'drop.na() function to remove any rows that contain the value NA within the country
#'column. The mutate function is then used along with the as.POSIXct() and parse_date_time()
#'to format the dates. A new column is then made for the hoax notes made by NUFORC.
#'
################################################################################

#6.Create a table reporting the percentage of hoax sightings per country.
Percentage_hoax_table <- ufodata %>% group_by(country) %>%
  summarize(Percentage_Hoax = mean(is_hoax) * 100)
#'Here I create a table that has country data grouped into rows with percentage_hoax data 
#'summarized in each cell per country, i then multiply this data by 100 to get a percent value.
#'
################################################################################

#7.Add another column to the dataset (report_delay) and populate with the time 
#difference in days, between the date of the sighting and the date it was reported.
ufodata <- ufodata %>%
  mutate(report_delay = as.numeric(difftime(date_posted, datetime, units = "days"))) %>%
  #'Here I again use the mutate function to create a column that contains the calculated difference 
  #'between the date_posted and datetime variables.
  
  ################################################################################

#8.Remove the rows where the sighting was reported before it happened.
filter(report_delay > 0) 
#I use the filter function to filter out data that has a report_delay value of more than 0

################################################################################

#9.Create a table reporting the average report_delay per country.
avg_delay_table <- ufodata %>% group_by(country) %>% 
  summarize(Average_Report_Delay = mean(report_delay)) 
#Here i pretty much repeat the process done in step 6
################################################################################

#10.Check the data quality (missingness, format, range etc) of the "duration seconds" 
#column. Explain what kinds of problems you have identified and how you chose to deal with them, in your comments.
class(ufodata$duration.seconds)
summary(ufodata$duration.seconds)
#'The range of data for the duration.seconds columnm is very large, with values
#'ranging froom 0 to 52623200 seconds which is equivalent to 609 days, Thereforee,
#'I will limit the duration in seconds to times in between 0.5 second and 1 day, 
#'since the value 0.5 reeoeats a decentr amount of times and is likely a significant 
#'observation. I am also going to limit the max duration to one day which is equivaltent
#'to 86400 seconds.
ufodata <- ufodata %>%
  filter(duration.seconds >= 0.5) %>%
  filter(duration.seconds <= 86400)
#Here i just filter out values less than 0.5 and more than 86400

################################################################################

#11.Create a histogram using the "duration seconds" column.
hist(log(ufodata$duration.seconds), xlab = "Log of Sighting Duration (s)", ylab = "Frequency", main = "Frequency of UFO Sighting Durations in Seconds")
#I plotted the log because the plot without log didnt show any meaningful pattern 
#and the values were astronomical.