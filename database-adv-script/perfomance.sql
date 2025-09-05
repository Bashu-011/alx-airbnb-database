-- Initial unoptimized query that gets user details
-- all bookings and related payments

SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id,
    p.name AS property_name,
    p.location,
    p.pricepernight,
    pay.payment_id,
    pay.amount,
    pay.payment_date,
    pay.payment_method
FROM Booking b
JOIN User u
    ON b.user_id = u.user_id
JOIN Property p
    ON b.property_id = p.property_id
LEFT JOIN Payment pay
    ON b.booking_id = pay.booking_id;

-- performance analysis on the unoptimized code
EXPLAIN ANALYZE
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id,
    p.name AS property_name,
    p.location,
    p.pricepernight,
    pay.payment_id,
    pay.amount,
    pay.payment_date,
    pay.payment_method
FROM Booking b
JOIN User u
    ON b.user_id = u.user_id
JOIN Property p
    ON b.property_id = p.property_id
LEFT JOIN Payment pay
    ON b.booking_id = pay.booking_id;

-- Indexing
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_payment_booking_id ON Payment(booking_id);
CREATE INDEX idx_user_email ON User(email);

-- the optimized sql query
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.status,

    u.first_name,
    u.last_name,
    u.email,

    p.name AS property_name,
    p.location,

    pay.amount,
    pay.payment_method
FROM Booking b
INNER JOIN User u
    ON b.user_id = u.user_id
INNER JOIN Property p
    ON b.property_id = p.property_id
LEFT JOIN Payment pay
    ON b.booking_id = pay.booking_id;




