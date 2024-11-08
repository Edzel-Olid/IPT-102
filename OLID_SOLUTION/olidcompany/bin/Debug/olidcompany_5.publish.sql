﻿/*
Deployment script for olidcompany5

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "olidcompany5"
:setvar DefaultFilePrefix "olidcompany5"
:setvar DefaultDataPath "C:\Users\USER\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\"
:setvar DefaultLogPath "C:\Users\USER\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\"

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
USE [master];


GO

IF (DB_ID(N'$(DatabaseName)') IS NOT NULL) 
BEGIN
    ALTER DATABASE [$(DatabaseName)]
    SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE [$(DatabaseName)];
END

GO
PRINT N'Creating database $(DatabaseName)...'
GO
CREATE DATABASE [$(DatabaseName)]
    ON 
    PRIMARY(NAME = [$(DatabaseName)], FILENAME = N'$(DefaultDataPath)$(DefaultFilePrefix)_Primary.mdf')
    LOG ON (NAME = [$(DatabaseName)_log], FILENAME = N'$(DefaultLogPath)$(DefaultFilePrefix)_Primary.ldf') COLLATE SQL_Latin1_General_CP1_CI_AS
GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CLOSE OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
USE [$(DatabaseName)];


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ANSI_NULLS ON,
                ANSI_PADDING ON,
                ANSI_WARNINGS ON,
                ARITHABORT ON,
                CONCAT_NULL_YIELDS_NULL ON,
                NUMERIC_ROUNDABORT OFF,
                QUOTED_IDENTIFIER ON,
                ANSI_NULL_DEFAULT ON,
                CURSOR_DEFAULT LOCAL,
                CURSOR_CLOSE_ON_COMMIT OFF,
                AUTO_CREATE_STATISTICS ON,
                AUTO_SHRINK OFF,
                AUTO_UPDATE_STATISTICS ON,
                RECURSIVE_TRIGGERS OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ALLOW_SNAPSHOT_ISOLATION OFF;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET READ_COMMITTED_SNAPSHOT OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_UPDATE_STATISTICS_ASYNC OFF,
                PAGE_VERIFY NONE,
                DATE_CORRELATION_OPTIMIZATION OFF,
                DISABLE_BROKER,
                PARAMETERIZATION SIMPLE,
                SUPPLEMENTAL_LOGGING OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET TRUSTWORTHY OFF,
        DB_CHAINING OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'The database settings cannot be modified. You must be a SysAdmin to apply these settings.';
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET HONOR_BROKER_PRIORITY OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'The database settings cannot be modified. You must be a SysAdmin to apply these settings.';
    END


GO
ALTER DATABASE [$(DatabaseName)]
    SET TARGET_RECOVERY_TIME = 0 SECONDS 
    WITH ROLLBACK IMMEDIATE;


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET FILESTREAM(NON_TRANSACTED_ACCESS = OFF),
                CONTAINMENT = NONE 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CREATE_STATISTICS ON(INCREMENTAL = OFF),
                MEMORY_OPTIMIZED_ELEVATE_TO_SNAPSHOT = OFF,
                DELAYED_DURABILITY = DISABLED 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE (QUERY_CAPTURE_MODE = ALL, DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_PLANS_PER_QUERY = 200, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 367), MAX_STORAGE_SIZE_MB = 100) 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE = OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET TEMPORAL_HISTORY_RETENTION ON 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF fulltextserviceproperty(N'IsFulltextInstalled') = 1
    EXECUTE sp_fulltext_database 'enable';


GO
PRINT N'Creating Table [dbo].[DEPARTMENT]...';


GO
CREATE TABLE [dbo].[DEPARTMENT] (
    [Dname]          VARCHAR (15) NOT NULL,
    [Dnumber]        INT          NOT NULL,
    [Mgr_ssn]        CHAR (9)     NOT NULL,
    [Mgr_start_date] DATE         NULL,
    CONSTRAINT [PK_Department_Dnumber] PRIMARY KEY CLUSTERED ([Dnumber] ASC)
);


GO
PRINT N'Creating Index [dbo].[Department].[UX_Department_Dname]...';


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_Department_Dname]
    ON [dbo].[DEPARTMENT]([Dname] ASC);


GO
PRINT N'Creating Index [dbo].[Department].[IX_Department_Mgr_ssn]...';


GO
CREATE NONCLUSTERED INDEX [IX_Department_Mgr_ssn]
    ON [dbo].[DEPARTMENT]([Mgr_ssn] ASC);


GO
PRINT N'Creating Table [dbo].[DEPENDENT]...';


GO
CREATE TABLE [dbo].[DEPENDENT] (
    [Essn]           CHAR (9)     NOT NULL,
    [Dependent_name] VARCHAR (15) NOT NULL,
    [Sex]            CHAR (1)     NULL,
    [Bdate]          DATE         NULL,
    [Relationship]   VARCHAR (8)  NULL,
    CONSTRAINT [PK_Dependent_name] PRIMARY KEY CLUSTERED ([Essn] ASC, [Dependent_name] ASC)
);


GO
PRINT N'Creating Index [dbo].[Dependent].[IX_Dependent_Dependent_name]...';


GO
CREATE NONCLUSTERED INDEX [IX_Dependent_Dependent_name]
    ON [dbo].[DEPENDENT]([Dependent_name] ASC);


GO
PRINT N'Creating Table [dbo].[DEPT_LOCATION]...';


GO
CREATE TABLE [dbo].[DEPT_LOCATION] (
    [Dnumber]   INT          NOT NULL,
    [Dlocation] VARCHAR (15) NOT NULL,
    CONSTRAINT [PK_Dept_Location_Dnumber] PRIMARY KEY CLUSTERED ([Dnumber] ASC, [Dlocation] ASC)
);


GO
PRINT N'Creating Index [dbo].[Dept_Location].[IX_Dept_Location_Dnumber]...';


GO
CREATE NONCLUSTERED INDEX [IX_Dept_Location_Dnumber]
    ON [dbo].[DEPT_LOCATION]([Dnumber] ASC);


GO
PRINT N'Creating Table [dbo].[EMPLOYEE]...';


GO
CREATE TABLE [dbo].[EMPLOYEE] (
    [Fname]     VARCHAR (15)    NOT NULL,
    [Minit]     CHAR (1)        NULL,
    [Lname]     VARCHAR (15)    NOT NULL,
    [Ssn]       CHAR (9)        NOT NULL,
    [Bdate]     DATE            NULL,
    [Address]   VARCHAR (30)    NULL,
    [Sex]       CHAR (1)        NULL,
    [Salary]    DECIMAL (10, 2) NULL,
    [Super_ssn] CHAR (9)        NULL,
    [Dno]       INT             NOT NULL,
    CONSTRAINT [Employee_Ssn] PRIMARY KEY CLUSTERED ([Ssn] ASC)
);


GO
PRINT N'Creating Index [dbo].[Employee].[IX_Employee_Name]...';


GO
CREATE NONCLUSTERED INDEX [IX_Employee_Name]
    ON [dbo].[EMPLOYEE]([Lname] ASC, [Fname] ASC);


GO
PRINT N'Creating Table [dbo].[PROJECT]...';


GO
CREATE TABLE [dbo].[PROJECT] (
    [Pname]     VARCHAR (15) NOT NULL,
    [Pnumber]   INT          NOT NULL,
    [Plocation] VARCHAR (15) NULL,
    [Dnum]      INT          NOT NULL,
    CONSTRAINT [PK_Project_Pnumber] PRIMARY KEY CLUSTERED ([Pnumber] ASC),
    CONSTRAINT [UI_Project_Pname] UNIQUE NONCLUSTERED ([Pname] ASC)
);


GO
PRINT N'Creating Index [dbo].[Project].[IX_Project_Location]...';


GO
CREATE NONCLUSTERED INDEX [IX_Project_Location]
    ON [dbo].[PROJECT]([Plocation] ASC);


GO
PRINT N'Creating Index [dbo].[Project].[UX_Project_Pname]...';


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_Project_Pname]
    ON [dbo].[PROJECT]([Pname] ASC);


GO
PRINT N'Creating Index [dbo].[Project].[IX_Project_Dnum]...';


GO
CREATE NONCLUSTERED INDEX [IX_Project_Dnum]
    ON [dbo].[PROJECT]([Dnum] ASC);


GO
PRINT N'Creating Table [dbo].[WORKS_ON]...';


GO
CREATE TABLE [dbo].[WORKS_ON] (
    [Essn]  CHAR (9)       NOT NULL,
    [Pno]   INT            NOT NULL,
    [Hours] DECIMAL (3, 1) NOT NULL,
    CONSTRAINT [PK_Works_On_Essn] PRIMARY KEY CLUSTERED ([Essn] ASC, [Pno] ASC)
);


GO
PRINT N'Creating Index [dbo].[Works_On].[IX_Works_On_Number]...';


GO
CREATE NONCLUSTERED INDEX [IX_Works_On_Number]
    ON [dbo].[WORKS_ON]([Pno] ASC);


GO
PRINT N'Creating Foreign Key [dbo].[FK_Department_Employee_Mgr_ssn]...';


GO
ALTER TABLE [dbo].[DEPARTMENT]
    ADD CONSTRAINT [FK_Department_Employee_Mgr_ssn] FOREIGN KEY ([Mgr_ssn]) REFERENCES [dbo].[EMPLOYEE] ([Ssn]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_Dependent_Essn]...';


GO
ALTER TABLE [dbo].[DEPENDENT]
    ADD CONSTRAINT [FK_Dependent_Essn] FOREIGN KEY ([Essn]) REFERENCES [dbo].[EMPLOYEE] ([Ssn]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_Dept_Location_Dnumber]...';


GO
ALTER TABLE [dbo].[DEPT_LOCATION]
    ADD CONSTRAINT [FK_Dept_Location_Dnumber] FOREIGN KEY ([Dnumber]) REFERENCES [dbo].[DEPARTMENT] ([Dnumber]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_Project_Dnum]...';


GO
ALTER TABLE [dbo].[PROJECT]
    ADD CONSTRAINT [FK_Project_Dnum] FOREIGN KEY ([Dnum]) REFERENCES [dbo].[DEPARTMENT] ([Dnumber]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_Works_On_Essn]...';


GO
ALTER TABLE [dbo].[WORKS_ON]
    ADD CONSTRAINT [FK_Works_On_Essn] FOREIGN KEY ([Essn]) REFERENCES [dbo].[EMPLOYEE] ([Ssn]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_Works_On_Number]...';


GO
ALTER TABLE [dbo].[WORKS_ON]
    ADD CONSTRAINT [FK_Works_On_Number] FOREIGN KEY ([Pno]) REFERENCES [dbo].[PROJECT] ([Pnumber]);


GO
PRINT N'Creating Procedure [dbo].[EMPLOYEE_CREATE]...';


GO
CREATE PROCEDURE [dbo].[EMPLOYEE_CREATE]
	@Fname VARCHAR(15) ,
	@Minit CHAR,
	@Lname VARCHAR(15),
	@Ssn CHAR(9) ,
	@Bdate DATE,
	@Address VARCHAR(30),
	@Sex CHAR,
	@Salary DECIMAL(10,2),
	@Super_ssn CHAR(9),
	@Dno INT 
AS
BEGIN
	INSERT INTO  [EMPLOYEE] (Fname, Minit, Lname, Ssn, Bdate, Address, Sex, Salary, Super_ssn, Dno)
	VALUES (@Fname, @Minit, @Lname, @Ssn,@Bdate,@Address, @Sex, @Salary, @Super_ssn, @Dno)
	END
GO
PRINT N'Creating Procedure [dbo].[EMPLOYEE_DELETE]...';


GO
CREATE PROCEDURE [dbo].[EMPLOYEE_DELETE]

	@Ssn CHAR(9) 

AS

BEGIN
DELETE FROM [EMPLOYEE] 
WHERE Ssn = @Ssn

	END
GO
PRINT N'Creating Procedure [dbo].[EMPLOYEE_READ]...';


GO
CREATE PROCEDURE [dbo].[EMPLOYEE_READ]
	@Find VARCHAR(15) 
AS
BEGIN
	SELECT * FROM   [EMPLOYEE] 
	WHERE Lname like @Find or Minit like @Find or Bdate like @Find  or  Ssn like @Find or Address like @Find or Sex like @Find or Salary like @Find or Super_ssn like @Find or Dno like @Find
	END
GO
PRINT N'Creating Procedure [dbo].[EMPLOYEE_UPDATE]...';


GO
CREATE PROCEDURE [dbo].[EMPLOYEE_UPDATE]
	@Fname VARCHAR(15) ,
	@Minit CHAR,
	@Lname VARCHAR(15),
	@Ssn CHAR(9) ,
	@Bdate DATE,
	@Address VARCHAR(30),
	@Sex CHAR,
	@Salary DECIMAL(10,2),
	@Super_ssn CHAR(9),
	@Dno INT 
AS
BEGIN 
UPDATE [EMPLOYEE]
	SET 
	Fname = @Fname,
	Minit = @Minit, 
	Lname= @Lname,
	Bdate = @Bdate,
	Address = @Address,
	Sex = @Sex,
	Salary = @Salary,
	Super_ssn = @Super_ssn,
	Dno = @Dno

	WHERE Ssn = @Ssn
END
GO
DECLARE @VarDecimalSupported AS BIT;

SELECT @VarDecimalSupported = 0;

IF ((ServerProperty(N'EngineEdition') = 3)
    AND (((@@microsoftversion / power(2, 24) = 9)
          AND (@@microsoftversion & 0xffff >= 3024))
         OR ((@@microsoftversion / power(2, 24) = 10)
             AND (@@microsoftversion & 0xffff >= 1600))))
    SELECT @VarDecimalSupported = 1;

IF (@VarDecimalSupported > 0)
    BEGIN
        EXECUTE sp_db_vardecimal_storage_format N'$(DatabaseName)', 'ON';
    END


GO
PRINT N'Update complete.';


GO
