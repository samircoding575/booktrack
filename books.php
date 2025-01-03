<?php

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "book_tracker";  


$conn = new mysqli($servername, $username, $password, $dbname);


if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT title, author FROM books";
$result = $conn->query($sql);

$books = array();

if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        $books[] = array(
            'title' => $row['title'],
            'author' => $row['author'],
        );
    }
}


$conn->close();


echo json_encode($books);
?>
