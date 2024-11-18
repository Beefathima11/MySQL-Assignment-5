CREATE Database Assignment5;
use assignment5;
CREATE TABLE Country (
    Id INT PRIMARY KEY,
    Country_name VARCHAR(50),
    Population INT,
    Area INT
);
INSERT INTO Country (Id, Country_name, Population, Area)
VALUES
(1, 'USA', 331002651, 9833517),
(2, 'India', 1380004385, 3287263),
(3, 'China', 1439323776, 9596961),
(4, 'Brazil', 212559417, 8515767),
(5, 'Russia', 145934462, 17098246),
(6, 'Canada', 37742154, 9984670),
(7, 'Australia', 25499884, 7692024),
(8, 'Germany', 83783942, 357022),
(9, 'France', 65273511, 551695),
(10, 'Japan', 126476461, 377975);

select * from country;

CREATE TABLE Persons (
    Id INT PRIMARY KEY,
    Fname VARCHAR(50),
    Lname VARCHAR(50),
    Population INT,
    Rating INT,
    Country_Id INT,
    FOREIGN KEY (Country_Id) REFERENCES Country(Id)
);

INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id)
VALUES
(1, 'John', 'Doe', 100000, 85, 1),
(2, 'Jane', 'Smith', 150000, 90, 2),
(3, 'Alex', 'Brown', 120000, 75, 3),
(4, 'Emily', 'Davis', 130000, 80, 4),
(5, 'Chris', 'Wilson', 140000, 95, 5),
(6, 'Sophia', 'Miller', 110000, 70, 6),
(7, 'Daniel', 'Taylor', 125000, 65, 7),
(8, 'Emma', 'Anderson', 135000, 85, 8),
(9, 'Olivia', 'Thomas', 145000, 88, 9),
(10, 'Liam', 'Johnson', 155000, 92, 10);

select * from persons;

SELECT LEFT(Country_name, 3) AS FirstThreeCharacters FROM Country;

SELECT CONCAT(Fname, ' ', Lname) AS FullName FROM Persons;

SELECT COUNT(DISTINCT Country_Id) AS UniqueCountryCount FROM Persons;

SELECT MAX(Population) AS MaxPopulation FROM Country;

SELECT MIN(Population) AS MinPopulation FROM Persons;

INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id)
VALUES
(11, 'Noah', NULL, 50000, 60, 1),
(12, 'Mia', NULL, 75000, 80, 2);
SELECT COUNT(Lname) AS CountLname FROM Persons;
SELECT COUNT(*) AS RowCount FROM Persons;

SELECT Population FROM Country LIMIT 3;

SELECT * FROM Country ORDER BY RAND() LIMIT 3;

SELECT * FROM Persons ORDER BY Rating DESC;

SELECT Country_Id, SUM(Population) AS TotalPopulation
FROM Persons
GROUP BY Country_Id;

SELECT Country_Id
FROM Persons
GROUP BY Country_Id
HAVING SUM(Population) > 50000;

SELECT Country_Id, COUNT(*) AS TotalPersons, AVG(Rating) AS AverageRating
FROM Persons
GROUP BY Country_Id
HAVING COUNT(*) > 2
ORDER BY AverageRating ASC;

SELECT Country_Id, COUNT(*) AS TotalPersons, AVG(Rating) AS AverageRating
FROM Persons
GROUP BY Country_Id
HAVING COUNT(*) >= 2
ORDER BY AverageRating ASC;
