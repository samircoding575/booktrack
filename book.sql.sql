CREATE DATABASE book_tracker;

USE book_tracker;

CREATE TABLE books (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    genre VARCHAR(100)
);

-- Add books
INSERT INTO books (title, author, genre) VALUES
('1984', 'George Orwell', 'Dystopian'),
('Manuscript Found in Accra', 'Paulo Coelho', 'Philosophy'),
('Powerless', 'Tera Lynn Childs', 'Fantasy'),
('To Kill a Mockingbird', 'Harper Lee', 'Classic'),
('The Great Gatsby', 'F. Scott Fitzgerald', 'Classic'),
('The Catcher in the Rye', 'J.D. Salinger', 'Fiction');
