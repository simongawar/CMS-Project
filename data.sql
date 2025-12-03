-- USER DATA
INSERT INTO User (user_id, name, email, password, created_at, role) VALUES
(111, 'Simon Johnson', 'simon.johnson@gmail.com', '$2b$10$OJ0IAvMJBp8KD08A0gGQreIHo0gnen.idywRMORl/aBQ24Q8S7A0q', NOW(), 'ADMIN'),
(112, 'Bob Smith', 'bob.smith@gmail.com', '$2b$10$.QtgjTmOZghad.oNmNGIneVUIwR0N0NnrMii21xv9lAbnX3GjQyhS', NOW(), 'INSTRUCTOR'),
(113, 'Charles Bol', 'charles.bol@gmail.com', '$2b$10$Fk/kjvVX/tuUkv202vhSCeXPM5uPeyNXP0wIy8Aoqpuhj6NyAitYi', NOW(), 'LEARNER');



-- COURSE DATA
INSERT INTO Course (course_id, title, description, instructor_name, created_at) VALUES
(101, 'Introduction to SQL', 'Learn the basics of database querying and management.', 'A. Turing', '2024-09-01 10:00:00'),
(102, 'Advanced Python Programming', 'Deep dive into complex Python concepts and libraries.', 'G. Hopper', '2024-09-15 14:30:00'),
(103, 'Cloud Architecture Fundamentals', 'Understand the core concepts of cloud computing and design.', 'J. Von Neumann', '2024-09-29 09:00:00');

-- ENROLLMENT DATA
INSERT INTO Enrollment (enrollment_id, user_id, course_id, enrolled_at) VALUES
(1, 111, 101, '2024-10-01 10:00:00'),
(2, 111, 102, '2024-10-01 10:05:00'),
(3, 111, 101, '2024-10-05 15:30:00'),
(4, 113, 103, '2024-10-10 09:15:00');

-- NOTIFICATION DATA
INSERT INTO Notification (message, user_id, course_id, assessment_id) VALUES
('Welcome to Introduction to SQL!', 111, 101, NULL),
('Your score for SQL Basics Quiz is 92.50', 111, 101, 1),
('New assessment available for Cloud Architecture Fundamentals', 113, 103, 113),
('You have successfully enrolled in Advanced Python Programming', 111, 102, NULL);

-- ASSESSMENT DATA
INSERT INTO Assessment (title, course_id, created_at) VALUES
('SQL Basics Quiz', 101, '2025-10-01 10:00:00'),
('Python Final Project', 102, '2025-10-15 14:30:00'),
('Cloud Concepts Exam', 103, '2025-10-29 09:00:00');

-- USER ASSESSMENT DATA
INSERT INTO UserAssessment (user_assessment_id, user_id, assessment_id, taken_at, score) VALUES
(1, 111, 1, '2025-10-02 11:00:00', 92.50),
(2, 112, 1, '2025-10-02 11:15:00', 78.00),
(3, 111, 2, '2025-10-16 16:00:00', 85.75),
(4, 113, 3, '2025-10-30 10:30:00', 95.00);

-- ANALYTICS DATA
INSERT INTO Analytics (user_id, course_id, assessment_id, metric_type, metric_value, recorded_at) VALUES
(111, 101, NULL, 'Time_Spent_Minutes', 120.50, '2025-10-02 12:00:00'),
(111, 102, NULL, 'Time_Spent_Minutes', 90.00, '2025-10-16 13:00:00'),
(111, 101, 1, 'Assessment_Score', 92.50, '2025-10-02 11:05:00'),
(112, 101, 1, 'Assessment_Score', 78.00, '2025-10-02 11:20:00'),
(113, 103, NULL, 'Logins_Total', 15.00, '2025-10-30 08:00:00'),
(113, 103, 3, 'Assessment_Score', 95.00, '2025-10-30 10:35:00');
``