-- Create Database
CREATE DATABASE InventoryDB;
USE InventoryDB;

-- Create Suppliers Table
CREATE TABLE Suppliers (
    SupplierID INT AUTO_INCREMENT PRIMARY KEY,
    SupplierName VARCHAR(100) NOT NULL,
    ContactName VARCHAR(100),
    Phone VARCHAR(15),
    Email VARCHAR(100) UNIQUE
);

-- Create Products Table
CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    SupplierID INT,
    QuantityInStock INT DEFAULT 0,
    Price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID) ON DELETE SET NULL
);

-- Create Customers Table
CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL,
    ContactName VARCHAR(100),
    Phone VARCHAR(15),
    Email VARCHAR(100) UNIQUE
);

-- Create Orders Table
CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    Status VARCHAR(50) DEFAULT 'Pending',
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Create Order Details Table (Many-to-Many relationship between Orders and Products)
CREATE TABLE OrderDetails (
    OrderDetailID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT DEFAULT 1,
    Price DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID) ON DELETE CASCADE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID) ON DELETE CASCADE
);

-- Sample Insert Data
INSERT INTO Suppliers (SupplierName, ContactName, Phone, Email) VALUES 
('ABC Electronics', 'John Doe', '123-456-7890', 'contact@abcelectronics.com'),
('XYZ Supplies', 'Jane Smith', '987-654-3210', 'contact@xyzsupplies.com');

INSERT INTO Products (ProductName, SupplierID, QuantityInStock, Price) VALUES 
('Laptop', 1, 50, 999.99),
('Mouse', 1, 200, 19.99),
('Keyboard', 2, 150, 49.99);

INSERT INTO Customers (CustomerName, ContactName, Phone, Email) VALUES
('Alice Johnson', 'Alice J.', '111-222-3333', 'alice.johnson@email.com'),
('Bob Brown', 'Bob B.', '444-555-6666', 'bob.brown@email.com');

INSERT INTO Orders (CustomerID, OrderDate, Status) VALUES
(1, '2023-10-10 14:30:00', 'Completed'),
(2, '2023-10-11 10:00:00', 'Pending');

INSERT INTO OrderDetails (OrderID, ProductID, Quantity, Price) VALUES
(1, 1, 2, 999.99),
(1, 2, 1, 19.99),
(2, 3, 3, 49.99);

