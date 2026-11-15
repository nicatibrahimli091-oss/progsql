CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName  VARCHAR(50),
    LastName   VARCHAR(50),
    Country    VARCHAR(50),
    Score      INT
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    Product   VARCHAR(100),
    Category  VARCHAR(50),
    Price     DECIMAL(10,2)
);

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName  VARCHAR(50),
    LastName   VARCHAR(50),
    Department VARCHAR(50),
    BirthDate  DATE,
    Gender     VARCHAR(10),
    Salary     DECIMAL(10,2),
    ManagerID  INT,
    FOREIGN KEY (ManagerID) REFERENCES Employees(EmployeeID)
);

CREATE TABLE Orders (
    OrderID       INT PRIMARY KEY,
    ProductID     INT,
    CustomerID    INT,
    SalesPersonID INT,
    OrderDate     DATE,
    ShipDate      DATE NULL,
    OrderStatus   VARCHAR(30),
    ShipAddress   VARCHAR(150),
    BillAddress   VARCHAR(150),
    Quantity      INT,
    Sales         DECIMAL(10,2),
    CreationTime  DATETIME,
    FOREIGN KEY (ProductID)     REFERENCES Products(ProductID),
    FOREIGN KEY (CustomerID)    REFERENCES Customers(CustomerID),
    FOREIGN KEY (SalesPersonID) REFERENCES Employees(EmployeeID)
);

INSERT INTO Customers(CustomerID, FirstName, LastName, Country, Score) VALUES
(1, 'Ayla', 'Karimova', 'Azerbaijan', 720),
(2, 'John',  'Miller',   'USA',        450),
(3, 'Emma',  'Schmidt',  'Germany',    860),
(4, 'Sara',  'Martin',   'France',     280),
(5, 'Lukas', 'Weber',    'Germany',    550);

INSERT INTO Products (ProductID, Product, Category, Price) VALUES
(101, 'Wireless Mouse', 'Electronics', 55),
(102, 'Office Chair',   'Furniture',   230),
(103, 'Laptop',         'Electronics', 850),
(104, 'Notebook',       'Stationery',  12),
(105, 'Smart Phone',    'Electronics', 420);

INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, BirthDate, Gender, Salary, ManagerID) VALUES
(12, 'Maya',  'Brown',    'Sales',   '1988-03-14', 'Female', 2400, NULL),
(11, 'David', 'Lee',      'Sales',   '1990-07-22', 'Male',   2200, 12),
(13, 'Alex',  'Green',    'Support', '1992-11-05', 'Male',   1900, 12);

INSERT INTO Orders (OrderID, ProductID, CustomerID, SalesPersonID, OrderDate, ShipDate, OrderStatus, Quantity, Sales) VALUES
(201, 101, 1, 11, '2026-10-04', '2026-10-06', 'Delivered', 2, 110),
(202, 103, 3, 12, '2026-10-08', '2026-10-10', 'Shipped', 1,  850),
(203, 102, 2, 11, '2026-10-12', NULL,         'Pending', 1,  230),
(204, 105, 5, 12, '2026-10-15', '2026-10-25', 'Delivered', 1,  420);

/*SELECT * FROM Customers;
SELECT FirstName, LastName, Country FROM Customers;
*/
--SELECT CustomerID, FirstName, LastName, Country
--FROM Customers WHERE Country = 'Germany';

--SELECT FirstName, LastName, Country, Score
--FROM Customers
--WHERE Score >= 300 AND Country IN ('Germany', 'France');

--select ProductID, Product, Category, Price from Products order by ProductID desc;

--SELECT Product, Price from Products where Price BETWEEN 50 and 300;

--SELECT Product, Category FROM Products WHERE Product LIKE '%Phone%';

--SELECT DISTINCT Category FROM Products ORDER BY Category ASC;

--SELECT Orders.OrderID, Customers.FirstName, Customers.LastName from Orders INNER JOIN Customers on Customers.CustomerID = Orders.CustomerID;

--SELECT OrderStatus, COUNT(OrderID), SUM(Sales) from Orders GROUP by OrderStatus;
 
--INSERT INTO Products (ProductID, Product, Category, Price) 
--VALUES (106, 'Tablet', 'Electronics', 280);

--UPDATE Products SET Price = 350 WHERE ProductID = 106;
--DELETE FROM Products WHERE ProductID = 106;

--task1

--SELECT FirstName, LastName, Country, Score FROM Customers WHERE Score > 500 ORDER BY Score DESC;

--SELECT FirstName, LastName, Country, Score FROM Customers WHERE Country IN ('Germany', 'France', 'USA') and Score >= 300;

--SELECT Customers.FirstName, Customers.LastName, Orders.OrderID, Orders.OrderDate, Orders.Sales from Customers inner join Orders on Customers.CustomerID = Orders.CustomerID;

--SELECT Customers.CustomerID, Customers.FirstName, Customers.LastName, Customers.Country FROM Customers LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID WHERE Orders.OrderID IS NULL;

--SELECT Customers.CustomerID, Customers.FirstName, Customers.LastName, Customers.Country FROM Customers LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID WHERE Orders.OrderID IS  NOT NULL;

--SELECT Customers.FirstName, Customers.LastName, SUM(Orders.Sales) from Customers INNER JOIN Orders on Orders.CustomerID = Customers.CustomerID GROUP by Customers.FirstName, Customers.LastName Having SUM(Orders.Sales) > 1000;

--SELECT Customers.FirstName, Customers.LastName, SUM(Orders.Sales) from Customers INNER JOIN Orders on Orders.CustomerID = Customers.CustomerID GROUP by Customers.FirstName, Customers.LastName ORDER By SUM(Orders.Sales) DESC;

--SELECT OrderID, CustomerID, OrderDate, OrderStatus, ShipDate from Orders Where OrderDate BETWEEN '2026-10-01' AND '2026-10-31';

--SELECT OrderID, CustomerID, OrderDate from Orders where OrderStatus = 'Pending' order by OrderDate asc;

--task3?

--UPDATE Orders SET OrderStatus = 'Shipped', ShipDate = '2026-11-05' where OrderID = 105;

--UPDATE Orders SET ShipAddress = '45 Main Street, Baku' WHERE OrderID = 110;

--DELETE FROM Orders WHERE OrderID = 999;

--SELECT OrderStatus, SUM(OrderID) FROM Orders GROUP BY OrderStatus;

--SELECT Customers.FirstName, Customers.LastName, Orders.OrderDate, Orders.OrderStatus from Customers inner join Orders on Orders.CustomerID = Customers.CustomerID WHERE Orders.ShipDate IS NULL;

--task3 

--SELECT Product, Category, Price from Products where Price BETWEEN 50 and 300;

--SELECT Product, Category, Price FROM Products WHERE Category = 'Electronics' AND Price > 500;

--SELECT Products.Product, Products.Category, Orders.Quantity, Orders.Sales FROM Products INNER JOIN Orders ON Products.ProductID = Orders.ProductID;

--SELECT Products.Product, SUM(Orders.Quantity) from Products INNER join Orders on Orders.ProductID = Products.ProductID GROUP BY Products.Product;

--SELECT Products.ProductID, Products.Product from Products left join Orders on Orders.ProductID = Products.ProductID where Orders.OrderID is NULL;

--SELECT Employees.FirstName, Employees.LastName, Employees.Department, SUM(Orders.Sales) FROM Employees INNER JOIN Orders ON Employees.EmployeeID = Orders.SalesPersonID GROUP BY Employees.EmployeeID, Employees.FirstName, Employees.LastName, Employees.Department;

--SELECT Employees.FirstName, Employees.LastName, SUM(Orders.Sales) from Employees inner join Orders on Orders.SalesPersonID = Employees.EmployeeID GROUP By Employees.EmployeeID, Employees.FirstName, Employees.LastName HAVING SUM(Orders.Sales) > 5000;

--INSERT INTO Products (ProductID, Product, Category, Price) 
--VALUES (501, 'Wireless Keyboard', 'Electronics', 75);

--UPDATE Products SET Price = 90 WHERE ProductID = 501;

--SELECT FirstName, LastName FROM Customers UNION SELECT FirstName, LastName FROM Employees; 

--SELECT Products.Category, SUM(Orders.Quantity), SUM(Orders.Sales) from Products inner join Orders on Orders.ProductID = Products.ProductID GROUP by Products.Category having sum(Orders.Sales) > 2000 order by SUM(Orders.Quantity) desc;

--task4,5

