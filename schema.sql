## `schema.sql`

```sql
-- Schema for Vehicles Table
CREATE TABLE Vehicles (
    vehicle_id INT PRIMARY KEY AUTO_INCREMENT,
    make VARCHAR(50) NOT NULL,
    model VARCHAR(50) NOT NULL,
    year INT NOT NULL
);

-- Schema for Intervals Table
CREATE TABLE Intervals (
    interval_id INT PRIMARY KEY AUTO_INCREMENT,
    vehicle_id INT NOT NULL,
    start_time DATETIME NOT NULL,
    end_time DATETIME NOT NULL,
    start_fuel_level FLOAT NOT NULL,
    end_fuel_level FLOAT NOT NULL,
    status ENUM('parking', 'moving') NOT NULL,
    location_id INT,
    FOREIGN KEY (vehicle_id) REFERENCES Vehicles(vehicle_id),
    FOREIGN KEY (location_id) REFERENCES Locations(location_id)
);

-- Schema for Locations Table
CREATE TABLE Locations (
    location_id INT PRIMARY KEY AUTO_INCREMENT,
    description VARCHAR(255) NOT NULL
);

-- Create indexes
CREATE INDEX idx_vehicle_make_model ON Vehicles(make, model);
CREATE INDEX idx_interval_time ON Intervals(start_time, end_time);
CREATE INDEX idx_location_description ON Locations(description);

-- Sample Data Insertion

-- Inserting sample data into Vehicles
INSERT INTO Vehicles (make, model, year) VALUES ('Toyota', 'Corolla', 2019);
INSERT INTO Vehicles (make, model, year) VALUES ('Honda', 'Civic', 2018);

-- Inserting sample data into Locations
INSERT INTO Locations (description) VALUES ('Downtown');
INSERT INTO Locations (description) VALUES ('Suburb');

-- Inserting sample data into Intervals
INSERT INTO Intervals (vehicle_id, start_time, end_time, start_fuel_level, end_fuel_level, status, location_id) 
VALUES (1, '2024-06-01 08:00:00', '2024-06-01 09:00:00', 50.0, 45.0, 'moving', 1);
INSERT INTO Intervals (vehicle_id, start_time, end_time, start_fuel_level, end_fuel_level, status, location_id) 
VALUES (2, '2024-06-01 10:00:00', '2024-06-01 11:00:00', 60.0, 55.0, 'parking', 2);
