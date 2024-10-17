CREATE TABLE [dbo].[DEPENDENT]
(
	Essn CHAR(9) NOT NULL,
	Dependent_name VARCHAR(15) NOT NULL,
	Sex CHAR,
	Bdate DATE,
	Relationship VARCHAR(8),

	Constraint [PK_Dependent_name] primary key (Essn, Dependent_name),
	Constraint [FK_Dependent_Essn] foreign key ([Essn]) REFERENCES Employee(Ssn)
);

GO
Create nonclustered index [IX_Dependent_Dependent_name] ON [Dependent]([Dependent_name])