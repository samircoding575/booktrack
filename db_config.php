<?php
// Database configuration constants
define('DB_SERVER', 'localhost');
define('DB_USERNAME', 'root');  // Replace with your database username
define('DB_PASSWORD', '');      // Replace with your database password
define('DB_DATABASE', 'book_tracker'); // Replace with your database name

// Create a connection to the database
$conn = new mysqli(DB_SERVER, DB_USERNAME, DB_PASSWORD, DB_DATABASE);

// Check the connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>
