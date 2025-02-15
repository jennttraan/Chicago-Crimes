CREATE DATABASE chicago_crime_db;

\c chicago_crime_db;

CREATE TABLE chicago_crime (
    id SERIAL PRIMARY KEY,
    case_number VARCHAR(20),
    date TIMESTAMP,
    block VARCHAR(100),
    iucr VARCHAR(10),
    primary_type VARCHAR(50),
    description TEXT,
    location_description VARCHAR(100),
    arrest BOOLEAN,
    domestic BOOLEAN,
    beat INT,
    district INT,
    ward INT,
    community_area INT,
    fbi_code VARCHAR(10),
    x_coordinate FLOAT,
    y_coordinate FLOAT,
    year INT,
    updated_on TIMESTAMP,
    latitude FLOAT,
    longitude FLOAT,
    location VARCHAR(50)
);