CREATE TABLE [dbo].[DEPARTMENT]
(
    [Dname] Varchar(15) NOT NULL ,
    Dnumber INT NOT NULL ,
    Mgr_ssn Char(9) NOT NULL,
    Mgr_start_date Date ,
    Constraint [PK_DEPARTMENT_Number] Primary KEy (Dnumber),
    Constraint [UX_DEPARTMENT_Name] UNIQUE nonclustered (Dname),
    Constraint [FK_DEPARTMENT_SSN] Foreign Key (Mgr_ssn) References EMPLOYEE(SSN)
);
GO
create nonclustered index [IX_DEPARTMENT_Name] On [DEPARTMENT] ([Dname] ASC)
