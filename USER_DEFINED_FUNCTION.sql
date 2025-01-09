--Part – A

--1. Write a function to print "hello world".
CREATE OR ALTER FUNCTION FN_PRINT_HELLO()
RETURNS VARCHAR(20)
AS BEGIN
	RETURN 'HELLO WORLD'
END

SELECT dbo.FN_PRINT_HELLO()

--2. Write a function which returns addition of two numbers.
CREATE OR ALTER FUNCTION FN_ADD_NUMBER(@NUM1 INT,@NUM2 INT)
RETURNS INT
AS BEGIN 
	RETURN @NUM1+@NUM2
END

SELECT dbo.FN_ADD_NUMBER(5,6)

--3. Write a function to check whether the given number is ODD or EVEN.
CREATE OR ALTER FUNCTION FN_ODD_EVEN(@NUM INT)
RETURNS VARCHAR(20)
AS BEGIN
	DECLARE @RESULT VARCHAR(4);

	IF(@NUM%2=0) 
		SET @RESULT =  'EVEN NUMBER';
	ELSE
		SET @RESULT = 'ODD NUMBER';

	RETURN @RESULT
END

SELECT dbo.FN_ODD_EVEN(12)
SELECT dbo.FN_ODD_EVEN(45)

--4. Write a function which returns a table with details of a person whose first name starts with B.
CREATE OR ALTER FUNCTION FN_PERSON_DETAILS(@FNAME VARCHAR(20))
RETURNS TABLE
AS RETURN
	(SELECT * FROM Person WHERE FirstName LIKE @FNAME+'%')

SELECT * FROM FN_PERSON_DETAILS('B')

--5. Write a function which returns a table with unique first names from the person table.
CREATE OR ALTER FUNCTION FN_UNIQUE_PERSON()
RETURNS TABLE
AS 
	RETURN (SELECT DISTINCT FirstName,LastName,Salary,JoiningDate FROM Person)

SELECT * FROM FN_UNIQUE_PERSON()

--6. Write a function to print number from 1 to N. (Using while loop)

CREATE OR ALTER FUNCTION FN_PRINT_NUMBER(@NUM INT)
RETURNS VARCHAR(MAX)
AS BEGIN
	DECLARE @ANS VARCHAR(MAX) = '';
	DECLARE @I INT = 1
WHILE(@I < @NUM)
	BEGIN
		SET @ANS = @ANS + CAST(@I AS VARCHAR(10)) + ' , '
		SET @I = @I +1
	END
	RETURN @ANS
END

SELECT dbo.FN_PRINT_NUMBER(10) AS NUMBER

--7. Write a function to find the factorial of a given integer.
-- Create a function to calculate the factorial of a given integer
CREATE FUNCTION FN_PRINT_FACTORIAL(@NUM INT)
RETURNS INT
AS BEGIN
    DECLARE @ANS INT = 1;
    DECLARE @I INT = 1;

    IF @NUM < 0
        RETURN NULL;

    WHILE @I <= @NUM
    BEGIN
        SET @ANS = @ANS * @I;  
        SET @I = @I + 1;       
    END
    RETURN @ANS;  
END;

SELECT dbo.FN_PRINT_FACTORIAL(5) AS FACTORIAL

--Part – B

--8. Write a function to compare two integers and return the comparison result. (Using Case statement)
CREATE OR ALTER FUNCTION FN_COMPARISON(@NUMBER1 INT,@NUMBER2 INT)
RETURNS VARCHAR(50)
AS BEGIN RETURN
	CASE
		WHEN @NUMBER1 = @NUMBER2 THEN 'NUMBERS ARE SAME'
		WHEN @NUMBER1 > @NUMBER2 THEN CAST(@NUMBER1 AS VARCHAR(10)) + ' IS GREATER THAN ' + CAST(@NUMBER2 AS VARCHAR(10))
		WHEN @NUMBER1 < @NUMBER2 THEN CAST(@NUMBER2 AS VARCHAR(10)) + ' IS GREATER THAN ' + CAST(@NUMBER1 AS VARCHAR(10))
	END
END

SELECT  dbo.FN_COMPARISON(4,6) AS COMPARE_NUMBER

--9. Write a function to print the sum of even numbers between 1 to 20.

CREATE OR ALTER FUNCTION FN_SUM_EVEN(@NUM INT)
RETURNS INT
AS BEGIN
	DECLARE @SUM INT = 0
	DECLARE @I INT = 1
	WHILE @I <= @NUM
		BEGIN
			IF @I %2 = 0
				SET @SUM =@SUM + @I
				SET @I = @I +1
		END
	RETURN @SUM
END

SELECT dbo.FN_SUM_EVEN(20) AS SUM_OF_EVEN_NUMBER

--10. Write a function that checks if a given string is a palindrome

CREATE OR ALTER FUNCTION FN_PRINT_PALINDROME(@NUM INT)
RETURNS VARCHAR(50)
AS BEGIN
	DECLARE @ORG INT = @NUM
	DECLARE @N INT
	DECLARE @REM INT = 0
	DECLARE @ANS VARCHAR(50) = ''

	WHILE @NUM!=0
	BEGIN
		SET @N = @NUM%10
		SET @REM = (@REM*10) + @N
		SET @NUM = @NUM/10
	END

	IF @ORG = @REM
		SET @ANS = 'PALINDROME NUMBER'
	ELSE
		SET @ANS = 'NOT A PALINDROME NUMBER'

	RETURN @ANS
END

SELECT dbo.FN_PRINT_PALINDROME(141) AS PALINDROME_NUMBER;
SELECT dbo.FN_PRINT_PALINDROME(123) AS PALINDROME_NUMBER;

--Part – C

--11. Write a function to check whether a given number is prime or not.
CREATE OR ALTER FUNCTION FN_PRIME(@NUMB INT)
RETURNS VARCHAR(50)
AS BEGIN 

--12. Write a function which accepts two parameters start date & end date, and returns a difference in days.


--13. Write a function which accepts two parameters year & month in integer and returns total days each
--year.


--14. Write a function which accepts departmentID as a parameter & returns a detail of the persons.
CREATE OR ALTER FUNCTION FN_DETAILS_PERSON(@DID INT)RETURNS TABLEAS RETURN	SELECT * FROM Person WHERE DepartmentID=@DIDSELECT * FROM FN_DETAILS_PERSON(2)--15. Write a function that returns a table with details of all persons who joined after 1-1-1991.CREATE OR ALTER FUNCTION FN_DETAILS_JOINDATE()RETURNS TABLEAS RETURN	SELECT * FROM Person WHERE JoiningDate > '1991-01-01'SELECT * FROM FN_DETAILS_JOINDATE()