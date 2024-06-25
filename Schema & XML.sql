CREATE TABLE Director
(
    DirectorID INT PRIMARY KEY IDENTITY (1,1),
    D_Name VARCHAR(255) not null unique,
);

CREATE TABLE Actor
(
    ActorID INT PRIMARY KEY IDENTITY (1,1),
    A_Name VARCHAR(255) not null
    ,
);

CREATE TABLE Movies
(
    Movie_id INT PRIMARY KEY IDENTITY (1,1),
    Title VARCHAR(255) not null unique,
    Year INT not null,
    DirectorID INT not null,
    CONSTRAINT FK_DirectorID Foreign key (DirectorID) REFERENCES Director(DirectorID),
);

CREATE TABLE Movie_Actors
(
    Movie_id INT,
    ActorID INT ,
    PRIMARY KEY (Movie_id,ActorID),
    CONSTRAINT FK_ActorID Foreign key (ActorID) REFERENCES Actor(ActorID),
    CONSTRAINT FK_Movie_id Foreign key (Movie_id) REFERENCES Movies(Movie_id),
);


DROP TABLE Director
DROP TABLE Actor
DROP TABLE Movies
DROP TABLE Movie_Actors


INSERT INTO Movies
    (Title, Year ,DirectorID)
VALUES
    ('Baahubali', 2015, 1),
    ('Ala Vaikunthapurramuloo', 2020, 2),
    ('Pokiri', 2006, 3),
    ('Magadheera', 2009, 1),
    ('Srimanthudu', 2015, 4),
    ('Arjun Reddy', 2017, 5),
    ('Geetha Govindam', 2018, 6),
    ('Temper', 2015, 3),
    ('Eega', 2012, 1),
    ('Attarintiki Daredi', 2013, 2)

insert into Director
    (D_Name)
values
    ('S. S. Rajamouli'),
    ('Trivikram Srinivas'),
    ('Puri Jagannadh'),
    ('Koratala Siva'),
    ('Sandeep Reddy Vanga'),
    ('Parasuram')


INSERT INTO Actor
    (A_Name)
Values
    ('Prabhas'),
    ('Allu Arjun'),
    ('Mahesh Babu'),
    ('Ram Charan'),
    ('Vijay Deverakonda'),
    ('Jr. NTR'),
    ('Nani'),
    ('Pawan Kalyan')

INSERT INTO Movie_Actors
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 3),
    (6, 5),
    (7, 5),
    (8, 6),
    (9, 7),
    (10, 8)


SELECT *
from Director
SELECT *
from Actor
SELECT *
from Movies
SELECT *
from Movie_Actors

------------------------------------------------------------------------
-- Adding Constraints

ALTER TABLE Movies ADD CONSTRAINT chk_Year CHECK (Movies.Year >= 1990);
INSERT INTO Movies
VALUES('Mahanati', 1990 , 4)
----------------------------------------------------------------------
-- Deleteing a name 

Delete from Movie_Actors
where ActorID = 1
Delete from Actor
where A_Name = 'Prabhas'

-- Cascade Delete

---------------------------------------------------------------------
-- xml auto (for data to be in attribute form)
select *
from Movies
for xml auto

    -- xml path (data in the form of keys)
    select *
    from Movies
    for xml path ('Movie'),Root ('Movies')

        select
            Movie_id ,
            Title,
            year,
            DirectorID
        from Movies
        for xml path ('Movie'),Root ('Movies')

            select
                Movie_id as [@MovieTd] ,--attribute
                Title,
                year,
                DirectorID
            from Movies
            for xml path ('Movie'),Root ('Movies')

                select
                    Movie_id as [@MovieTd] ,--attribute
                    Title as [MovieInfo/Title], --nesting xml
                    year as [MovieInfo/Year],
                    DirectorID
                from Movies
                for xml path ('Movie'),Root ('Movies')

                    --------------------------------------------------------------------

                    -- JSON auto
                    select *
                    from Movies
                    for json auto

                        -- JSON path
                        select *
                        from Movies
                        for json path

                            select *
                            from Movies
                            for json path ,Root

                                select *
                                from Movies
                                for json path ,Root ('Movies')

                                    select
                                        Movie_id as [Td] ,--renaming the key
                                        Title as 'MovieInfo.Title', --nesting json
                                        year as 'MovieInfo.Year',
                                        DirectorID
                                    from Movies
                                    for json path ,Root ('Movies')
                                        ----------------------------------------------------------------------------------
                                        -- display table in xml format

                                        select
                                            Title as [Movie/Title],
                                            Year as [Movie/Year],
                                            D.DirectorID as [Movie/DirectorID],
                                            D.DirectorID as [Director/ID],
                                            D.D_Name as [Director/Name],
                                            A.ActorID as [Actor/ID],
                                            A.A_Name as [Actor/Name]
                                        from Movies M
                                            join Movie_Actors MA on M.Movie_id = MA.Movie_id
                                            join Actor A on MA.ActorID = A.ActorID
                                            join Director D on M.DirectorID = D.DirectorID
                                        for xml path ('Movies'),Root

                                            ----------------------------------------------------------------------------------
                                            -- display in json format

                                            select
                                                Title as 'Movie.Title',
                                                Year as 'Movie.Year',
                                                D.DirectorID as 'Movie.DirectorID',
                                                D.DirectorID as 'Director.ID',
                                                D.D_Name as 'Director.Name',
                                                A.ActorID as 'Actor.ID',
                                                A.A_Name as 'Actor.Name'
                                            from Movies M
                                                join Movie_Actors MA on M.Movie_id = MA.Movie_id
                                                join Actor A on MA.ActorID = A.ActorID
                                                join Director D on M.DirectorID = D.DirectorID
                                            for json path ,Root ('Movies')

                                                ------------------------------------------------
                                                -- Cast & Convert

                                                SELECT CAST(25.65 AS int);
                                                Select CAST(20 as Decimal(10,2));
                                                Select CAST('2017-08-25' as datetime);

                                                SELECT CONVERT(int, 25.65);
                                                SELECT CONVERT(Decimal(10,2), 25);
                                                SELECT CONVERT(datetime, '2017-08-25');
                                                SELECT CONVERT(VARCHAR , GETDATE(),101);-- 101 is a style code used for `/` instead of'-' in displaying date

                                                --------------------------------------------------------------------

                                                -- Functions

                                                --declartion(or)value/input from user

                                                DECLARE @movie_id INT =5;
                                                --SET @movie_id=3 -- Assignment

                                                Select *
                                                from Movies
                                                where Movie_id = @movie_id

                                                -----------------------------------------------------------------
                                                -- Function for calculating the no.of years of a movie from release
                                                Drop Function dbo.CalculateAge

                                                Create Function dbo.CalculateAge(@ReleaseDate INT)
Returns INT
As 
Begin
                                                    Return Year(GetDate()) - @ReleaseDate;
                                                End;

                                                Select *, dbo.CalculateAge([Year])
                                                from Movies
                                                ---------------------------------------------------------------------
                                                DECLARE @xmlDoc INT;
                                                DECLARE @xmlData NVARCHAR(MAX);

                                                -- 1. Assign XML data to a variable
                                                SET @xmlData = 
'<Books>
<Book id="1">
<Title>SQL for Beginners</Title>
<Author>John Doe</Author>
<Price>29.99</Price>
</Book>
<Book id="2">
<Title>Advanced SQL</Title>
<Author>Jane Smith</Author>
<Price>49.99</Price>
</Book>
</Books>';

                                                -- 2. Parse the XML document
                                                EXEC sp_xml_preparedocument @xmlDoc OUTPUT, @xmlData;

                                                -- 3. Query the XML data using OPENXML
                                                SELECT *
                                                FROM OPENXML(@xmlDoc, '/Books/Book', 1)
WITH (
    id INT '@id',
    Title NVARCHAR(100) 'Title',
    Author NVARCHAR(100) 'Author',
    Price DECIMAL(10,2) 'Price'
);

                                                -- Clear the memory
                                                EXEC sp_xml_removedocument @xmlDoc;