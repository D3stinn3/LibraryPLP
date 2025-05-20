-- Library Management System SQL Schema
-- Created by [Your Name]

-- Drop existing tables to avoid errors
DROP TABLE IF EXISTS Borrowings, BookCategories, Books, Users, Authors, Categories;

-- Authors Table
CREATE TABLE Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    bio TEXT
);

-- Categories Table
CREATE TABLE Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL
);

-- Books Table
CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    author_id INT NOT NULL,
    isbn VARCHAR(20) UNIQUE NOT NULL,
    total_copies INT DEFAULT 1,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

-- Users Table
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    membership_date DATE NOT NULL
);

-- BookCategories (Many-to-Many between Books and Categories)
CREATE TABLE BookCategories (
    book_id INT,
    category_id INT,
    PRIMARY KEY (book_id, category_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

-- Borrowings Table
CREATE TABLE Borrowings (
    borrowing_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT NOT NULL,
    user_id INT NOT NULL,
    borrowed_date DATE NOT NULL,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);
