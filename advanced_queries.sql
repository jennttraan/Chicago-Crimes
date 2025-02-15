-- Moving avg of crimes over 3 years
WITH yearly_crimes AS (
    SELECT 
        year, 
        COUNT(*) AS total_crimes
    FROM chicago_crime
    GROUP BY year
)
SELECT 
    year, 
    total_crimes,
    AVG(total_crimes) OVER (ORDER BY year ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS moving_avg
FROM yearly_crimes
ORDER BY year;

-- Top 3 crimes per districts
WITH district_crimes AS (
    SELECT 
        district, 
        primary_type, 
        COUNT(*) AS crime_count,
        ROW_NUMBER() OVER (PARTITION BY district ORDER BY COUNT(*) DESC) AS rank
    FROM chicago_crime
    GROUP BY district, primary_type
)
SELECT 
    district, 
    primary_type, 
    crime_count
FROM district_crimes
WHERE rank <= 3
ORDER BY district, rank;

-- YOY growth rate of crimes
WITH yearly_crimes AS (
    SELECT 
        year, 
        COUNT(*) AS total_crimes
    FROM chicago_crime
    GROUP BY year
),
growth_rate AS (
    SELECT 
        year, 
        total_crimes,
        LAG(total_crimes) OVER (ORDER BY year) AS previous_year_crimes
    FROM yearly_crimes
)
SELECT 
    year, 
    total_crimes,
    ROUND(
        ((total_crimes - previous_year_crimes) * 100.0 / previous_year_crimes), 
        2
    ) AS growth_rate
FROM growth_rate
ORDER BY year;

-- Times by time of day
WITH crime_times AS (
    SELECT 
        primary_type,
        CASE 
            WHEN EXTRACT(HOUR FROM date) BETWEEN 6 AND 11 THEN 'Morning'
            WHEN EXTRACT(HOUR FROM date) BETWEEN 12 AND 17 THEN 'Afternoon'
            WHEN EXTRACT(HOUR FROM date) BETWEEN 18 AND 23 THEN 'Evening'
            ELSE 'Night'
        END AS time_of_day
    FROM chicago_crime
)
SELECT 
    time_of_day, 
    COUNT(*) AS crime_count,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS percentage
FROM crime_times
GROUP BY time_of_day
ORDER BY crime_count DESC;

-- Crimes by season
WITH seasonal_crimes AS (
    SELECT 
        primary_type,
        CASE 
            WHEN EXTRACT(MONTH FROM date) IN (12, 1, 2) THEN 'Winter'
            WHEN EXTRACT(MONTH FROM date) IN (3, 4, 5) THEN 'Spring'
            WHEN EXTRACT(MONTH FROM date) IN (6, 7, 8) THEN 'Summer'
            ELSE 'Fall'
        END AS season
    FROM chicago_crime
)
SELECT 
    season, 
    COUNT(*) AS crime_count,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS percentage
FROM seasonal_crimes
GROUP BY season
ORDER BY crime_count DESC;

-- Frequency of crime rste vs arrest
WITH crime_stats AS (
    SELECT 
        primary_type, 
        COUNT(*) AS total_crimes,
        SUM(CASE WHEN arrest = TRUE THEN 1 ELSE 0 END) AS total_arrests,
        AVG(CASE WHEN arrest = TRUE THEN 1 ELSE 0 END) AS arrest_rate
    FROM chicago_crime
    GROUP BY primary_type
)
SELECT 
    CORR(total_crimes, arrest_rate) AS correlation
FROM crime_stats;