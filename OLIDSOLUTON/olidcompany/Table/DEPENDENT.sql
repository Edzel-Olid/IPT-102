CREATE TABLE [dbo].[DEPENDENT]
 (
    Essn CHAR(9) NOT NULL,
    Dependent_name VARCHAR(15) NOT NULL,
    Sex CHAR(1) ,
    Bdate DATE ,
    Relationship VARCHAR(8) ,
    Constraint [FK_DEPENDENT_NAME]PRIMARY KEY (Essn, Dependent_name),
    Constraint [FK_DEPENDENT_SSN]FOREIGN KEY (Essn) REFERENCES EMPLOYEE(Ssn)
);
GO
create nonclustered index [IX_Department_Sex] On [DEPENDENT] ([Sex]ASC)
