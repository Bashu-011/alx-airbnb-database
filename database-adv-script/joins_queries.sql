--Returns Users who have bookings
SELECT
    b.booking_id,
    b.property_id,
    b.start_date,
    b.end_date,
    b.totale_price,
    b.status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email
FROM BOOKING b
INNER JOIN USER u
    ON b.user_id = u.user_id;


--Returns properties that have or don't have reviews
SELECT
    p.property_id,
    p.name AS property_name,
    p.location,
    p.rating,
    p.review_id,
    p.comment,
    p.created_at
FROM Property p
LEFT JOIN Review r
    ON p.property_id = r.property_id
ORDER BY p.property_id;

--Returns all user and all bookings
SELECT
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    b.booking_id,
    b.property_id,
    b.start_date,
    b.end_date,
    b.status
FROM User u
FULL OUTER JOIN Booking b
    ON u.user_id = b.user_id;

--Properties where average rating is greater than 4
SELECT
    p.property_id,
    p.name AS property_name,
    p.location,
    p.rating
FROM Property p
WHERE p.property_id IN (
    SELECT r.property_id
    FROM Review r
    GROUP BY r.property_id
    HAVING AVG(r.rating) > 4.0
)
ORDER BY p.property_id;

--Users with 3 or more bookings
SELECT
    u.user_id,
    u.first_name,
    u.last_name,
    u.email
FROM User u
WHERE (
    SELECT COUNT(*)
    FROM Booking b
    WHERE b.user_id = u.user_id
) > 3
ORDER BY u.user_id;



