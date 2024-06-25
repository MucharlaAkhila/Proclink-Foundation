-- Create Departments table
CREATE TABLE Departments
(
    DepartmentID INT PRIMARY KEY,
    DepartmentName NVARCHAR(50)
);

-- Insert sample departments
INSERT INTO Departments
    (DepartmentID, DepartmentName)
VALUES
    (1, 'HR'),
    (2, 'IT'),
    (3, 'Finance'),
    (4, 'Marketing');

-- Create Employees table with a foreign key to Departments
CREATE TABLE Employees
(
    EmployeeID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    DepartmentID INT FOREIGN KEY REFERENCES Departments(DepartmentID),
    Salary DECIMAL(18, 2),
    HireDate DATE
);

-- Insert sample employees
INSERT INTO Employees
    (EmployeeID, FirstName, LastName, DepartmentID, Salary, HireDate)
VALUES
    (1, 'John', 'Doe', 1, 50000, '2020-01-01'),
    (2, 'Jane', 'Smith', 2, 75000, '2021-03-15'),
    (3, 'Jim', 'Brown', 3, 60000, '2019-07-23'),
    (4, 'Jake', 'White', 4, 45000, '2022-05-30'),
    (5, 'Jill', 'Black', 2, 80000, '2023-02-11');

CREATE TABLE Transfers
(
    EmployeeID INT ,
    OldDepartmentID INT ,
    NewDepartmentID INT ,
    TransferDate Date
);

---------------------------------------------------------------------------------------------------
--Task - 1 : Check if the department exist first if no then error 'No such Department exists' if yes then commit the changes


go
-- batch set of SQL commands
Alter Procedure AddEmployee
    @EmployeeID int,
    @FirstName nvarchar (30),
    @LastName nvarchar (30),
    @DepartmentID int,
    @Salary DECIMAL(18, 2),
    @HireDate Date
as
Begin
    BEGIN TRANSACTION ;
    BEGIN TRY
    IF not exists (select *
    from Departments
    where DepartmentID = @DepartmentID)
	THROW 60000, 'Department does not exist.', 1 ;
    INSERT INTO Employees
    VALUES
        (@EmployeeID, @FirstName, @LastName, @DepartmentID, @Salary, @HireDate)
    COMMIT TRANSACTION ;
  END TRY 
  BEGIN CATCH
    Rollback Transaction;
    print Concat('Error number is: ',Error_number()); 
	print Concat('Error message is: ',Error_message()); 
	print Concat('Error state is: ',Error_state()); 
  END CATCH
end
Go

EXEC AddEmployee @EmployeeID = 6, @FirstName = 'Anna', @LastName = 'Green', @DepartmentID = 8, @Salary = 55000, @HireDate = '2024-06-01';

select *
from Employees

----------------------------------------------------------------------------------------------------------------

-- Task 2 : Create a Stored Procedure to Update Employee Information with Salary Validation, Department Validation
 --Make sure the salary should only increase in the range of 10% to 30% of their current salary 
 
go
-- batch set of SQL commands
Alter Procedure UpdateEmployeeInfo
    @EmployeeID int,
    @NewFirstName nvarchar (30),
    @NewLastName nvarchar (30),
    @NewDepartmentID int,
    @NewSalary DECIMAL(18, 2)
as
Begin
    BEGIN TRANSACTION ;
    BEGIN TRY
    IF not exists (select *
    from Departments
    where DepartmentID = @NewDepartmentID)
	THROW 60000, 'Department does not exist.', 1 ;
    if not (@NewSalary >=(select (Salary+(Salary*0.1))
        from employees
        where EmployeeID =@EmployeeID) )and ( @NewSalary <=(select (Salary+(Salary*0.3))
        from employees
        where EmployeeID =@EmployeeID))
	THROW 60000, 'New Salary is not in range', 1 ;
    UPDATE Employees 
	SET Salary = @NewSalary
	Where EmployeeID = @EmployeeID
    COMMIT TRANSACTION ;
  END TRY 
  BEGIN CATCH
    Rollback Transaction;
    print Concat('Error number is: ',Error_number()); 
	print Concat('Error message is: ',Error_message()); 
	print Concat('Error state is: ',Error_state()); 
  END CATCH
end
Go

EXEC UpdateEmployeeInfo @EmployeeID = 3, @NewFirstName = 'James', @NewLastName = 'Brown', @NewDepartmentID = 8, @NewSalary = 66000;

Select *
from Employees

----------------------------------------------------------------------------------------------------------------
--Task 3 : Extening the logic of Task 2 also log the transfer that has happened incase of department change in Transfers table
 
go
-- batch set of SQL commands
Create Procedure UpdateTransferInfo
    @EmployeeID int,
    @NewFirstName nvarchar (30),
    @NewLastName nvarchar (30),
    @NewDepartmentID int,
    @NewSalary DECIMAL(18, 2),
    @TransferDate DATE
as
Begin
    BEGIN TRANSACTION ;
    BEGIN TRY
    IF not exists (select *
    from Departments
    where DepartmentID = @NewDepartmentID)
	THROW 60000, 'Department does not exist.', 1 ;
    if not (@NewSalary >=(select (Salary+(Salary*0.1))
        from employees
        where EmployeeID =@EmployeeID) )and ( @NewSalary <=(select (Salary+(Salary*0.3))
        from employees
        where EmployeeID =@EmployeeID))
	THROW 60000, 'New Salary is not in range', 1 ;
	UPDATE Employees 
	SET Salary = @NewSalary
	Where EmployeeID = @EmployeeID
	if (Select DepartmentID
    from Employees
    where EmployeeID = @EmployeeID) != @NewDepartmentID
    INSERT INTO Transfers
    VALUES
        (@EmployeeID, (Select DepartmentID
            from Employees
            where EmployeeID = @EmployeeID), @NewDepartmentID, @TransferDate)
	UPDATE Employees
	SET DepartmentID = @NewDepartmentID,
	    FirstName = @NewFirstName,
		LastName = @NewLastName
	where EmployeeID = @EmployeeID
    COMMIT TRANSACTION ;
  END TRY 
  BEGIN CATCH
    Rollback Transaction;
    print Concat('Error number is: ',Error_number()); 
	print Concat('Error message is: ',Error_message()); 
	print Concat('Error state is: ',Error_state()); 
  END CATCH
end
Go

EXEC UpdateTransferInfo @EmployeeID = 1, @NewFirstName = 'James', @NewLastName = 'Brown', @NewDepartmentID = 3, @NewSalary = 90000,@TransferDate ='2024-09-05'
;

select *
from Employees
select *
from Transfers

----------------------------------------------------------------------------------------------------------------------------
--Task 4 : Reverting an Employee Transfer

go
-- batch set of SQL commands
Alter Procedure RevertLastTransfer
    @EmployeeID int
as
Begin
    BEGIN TRANSACTION ;
    BEGIN TRY
    UPDATE Employees
	SET DepartmentID = (Select OldDepartmentID
    from Transfers
    where EmployeeID = @EmployeeID)
	where EmployeeID = @EmployeeID
    Delete from Transfers
	where EmployeeID= @EmployeeID
  COMMIT TRANSACTION ;
  END TRY 
  BEGIN CATCH
    Rollback Transaction;
  END CATCH
end
Go

select *
from Employees
select *
from Transfers

EXEC RevertLastTransfer @EmployeeID = 1;

--------------------------------------------------------------------------------------------------------------
