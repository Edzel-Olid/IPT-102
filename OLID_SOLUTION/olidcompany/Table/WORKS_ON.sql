CREATE TABLE [dbo].[WORKS_ON]
(
	Essn CHAR(9) NOT NULL,
	Pno INT NOT NULL,
	Hours DECIMAL(3,1) NOT NULL,

	Constraint [PK_Works_On_Essn] primary key (Essn,Pno),
	Constraint [FK_Works_On_Essn] foreign key (Essn) REFERENCES Employee(Ssn),
	Constraint [FK_Works_On_Number] Foreign key (Pno) REFERENCES Project (Pnumber)

);

GO
Create nonclustered index [IX_Works_On_Number] ON [Works_On] ([Pno] ASC)
