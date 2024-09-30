-- Drop existing tables if they exist
DROP TABLE IF EXISTS WorkoutSessions;
DROP TABLE IF EXISTS Members;

-- Create tables
CREATE TABLE Members (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    age INT
);

CREATE TABLE WorkoutSessions (
    session_id INT PRIMARY KEY,
    member_id INT,
    session_date DATE,
    session_time VARCHAR(50),
    activity VARCHAR(255),
    FOREIGN KEY (member_id) REFERENCES Members(id)
);

-- Insert data
INSERT INTO Members (id, name, age) VALUES (1, 'Jane Doe', 28);
INSERT INTO Members (id, name, age) VALUES (2, 'John Smith', 35);

INSERT INTO WorkoutSessions (session_id, member_id, session_date, session_time, activity) 
VALUES (1, 1, '2023-09-30', 'Morning', 'Yoga');
INSERT INTO WorkoutSessions (session_id, member_id, session_date, session_time, activity) 
VALUES (2, 2, '2023-09-30', 'Afternoon', 'Weightlifting');

-- Update Jane Doe's session time from Morning to Evening
UPDATE WorkoutSessions
SET session_time = 'Evening'
WHERE member_id = 1;

-- Delete John's workout session first, as his membership is canceled
DELETE FROM WorkoutSessions WHERE member_id = 2;

-- Now delete John Smith's data from the Members table
DELETE FROM Members WHERE id = 2;
