# Preliminary Data Exploration

* What is the shape of `df_data`? 
* How many rows and columns does it have?

4 324 rows and 9 columns

* What are the column names?

Two (redundant) ID columns at the beginning of the dataset
Organisation - chr
Location - chr
Date - chr - converted to dttm using `as.POSIXct` - this caused loss of all dates that didn't have times - fixed by writing function
```function(date_string) {
    if (grepl("\\d{2}:\\d{2}", date_string)) {
        return(as.POSIXct(date_string, format = "%a %b %d, %Y %H:%M"))
    } else {
        # assign midnight
        concat_date_midnight <- paste(date_string, "00:00 UTC")
        return(as.POSIXct(concat_date_midnight,  format = "%a %b %d, %Y %H:%M"))
    }
}```

`space_missions$Date <- as.POSIXct(sapply(space_missions$Date, parse_dates))`

Detail - chr
Rocket_Status - chr
Price - dbl
Mission_Status - chr

* Are there any NaN values or duplicates?
na - 126 Date^, 3360 Price
All prices are doubles
All rows are distinct, no duplicates found using `duplicated` and `distinct()`

^ due to error in date parsing formula (not accounting for dates with missing times). fixed and now 0 na values in Date column

## Data Cleaning - Check for Missing Values and Duplicates

Consider removing columns containing junk data. 

Renamed unnamed ID column to `Mission_ID`
Cleaned Dates using custom parse function (see above)

## Descriptive Statistics

# Number of Launches per Company

Create a chart that shows the number of space mission launches by organisation.

# Number of Active versus Retired Rockets

How many rockets are active compared to those that are decomissioned? 

# Distribution of Mission Status

How many missions were successful?
How many missions failed?

# How Expensive are the Launches? 

Create a histogram and visualise the distribution. The price column is given in USD millions (careful of missing values). 

# Use a Choropleth Map to Show the Number of Launches by Country

* Create a choropleth map
* You'll need to extract a `country` feature as well as change the country names that no longer exist.

Wrangle the Country Names
You'll need to use a 3 letter country code for each country. You might have to change some country names.

* Russia is the Russian Federation
* New Mexico should be USA
* Yellow Sea refers to China
* Shahrud Missile Test Site should be Iran
* Pacific Missile Range Facility should be USA
* Barents Sea should be Russian Federation
* Gran Canaria should be USA

You can use the iso3166 package to convert the country names to Alpha3 format.


# Use a Choropleth Map to Show the Number of Failures by Country

# Create a Plotly Sunburst Chart of the countries, organisations, and mission status. 

# Analyse the Total Amount of Money Spent by Organisation on Space Missions

# Analyse the Amount of Money Spent by Organisation per Launch

# Chart the Number of Launches per Year

# Chart the Number of Launches Month-on-Month until the Present

Which month has seen the highest number of launches in all time? Superimpose a rolling average on the month on month time series chart. 

# Launches per Month: Which months are most popular and least popular for launches?

Some months have better weather than others. Which time of year seems to be best for space missions?

# How has the Launch Price varied Over Time? 

Create a line chart that shows the average price of rocket launches over time. 

# Chart the Number of Launches over Time by the Top 10 Organisations. 

How has the dominance of launches changed over time between the different players? 

# Cold War Space Race: USA vs USSR

The cold war lasted from the start of the dataset up until 1991. 

## Create a Plotly Pie Chart comparing the total number of launches of the USSR and the USA

Hint: Remember to include former Soviet Republics like Kazakhstan when analysing the total number of launches. 

## Create a Chart that Shows the Total Number of Launches Year-On-Year by the Two Superpowers

## Chart the Total Number of Mission Failures Year on Year.

## Chart the Percentage of Failures over Time

Did failures go up or down over time? Did the countries get better at minimising risk and improving their chances of success over time? 

# For Every Year Show which Country was in the Lead in terms of Total Number of Launches up to and including including 2020)

Do the results change if we only look at the number of successful launches? 

# Create a Year-on-Year Chart Showing the Organisation Doing the Most Number of Launches

Which organisation was dominant in the 1970s and 1980s? Which organisation was dominant in 2018, 2019 and 2020? 
