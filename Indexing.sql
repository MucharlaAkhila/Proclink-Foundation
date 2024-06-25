Create Table Employees
(
    Id int primary key identity,
    [Name] nvarchar(50),
    Email nvarchar(50),
    Department nvarchar(50)
)
Go

SET NOCOUNT ON
Declare @counter int = 1

While(@counter <= 1000000)
Begin
    Declare @Name nvarchar(50) = 'ABC ' + RTRIM(@counter)
    Declare @Email nvarchar(50) = 'abc' + RTRIM(@counter) + '@proclink.com'
    Declare @Dept nvarchar(10) = 'Dept ' + RTRIM(@counter)

    Insert into Employees
    values
        (@Name, @Email, @Dept)

    Set @counter = @counter +1

    If(@Counter%100000 = 0)
		Print RTRIM(@Counter) + ' rows inserted'
End

Select *
from Employees
where id = 789829
-- Index seek(read only 1 row)
-- 0.0032(sub-tree cost)

Select *
from Employees
where [Name] = 'ABC 893939'-- Index scan(read all rows)
-- 10.68(sub-tree cost)


Exec sp_helpindex Employees

-- clustered index(Primary key) (Decides table order) (only one per table)

-- Non-clustered index(non Primary key) (Many per table)


CREATE NONCLUSTERED INDEX  ix_employee_name  
    ON Employees([Name]);

Select *
from Employees
where [Name] = 'ABC 893939'
-- sub-tree cost reduced from 10.68 to 0.0065704 after indexing

Exec sp_helpindex Employees
-- to check all the indexes

Drop Index  ix_employee_name ON Employees
-- to drop the index


------------------------------------------------------------------------

CREATE TABLE [tblEmployee]
(
    [Id] int Primary Key,
    [Name] nvarchar(50),
    [Salary] int,
    [Gender] nvarchar(10),
    [City] nvarchar(50)
)

Insert into tblEmployee
Values(3, 'John', 4500, 'Male', 'New York')
Insert into tblEmployee
Values(1, 'Sam', 2500, 'Male', 'London')
Insert into tblEmployee
Values(4, 'Sara', 5500, 'Female', 'Tokyo')
Insert into tblEmployee
Values(5, 'Todd', 3100, 'Male', 'Toronto')
Insert into tblEmployee
Values(2, 'Pam', 6500, 'Female', 'Sydney')

Select *
from tblEmployee

-- clustered index determines the table order


Create Clustered Index IX_tblEmployee_Gender_Salary
ON tblEmployee(Gender DESC, Salary ASC)
-- non-unique

Select *
from tblEmployee


-- unique vs non-unique index

-- unique (if indexing is done on unique coloumn then it is unique index)
-- non-unique (if indexing is done on non-unique coloumn then it is non-unique index)

----------------------------------------------------------------------------------------------

-- ACID Properties
-- A-> Atomicity (both pass or both fail)
-- C-> consistency (cannot have ghost data)
-- I-> Isolation (lock the particular rows that are affected)
-- D-> Durability (in case of failure , do a roll back)

----------------------------------------------------------------------------------------------

BEGIN TRANSACTION
UPDATE Actors
 set FirstName = 'Prabhas cool'
 Where ActorID = 11

COMMIT TRANSACTION

Rollback

-- to end a transaction :
-- 1. we can commit the transaction
-- 2. we can rollback the transaction

-- Isolation level - Read committed (Default)
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
-- we can also read uncommitted data using this 
SET TRANSACTION ISOLATION LEVEL READ COMMITTED; -- we can read only committed data using this 
 -------------------------------------------------------------------------------------------------