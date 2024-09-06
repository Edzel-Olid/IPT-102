﻿CREATE TABLE [dbo].[PROJECT]
(
    Pname VARCHAR(15) NOT NULL Constraint [UX_EPROJECT_NAME] UNIQUE NONCLUSTERED,
    Pnumber INT NOT NULL Constraint [PK_PROJECT_NUMBER] Primary KEy,
    Plocation VARCHAR(15),
    Dnum INT NOT NULL Constraint [FK_PROJECT_NUMBER] FOREIGN KEy REFERENCES DEPARTMENT (Dnumber),
    
);
GO
create nonclustered index [IX_PROJECT_LOCATION] On [PROJECT] ([PLOCATION])