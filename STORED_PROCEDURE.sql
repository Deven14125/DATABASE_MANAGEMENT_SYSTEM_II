-- Create Department Table
CREATE TABLE Department (
 DepartmentID INT PRIMARY KEY,
 DepartmentName VARCHAR(100) NOT NULL UNIQUE
);

-- Create Designation Table

CREATE TABLE Designation (
 DesignationID INT PRIMARY KEY,
 DesignationName VARCHAR(100) NOT NULL UNIQUE
);

-- Create Person Table

CREATE TABLE Person (
 PersonID INT PRIMARY KEY IDENTITY(101,1),
 FirstName VARCHAR(100) NOT NULL,
 LastName VARCHAR(100) NOT NULL,
 Salary DECIMAL(8, 2) NOT NULL,
 JoiningDate DATETIME NOT NULL,
 DepartmentID INT NULL,
 DesignationID INT NULL,
 FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),
 FOREIGN KEY (DesignationID) REFERENCES Designation(DesignationID)
);


--Part – A

--1. Department, Designation & Person Table’s INSERT, UPDATE & DELETE Procedures.

--DEPARTMENT

--CREATE PROCEDURE
CREATE OR ALTER PROCEDURE PR_INSERTDATA_DEPARTMENT
@DID INT, 
@DNAME VARCHAR(50)
AS BEGIN 
	INSERT INTO Department(DepartmentID,DepartmentName)
	VALUES (@DID,@DNAME)
END

EXEC PR_INSERTDATA_DEPARTMENT 1,'ADMIN'
EXEC PR_INSERTDATA_DEPARTMENT 2,'IT'
EXEC PR_INSERTDATA_DEPARTMENT 3,'HR'
EXEC PR_INSERTDATA_DEPARTMENT 4,'ACCOUNT'


--UPDATE PROCEDURE
CREATE OR ALTER PROCEDURE PR_UPDATE_DEPARTMENT
@DID INT,
@DNAME VARCHAR(50)
AS BEGIN 
	UPDATE Department 
	SET DepartmentID = @DID,DepartmentName = @DNAME WHERE DepartmentID = @DID
END


--DELETE PROCEDURE
CREATE OR ALTER PROCEDURE PR_DELETE_DEPARTMENT
@DID INT
AS BEGIN
	DELETE FROM Department WHERE DepartmentID = @DID
END

SELECT * FROM Department

--DESIGNATION

--CREATE PROCEDURE
CREATE OR ALTER PROCEDURE PR_INSERTDATA_DESIGNATION
@DEID INT,
@DNAME VARCHAR(50)
AS BEGIN
	INSERT INTO Designation(DesignationID,DesignationName)
	VALUES(@DEID,@DNAME)
END

--UPDATE PROCEDURE
CREATE OR ALTER PROCEDURE PR_UPDATE_DESIGNATION
@DEID INT,
@DNAME VARCHAR(50)
AS BEGIN 
	UPDATE Designation
	SET DesignationID = @DEID,DesignationName = @DNAME WHERE DesignationID = @DEID
END

--DELETE PROCEDURE
CREATE OR ALTER PROCEDURE PR_DELETE_DESIGNATION
@DEID INT
AS BEGIN
	DELETE FROM Designation WHERE DesignationID = @DEID
END

EXEC PR_INSERTDATA_DESIGNATION 11,'JOBBER'
EXEC PR_INSERTDATA_DESIGNATION 12,'WELDER'
EXEC PR_INSERTDATA_DESIGNATION 13,'CLERK'
EXEC PR_INSERTDATA_DESIGNATION 14,'MANAGER'
EXEC PR_INSERTDATA_DESIGNATION 15,'CEO'

SELECT * FROM Designation
	
--PERSON

--CREATE PROCEDURE
CREATE OR ALTER PROCEDURE PR_INSERTDATA_PERSON
@FNAME VARCHAR(50),
@LNAME VARCHAR(50),
@SALARY DECIMAL(8,2),
@JOININGDATE DATETIME,
@DID INT = NULL,
@DEID INT = NULL
AS BEGIN
	INSERT INTO Person(FirstName,LastName,Salary,JoiningDate,DepartmentID,DesignationID)
	VALUES(@FNAME,@LNAME,@SALARY,@JOININGDATE,@DID,@DEID)
END

EXEC PR_INSERTDATA_PERSON 'RAHUL','ANSHU',56000,'1990-01-01',1,12
EXEC PR_INSERTDATA_PERSON 'HARDIK','HINSU',18000,'1990-09-25',2,11
EXEC PR_INSERTDATA_PERSON 'BHAVIN','KAMANI',25000,'1991-05-14',NULL,11
EXEC PR_INSERTDATA_PERSON 'BHOOMI','PATEL',39000,'2014-02-20',1,13
EXEC PR_INSERTDATA_PERSON 'ROHIT','RAJGOR',17000,'1990-07-23',2,15
EXEC PR_INSERTDATA_PERSON 'PRIYA','MEHTA',25000,'1990-10-18',2,NULL
EXEC PR_INSERTDATA_PERSON 'NEHA','TRIVEDI',18000,'2014-02-20',3,15


--UPDATE PROCEDURE
CREATE OR ALTER PROCEDURE PR_UPDATE_PERSON
@PID INT,
@FNAME VARCHAR(50),
@LNAME VARCHAR(50),
@SALARY DECIMAL(8,2),
@JOININGDATE DATETIME,
@DID INT = NULL,
@DEID INT = NULL
AS BEGIN 
	UPDATE Person
	SET FirstName=@FNAME,
		LastName=@LNAME,
		Salary=@SALARY,
		JoiningDate=@JOININGDATE,
		DepartmentID=@DID,
		DesignationID=@DEID
	WHERE PersonID=@PID
END

--DELETE PROCEDURE
CREATE OR ALTER PROCEDURE PR_DELETE_PERSON
@PID INT
AS BEGIN
	DELETE FROM Person WHERE PersonID=@PID
END

SELECT * FROM Person

--2. Department, Designation & Person Table’s SELECTBYPRIMARYKEY

--DEPARTMENT TABLE SELECT BY PRIMARY
CREATE OR ALTER PROCEDURE PR_PRIMARY_DEPARTMENT
@DID INT 
AS BEGIN 
	SELECT * FROM Department WHERE DepartmentID=@DID
END

EXEC PR_PRIMARY_DEPARTMENT 1

--DESIGNATION TABLE SELECT BY PRIMARY
CREATE OR ALTER PROCEDURE PR_PRIMARY_DESIGNATION
@DEID INT
AS BEGIN
	SELECT * FROM Designation WHERE DesignationID=@DEID
END

EXEC PR_PRIMARY_DESIGNATION 11

--PERSON TABLE SELECT BY PRIMARY
CREATE OR ALTER PROCEDURE PR_PRIMARY_PERSON
@PID INT
AS BEGIN 
	SELECT * FROM Person WHERE PersonID=@PID
END

EXEC PR_PRIMARY_PERSON 101

--3. Department, Designation & Person Table’s (If foreign key is available then do write join and take columns on select list)
CREATE OR ALTER PROCEDURE PR_JOIN_ALL
AS BEGIN 
	SELECT PersonID,FirstName,LastName,DepartmentName,DesignationName FROM Person P
	JOIN Department D ON P.DepartmentID = D.DepartmentID
	JOIN Designation DE ON P.DesignationID = DE.DesignationID
END

EXEC PR_JOIN_ALL

--4. Create a Procedure that shows details of the first 3 persons.
CREATE OR ALTER PROCEDURE PR_DETAILS_PERSON
AS BEGIN
	SELECT TOP 3 * FROM PERSON ORDER BY PersonID
END

EXEC PR_DETAILS_PERSON


--Part – B

--5. Create a Procedure that takes the department name as input and returns a table with all workers working in that department.
CREATE OR ALTER PROCEDURE PR_SHOW_WORKER
@DNAME VARCHAR(50)
AS BEGIN
	SELECT * FROM Department D 
	JOIN Person P ON D.DepartmentID=P.DepartmentID
	WHERE D.DepartmentName = @DNAME
END

EXEC PR_SHOW_WORKER 'ADMIN'

--6. Create Procedure that takes department name & designation name as input and returns a table with
--worker’s first name, salary, joining date & department name.
CREATE OR ALTER PROCEDURE PR_SHOW_DETAILS2
@DNAME VARCHAR(50),
@DENAME VARCHAR(50)
AS BEGIN
	SELECT FirstName,Salary,JoiningDate,DepartmentName FROM Person P 
	JOIN Department D ON P.DepartmentID=D.DepartmentID
	JOIN Designation DE ON P.DesignationID=DE.DesignationID
	WHERE DepartmentName = @DNAME AND DesignationName=@DENAME
END

EXEC PR_SHOW_DETAILS2 'ADMIN','WELDER'

--7. Create a Procedure that takes the first name as an input parameter and display all the details of the
--worker with their department & designation name.
CREATE OR ALTER PROCEDURE PR_SHOW_ALL
@FNAME VARCHAR(50)
AS BEGIN
	SELECT * FROM Person P 
	JOIN Department D ON P.DepartmentID=D.DepartmentID
	JOIN Designation DE ON P.DesignationID=DE.DesignationID
	WHERE FirstName=@FNAME
END

EXEC PR_SHOW_ALL 'RAHUL'

--8. Create Procedure which displays department wise maximum, minimum & total salaries.
CREATE OR ALTER PROCEDURE PR_MIN_MAX_SUM
AS BEGIN 
	SELECT DepartmentName,MIN(Salary) AS MIN_SALARY,MAX(Salary) AS MAX_SALARY,SUM(Salary) AS TOTAL_SALARY FROM Person P
	JOIN Department D ON P.DepartmentID=D.DepartmentID 
	GROUP BY DepartmentName
END

EXEC PR_MIN_MAX_SUM

--9. Create Procedure which displays designation wise average & total salaries.
CREATE OR ALTER PROCEDURE PR_DISPLAY_DESIG
AS BEGIN
	SELECT DesignationName,SUM(Salary) AS TOTAL_SALARY,AVG(Salary) AS AVERAGE_SALARY FROM Person P 
	JOIN Designation DE ON P.DesignationID=DE.DesignationID
	GROUP BY DesignationName
END

EXEC PR_DISPLAY_DESIG

--Part – C

--10. Create Procedure that Accepts Department Name and Returns Person Count.
CREATE OR ALTER PROCEDURE PR_PERSON_COUNT
@DNAME VARCHAR(50)
AS BEGIN 
	SELECT COUNT(PersonID) AS PERSON_COUNT FROM Person P
	JOIN Department D ON P.DepartmentID=D.DepartmentID
	WHERE D.DepartmentName=@DNAME
END

EXEC PR_PERSON_COUNT 'ADMIN'
EXEC PR_PERSON_COUNT 'IT'


--11. Create a procedure that takes a salary value as input and returns all workers with a salary greater than
--input salary value along with their department and designation details.
CREATE OR ALTER PROCEDURE PR_SHOW_DETAILS
@SAL INT
AS BEGIN
	SELECT * FROM Person P 
	JOIN Department D ON P.DepartmentID=D.DepartmentID
	JOIN Designation DE ON P.DesignationID=DE.DesignationID
	WHERE Salary > @SAL
END

EXEC PR_SHOW_DETAILS 25000
EXEC PR_SHOW_DETAILS 5000

--12. Create a procedure to find the department(s) with the highest total salary among all departments.
CREATE OR ALTER PROCEDURE PR_HIGHEST_SALARY
AS BEGIN
	SELECT TOP 1 SUM(P.Salary) AS TOTAL_SALARY,D.DepartmentName FROM Person P 
	JOIN Department D ON P.DepartmentID=D.DepartmentID
	GROUP BY DepartmentName ORDER BY TOTAL_SALARY DESC
END

EXEC PR_HIGHEST_SALARY

--13. Create a procedure that takes a designation name as input and returns a list of all workers under that
--designation who joined within the last 10 years, along with their department.
CREATE OR ALTER PROCEDURE PR_SHOW_DETAILS1
@DENAME VARCHAR(50)
AS BEGIN
	SELECT * FROM Person P
	JOIN Department D ON P.DepartmentID=D.DepartmentID
	JOIN Designation DE ON P.DesignationID=DE.DesignationID
	WHERE DE.DesignationName=@DENAME AND P.JoiningDate > '2010-12-06'
END

EXEC PR_SHOW_DETAILS1 'CEO'

--14. Create a procedure to list the number of workers in each department who do not have a designation assigned.
CREATE OR ALTER PROCEDURE PR_SHOW_LIST
AS BEGIN
    SELECT D.DepartmentID, D.DepartmentName, COUNT(P.PersonID) AS WorkerCount
    FROM Person P
    JOIN Department D ON P.DepartmentID = D.DepartmentID
    LEFT JOIN Designation DE ON P.DesignationID = DE.DesignationID
    WHERE DE.DesignationID IS NULL
    GROUP BY D.DepartmentID, D.DepartmentName
END

EXEC PR_SHOW_LIST

--15. Create a procedure to retrieve the details of workers in departments where the average salary is above 12000.
CREATE OR ALTER PROCEDURE PR_WORKER_DETAIL
AS BEGIN
    SELECT P.*, D.DepartmentName
    FROM Person P
    JOIN Department D ON P.DepartmentID = D.DepartmentID
    WHERE P.DepartmentID IN (
        SELECT DepartmentID 
        FROM Person
        GROUP BY DepartmentID
        HAVING AVG(Salary) > 12000);
END


EXEC PR_WORKER_DETAIL