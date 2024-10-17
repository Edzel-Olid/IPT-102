CREATE TABLE [dbo].[PROJECT]
(
	Pname VARCHAR(15) NOT NULL,
	Pnumber INT NOT NULL,
	Plocation VARCHAR(15),
	Dnum INT NOT NULL,


	Constraint [PK_Project_Pnumber] primary key clustered ([Pnumber]),
	Constraint [UI_Project_Pname] unique ([Pname]),
	Constraint [FK_Project_Dnum] foreign key ([Dnum]) REFERENCES [dbo].[Department]([Dnumber])
);

GO
Create nonclustered index [IX_Project_Location] ON [dbo].[Project] ([Plocation]);
GO
Create unique nonclustered index [UX_Project_Pname] ON [dbo].[Project] ([Pname]);
GO
Create nonclustered index [IX_Project_Dnum] ON [dbo].[Project] ([Dnum] ASC

);