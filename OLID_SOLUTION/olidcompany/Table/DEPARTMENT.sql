CREATE TABLE [dbo].[DEPARTMENT]
(
	Dname VARCHAR(15) NOT NULL,
	Dnumber INT NOT NULL,
	Mgr_ssn CHAR(9) NOT NULL,
	Mgr_start_date DATE,

	Constraint [PK_Department_Dnumber] primary key clustered ([Dnumber]),
	Constraint [FK_Department_Employee_Mgr_ssn] foreign key([Mgr_ssn]) REFERENCES [dbo].[Employee]([Ssn])
	--consraint [UX_Department_Dname] unique nonclustered ([Dname])
);
GO

Create Unique nonclustered index [UX_Department_Dname] ON [dbo].[Department]([Dname]);

GO

Create nonclustered index [IX_Department_Mgr_ssn] ON [dbo].[Department]([Mgr_ssn] ASC
);
