CREATE TABLE salesman (
    salesman_id INT PRIMARY KEY,
    name VARCHAR(255),
    city VARCHAR(255),
    commission DECIMAL(4, 2)
);


INSERT INTO salesman (salesman_id, name, city, commission) VALUES
(5001, 'James Hoog', 'New York', 0.15), -- Print
(5002, 'Nail Knite', 'Paris', 0.13),
(5005, 'Pit Alex', 'London', 0.11), -- Print
(5006, 'Mc Lyon', 'Paris', 0.14), -- Print
(5003, 'Lauson Hen', NULL, 0.12),
(5007, 'Paul Adam', 'Rome', 0.13); -- Print

Select * from salesman

-------------------------------------------------------------------------------------------------------------------------
--Task 1
--Find the average commision of a saleman from Paris
SELECT AVG (commission) FROM salesman
where city= 'Paris';
-------------------------------------------------------------------------------------------------------------------------
--Task 2
--Find out if there are cities with only one salesman and list them | No nulls
--Clue: Having
SELECT city, COUNT(city) from salesman
GROUP BY city
having COUNT(city) = 1;

-------------------------------------------------------------------------------------------------------------------------



CREATE TABLE orders (
    ord_no INT PRIMARY KEY,
    purch_amt DECIMAL(10, 2),
    ord_date DATE,
    customer_id INT,
    salesman_id INT
);


INSERT INTO orders (ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES
(70001, 150.5, '2012-10-05', 3005, 5002),
(70009, 270.65, '2012-09-10', 3001, 5005),
(70002, 65.26, '2012-10-05', 3002, 5001),
(70004, 110.5, '2012-08-17', 3009, 5003),
(70007, 948.5, '2012-09-10', 3005, 5002),
(70005, 2400.6, '2012-07-27', 3007, 5001),
(70008, 5760, '2012-09-10', 3002, 5001),
(70010, 1983.43, '2012-10-10', 3004, 5006),
(70003, 2480.4, '2012-10-10', 3009, 5003),
(70012, 250.45, '2012-06-27', 3008, 5002),
(70011, 75.29, '2012-08-17', 3003, 5007),
(70013, 3045.6, '2012-04-25', 3002, 5001);

Select * from orders;

-----------------------------------------------------------------------------------------------------------------------------------
-- Task 3 - Sub-Query
-- Write a query to display all the orders from the orders table issued by the salesman 'Paul Adam'.

-- using joins
SELECT ord_no from orders
JOIN salesman
ON orders.salesman_id = salesman.salesman_id
where name = 'Paul Adam';

(Or)
-- without using joins
-- Step -1: hard coding
 SELECT * from orders where salesman_id = 5007
-- step 2 : remove hard coding
 Select salesman_id from salesman
 where name = 'Paul Adam';
 -- step - 3: replace instep 2 in step 1
 SELECT * from orders 
 where salesman_id =( Select salesman_id from salesman
 where name = 'Paul Adam');

-----------------------------------------------------------------------------------------------------------------------

-- Task 4
-- Write a query to display all the orders which values are greater than the average order value for 10th October 2012

Select * from orders
where purch_amt>(Select AVG(purch_amt) from orders
                 where ord_date = '2012-10-10');
------------------------------------------------------------------------------------------------------------------------
-- Task 5 (Challenging)
-- Write a query to find all orders with order amounts which are above-average amounts for their customers.
------------------------------------------------------------------------------------------------------------------------
-- Task 6
-- Write a query to find all orders attributed to a salesman in 'Paris'
-- Clue: In operator

select * from orders
where salesman_id IN (select salesman_id from salesman
where city ='Paris');

------------------------------------------------------------------------------------------------------------------------


CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    cust_name VARCHAR(255),
    city VARCHAR(255),
    grade INT NULL,
    salesman_id INT
);
INSERT INTO customer (customer_id, cust_name, city, grade, salesman_id) VALUES
(3002, 'Nick Rimando', 'New York', 100, 5001),
(3005, 'Graham Zusi', 'California', 200, 5002),
(3001, 'Brad Guzan', 'London', NULL, 5005),
(3004, 'Fabian Johns', 'Paris', 300, 5006),
(3007, 'Brad Davis', 'New York', 200, 5001),
(3009, 'Geoff Camero', 'Berlin', 100, 5003),
(3008, 'Julian Green', 'London', 300, 5002),
(3003, 'Jozy Altidor', 'Moscow', 200, 5007);

----------------------------------------------------------------------------------------------------------------------------------
-- Task 7
-- Write a query to find the name and id of all salesmen who had more than one customer

select salesman_id,count(salesman_id) from customer
group by salesman_id 
having count(salesman_id)>1

select * from salesman
where salesman_id in (5001,5002)

select * from salesman
where salesman_id in (select salesman_id from customer
								group by salesman_id 
								having count(salesman_id)>1)
----------------------------------------------------------------------------------------------------------------------------------