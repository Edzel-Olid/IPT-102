CREATE TABLE [dbo].[DEPT_LOCATION]
(
   Dnumber INT NOT NULL,
   Dlocation VARCHAR(15) NOT NULL,


   Constraint [FK_Dept_Location_Dnumber] foreign key (Dnumber) REFERENCES [dbo].[Department] ([Dnumber]),
   Constraint [PK_Dept_Location_Dnumber] primary key (Dnumber, Dlocation),
);

GO
create nonclustered index [IX_Dept_Location_Dnumber] ON [Dept_Location] ([Dnumber])
