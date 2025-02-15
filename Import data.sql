COPY chicago_crime(
    case_number, date, block, iucr, primary_type, description, 
    location_description, arrest, domestic, beat, district, ward, 
    community_area, fbi_code, x_coordinate, y_coordinate, year, 
    updated_on, latitude, longitude, location
)
FROM '/path/to/your/Crimes_-_2001_to_Present.csv'
DELIMITER ','
CSV HEADER;