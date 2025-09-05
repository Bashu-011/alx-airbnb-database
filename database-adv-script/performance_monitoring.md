### Continuous Performance Monitoring

To ensure our database remains performant as data grows, we implemented a cycle of **monitoring, analysis, and optimization**.

#### Monitoring
We used tools such as:
- `EXPLAIN ANALYZE` (PostgreSQL) to examine query execution plans.

This allowed us to identify slow queries and understand where most of the execution cost was occurring.

#### Bottlenecks Identified
- Some queries were performing **full table scans** instead of using indexes.
- Joins between `Booking`, `User`, and `Property` tables became expensive under large datasets.
- Filtering by `date ranges` in the `Booking` table was slower without partition pruning.

#### Improvements Implemented
- **Indexing**: Added indexes on high-usage columns (`Booking.user_id`, `Booking.property_id`, `Payment.booking_id`, `User.email`).  
- **Partitioning**: Applied **range partitioning** on the `Booking` table based on `start_date` to reduce the scan size for date-based queries.  
- **Query Refactoring**: Removed unnecessary columns and joins in reporting queries, reducing execution time.  
- **Selective Queries**: Ensured use of `WHERE` filters to leverage indexes instead of scanning the entire dataset.

#### Results
- Queries filtering by user, property, or booking ID showed **significant performance improvements**. 
- Date range queries on bookings now scan only the relevant partition instead of the whole table.  
- Execution plans confirm that indexes and partition pruning are being used effectively.

