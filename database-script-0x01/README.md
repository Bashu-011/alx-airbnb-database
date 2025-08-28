# Airbnb Database Schema

## Schema Overview

This file contains the SQL `CREATE TABLE` statements to define the schema for the Airbnb database. The schema includes the following tables:
- **User**: Stores user information.
- **Property**: Stores property details hosted by users.
- **Booking**: Stores booking information made by users for properties.
- **Payment**: Stores payment information for bookings.
- **Review**: Stores reviews left by users on properties.
- **Message**: Stores messages sent between users.

## Indexes

Indexes are created on frequently queried columns to improve performance:
- `email` in the **User** table.
- `host_id` in the **Property** table.
- `property_id` in the **Booking** and **Review** tables.
- `user_id` in the **Booking** and **Message** tables.

## How to Use

To create the schema in your database:
1. Download the `schema.sql` file.
2. Run the SQL script on your PostgreSQL or MySQL database system.

## Requirements

- PostgreSQL or MySQL database system.
- Ensure that UUID support is enabled in your database.
