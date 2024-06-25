CREATE TABLE Movies
(

    MovieID INT PRIMARY KEY,

    Title NVARCHAR(100),

    ReleaseYear INT,

    Director NVARCHAR(100),

    Genre NVARCHAR(50),

    Budget DECIMAL(18, 2),

    BoxOffice DECIMAL(18, 2)

);

CREATE TABLE Actors
(

    ActorID INT PRIMARY KEY,

    FirstName NVARCHAR(50),

    LastName NVARCHAR(50),

    BirthDate DATE

);

CREATE TABLE MovieActors
(

    MovieID INT,

    ActorID INT,

    Role NVARCHAR(100),

    PRIMARY KEY (MovieID, ActorID),

    FOREIGN KEY (MovieID) REFERENCES Movies(MovieID),

    FOREIGN KEY (ActorID) REFERENCES Actors(ActorID)

);

-- Movies

INSERT INTO Movies
    (MovieID, Title, ReleaseYear, Director, Genre, Budget, BoxOffice)
VALUES

    (1, 'Baahubali: The Beginning', 2015, 'S. S. Rajamouli', 'Action', 1800000000, 6500000000),

    (2, 'Baahubali: The Conclusion', 2017, 'S. S. Rajamouli', 'Action', 2500000000, 18000000000),

    (3, 'Sye', 2004, 'S. S. Rajamouli', 'Sports Drama', 120000000, 250000000),

    (4, 'Magadheera', 2009, 'S. S. Rajamouli', 'Fantasy', 400000000, 1500000000),

    (5, 'Arjun Reddy', 2017, 'Sandeep Reddy Vanga', 'Romance', 50000000, 510000000),

    (6, 'Rangasthalam', 2018, 'Sukumar', 'Drama', 60000000, 2160000000),

    (7, 'Maharshi', 2019, 'Vamsi Paidipally', 'Drama', 100000000, 1750000000),

    (8, 'Geetha Govindam', 2018, 'Parasuram', 'Romantic Comedy', 15000000, 1300000000),

    (9, 'Ala Vaikunthapurramuloo', 2020, 'Trivikram Srinivas', 'Action Comedy', 100000000, 2620000000),

    (10, 'Sarileru Neekevvaru', 2020, 'Anil Ravipudi', 'Action', 75000000, 2600000000);

-- Actors

INSERT INTO Actors
    (ActorID, FirstName, LastName, BirthDate)
VALUES

    (1, 'Prabhas', 'Raju', '1979-10-23'),

    (2, 'Rana', 'Daggubati', '1984-12-14'),

    (3, 'Ram', 'Charan', '1985-03-27'),

    (4, 'Vijay', 'Deverakonda', '1989-05-09'),

    (5, 'Mahesh', 'Babu', '1975-08-09'),

    (6, 'Allu', 'Arjun', '1983-04-08'),

    (7, 'Samantha', 'Akkineni', '1987-04-28'),

    (8, 'Pooja', 'Hegde', '1990-10-13'),

    (9, 'Rashmika', 'Mandanna', '1996-04-05'),

    (10, 'Anushka', 'Shetty', '1981-11-07');

-- MovieActors

INSERT INTO MovieActors
    (MovieID, ActorID, Role)
VALUES

    (1, 1, 'Baahubali'),

    (1, 2, 'Bhallaladeva'),

    (2, 1, 'Baahubali'),

    (2, 2, 'Bhallaladeva'),

    (4, 3, 'Kala Bhairava'),

    (5, 4, 'Arjun Reddy'),

    (7, 5, 'Rishi'),

    (9, 6, 'Bantu'),

    (10, 5, 'Ajay Krishna'),

    (9, 8, 'Ammu');

------------------------------------------------------------------------------------------
--TASK 1: commit if success | Rollback if failure

go
-- batch set of SQL commands
create Procedure spActorChangeOfTitle
    @Actorname nvarchar(30),
    @ActorID int
as
Begin
    BEGIN TRY
	BEGIN TRANSACTION
    UPDATE Actors
    SET FirstName = @Actorname
    where ActorID = @ActorID
    COMMIT TRANSACTION
  END TRY 

  BEGIN CATCH  
	Rollback
  END CATCH
end
Go

Exec spActorChangeOfTitle 'Prabhas Rebel Star',1

select *
from Actors

--------------------------------------------------------------------------
-- Filtered Index
Create Index ix_Filtered_Year
on Movies(Title)
where ReleaseYear = 2020

Exec sp_helpindex Movies

Select Title
from Movies
where ReleaseYear = 2020
----------------------------------------------------------------------
-- To test the performance with and without index , we can disable the index using

Alter Index ix_Filtered_Year on Movies Disable;

Alter Index ix_Filtered_Year on Movies Rebuild;
-----------------------------------------------------------------------
-- Rename the index

Exec sp_rename 'Movies.ix_Filtered_Year','ix_Movie_Filter_Year'

-- sp_rename -> used to rename procedures , Tables , Columns
---------------------------------------------------------------------------

-- to remove the nulls and give 1st non null value use:
select COALESCE(NULL,NULL,'First Non-Null Value','Hi') AS FirstNonNullValue;

-----------------------------------------------------------------------------
-- System info functions
select DB_NAME() as CurrentDatabase;
select @@VERSION AS SQLServerVersion;
select @@SERVICENAME AS ServiceName;
select SESSION_USER AS CurrentSessionUser;
select SYSTEM_USER AS SystemUserName;
----------------------------------------------------------------------------
-- user defined data types

create type PhoneNumber From Varchar(15) NOT NULL

-- usage of the user defined data types
Create Table Customer
(
    ContactId int primary key,
    Name Varchar(30),
    Phone PhoneNumber
)

Insert into Customer
Values
    (1, 'Akhila', '1234567890')

select *
from Customer

------------------------------------------------------------------------
