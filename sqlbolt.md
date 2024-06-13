## Exercise 1 — Tasks

Find the title of each film ✓

```sql
 SELECT Title FROM movies;
```

Find the director of each film ✓

```sql
 SELECT Director FROM movies;
```

Find the title and director of each film ✓

```sql
 SELECT Title,Director FROM movies;
```

Find the title and year of each film ✓

```sql
 SELECT Title,year FROM movies;
```

Find all the information about each film ✓

```sql
 SELECT * FROM movies;
```

![Exercise - 1](image-6.png)

## Exercise 2 — Tasks

Find the movie with a row id of 6 ✓

```sql
SELECT *
FROM movies
Where id = 6;
```

Find the movies released in the years between 2000 and 2010 ✓

```sql
SELECT * FROM movies
where year between 2000 and 2010;
```

Find the movies not released in the years between 2000 and 2010 ✓

```sql
SELECT * FROM movies
where year not between 2000 and 2010;
```

Find the first 5 Pixar movies and their release year ✓

```sql
SELECT * FROM movies
where id<= 5;
```

![Excrcise - 2](image-7.png)

## Exercise 3 — Tasks

Find all the Toy Story movies ✓

```sql
SELECT * FROM movies
where title like "Toy Story%";
```

Find all the movies directed by John Lasseter ✓

```sql
SELECT * FROM movies
where director = "John Lasseter";
```

Find all the movies (and director) not directed by John Lasseter ✓

```sql
SELECT * FROM movies
where director != "John Lasseter";
```

Find all the WALL-\* movies ✓

```sql
SELECT * FROM movies
where TITLE like "WALL-_";
```

![Exercise - 3](image-8.png)

## Exercise 4 — Tasks

List all directors of Pixar movies (alphabetically), without duplicates ✓

```sql
SELECT  Distinct Director
FROM Movies
ORDER BY Director ASC;
```

List the last four Pixar movies released (ordered from most recent to least) ✓

```sql
SELECT Title FROM movies
ORDER BY Year Desc
LIMIT 4 OFFSET 0;
```

List the first five Pixar movies sorted alphabetically ✓

```sql
SELECT Title FROM movies
ORDER BY  Title ASC
LIMIT 5 OFFSET 0;
```

List the next five Pixar movies sorted alphabetically ✓

```sql
SELECT Title FROM movies
ORDER BY  Title ASC
LIMIT 5 OFFSET 5;
```

![Excercise - 4](image-9.png)

## Review 1 — Tasks

List all the Canadian cities and their populations ✓

```sql
SELECT city,population FROM north_american_cities
where country = "Canada";
```

Order all the cities in the United States by their latitude from north to south ✓

```sql
SELECT City FROM north_american_cities
where Country = "United States"
ORDER BY latitude DESC;
```

List all the cities west of Chicago, ordered from west to east ✓

```sql
SELECT City FROM north_american_cities
where longitude < -87.629798
ORDER BY  longitude ASC;
```

List the two largest cities in Mexico (by population) ✓

```sql
SELECT City FROM north_american_cities
where country ="Mexico"
ORDER BY population DESC
LIMIT 2 OFFSET 0;
```

List the third and fourth largest cities (by population) in the United States and their population ✓

```sql
SELECT City FROM north_american_cities
where country ="United States"
ORDER BY population DESC
LIMIT 2 OFFSET 2;
```

![Review - 1](image-10.png)

## Exercise 6 — Tasks

Find the domestic and international sales for each movie ✓

```sql
SELECT * FROM movies
INNER JOIN Boxoffice
ON Movies.Id = Boxoffice.Movie_id;
```

Show the sales numbers for each movie that did better internationally rather than domestically ✓

```sql
SELECT * FROM movies
INNER JOIN Boxoffice
ON Movies.Id = Boxoffice.Movie_id
where Domestic_sales < International_sales;
```

List all the movies by their ratings in descending order ✓

```sql
SELECT Title,Rating FROM movies
INNER JOIN Boxoffice
ON Movies.Id = Boxoffice.Movie_id
ORDER BY Rating DESC;
```

![Exercise - 6](image-15.png)

## Exercise 7 — Tasks

Find the list of all buildings that have employees ✓

```sql
SELECT Distinct Building FROM employees;
```

Find the list of all buildings and their capacity ✓

```sql
SELECT * FROM Buildings;
```

List all buildings and the distinct employee roles in each building (including empty buildings) ✓

```sql
SELECT DISTINCT Building_name, Role FROM Buildings
OUTER LEFT JOIN Employees
ON Buildings.Building_name = Employees.Building ;
```

![Exercise - 7](image-16.png)

## Exercise 8 — Tasks

Find the name and role of all employees who have not been assigned to a building ✓

```sql
SELECT Name,Role FROM employees
Where Building is NULL;
```

Find the names of the buildings that hold no employees ✓

```sql
SELECT Building_name FROM Buildings
Left join Employees
ON Buildings.Building_name = Employees.Building
Where Building is NULL;
```

![Exercise - 8](image-17.png)

## Exercise 9 — Tasks

List all movies and their combined sales in millions of dollars ✓

```sql
SELECT *,(Domestic_sales+International_sales)/1000000 AS Total_Sales FROM movies
INNER Join Boxoffice
ON Id = Movie_id;
```

List all movies and their ratings in percent ✓

```sql
SELECT Title,(Rating*10) AS Ratings_in_percent FROM movies
INNER Join Boxoffice
ON Id = Movie_id;
```

List all movies that were released on even number years ✓

```sql
SELECT Title FROM movies
Where Year % 2 = 0 ;
```

![Exercise - 9](image-18.png)

## Exercise 10 — Tasks

Find the longest time that an employee has been at the studio ✓

```sql
SELECT Max(	Years_employed),* FROM employees;
```

For each role, find the average number of years employed by employees in that role ✓

```sql
SELECT AVG(Years_employed),* FROM employees
GROUP BY Role ;
```

Find the total number of employee years worked in each building ✓

```sql
SELECT SUM(Years_employed),* FROM employees
GROUP BY Building ;
```

![Exercise - 10](image-19.png)

## Exercise 11 — Tasks

Find the number of Artists in the studio (without a HAVING clause) ✓

```sql
SELECT *,COUNT(Role) FROM employees
where Role = "Artist";
```

Find the number of Employees of each role in the studio ✓

```sql
SELECT *,count(Role) FROM employees
GROUP BY Role;
```

Find the total number of years employed by all Engineers ✓

```sql
SELECT *,Sum(Years_employed) FROM employees
where Role = "Engineer";
```

![Exercise - 11](image-20.png)

## Exercise 12 — Tasks

Find the number of movies each director has directed ✓

```sql
SELECT *,Count(Title) FROM movies
GROUP BY Director;
```

Find the total domestic and international sales that can be attributed to each director ✓

```sql
SELECT Director,SUM(Domestic_sales + International_sales) FROM movies
Join Boxoffice
ON Id = Movie_id
GROUP BY Director;
```

![Exercise - 12](image-21.png)

## Exercise 13 — Tasks

Add the studio's new production, Toy Story 4 to the list of movies (you can use any director) ✓

```sql
INSERT INTO Movies
VALUES (4,"Toy Story 4","John Lasseter",2024,100);
```

Toy Story 4 has been released to critical acclaim! It had a rating of 8.7, and made 340 million domestically and 270 million internationally. Add the record to the BoxOffice table. ✓

```sql
INSERT INTO Boxoffice
VALUES (4 , 8.7 , 340000000 , 270000000);
```

![Exercise - 13](image-22.png)

## Exercise 14 — Tasks

The director for A Bug's Life is incorrect, it was actually directed by John Lasseter ✓

```sql
UPDATE Movies
SET Director = "John Lasseter"
Where Id=2;
```

The year that Toy Story 2 was released is incorrect, it was actually released in 1999 ✓

```sql
UPDATE Movies
SET Year = "1999"
Where Title = "Toy Story 2";
```

Both the title and director for Toy Story 8 is incorrect! The title should be "Toy Story 3" and it was directed by Lee Unkrich ✓

```sql
UPDATE Movies
SET Title = "Toy Story 3",Director ="Lee Unkrich"
Where Title = "Toy Story 8";
```

![Exercise - 14](image-23.png)

## Exercise 15 — Tasks

This database is getting too big, lets remove all movies that were released before 2005. ✓

```sql
Delete From Movies
Where Year < 2005
```

Andrew Stanton has also left the studio, so please remove all movies directed by him.✓

```sql
Delete From Movies
Where Director ="Andrew Stanton";
```

![Exercise - 15](image-24.png)

## Exercise 16 — Tasks

Create a new table named Database with the following columns:
– Name A string (text) describing the name of the database  
– Version A number (floating point) of the latest version of this database  
– Download_count An integer count of the number of times this database was downloaded  
This table has no constraints. ✓

```sql
CREATE TABLE Database (
Name TEXT PRIMARY KEY,
Version FLOAT,
Download_count INTEGER
);
```

![Exercise - 16](image-25.png)

## Exercise 17 — Tasks

Add a column named Aspect_ratio with a FLOAT data type to store the aspect-ratio each movie was released in. ✓

```sql
ALTER TABLE Movies
ADD Aspect_ratio FLOAT;
```

Add another column named Language with a TEXT data type to store the language that the movie was released in. Ensure that the default for this language is English. ✓

```sql
ALTER TABLE Movies
ADD Language TEXT
DEFAULT English;
```

![Exercise - 17](image-26.png)

## Exercise 18 — Tasks

We've sadly reached the end of our lessons, lets clean up by removing the Movies table ✓

```sql
DROP TABLE Movies;
```

And drop the BoxOffice table as well ✓

```sql
DROP TABLE Boxoffice;
```

![Exercise - 18](image-27.png)
