CREATE DATABASE IF NOT EXISTS user_service_db;

CREATE USER IF NOT EXISTS 'root'@'localhost' IDENTIFIED BY 'root@2025dbv';
GRANT ALL PRIVILEGES ON user_service_db.* TO 'root'@'localhost';
FLUSH PRIVILEGES;

-- USER SERVICE DB
CREATE DATABASE IF NOT EXISTS user_service_db;
USE user_service_db;

CREATE TABLE IF NOT EXISTS User (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password VARCHAR(255),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    role VARCHAR(50) DEFAULT 'LEARNER'
);

-- USER SERVICE DB

CREATE TABLE IF NOT EXISTS password_reset_token (
id BIGINT AUTO_INCREMENT PRIMARY KEY,
token VARCHAR(255),
email VARCHAR(255),
expiry_date DATETIME
);

-- COURSE SERVICE DB
CREATE DATABASE IF NOT EXISTS course_service_db;
USE course_service_db;

CREATE TABLE IF NOT EXISTS Course (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(200),
    description TEXT,
    instructor_name VARCHAR(200), 
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS Enrollment (
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    course_id INT,
    enrolled_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- NOTIFICATION SERVICE DB
CREATE DATABASE IF NOT EXISTS notification_service_db;
USE notification_service_db;

CREATE TABLE IF NOT EXISTS Notification (
    notification_id INT PRIMARY KEY AUTO_INCREMENT,
    message TEXT,
    sent_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    user_id INT,
    course_id INT,
    assessment_id INT
);

-- USERASSESSMENT SERVICE DB
CREATE DATABASE IF NOT EXISTS userassessment_service_db;
USE userassessment_service_db;

CREATE TABLE IF NOT EXISTS assessment (
    assessment_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(200),
    course_id INT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS user_assessment (
    user_assessment_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    assessment_id INT,
    taken_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    score DECIMAL(5,2)
);

-- ANALYTICS SERVICE DB
CREATE DATABASE IF NOT EXISTS analytics_service_db;
USE analytics_service_db;

CREATE TABLE IF NOT EXISTS Analytics (
    analytics_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    course_id INT,
    assessment_id INT,
    metric_type VARCHAR(100),
    metric_value DECIMAL(10,2),
    recorded_at DATETIME DEFAULT CURRENT_TIMESTAMP
);


-- KEYCLOAK DB
CREATE DATABASE IF NOT EXISTS keycloak;
CREATE USER IF NOT EXISTS 'keycloak'@'%' IDENTIFIED BY 'keycloakpassword';
GRANT ALL PRIVILEGES ON keycloak.* TO 'keycloak'@'%';
FLUSH PRIVILEGES;