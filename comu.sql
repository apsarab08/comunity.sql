
CREATE DATABASE IF NOT EXISTS CommunityIssueReporting;
USE CommunityIssueReporting;

-- Users table
CREATE TABLE IF NOT EXISTS Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(50) NOT NULL
);

-- Categories table
CREATE TABLE IF NOT EXISTS Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

-- Problems table
CREATE TABLE IF NOT EXISTS Problems (
    problem_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    category_id INT NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(255) NOT NULL,
    image TEXT,
    images TEXT,
    status VARCHAR(50) NOT NULL,
    reported_date DATETIME NOT NULL,
    resolved_date DATETIME,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

-- StatusUpdates table
CREATE TABLE IF NOT EXISTS StatusUpdates (
    update_id INT AUTO_INCREMENT PRIMARY KEY,
    problem_id INT NOT NULL,
    status VARCHAR(50) NOT NULL,
    update_date DATETIME NOT NULL,
    comments TEXT,
    authority_id INT,
    FOREIGN KEY (problem_id) REFERENCES Problems(problem_id),
    FOREIGN KEY (authority_id) REFERENCES Users(user_id)
);

-- Comments table
CREATE TABLE IF NOT EXISTS Comments (
    comment_id INT AUTO_INCREMENT PRIMARY KEY,
    problem_id INT NOT NULL,
    user_id INT NOT NULL,
    comment_text TEXT NOT NULL,
    comment_date DATETIME NOT NULL,
    FOREIGN KEY (problem_id) REFERENCES Problems(problem_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Sample categories (can be adjusted as per actual categories)
INSERT INTO Categories (category_name) VALUES
('Road Maintenance'),
('Street Lighting'),
('Waste Management'),
('Water Supply'),
('Public Safety'),
('Parks and Recreation'),
('Education'),
('Healthcare');

-- Sample admin user (role can be 'Admin' or 'User')
-- Replace 'hashed_password_here' with the actual hashed password
INSERT INTO Users (name, email, password, role) VALUES
('Admin', 'admin@example.com', 'hashed_password_here', 'Admin');

-- Alter the Problems table to make image and images columns suitable for storing image paths
ALTER TABLE Problems
MODIFY COLUMN image TEXT;

ALTER TABLE Problems ADD COLUMN images TEXT;

-- Alter the Problems table to make category_id NOT NULL
ALTER TABLE Problems
MODIFY category_id INT NOT NULL;

-- Verify the table structure after modification
SHOW CREATE TABLE Problems;

-- Update any NULL category_id to a default value (e.g., 1)
UPDATE Problems
SET category_id = 1
WHERE category_id IS NULL;

-- Verify the structure and data of the Users and Categories tables
SELECT * FROM Users;
select *from comments;
select * from statusupdates;
SELECT * FROM Categories;
select * from problems;
delete from users 
where user_id=26;
INSERT INTO Users (name, email, password, role) VALUES ('Apsara', 'admin@yahoo.com', 'scrypt:32768:8:1$zy18H89x9ntt824q$9640e96d37b629c0362698c94959b4dad5aa47e95a7022c0af20e29cbe5e438f3d8c9c930ec63301136d9b52af8f03ed26ca62190527810973c3bcc53609c7f6'
, 'Admin');
CREATE TABLE Notifications (
    notification_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    issue_id INT NOT NULL,
    message TEXT NOT NULL,
    status ENUM('read', 'unread') DEFAULT 'unread',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (issue_id) REFERENCES Problems(problem_id)
);
DELIMITER //

CREATE TRIGGER notify_user_on_status_update
AFTER UPDATE ON Problems
FOR EACH ROW
BEGIN
    IF OLD.status != NEW.status THEN
        INSERT INTO Notifications (user_id, issue_id, message, status)
        VALUES (
            NEW.user_id,
            NEW.problem_id,
            CONCAT('The status of your reported issue ', NEW.problem_id, ' has been updated to ', NEW.status, '.'),
            'unread'
        );
    END IF;
    
    
END //

DELIMITER ;
ALTER TABLE Notifications DROP COLUMN is_read;
select* from notifications;
SELECT VERSION();

select* from users;
update users
set password='appu'
where user_id=25;
INSERT INTO Users (name, email, password, role) VALUES ('Apsara1', 'admin@appu.com', 'scrypt:32768:8:1$kahLA6pX3p49Nok4$6e7888f270f03101623481ac88bf6191dd7728aa93b7f9b4162e90acd36ef50510b5ce2f043fa00378dac2723f575648e27bc7cc49d805c3ee0940c373a30e42'

, 'Admin');
select * from problems;
select * from categories;
describe communityissuereporting;
describe CommunityIssueReporting;
SHOW TABLES;
