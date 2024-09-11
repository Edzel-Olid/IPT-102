create TABLE [dbo].[WORKS_ON]
(
    [Essn] CHAR(9) NOT NULL Constraint [PK_works_ssn] Primary KEy,
    Pno INT NOT NULL Constraint [PK_works_Number] Primary KEy,
    [Hours] DECIMAL(3,1) NOT NULL,
    
Constraint [FK_works_ssn] FOREIGN KEY (Essn) REFERENCES EMPLOYEE(Ssn),
Constraint [FK_works_NUMBER]  FOREIGN KEY (Pno) REFERENCES PROJECT(Pnumber)
   
);
GO
create nonclustered index [IX_WORKS_NUMBER] On [WORKS_ON] ([PNO]ASC)