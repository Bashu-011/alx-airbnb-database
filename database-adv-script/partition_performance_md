### Partitioning Optimization

Implemented **table partitioning** on the `Booking` table based on the `start_date` column, splitting the data into yearly partitions.
Since `Booking` is a very large table, queries filtering by `start_date` are scanning the entire table, which is slow.

#### Improvements Observed
- Before partitioning: Queries scanned the full `Booking` table.
- After partitioning: PostgreSQL **pruned partitions** and only scanned the relevant year e.g `Booking_2025`.
- This reduced query execution time significantly.

#### Example
```sql
EXPLAIN ANALYZE
SELECT *
FROM Booking
WHERE start_date BETWEEN '2025-01-01' AND '2025-03-31';
