INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at)
VALUES
  (UUID_GENERATE_V4(), 'John', 'Doe', 'john.doe@example.com', 'hashedpassword1', '1234567890', 'guest', CURRENT_TIMESTAMP),
  (UUID_GENERATE_V4(), 'Jane', 'Smith', 'jane.smith@example.com', 'hashedpassword2', '1234567891', 'host', CURRENT_TIMESTAMP),
  (UUID_GENERATE_V4(), 'Alice', 'Johnson', 'alice.johnson@example.com', 'hashedpassword3', '1234567892', 'admin', CURRENT_TIMESTAMP);


INSERT INTO Property (property_id, host_id, name, description, location, pricepernight, created_at, updated_at)
VALUES
  (UUID_GENERATE_V4(), (SELECT user_id FROM User WHERE email = 'jane.smith@example.com'), 'Oceanfront Villa', 'Beautiful oceanfront villa with 3 bedrooms', 'Malibu, CA', 350.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
  (UUID_GENERATE_V4(), (SELECT user_id FROM User WHERE email = 'jane.smith@example.com'), 'Mountain Retreat', 'Cozy mountain retreat with a fireplace', 'Aspen, CO', 250.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
  (UUID_GENERATE_V4(), (SELECT user_id FROM User WHERE email = 'john.doe@example.com'), 'City Apartment', 'Modern apartment in downtown', 'New York, NY', 200.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at)
VALUES
  (UUID_GENERATE_V4(), (SELECT property_id FROM Property WHERE name = 'Oceanfront Villa'), (SELECT user_id FROM User WHERE email = 'john.doe@example.com'), '2023-12-01', '2023-12-07', 2100.00, 'confirmed', CURRENT_TIMESTAMP),
  (UUID_GENERATE_V4(), (SELECT property_id FROM Property WHERE name = 'Mountain Retreat'), (SELECT user_id FROM User WHERE email = 'john.doe@example.com'), '2023-11-15', '2023-11-20', 1250.00, 'pending', CURRENT_TIMESTAMP);

INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method)
VALUES
  (UUID_GENERATE_V4(), (SELECT booking_id FROM Booking WHERE status = 'confirmed'), 2100.00, CURRENT_TIMESTAMP, 'credit_card'),
  (UUID_GENERATE_V4(), (SELECT booking_id FROM Booking WHERE status = 'pending'), 1250.00, CURRENT_TIMESTAMP, 'paypal');

INSERT INTO Review (review_id, property_id, user_id, rating, comment, created_at)
VALUES
  (UUID_GENERATE_V4(), (SELECT property_id FROM Property WHERE name = 'Oceanfront Villa'), (SELECT user_id FROM User WHERE email = 'john.doe@example.com'), 5, 'Amazing place! Highly recommend!', CURRENT_TIMESTAMP),
  (UUID_GENERATE_V4(), (SELECT property_id FROM Property WHERE name = 'Mountain Retreat'), (SELECT user_id FROM User WHERE email = 'john.doe@example.com'), 4, 'Great retreat, but a bit remote.', CURRENT_TIMESTAMP);

INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at)
VALUES
  (UUID_GENERATE_V4(), (SELECT user_id FROM User WHERE email = 'john.doe@example.com'), (SELECT user_id FROM User WHERE email = 'jane.smith@example.com'), 'Is the villa available for New Year?', CURRENT_TIMESTAMP),
  (UUID_GENERATE_V4(), (SELECT user_id FROM User WHERE email = 'jane.smith@example.com'), (SELECT user_id FROM User WHERE email = 'john.doe@example.com'), 'Yes, it is available! Let me know if you need more details.', CURRENT_TIMESTAMP);
