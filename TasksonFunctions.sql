-- TASKS ON FUNCTIONS

CREATE TABLE Employee(
    Employee_id INT PRIMARY KEY,
    First_name VARCHAR(255),
    Last_name VARCHAR(255),
);


INSERT INTO Employee (Employee_id, First_name,Last_name) VALUES
(1,	'John','Doe'),
(2,'Jane','Smith'),
(3,'Alice','Johnson')


Select * from Employee

-- Exercise -1

Select Employee_id,Upper(concat(First_name,' ',Last_name)) as FullName from Employee

-------------------------------------------------------------------------

CREATE TABLE Products(
    Products_id INT PRIMARY KEY,
    Products_name VARCHAR(255),
    Products_description VARCHAR(255),
);


INSERT INTO Products (Products_id,Products_name,Products_description) VALUES
(101,'Widget A','A standard widget'),
(102,'Gadget B','A fancy new gadget'),
(103,'Thingamajig','A very useful tool')


Select * from Products 

-- Exercise 2: Product Description Length
-- Scenario: You need to find the length of the product descriptions.

Select Products_id,Products_name,len(Products_description) as DescriptionLength from Products
-----------------------------------------------------------------------------

CREATE TABLE SalesOrders(
    SalesOrder_id INT PRIMARY KEY,
    Order_date DateTime,
    Total_amount float,
);


INSERT INTO SalesOrders (SalesOrder_id,Order_date,Total_amount) VALUES
(1001,'2023-01-15 14:33:00','150.00'),
(1002,'2023-03-22 10:45:00','200.00'),
(1003,'2024-05-17 09:20:00','350.00')


Select * from SalesOrders 

-- Exercise 3: Sales Date Formatting
-- Scenario: You need to display sales order dates in the YYYY-MM-DD format.

Select SalesOrder_id,format(Order_date , 'yyyy-MM-dd') as FormattedOrderDate from SalesOrders

-- Exercise 5: Sales Summary by Year
-- Scenario: You need to show the total sales amount for each year.

Select DatePart(year,Order_date) as Year,Sum(Total_amount) as TotalSales from SalesOrders
group by DatePart(year,Order_date)
------------------------------------------------------------------------
CREATE TABLE Customers(
    Customer_id INT PRIMARY KEY,
    Customer_name VARCHAR(255),
    Customers_Address VARCHAR(255),
);


INSERT INTO Customers(Customer_id,Customer_name,Customers_Address) VALUES
(201,'Acme Corp','   123 Main St'),
(202,'Globex Inc','   456 Elm St  '),
(203,'Initech','789 Oak St     ')


Select * from Customers
Drop Table Customers
--Exercise 4: Customer Address Cleanup
--Scenario: You need to remove leading and trailing spaces from the customer addresses.

Select *,trim(Customers_Address) as CleanedAddress from Customers
------------------------------------------------------------------------
-- PART - 2

-- Exercise 1: Employee Full Name and Department
-- Scenario: Create a list of employees with their full names in uppercase and their department names. Ensure the full name is in uppercase and the department name is in lowercase.

CREATE TABLE Employees(
    Employee_id INT PRIMARY KEY,
    First_name VARCHAR(255),
    Last_name VARCHAR(255),
	 DepartmentID INT,
);


INSERT INTO Employees (Employee_id, First_name,Last_name, DepartmentID) VALUES
(1,	'John','Doe',101),
(2,'Jane','Smith',102),
(3,'Alice','Johnson',103)


Select * from Employees

CREATE TABLE Departments(
    Departments_id INT ,
   Departments_name VARCHAR(255),
);


INSERT INTO Departments (Departments_id,Departments_name) VALUES
(101,'Sales'),
(102,'Engineering'),
(103,'Marketing')


Select * from Departments 

Select Employee_id,Upper(concat(First_name,' ',Last_name)) as FullName ,lower(Departments_name) as DepartmentName from Employees
Inner join Departments
on  DepartmentID = Departments_id

-----------------------------------------------------------------------------------------------------------

-- Exercise 2: Product Description Analysis
-- Scenario: Find the products where the description length is more than 15 characters. Additionally, reverse the product descriptions and show the first 10 characters of the reversed description.

CREATE TABLE Products(
    Products_id INT PRIMARY KEY,
    Products_name VARCHAR(255),
    Products_description VARCHAR(255),
);


INSERT INTO Products (Products_id,Products_name,Products_description) VALUES
(101,'Widget A','A standard widget'),
(102,'Gadget B','A fancy new gadget'),
(103,'Thingamajig','A very useful tool')


Select * from Products

Select Products_id,Products_name,len(Products_description) as DescriptionLength,substring(reverse(Products_description(len(Products_description) > 15)),1,10) as Reversed_Description from Products

--------------------------------------------------------------------------------------------------------------------------

CREATE TABLE SalesOrder(
    SalesOrder_id INT PRIMARY KEY,
	CustomerID INT,
    Order_date DateTime,
    Total_amount decimal (10,2),
);


INSERT INTO SalesOrder (SalesOrder_id,CustomerID,Order_date,Total_amount) VALUES
(1001,201,'2023-01-15 14:33:00','150.00'),
(1002,202,'2023-03-22 10:45:00','200.00'),
(1003,201,'2024-05-17 09:20:00','350.00')


Select * from SalesOrder
Drop table Salesorder

CREATE TABLE Customer(
    Customer_id INT PRIMARY KEY,
    Customer_name VARCHAR(255),
);


INSERT INTO Customer(Customer_id,Customer_name) VALUES
(201,'Acme Corp'),
(202,'Globex Inc'),
(203,'Initech')


Select * from Customer


Select Customer_id,Customer_name, DatePart(year,Order_date) as Year ,Total_amount from SalesOrder
join Customer
on  CustomerID = Customer_id 
order by customer_id

-----------------------------------------------------------------------------------------------------------------

--Exercise 4: Enhanced Product Search
--Scenario: Write a query to find products where the description contains the word "useful" and replace the word "useful" with "beneficial". Return the product ID, product name, and modified description.

CREATE TABLE Products2(
    Products_id INT PRIMARY KEY,
    Products_name VARCHAR(255),
    Products_description VARCHAR(255),
);


INSERT INTO Products2 (Products_id,Products_name,Products_description) VALUES
(101,'Widget A','A standard widget'),
(102,'Gadget B','A fancy new gadget'),
(103,'Thingamajig','A very useful tool')


Select * from Products2 

Select Products_id,Products_name, Replace((select Products_description from Products2 where Products_description like '%useful%') , 'useful','beneficial') as ModifiedDescription from Products2
where Products_description like '%useful%'

-------------------------------------------------------------------------------------------------------------------------------------

-- Exercise 5: Detailed Sales Report
-- Scenario: Write a query to generate a detailed sales report. Include the sales order ID, customer name (without leading or trailing spaces), formatted order date (YYYY-MM-DD), and the total amount formatted to two decimal places.

CREATE TABLE SalesOrder2(
    SalesOrder_id INT PRIMARY KEY,
	CustomerID INT,
    Order_date DateTime,
    Total_amount decimal (10,2),
);


INSERT INTO SalesOrder2(SalesOrder_id,CustomerID,Order_date,Total_amount) VALUES
(1001,201,'2023-01-15 14:33:00','150.00'),
(1002,202,'2023-03-22 10:45:00','200.00'),
(1003,201,'2024-05-17 09:20:00','350.00')


Select * from SalesOrder2

CREATE TABLE Customer2(
    Customer_id INT PRIMARY KEY,
    Customer_name VARCHAR(255),
);


INSERT INTO Customer2(Customer_id,Customer_name) VALUES
(201,'Acme Corp'),
(202,'Globex Inc'),
(203,'Initech')


Select * from Customer2

Select SalesOrder_id,Customer_name,format(Order_date , 'yyyy-MM-dd') as FormattedOrderDate,Total_amount from SalesOrder2
join Customer2
on CustomerID =Customer_id