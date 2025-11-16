--Database Schema

--1. Table: Books

CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    Author VARCHAR(50),
    Genre VARCHAR(30),
    CopiesAvailable INT DEFAULT 1
);


--2. Table: Members

CREATE TABLE Members (
    MemberID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Email VARCHAR(50) UNIQUE,
    Phone VARCHAR(15)
);


--3. Table: BorrowRecords

CREATE TABLE BorrowRecords (
    RecordID INT PRIMARY KEY,
    MemberID INT,
    BookID INT,
    BorrowDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

--Sample Queries

--Insert data

INSERT INTO Books VALUES (1, 'The Alchemist', 'Paulo Coelho', 'Fiction', 5);
INSERT INTO Members VALUES (1, 'John Doe', 'john@example.com', '9876543210');
INSERT INTO BorrowRecords VALUES (1, 1, 1, '2025-11-16', NULL);


--View borrowed books

SELECT m.Name, b.Title, br.BorrowDate
FROM BorrowRecords br
JOIN Members m ON br.MemberID = m.MemberID
JOIN Books b ON br.BookID = b.BookID
WHERE br.ReturnDate IS NULL;


--Update return date

UPDATE BorrowRecords
SET ReturnDate = '2025-11-20'
WHERE RecordID = 1;


--Check available copies

SELECT Title, CopiesAvailable FROM Books;
