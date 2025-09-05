-- User Table
CREATE INDEX idx_user_email ON User(email);
CREATE INDEX idx_user_role ON USER(role);

-- Booking Table
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_booking_status ON Booking(status);
CREATE INDEX idx_booking_dates ON Booking(start_date, end_date);

-- Property Table
CREATE INDEX idx_property_location ON Property(location);
CREATE INDEX idx_property_price ON Property(pricepernight);


EXPLAIN ANALYZE
SELECT *
FROM Property
WHERE location = 'Nairobi'
ORDER BY pricepernight;


