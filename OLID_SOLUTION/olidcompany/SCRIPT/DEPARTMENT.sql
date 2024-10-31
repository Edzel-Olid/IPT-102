INSERT INTO dbo.DEPARTMENT(Dname,Dnumber,Mgr_ssn,Mgr_start_date)

VALUES 

('EDZEL1','10','1','2022-10-20'),
('EDZEL2','11','2','2022-10-20'),
('EDZEL3','12','3','2022-10-20'),
('EDZEL4','13','4','2022-10-20'),
('EDZEL5','14','5','2022-10-20')
GO
SELECT * FROM dbo.DEPARTMENT;
SELECT [Dname],[Dnumber] FROM dbo.DEPARTMENT;
GO