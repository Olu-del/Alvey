Here is an example of how I created my website and explaining how I set up the application:

Alvey E-learning Platform

Overview
Alvey is an e-learning platform that allows users to register, log in, browse, and watch educational videos. The platform includes user authentication, video search, video prices and Submitting inquiries via a contact form

Architecture
The application uses Node.js and Express, EJS for templating, and MySQL for the database. The front end is styled with CSS.

Advanced Techniques
Session Management and Authentication: Using express-session for session management and bcryptjs for password hashing.

Responsive Design: 
Using CSS media queries to ensure the website is responsive and adapts to different screen sizes.

Features
User Registration and Login
Video Browsing and Watching
Video Search
Contact Form
Search History

Data Model
The application uses the following database tables:
users: Stores user information.
contacts: Stores contact form submissions.
videos: Stores information about the educational videos.
videos_price: Stores video pricing information (video name, price).

Setup Instructions
Node.js 
ejs
express
MySQL
bcryptjs
body-parser

Step1:
I used npm installer to install the Dependencies.
npm install express, ejs, mysql2, body-parser, bcryptjs and express-session


How I Set Up the Database
Step 2:
I Opened MySQL and created the database:

    CREATE DATABASE user_alvey.

    USE user_alvey.

Step 3: Create the Tables
sql
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
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

CREATE TABLE videos_price (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    price DECIMAL(5, 2) UNSIGNED
);

CREATE TABLE search_history (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    search_query VARCHAR(255) NOT NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
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
Step 4: Insert Video Data
sql
INSERT INTO videos (title, url) VALUES
('Video 1: Affiliate Program Tutorial', 'https://www.youtube.com/embed/wl_wDzzFhI0?si=4CUQ91p7dTlgm-ls'),
('Video 2: Make money with no skill required', 'https://www.youtube.com/embed/OB78_bW8kEM?si=VzjgSVM-wirE58XY'),
('Video 3: Make money online', 'https://www.youtube.com/embed/kS4lPtY0AKg?si=Vd4cuq1m92RD1NHa'),
('Video 4: Print on demand', 'https://www.youtube.com/embed/qKfaf_rwg7U?si=xEvW0jFIuaXyZgJN'),
('Video 5: Make YouTube Thumbnails', 'https://www.youtube.com/embed/EbyVDtPsa44?si=sCgjotHoYQ2JW-LI'),
('Video 6: Make money on Upwork', 'https://www.youtube.com/embed/dcWWIclIHDY?si=yoom8zukdx-zMI7J'),
('Video 7: Re-upload YouTube videos', 'https://www.youtube.com/embed/qCdSNONlIl8?si=8azh1bP4hTFDaNlV'),
('Video 8: Websites to earn money', 'https://www.youtube.com/embed/AejOMMUyYiQ?si=AZyJ0bSjZ3ceA512');

INSERT INTO videos_price (name, price) VALUES
('wl_wDzzFhI0?si=4CUQ91p7dTlgm-ls', 10.30),
('OB78_bW8kEM?si=VzjgSVM-wirE58XY', 10.00), 
('kS4lPtY0AKg?si=Vd4cuq1m92RD1NHa', 11.99), 
('qKfaf_rwg7U?si=xEvW0jFIuaXyZgJN', 12.99), 
('EbyVDtPsa44?si=sCgjotHoYQ2JW-LI', 14.99), 
('dcWWIclIHDY?si=yoom8zukdx-zMI7J', 17.99), 
('qCdSNONlIl8?si=8azh1bP4hTFDaNlV', 19.99),
('AejOMMUyYiQ?si=AZyJ0bSjZ3ceA512', 15.99);


Step 5: Create .env File
I Created a .env file in the root directory and added database configuration:

DB_HOST=localhost
DB_USER=alvey_elearning_app
DB_PASSWORD=smirted
DB_NAME=user_alvey

Step 6: I Ran the Application
node index.js

Step 7: Access the Application
I Opened my browser and go to http://localhost:8000.