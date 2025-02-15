# Chicago Crime Analysis: SQL Project

This project analyzes the **Chicago Crime Dataset** using SQL. The dataset contains information about crimes reported in Chicago from 2001 to the present. The goal of this project is to demonstrate advanced SQL skills by performing complex queries and deriving meaningful insights from the data.

---

## Dataset Overview

### Source
The dataset is sourced from the [City of Chicago Data Portal](https://data.cityofchicago.org/Public-Safety/Crimes-2001-to-Present/ijzp-q8t2).

### Description
The dataset includes the following key columns:
- **Case Number**: Unique identifier for each crime.
- **Date**: Date and time when the crime occurred.
- **Block**: Address or block where the crime occurred.
- **Primary Type**: Type of crime (e.g., theft, battery, assault).
- **Description**: Detailed description of the crime.
- **Location Description**: Specific location (e.g., street, residence, park).
- **Arrest**: Whether an arrest was made (TRUE/FALSE).
- **Domestic**: Whether the crime was domestic-related (TRUE/FALSE).
- **District**: Police district where the crime occurred.
- **Latitude/Longitude**: Geographic coordinates of the crime location.

---

## Tools Used
- **SQL**: For querying and analyzing the data.
- **PostgreSQL**: Database management system.
- **pgAdmin**: For importing and managing the dataset.
- **Tableau/Power BI**: For visualizing the results (optional).

---

## Project Steps

1. **Download the Dataset**: The dataset was downloaded from the City of Chicago Data Portal in CSV format.
2. **Create Database and Table**: A PostgreSQL database was created, and a table was designed to store the crime data.
3. **Import Data**: The dataset was imported into the `chicago_crime` table using the `COPY` command.
4. **Perform Analysis**: A series of SQL queries were executed to analyze the data.
5. **Visualize Results**: Key insights were visualized using Tableau or Python (optional).

---

## Key Findings

### 1. **Crime Trends Over Time**
- The number of crimes peaked in the early 2000s and has been declining since.
- The moving average analysis revealed a steady decrease in crime rates over the years.

### 2. **Top Crime Types**
- Theft, battery, and criminal damage were the most common crime types.
- Theft accounted for over 30% of all reported crimes.

### 3. **Arrest Rates**
- Arrest rates varied significantly by crime type. For example, narcotics-related crimes had a high arrest rate, while theft had a lower arrest rate.
- Overall, only 20% of crimes resulted in an arrest.

### 4. **Crime Hotspots**
- Certain community areas, such as Austin and Humboldt Park, had the highest crime density.
- Crimes were more frequent in residential areas and on streets.

### 5. **Seasonal Trends**
- Crimes were more common during the summer months and less frequent in winter.

---

## Advanced Queries

The project includes the following advanced SQL queries:
1. **Moving Averages**: Calculated the 3-year moving average of crimes to identify trends.
2. **Top Crimes by District**: Identified the top 3 most common crime types for each district.
3. **Year-over-Year Growth Rate**: Analyzed the year-over-year growth rate of crimes.
4. **Time of Day Analysis**: Categorized crimes by time of day (morning, afternoon, evening, night).
5. **Seasonal Trends**: Analyzed crimes by season (winter, spring, summer, fall).


For detailed SQL code, refer to the [advanced_queries.sql](advanced_queries.sql) file.

