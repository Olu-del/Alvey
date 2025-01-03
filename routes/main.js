// Create a new router
const express = require("express");
const router = express.Router();
const session = require('express-session');
const bcrypt = require('bcryptjs');

// Define app data
var appData = { appName: 'Alvey' };

// Handle our routes
router.get('/', function(req, res) {
    // Render the index page with appData
    res.render('index.ejs', appData);
});

router.get('/about', function(req, res) {
    // Render the about page with appData
    res.render('about.ejs', appData);
});

router.get('/contact', function(req, res) {
    // Render the contact page with appData
    res.render('contact.ejs', appData);
});

router.post('/contact', function(req, res) {
    const { first, last, email, phone, question } = req.body;
    const query = 'INSERT INTO contacts SET ?';
    const contactData = { first_name: first, last_name: last, email, phone, question };

    req.app.locals.connection.query(query, contactData, function(err) {
        if (err) {
            console.error('Error inserting contact data:', err);
            return res.status(500).send('An error occurred while saving your message.');
        }
        res.send('Thank you for contacting us. We will get back to you soon.');
    });
});

router.get('/register', function(req, res) {
    // Render the register page with appData
    res.render('register.ejs', appData);
});

router.post('/register', function(req, res) {
    // Extract registration data from the request body
    const { username, email, password } = req.body;

    console.log("Registration Data:", { username, email, password });

    // Ensure the username is not null
    if (!username || !email || !password) {
        return res.send('All fields are required.');
    }

    // Hash the password before storing it
    const hashedPassword = bcrypt.hashSync(password, 8);

    // Check if the email or username already exists
     req.app.locals.connection.query('SELECT * FROM users WHERE email = ? OR username = ?', [email, username], (err, results) => {
         if (err) throw err;

         if (results.length > 0) {
             return res.send('This email or username is already registered. Please use a different one.');
         }

         // Insert the new user into the database
    
    req.app.locals.connection.query('INSERT INTO users SET ?', { username, email, password_hash: hashedPassword }, (err, result) => {
        if (err) {
            if (err.code === 'ER_DUP_ENTRY') {
                return res.send('This email or username is already registered. Please use a different one.');
            }
            console.error('Error inserting user data:', err); // Add this line
            throw err;
        }
        console.log('User registered successfully:', result); // Add this line
        // Set session variables
        req.session.loggedin = true;
        req.session.username = username;
        req.session.email = email;
    
        // Redirect to the account page after successful registration
        res.redirect('/account');
    });
    
    });
 });


router.get('/login', function(req, res) {
    res.render('login.ejs', { appData }); // Make sure to render the login page
});
         


router.post('/login', function(req, res) {
    // Extract login data from the request body
    const { email, password } = req.body;

    // Query the database for the user with the provided email
    req.app.locals.connection.query('SELECT * FROM users WHERE email = ?', [email], (err, results) => {
        if (err) throw err;

        if (results.length === 0) {
            return res.send('Incorrect Email and/or Password!');
        }

        // Compare the entered password with the hashed password in the database
        if (bcrypt.compareSync(password, results[0].password_hash)) {
            // Set session variables upon successful login
            req.session.loggedin = true;
            req.session.username = results[0].username;
            req.session.userId = results[0].id;

            // Redirect to the account page after successful login
            res.redirect('/account');
        } else {
            // Send an error message if password comparison fails
            res.send('Incorrect Email and/or Password!');
        }
    });
});
      
router.get('/account', function(req, res) {
    if (req.session.loggedin) {
        const userId = req.session.userId;

        // Fetch user's search history
        req.app.locals.connection.query('SELECT search_query, timestamp FROM search_history WHERE user_id = ? ORDER BY timestamp DESC LIMIT 5', [userId], (err, searchhistory) => {
            if (err) throw err;

            // Render the account page with the user's information and search history
            res.render('account.ejs', {
                username: req.session.username,
                searchhistory: searchhistory
            });
        });
    } else {
        // Send an error message if the user is not logged in
        res.send('Please log in to view your account!');
    }
});

// Search route for videos
router.get('/search', (req, res) => {
    const searchText = req.query.search_text; // Get the search text from the query
    const sql = `
        SELECT videos.title AS video_title, CAST(videos_price.price AS DECIMAL(10, 2)) AS video_price
        FROM videos
        JOIN videos_price
        ON videos.title = videos_price.name
        WHERE videos.title LIKE ?;
    `;

    const searchQuery = `%${searchText}%`;

    req.app.locals.connection.query(sql, [searchQuery], (err, results) => {
        if (err) {
            console.error('Error fetching search results:', err);
            return res.status(500).send('An error occurred while searching for videos.');
        }

        // Render a search results page with the results
        res.render('search_results', { videos: results, searchText });
    });
});



router.get('/signout-confirmation', function(req, res) {
    // Destroy the session to sign out the user
   req.session.destroy(function(err) {
        if (err) {
            return res.send('Error signing out.');
        }
        // Redirect to the home page after sign-out
       res.redirect('/login');
   });
});

router.get('/videos', (req, res) => {
    const query = 'SELECT * FROM videos';

    req.app.locals.connection.query(query, (err, results) => {
        if (err) {
            console.error('Error fetching videos:', err);
            return res.status(500).send('An error occurred while fetching videos.');
        }
        res.render('videos.ejs', { videos: results });
    });
});

 router.get('/list', (req, res) => {
     req.app.locals.connection.query('SELECT * FROM videos_price', (err, results) => {
         if (err) {
             console.error('Error fetching video prices:', err);
             return res.status(500).send('An error occurred while fetching video prices.');
         }

         // Pass the results from the database (videos_price) to the EJS template as availableVideos
         res.render('videos', { availableVideos: results });
    });
 });


module.exports = router;

// Export the router object so index.js can access it
module.exports = router;
