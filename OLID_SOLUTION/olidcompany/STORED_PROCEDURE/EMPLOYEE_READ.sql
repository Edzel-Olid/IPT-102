CREATE PROCEDURE [dbo].[EMPLOYEE_READ]
	@Find VARCHAR(15) 
AS
BEGIN
	SELECT * FROM   [EMPLOYEE] 
	WHERE Lname like @Find or Minit like @Find or Bdate like @Find  or  Ssn like @Find or Address like @Find or Sex like @Find or Salary like @Find or Super_ssn like @Find or Dno like @Find
	END

	