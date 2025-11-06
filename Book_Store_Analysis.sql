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

