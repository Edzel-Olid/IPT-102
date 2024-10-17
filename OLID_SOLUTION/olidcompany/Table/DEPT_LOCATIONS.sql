CREATE TABLE[dbo].[DEPT_LOCATIONS]
(
    [Dnumber] INT NOT NULL  Constraint [PK_DEPT_LOCATIONS_Number] Primary KEy ,
    [Dlocation] VARCHAR(15) NOT NULL Constraint [PK_DEP_LOCATIONS_Number] Primary KEy,
    
    Constraint [FK_DEPT_LOCATIONS_Number]  FOREIGN KEY (Dnumber) REFERENCES DEPARTMENT(Dnumber)
);
GO
CREATE nonclustered index [IX_DEPT_LOCATIONS] On [DEPT_LOCATIONS] ([dLOCATION]ASC)

CREATE TABLE [dbo].[DEPT_LOCATION]
(
   Dnumber INT NOT NULL,
   Dlocation VARCHAR(15) NOT NULL,


   Constraint [FK_Dept_Location_Dnumber] foreign key (Dnumber) REFERENCES [dbo].[Department] ([Dnumber]),
   Constraint [PK_Dept_Location_Dnumber] primary key (Dnumber, Dlocation),
);

GO
create nonclustered index [IX_Dept_Location_Dnumber] ON [Dept_Location] ([Dnumber])
