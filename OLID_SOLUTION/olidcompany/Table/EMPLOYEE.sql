CREATE TABLE [dbo].[EMPLOYEE]
(
	Fname VARCHAR(15) NOT NULL,
	Minit CHAR,
	Lname VARCHAR(15) NOT NULL,
	Ssn CHAR(9) NOT NULL,
	Bdate DATE,
	Address VARCHAR(30),
	Sex CHAR,
	Salary DECIMAL(10,2),
	Super_ssn CHAR(9),
	Dno INT NOT NULL,

	Constraint [Employee_Ssn] primary key (Ssn)
);
GO

Create nonclustered index [IX_Employee_Name] ON [dbo].[Employee]([Lname] ASC, [Fname] ASC);
