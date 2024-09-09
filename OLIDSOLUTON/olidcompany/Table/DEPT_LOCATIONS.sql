create TABLE[dbo].[DEPT_LOCATIONS]
(
    [Dnumber] INT NOT NULL  Constraint [PK_DEPT_LOCATIONS_Number] Primary KEy ,
    [Dlocation] VARCHAR(15) NOT NULL Constraint [PK_DEP_LOCATIONS_Number] Primary KEy,
    
    Constraint [FK_DEPT_LOCATIONS_Number]  FOREIGN KEY (Dnumber) REFERENCES DEPARTMENT(Dnumber)
);
GO
create nonclustered index [IX_DEPT_LOCATIONS] On [DEPT_LOCATIONS] ([dLOCATION]ASC)



