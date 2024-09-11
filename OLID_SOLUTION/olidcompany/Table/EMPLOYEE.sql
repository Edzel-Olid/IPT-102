CREATE TABLE [dbo].[EMPLOYEE]
(
    Fname VARCHAR(15) NOT NULL,
    Minit CHAR(1) ,
    Lname VARCHAR(15) NOT NULL,
    Ssn CHAR(9) NOT NULL Constraint [PK_EMPLOYEE_SSN] Primary KEy,
    Bdate DATE ,
    Address VARCHAR(30) ,
    Sex CHAR(1),
    Salary DECIMAL(10,2)NULL,
    Super_ssn CHAR(9),
    Dno INT NOT NULL,

);
GO
create nonclustered index [IX_EMPLOYEE_NAME] On [dbo].[EMPLOYEE] ([FNAME]ASC, [LNAME]ASC)