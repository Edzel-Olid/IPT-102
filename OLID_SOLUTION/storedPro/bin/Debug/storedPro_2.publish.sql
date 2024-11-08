﻿/*
Deployment script for storedPro

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "storedPro"
:setvar DefaultFilePrefix "storedPro"
:setvar DefaultDataPath "C:\Users\Personal Computer\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\"
:setvar DefaultLogPath "C:\Users\Personal Computer\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
PRINT N'Altering Procedure [dbo].[delete]...';


GO
ALTER PROCEDURE [dbo].[delete]
	@Id INT
AS
BEGIN
	DELETE FROM [dbo].[Info] 
	WHERE Id = @Id
END
GO
PRINT N'Altering Procedure [dbo].[read]...';


GO
ALTER PROCEDURE [dbo].[read]
	@id INT  ,
	@firstname NVARCHAR (max),
	@middleiniatial NVARCHAR (max),
	@lastname NVARCHAR (max)
AS
BEGIN
	SELECT * FROM [dbo].[Info] 
	WHERE id like @id or firstname like @firstname or middleiniatial like @middleiniatial or lastname like @lastname
END
GO
PRINT N'Update complete.';


GO
