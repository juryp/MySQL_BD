# Design Document - "Fuel Consumption and Interval Data Management Database"

By: Yurii

## Scope

### Purpose:
The purpose of this database is to track and manage vehicle fuel consumption based on interval data logs, including periods of parking and movement, timestamps, fuel levels, and additional metadata such as location.

### In-Scope:
- Vehicle profiles
- Interval data (parking/moving)
- Fuel levels and timestamps
- Location data
- Fuel consumption reports

### Out-of-Scope:
- Detailed vehicle maintenance records
- Real-time fuel consumption monitoring
- Integration with external GPS and fuel sensors

## Functional Requirements

### User Capabilities:
- Create and manage vehicle profiles
- Record interval data (parking/moving)
- Log fuel levels and timestamps
- Track location data
- Generate reports on fuel consumption

### Beyond Scope:
- Real-time fuel consumption monitoring
- Integration with external GPS and fuel sensors
- Advanced analytics and forecasting

## Entities and Relationships

### ER Diagram

#### Entities

- **Vehicles Table**: 
  - One-to-Many with Intervals Table

- **Intervals Table**: 
  - Many-to-One with Vehicles Table
  - One-to-Many with Locations Table (optional)

- **Locations Table**: 
  - Many-to-One with Intervals Table

### Views and Optimizations

#### High Fuel Consumption View

```sql
CREATE VIEW HighFuelConsumption AS
SELECT 
    i.interval_id, 
    v.make, 
    v.model, 
    v.year, 
    i.start_time, 
    i.end_time, 
    (i.start_fuel_level - i.end_fuel_level) AS fuel_consumed
FROM Intervals i
JOIN Vehicles v ON i.vehicle_id = v.vehicle_id
WHERE (i.start_fuel_level - i.end_fuel_level) > 5;
```
