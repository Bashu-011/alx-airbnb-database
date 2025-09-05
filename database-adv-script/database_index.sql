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


EXPLAIN
SELECT u.first_name, u.last_name, b.booking_id, b.start_date, b.status
FROM User u
JOIN Booking b ON u.user_id = b.user_id
WHERE u.email = 'test123@gmail.com'
  AND b.status = 'confirmed';

