```sql
CREATE TABLE Movies (

    MovieID INT PRIMARY KEY,

    Title NVARCHAR(100),

    ReleaseYear INT,

    Director NVARCHAR(100),

    Genre NVARCHAR(50),

    Budget DECIMAL(18, 2),

    BoxOffice DECIMAL(18, 2)

);

CREATE TABLE Actors (

    ActorID INT PRIMARY KEY,

    FirstName NVARCHAR(50),

    LastName NVARCHAR(50),

    BirthDate DATE

);

CREATE TABLE MovieActors (

    MovieID INT,

    ActorID INT,

    Role NVARCHAR(100),

    PRIMARY KEY (MovieID, ActorID),

    FOREIGN KEY (MovieID) REFERENCES Movies(MovieID),

    FOREIGN KEY (ActorID) REFERENCES Actors(ActorID)

);

-- Movies

INSERT INTO Movies (MovieID, Title, ReleaseYear, Director, Genre, Budget, BoxOffice) VALUES

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

INSERT INTO Actors (ActorID, FirstName, LastName, BirthDate) VALUES

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

INSERT INTO MovieActors (MovieID, ActorID, Role) VALUES

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

[10:59 AM] Bhanusri Gangadevi
------------------------------------------------------------------------------------

--Exercise 1: View for Movies Released After 2015

--Task: Create a view named ViewMoviesAfter2015 that selects movies released after the year 2015.

create view vWViewMoviesAfter2015

as

select * from Movies

where ReleaseYear>2015

select * from vWViewMoviesAfter2015

--Exercise 2: View for High Box Office Movies

--Task: Create a view named ViewHighBoxOfficeMovies that

--selects movies with a box office collection greater than 1 billion.

create view vWViewHighBoxOfficeMovies

as

select * from Movies

where BoxOffice> 1000000000

select * from vWViewHighBoxOfficeMovies

--------------------------------

-- Exercise 3: View for Actor Details in Movies

--Task: Create a view named ViewActorDetailsInMovies that joins Movies

--and Actors through MovieActors and shows movie titles and actor names.

select * from Actors

create view vWViewActorDetailsInMovies

as

select Title,concat(FirstName,' ',LastName) as Actor from Movies

join MovieActors

on Movies.MovieID=MovieActors.MovieID

join

Actors

on MovieActors.ActorID=Actors.ActorID

select * from vWViewActorDetailsInMovies

-------------------------------------------------------

--Exercise 4: View for Top Grossing Movies per Genre

--Task: Create a view named ViewTopGrossingMoviesPerGenre

--that shows the highest-grossing movie in each genre.

select * from Movies

create view vWViewTopGrossingMoviesPerGenre

as

with Movies_cte

as

(

	select

	Genre,BoxOffice,title,

	Rank() over ( partition by Genre,title order by BoxOffice desc) as rank_1

    from Movies

	group by Genre,BoxOffice

)

select * from Movies_cte

where rank_1=1

	select * from vWViewTopGrossingMoviesPerGenre

-------------------------------------------------------------

--Exercise 5: View for Actor's Total Box Office Collection

--Task: Create a view named ViewActorTotalBoxOffice that shows the total box office

--collection for each actor across all their movies.

---------------------------------------------------------

select concat(Actors.FirstName,' ',Actors.LastName) as FullName,sum(BoxOffice) from Movies

join MovieActors

on Movies.MovieID=MovieActors.MovieID

join Actors

on

Actors.ActorID=MovieActors.ActorID

group by concat(Actors.FirstName,' ',Actors.LastName)

---------

create view vWViewActorTotalBoxOffice

as

With MoviesCTE

As

(

	select concat(Actors.FirstName,' ',Actors.LastName) as FullName, BoxOffice from Movies

	join MovieActors

	on Movies.MovieID=MovieActors.MovieID

	join Actors

	on

	Actors.ActorID=MovieActors.ActorID

) select FullName,sum(BoxOffice) as total from MoviesCTE

group by FullName

select * from vWViewActorTotalBoxOffice

-------------------------------------------------------------------------

--Exercise 6: View for Actor's Age and Movie Roles

--Task: Create a view named ViewActorAgeAndRoles that shows each actor's age

--when acted that movie & also their current age and the roles they played in different movies.

select * from Movies

select * from MovieActors

select * from Actors

select DateDiff(year,BirthDate,GetDate())  from Actors


select * from Movies

select concat(Actors.FirstName,' ',Actors.LastName) as FullName,Movies.Title Role,

(ReleaseYear-year(BirthDate)) as ageActed, DateDiff(year,BirthDate,GetDate()) as CurrentAge

  from Movies

	join MovieActors

	on Movies.MovieID=MovieActors.MovieID

	join Actors

	on

	Actors.ActorID=MovieActors.ActorID

select * from Movies

	join MovieActors

	on Movies.MovieID=MovieActors.MovieID

	join Actors

	on

	Actors.ActorID=MovieActors.ActorID

------------------------------------------------------------------------------------------------

-- Functions Ex

--Exercise 1: Scalar Function to Calculate Movie Age

--Task: Create a scalar function named dbo.CalculateMovieAge that takes a MovieID

--and returns the age of the movie in years.

drop   Function CalculateMovieAge

go

create Function CalculateMovieAge(@Movieid int)

returns int

As

Begin

         return year(GetDate())-(select ReleaseYear from Movies

		                          where MovieID=@Movieid);

End;

go

select dbo.CalculateMovieAge(1)

select *,dbo.CalculateMovieAge(MovieID) as AgeOfMovie  from Movies

-----------------------------------------------------------------------------------------------

--Exercise 2: Inline Table-Valued Function for Movies within Budget Range

--Task: Create an inline table-valued function named dbo.

--GetMoviesByBudgetRange that takes MinBudget and MaxBudget and

--returns movies within that budget range.

drop Function GetMoviesByBudgetRange

go

create Function GetMoviesByBudgetRange(@minBud float,@maxBud float)

returns table

As

return(

         select * from Movies

		 where Movies.Budget between @minBud and @maxBud

);

go

select  * from dbo.GetMoviesByBudgetRange(15000000.00,2500000000.00)

go

----------------------------------------------------------------------------------------------

--Exercise 3: Inline Table-Valued Function for Actor's Movies by Year

--Task: Create an inline table-valued function named dbo.GetActorMoviesByYear

--that takes an ActorID and Year and returns the movies the actor appeared in that year.

--3. MTVF syntax

select * from Movies

join

MovieActors

on Movies.MovieID=MovieActors.MovieID

join Actors

on MovieActors.ActorID=Actors.ActorID

drop function GetActorMoviesByYear

go

create function  dbo.GetActorMoviesByYear(@ReleaseYear int ,@ActorID int)

returns table

as

return (

select Title,ReleaseYear,concat(Actors.FirstName,' ',Actors.LastName) as FullName from Movies

join

MovieActors

on Movies.MovieID=MovieActors.MovieID

join Actors

on MovieActors.ActorID=Actors.ActorID

where ReleaseYear=@ReleaseYear and Actors.ActorID=@ActorID

);

go

select * from dbo.GetActorMoviesByYear(2015,1)

------------------------------------------------------------------------------------------------------------------------

go

create function dbo.functionName()

returns @LastestMovies Table(title varchar(20),Releaseyear int, Genre varchar(10))

as

begin

           insert into @LastestMovies

           select title,ReleaseYear,Genre from Movies

           where ReleaseYear>2015

		   return;

end

go

select * from dbo.functionName()

----------------------------------------------------------------------------------------------------------

-- Exercise 4: Multi-Statement Table-Valued Function for Top Actors by Movie Count

--Task: Create a multi-statement table-valued function named dbo.

--GetTopActorsByMovieCount that returns actors who have acted in more than 2 movies.

select * from Movies

select * from Movies

join

MovieActors

on Movies.MovieID=MovieActors.MovieID

join Actors

on MovieActors.ActorID=Actors.ActorID

drop function GetTopActorsByMovieCount

go

Create Function dbo.GetTopActorsByMovieCount()

Returns @TopActors Table(Actor varchar(20), No_Movies_Acted int)

As

Begin

	Insert Into @TopActors

	Select concat(FirstName,' ',LastName),Actors.ActorID from Movies

	join

    MovieActors

    on Movies.MovieID=MovieActors.MovieID

     join Actors

     on MovieActors.ActorID=Actors.ActorID

	 group by concat(FirstName,' ',LastName),Actors.ActorID

	  having  count(Actors.ActorID)>2

	-- updates

	-- delete

	Return;

End

go

select * from dbo.GetTopActorsByMovieCount()

---------------------------------------------------------------------------------------------------------------

--Exercise 5: Multi-Statement Table-Valued Function for Actors with Multiple Roles

--Task: Create a multi-statement table-valued function named dbo.

--GetActorsWithMultipleRoles that returns actors who have played more than one role in the same movie.

go

create function dbo.GetActorsWithMultipleRoles()

returns @ActorsWithMultipleRoles table(title varchar(50),count int)

as

begin

       insert into @ActorsWithMultipleRoles

	   Select title,count(Actors.ActorID) from Movies

	  join

      MovieActors

     on Movies.MovieID=MovieActors.MovieID

     join Actors

     on MovieActors.ActorID=Actors.ActorID

	 group by Role,Title

	 having count(Role) > 1

	 return;

end

select * from dbo.GetActorsWithMultipleRoles()

--drop function GetActorsWithMultipleRoles

go

Create Function dbo.GetTopActorsByMovieCount()

Returns @TopActors Table(Actor varchar(20), No_Movies_Acted int)

As

Begin

	Insert Into @TopActors

	Select concat(FirstName,' ',LastName),Actors.ActorID from Movies

	join

    MovieActors

    on Movies.MovieID=MovieActors.MovieID

     join Actors

     on MovieActors.ActorID=Actors.ActorID

	 group by concat(FirstName,' ',LastName),Actors.ActorID

	  having  count(Actors.ActorID)>2

	-- updates

	-- delete

	Return;

End
```
