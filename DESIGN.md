# Design Document: Personal Finance Management System

By: Yurii



### Purpose:
Create a database to manage personal finances, including tracking income and expenses, managing budgets, monitoring account balances, and generating financial reports.

## Scope

### In-Scope:
- Users
- Accounts
- Transaction Categories
- Transactions


### Out-of-Scope:
- Detailed vehicle maintenance records
- Real-time fuel consumption monitoring
- Integration with external GPS and fuel sensors

## Functional Requirements

### Users should be able to::
- Register and log in
- Manage accounts and categories
- Manage transactions
- View balances and reports
- Set and track budgets

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
