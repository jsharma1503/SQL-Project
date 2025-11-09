-- Create Database
CREATE DATABASE OnlineBookstore;

-- Switch to the database
\c OnlineBookstore;

-- Creating Table for Books Information in Database
DROP TABLE IF EXISTS Books;
CREATE TABLE Books(
    Book_ID INTEGER PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Genre VARCHAR(50),
    Published_Year INTEGER,
    Price NUMERIC(10, 2),
    Stock INTEGER
    );

-- Adding Books Information in Database
COPY Books(Book_ID, Title, Author, Genre, Published_Year, Price, Stock) 
FROM 'Books.csv' 
CSV HEADER;

-- Creating Table for Customers Information in Database
DROP TABLE IF EXISTS Customers;
CREATE TABLE Customers(
    Customer_ID INTEGER PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone INTEGER,
    City VARCHAR(50),
    Country VARCHAR(50)
    );

-- Adding Customers Information in Database
COPY Customers(Customer_ID, Name, Email, Phone, City, Country) 
FROM 'Customers.csv' 
CSV HEADER;

-- Creating Table for Orders Information in Database
DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders(
    Order_ID INTEGER PRIMARY KEY,
    Book_ID INTEGER,
    Customer_ID INTEGER,
    Order_Date DATE,
    Quantity INTEGER,
    Total_Amount NUMERIC(10, 2)
    );


-- Adding Orders Information in Database
COPY Orders(Order_ID, Customer_ID, Book_ID, Order_Date, Quantity, Total_Amount) 
FROM 'Orders.csv' 
CSV HEADER;

-- Basic Queries


-- 1) Retrieve all books in the "Fiction" genre:
SELECT * FROM Books WHERE Genre = "Fiction";

-- 2) Find books published after the year 1950:
SELECT * FROM Books WHERE Published_Year > 1950
ORDER BY Published_Year ASC;

-- 3) List all customers from the Canada:
SELECT * FROM Customers WHERE Country = "Canada";

-- 4) Show orders placed in November 2023:
SELECT * FROM Orders 
WHERE strftime('%Y-%m', Order_Date) == "2023-11";

-- OR
-- SELECT * FROM Orders 
-- WHERE order_date BETWEEN '2023-11-01' AND '2023-11-30';

-- 5) Retrieve the total stock of books available:
SELECT SUM(Stock) AS Total_Stock FROM Books;

-- 6) Find the details of the most expensive book:
SELECT * FROM Books 
WHERE Price = (SELECT MAX(Price) FROM Books);

