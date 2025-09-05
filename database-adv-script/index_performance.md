# High Usage Columns

## User Table

- email - frequently queried in WHERE (login, lookups).

- user_id → used in JOINs with Booking, Message, Review.

## Booking Table

- user_id - JOIN with User.

- property_id - JOIN with Property.

- start_date, end_date - mostly used in WHERE.

- status - used in filtering.

## Property Table

- property_id - JOIN with Booking and Review.

- location - mostly used in WHERE.

- pricepernight  - used in filtering/sorting.