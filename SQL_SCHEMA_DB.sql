CREATE DATABASE LibraryDB;
USE LibraryDB;

CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL
);

CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY AUTO_INCREMENT,
    CategoryName VARCHAR(100) NOT NULL
);

CREATE TABLE Books (
    BookID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(150),
    AuthorID INT,
    CategoryID INT,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

CREATE TABLE Members (
    MemberID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Email VARCHAR(100)
);

CREATE TABLE Borrow (
    BorrowID INT PRIMARY KEY AUTO_INCREMENT,
    MemberID INT,
    BookID INT,
    BorrowDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);


-- Authors
INSERT INTO Authors (Name) VALUES ('Chetan Bhagat'), ('J.K. Rowling');

-- Categories
INSERT INTO Categories (CategoryName) VALUES ('Fiction'), ('Science');

-- Books
INSERT INTO Books (Title, AuthorID, CategoryID) 
VALUES 
('2 States', 1, 1),
('Harry Potter', 2, 1);

-- Members
INSERT INTO Members (Name, Email)
VALUES
('Rahul Sharma', 'rahul@example.com'),
('Anita Verma', 'anita@example.com');

-- Borrow
INSERT INTO Borrow (MemberID, BookID, BorrowDate, ReturnDate)
VALUES 
(1, 1, '2025-08-01', '2025-08-10'),
(2, 2, '2025-08-02', NULL);

SELECT * FROM Authors;
SELECT * FROM Books;
SELECT * FROM Borrow;

SET SQL_SAFE_UPDATES = 0;

UPDATE Authors  
SET Name = 'Chetan B.'  
WHERE Name = 'Chetan Bhagat';

UPDATE Authors
SET Name = 'Chetan B.'
WHERE AuthorID = 1;  -- Because 'Chetan Bhagat' has AuthorID = 1


UPDATE Authors
SET Name = 'Chetan B.'
WHERE Name = 'Chetan Bhagat';

UPDATE Books
SET Title = 'Harry Potter and the Philosopher\'s Stone'
WHERE Title = 'Harry Potter';

UPDATE Books
SET Title = 'Harry Potter and the Philosopher\'s Stone'
WHERE BookID = 2;  -- BookID 2 corresponds to 'Harry Potter'

UPDATE Members
SET Email = 'rahul.sharma@library.com'
WHERE Name = 'Rahul Sharma';


UPDATE Members
SET Email = 'rahul.sharma@library.com'
WHERE MemberID = 1;  -- Rahul Sharma's MemberID


UPDATE Borrow
SET ReturnDate = '2025-08-12'
WHERE BorrowID = 2;

DELETE FROM Members
WHERE Name = 'Anita Verma';

-- First delete borrow record
DELETE FROM Borrow
WHERE MemberID = 2;

-- Then delete member
DELETE FROM Members
WHERE MemberID = 2;

-- First delete borrow entry
DELETE FROM Borrow
WHERE BookID = 1;

-- Then delete book
DELETE FROM Books
WHERE BookID = 1;

-- First delete books in that category
DELETE FROM Books
WHERE CategoryID = 1;

-- Then delete category
DELETE FROM Categories
WHERE CategoryID = 1;







