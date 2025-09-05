# Optimisation Report

## Initial Query
The initial query retrieved bookings along with user, property, and payment details.  
However, the `EXPLAIN ANALYZE` output showed sequential scans on the `Booking`, `User`, and `Property` tables.  
This indicated that no indexes were being used, leading to inefficient full table scans.

## Inefficiencies Identified
- **Sequential scans** on `Booking.user_id`, `Booking.property_id`, and `Payment.booking_id`.  
- **Nested loop joins** when joining large tables without indexes.  
- Selecting unnecessary columns, which increased input - output cost.

## Optimizations Applied
1. Added indexes on frequently joined columns:
   - `Booking.user_id`
   - `Booking.property_id`
   - `Payment.booking_id`
   - `User.email`
2. Reduced selected columns to only essential fields.
3. Explicitly used `INNER JOIN` to clarify intent.

## Results
- Execution plan after indexing switched from **Seq Scan** to **Index Scan**, improving lookup performance.  
- Query execution time reduced significantly (depending on dataset size, up to several orders of magnitude).  
- The final query is leaner and avoids unnecessary overhead.
