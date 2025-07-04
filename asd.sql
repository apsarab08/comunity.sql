select * from users;
DESCRIBE users;
SELECT password FROM users WHERE email = 'educator1@gmail.com';
DELETE FROM Users
where user_id=9;
CREATE TABLE educator_profile (
    educator_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    bio TEXT,
    experience TEXT,
    other_details TEXT
);
delete from users 
where user_id=4;

ALTER TABLE users
ADD COLUMN age INT,
ADD COLUMN address VARCHAR(255),
ADD COLUMN interests TEXT,
ADD COLUMN special_needs TEXT,
ADD COLUMN health_info TEXT;

ALTER TABLE users
ADD COLUMN child_names VARCHAR(255) DEFAULT NULL,
ADD COLUMN parent_special_needs TEXT DEFAULT NULL,
ADD COLUMN specialization VARCHAR(255) DEFAULT NULL,
ADD COLUMN professional_experience TEXT DEFAULT NULL,
ADD COLUMN certifications TEXT DEFAULT NULL,
ADD COLUMN consultation_availability VARCHAR(255) DEFAULT NULL;

ALTER TABLE users ADD COLUMN profile_completed BOOLEAN DEFAULT FALSE;
SELECT user_id, name, email, role, profile_completed FROM users WHERE user_id =16;
ALTER TABLE users
ADD COLUMN bio TEXT;


select profile_completed, name, specialization,age from users;
SELECT * FROM users
WHERE user_id = 13;

ALTER TABLE users
    ADD CONSTRAINT fk_parent1 FOREIGN KEY (parent1_id) REFERENCES users(user_id),
    ADD CONSTRAINT fk_parent2 FOREIGN KEY (parent2_id) REFERENCES users(user_id),
    ADD CONSTRAINT fk_educator FOREIGN KEY (educator_id) REFERENCES users(user_id);
    
UPDATE users
SET email = 'pa@gmail.com'
WHERE user_id = 15;
ALTER TABLE users ADD CONSTRAINT fk_parent1 FOREIGN KEY (parent1_id) REFERENCES users(user_id);
ALTER TABLE users ADD CONSTRAINT fk_parent2 FOREIGN KEY (parent2_id) REFERENCES users(user_id);
ALTER TABLE users ADD CONSTRAINT fk_educator FOREIGN KEY (educator_id) REFERENCES users(user_id);

SELECT CONSTRAINT_NAME, TABLE_NAME, COLUMN_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE TABLE_NAME = 'users';

SELECT CONSTRAINT_NAME, TABLE_NAME, COLUMN_NAME, REFERENCED_TABLE_NAME, REFERENCED_COLUMN_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE TABLE_NAME = 'users';

ALTER TABLE users DROP FOREIGN KEY users_ibfk_1;
ALTER TABLE users DROP FOREIGN KEY users_ibfk_2;
ALTER TABLE users DROP FOREIGN KEY users_ibfk_3;

SHOW INDEX FROM users;
SELECT * FROM users WHERE user_id = 18;  -- Check if educator_id exists

-- Step 1: Ensure user_id remains as primary key
ALTER TABLE users
  DROP INDEX PRIMARY;

-- Step 2: Add UNIQUE constraints on email and username (if needed)
ALTER TABLE users
  ADD CONSTRAINT UNIQUE (email),
  ADD CONSTRAINT UNIQUE (username);
  
 ALTER TABLE users
ADD CONSTRAINT unique_email UNIQUE (email);

ALTER TABLE users ADD CONSTRAINT fk_parent1 FOREIGN KEY (parent1_id) REFERENCES users(user_id);
ALTER TABLE users ADD CONSTRAINT fk_parent2 FOREIGN KEY (parent2_id) REFERENCES users(user_id);

SHOW CREATE TABLE users;

CREATE TABLE Feedback (
    feedback_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    feedback TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

describe feedback;
select* from feedback;
SELECT user_id, name, email FROM Users WHERE parent1_id =14 OR parent2_id = 15;
CREATE TABLE educator_assignments (
    assignment_id INT AUTO_INCREMENT PRIMARY KEY,
    child_id INT,
    educator_id INT,
    FOREIGN KEY (child_id) REFERENCES users(user_id),
    FOREIGN KEY (educator_id) REFERENCES users(user_id)
);
CREATE TABLE sessions (
    session_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    login_time DATETIME NOT NULL,
    logout_time DATETIME,
    total_time INT DEFAULT 0,
    session_date DATE NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

select* from sessions;
update users 
set name='child8'
where user_id=16;
    


