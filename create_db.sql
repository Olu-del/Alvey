CREATE DATABASE user_alvey;

 use user_alvey;
 
 CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE courses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    instructor VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE contacts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(20),
    question TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE videos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    url TEXT NOT NULL
);

CREATE TABLE user_videos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    video_id INT,
    watched BOOLEAN DEFAULT FALSE,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (video_id) REFERENCES videos(id)
);

CREATE TABLE search_history (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    search_query VARCHAR(255) NOT NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);
 INSERT INTO videos (title, url) VALUES
('Video 1: Introduction', 'https://www.youtube.com/embed/wl_wDzzFhI0?si=4CUQ91p7dTlgm-ls'),
('Video 2: Advanced Techniques', 'https://www.youtube.com/embed/OB78_bW8kEM?si=VzjgSVM-wirE58XY'),
('Video 3: Deep Dive', 'https://www.youtube.com/embed/kS4lPtY0AKg?si=Vd4cuq1m92RD1NHa'),
('Video 4: Optimization', 'https://www.youtube.com/embed/qKfaf_rwg7U?si=xEvW0jFIuaXyZgJN'),
('Video 5: Best Practices', 'https://www.youtube.com/embed/EbyVDtPsa44?si=sCgjotHoYQ2JW-LI'),
('Video 6: Troubleshooting', 'https://www.youtube.com/embed/dcWWIclIHDY?si=yoom8zukdx-zMI7J'),
('Video 7: Real-world Examples', 'https://www.youtube.com/embed/qCdSNONlIl8?si=8azh1bP4hTFDaNlV'),
('Video 8: Final Thoughts', 'https://www.youtube.com/embed/AejOMMUyYiQ?si=AZyJ0bSjZ3ceA512');

CREATE USER 'alvey_elearning_app'@'localhost' IDENTIFIED BY 'smirted'; 

GRANT ALL PRIVILEGES ON user_alvey.* TO 'alvey_elearning_app'@'localhost';

CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE videos_price (id INT AUTO_INCREMENT,
name VARCHAR(50),
price DECIMAL(5, 2) unsigned,
PRIMARY KEY(id));

INSERT INTO videos_price (name, price) VALUES('wl_wDzzFhI0?si=4CUQ91p7dTlgm-ls', 10.30),
('OB78_bW8kEM?si=VzjgSVM-wirE58XY', 10.00), ('kS4lPtY0AKg?si=Vd4cuq1m92RD1NHa', 11.99), 
('qKfaf_rwg7U?si=xEvW0jFIuaXyZgJN', 12.99), ('EbyVDtPsa44?si=sCgjotHoYQ2JW-LI', 14.99), 
('dcWWIclIHDY?si=yoom8zukdx-zMI7J', 17.99), ('qCdSNONlIl8?si=8azh1bP4hTFDaNlV', 19.99),
('AejOMMUyYiQ?si=AZyJ0bSjZ3ceA512', 15.99);

SELECT * FROM videos;
SELECT * FROM videos_price;

SELECT videos.title AS video_title, videos_price.price AS video_price
FROM videos
JOIN videos_price
ON videos.url LIKE CONCAT('%', videos_price.name, '%')
WHERE videos.title LIKE '%Introduction%';

INSERT INTO videos (title, url) VALUES
('Video 1: Introduction', 'https://www.youtube.com/embed/wl_wDzzFhI0?si=4CUQ91p7dTlgm-ls'),
('Video 2: Advanced Techniques', 'https://www.youtube.com/embed/OB78_bW8kEM?si=VzjgSVM-wirE58XY'),
('Video 3: Deep Dive', 'https://www.youtube.com/embed/kS4lPtY0AKg?si=Vd4cuq1m92RD1NHa'),
('Video 4: Optimization', 'https://www.youtube.com/embed/qKfaf_rwg7U?si=xEvW0jFIuaXyZgJN'),
('Video 5: Best Practices', 'https://www.youtube.com/embed/EbyVDtPsa44?si=sCgjotHoYQ2JW-LI'),
('Video 6: Troubleshooting', 'https://www.youtube.com/embed/dcWWIclIHDY?si=yoom8zukdx-zMI7J'),
('Video 7: Real-world Examples', 'https://www.youtube.com/embed/qCdSNONlIl8?si=8azh1bP4hTFDaNlV'),
('Video 8: Final Thoughts', 'https://www.youtube.com/embed/AejOMMUyYiQ?si=AZyJ0bSjZ3ceA512');

INSERT INTO videos (title, url) VALUES 
('Video 1: Introduction', 'https://www.youtube.com/embed/wl_wDzzFhI0?si=4CUQ91p7dTlgm-ls'),
('Video 2: Advanced Techniques', 'https://www.youtube.com/embed/OB78_bW8kEM?si=VzjgSVM-wirE58XY'),
('Video 3: Deep Dive', 'https://www.youtube.com/embed/kS4lPtY0AKg?si=Vd4cuq1m92RD1NHa'),
('Video 4: Optimization', 'https://www.youtube.com/embed/qKfaf_rwg7U?si=xEvW0jFIuaXyZgJN'),
('Video 5: Best Practices', 'https://www.youtube.com/embed/EbyVDtPsa44?si=sCgjotHoYQ2JW-LI'),
('Video 6: Troubleshooting', 'https://www.youtube.com/embed/dcWWIclIHDY?si=yoom8zukdx-zMI7J'),
('Video 7: Real-world Examples', 'https://www.youtube.com/embed/qCdSNONlIl8?si=8azh1bP4hTFDaNlV'),
('Video 8: Final Thoughts', 'https://www.youtube.com/embed/AejOMMUyYiQ?si=AZyJ0bSjZ3ceA512');

SELECT 
    videos.title AS video_title, 
    videos_price.price AS video_price
FROM 
    videos
JOIN 
    videos_price
ON 
    videos.url LIKE CONCAT('%', videos_price.name, '%');

UPDATE videos 
SET title = 'Video 1: Affiliate Program Tutorial' 
WHERE url = 'https://www.youtube.com/embed/wl_wDzzFhI0?si=4CUQ91p7dTlgm-ls';

UPDATE videos 
SET title = 'Video 2: Make money with no skill required' 
WHERE url = 'https://www.youtube.com/embed/OB78_bW8kEM?si=VzjgSVM-wirE58XY';

UPDATE videos 
SET title = 'Video 3: Make money online' 
WHERE url = 'https://www.youtube.com/embed/kS4lPtY0AKg?si=Vd4cuq1m92RD1NHa';

UPDATE videos 
SET title = 'Video 4: Print on demand' 
WHERE url = 'https://www.youtube.com/embed/qKfaf_rwg7U?si=xEvW0jFIuaXyZgJN';

UPDATE videos 
SET title = 'Video 5: Make YouTube Thumbnails' 
WHERE url = 'https://www.youtube.com/embed/EbyVDtPsa44?si=sCgjotHoYQ2JW-LI';

UPDATE videos 
SET title = 'Video 6: Make money on Upwork' 
WHERE url = 'https://www.youtube.com/embed/dcWWIclIHDY?si=yoom8zukdx-zMI7J';

UPDATE videos 
SET title = 'Video 7: Re-upload YouTube videos' 
WHERE url = 'https://www.youtube.com/embed/qCdSNONlIl8?si=8azh1bP4hTFDaNlV';

UPDATE videos 
SET title = 'Video 8: Websites to earn money' 
WHERE url = 'https://www.youtube.com/embed/AejOMMUyYiQ?si=AZyJ0bSjZ3ceA512';

INSERT INTO videos (title, url) VALUES 
('Video 1: Affiliate Program Tutorial', 'https://www.youtube.com/embed/wl_wDzzFhI0?si=4CUQ91p7dTlgm-ls'),
('Video 2: Make money with no skill required', 'https://www.youtube.com/embed/OB78_bW8kEM?si=VzjgSVM-wirE58XY'),
('Video 3: Make money online', 'https://www.youtube.com/embed/kS4lPtY0AKg?si=Vd4cuq1m92RD1NHa'),
('Video 4: Print on demand', 'https://www.youtube.com/embed/qKfaf_rwg7U?si=xEvW0jFIuaXyZgJN'),
('Video 5: Make YouTube Thumbnails', 'https://www.youtube.com/embed/EbyVDtPsa44?si=sCgjotHoYQ2JW-LI'),
('Video 6: Make money on Upwork', 'https://www.youtube.com/embed/dcWWIclIHDY?si=yoom8zukdx-zMI7J'),
('Video 7: Re-upload YouTube videos', 'https://www.youtube.com/embed/qCdSNONlIl8?si=8azh1bP4hTFDaNlV'),
('Video 8: Websites to earn money', 'https://www.youtube.com/embed/AejOMMUyYiQ?si=AZyJ0bSjZ3ceA512');

SELECT 
    videos.title AS video_title, 
    videos_price.price AS video_price
FROM 
    videos
JOIN 
    videos_price
ON 
    videos.url LIKE CONCAT('%', videos_price.name, '%');

SELECT video_title, CAST(video_price AS DECIMAL(10, 2)) AS video_price FROM videos_price;

DESCRIBE videos_price;

SHOW COLUMNS FROM videos_price;

SELECT name, CAST(video_price AS DECIMAL(10, 2)) AS video_price FROM videos_price LIMIT 0, 1000;
SELECT name AS video_title, CAST(price AS DECIMAL(10, 2)) AS video_price
FROM videos_price
LIMIT 0, 1000;

SELECT name, CAST(price AS DECIMAL(10, 2)) AS video_price
FROM videos_price
LIMIT 0, 1000;

UPDATE videos_price
SET name = 'Video 1: Affiliate Program Tutorial', url = 'https://www.youtube.com/embed/wl_wDzzFhI0?si=4CUQ91p7dTlgm-ls'
WHERE id = 1;

UPDATE videos_price
SET name = 'Video 2: Make money with no skill required', url = 'https://www.youtube.com/embed/OB78_bW8kEM?si=VzjgSVM-wirE58XY'
WHERE id = 2;

UPDATE videos_price
SET name = 'Video 3: Make money online', url = 'https://www.youtube.com/embed/kS4lPtY0AKg?si=Vd4cuq1m92RD1NHa'
WHERE id = 3;

UPDATE videos_price
SET name = 'Video 4: Print on demand', url = 'https://www.youtube.com/embed/qKfaf_rwg7U?si=xEvW0jFIuaXyZgJN'
WHERE id = 4;

UPDATE videos_price
SET name = 'Video 5: Make YouTube Thumbnails', url = 'https://www.youtube.com/embed/EbyVDtPsa44?si=sCgjotHoYQ2JW-LI'
WHERE id = 5;

UPDATE videos_price
SET name = 'Video 6: Make money on Upwork', url = 'https://www.youtube.com/embed/dcWWIclIHDY?si=yoom8zukdx-zMI7J'
WHERE id = 6;

UPDATE videos_price
SET name = 'Video 7: Re-upload YouTube videos', url = 'https://www.youtube.com/embed/qCdSNONlIl8?si=8azh1bP4hTFDaNlV'
WHERE id = 7;

UPDATE videos_price
SET name = 'Video 8: Websites to earn money', url = 'https://www.youtube.com/embed/AejOMMUyYiQ?si=AZyJ0bSjZ3ceA512'
WHERE id = 8;

SHOW COLUMNS FROM videos_price;

ALTER TABLE videos_price
ADD COLUMN url VARCHAR(255);

UPDATE videos_price
SET name = 'Video 1: Affiliate Program Tutorial', url = 'https://www.youtube.com/embed/wl_wDzzFhI0?si=4CUQ91p7dTlgm-ls'
WHERE id = 1;

UPDATE videos_price
SET name = 'Video 2: Make money with no skill required', url = 'https://www.youtube.com/embed/OB78_bW8kEM?si=VzjgSVM-wirE58XY'
WHERE id = 2;

UPDATE videos_price
SET name = 'Video 3: Make money online', url = 'https://www.youtube.com/embed/kS4lPtY0AKg?si=Vd4cuq1m92RD1NHa'
WHERE id = 3;

UPDATE videos_price
SET name = 'Video 4: Print on demand', url = 'https://www.youtube.com/embed/qKfaf_rwg7U?si=xEvW0jFIuaXyZgJN'
WHERE id = 4;

UPDATE videos_price
SET name = 'Video 5: Make YouTube Thumbnails', url = 'https://www.youtube.com/embed/EbyVDtPsa44?si=sCgjotHoYQ2JW-LI'
WHERE id = 5;

UPDATE videos_price
SET name = 'Video 6: Make money on Upwork', url = 'https://www.youtube.com/embed/dcWWIclIHDY?si=yoom8zukdx-zMI7J'
WHERE id = 6;

UPDATE videos_price
SET name = 'Video 7: Re-upload YouTube videos', url = 'https://www.youtube.com/embed/qCdSNONlIl8?si=8azh1bP4hTFDaNlV'
WHERE id = 7;

UPDATE videos_price
SET name = 'Video 8: Websites to earn money', url = 'https://www.youtube.com/embed/AejOMMUyYiQ?si=AZyJ0bSjZ3ceA512'
WHERE id = 8;

SHOW COLUMNS FROM videos;
SHOW COLUMNS FROM videos_price LIKE 'price';


