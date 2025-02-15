-- Number of crimes reported per year
SELECT year, COUNT(*) AS total_crimes
FROM chicago_crime
GROUP BY year
ORDER BY year;

-- Top 5 Most Common Crimes
SELECT primary_type, COUNT(*) AS crime_count
FROM chicago_crime
GROUP BY primary_type
ORDER BY crime_count DESC
LIMIT 5;

-- Crimes with arrests
SELECT primary_type, COUNT(*) AS arrest_count
FROM chicago_crime
WHERE arrest = TRUE
GROUP BY primary_type
ORDER BY arrest_count DESC;

-- Crimes by location desc
SELECT location_description, COUNT(*) AS crime_count
FROM chicago_crime
GROUP BY location_description
ORDER BY crime_count DESC
LIMIT 10;

-- Crimes by district
SELECT district, COUNT(*) AS crime_count
FROM chicago_crime
GROUP BY district
ORDER BY crime_count DESC;

-- Domestic crimes over the years
SELECT year, COUNT(*) AS domestic_crimes
FROM chicago_crime
WHERE domestic = TRUE
GROUP BY year
ORDER BY year;

-- Crimes with no arrests
SELECT primary_type, COUNT(*) AS no_arrest_count
FROM chicago_crime
WHERE arrest = FALSE
GROUP BY primary_type
ORDER BY no_arrest_count DESC
LIMIT 10;

-- Crimes by community
SELECT community_area, COUNT(*) AS crime_count
FROM chicago_crime
GROUP BY community_area
ORDER BY crime_count DESC
LIMIT 10;