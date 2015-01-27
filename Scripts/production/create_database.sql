USE [master];
GO

CREATE DATABASE [TfexMIS];
GO
    
ALTER DATABASE [TfexMIS] MODIFY FILE 
(NAME = N'TfexMIS' , SIZE = 3GB , MAXSIZE = UNLIMITED, FILEGROWTH = 1GB);
GO

ALTER DATABASE [TfexMIS] MODIFY FILE 
(NAME = N'TfexMIS_log' , SIZE = 1GB , MAXSIZE = 2GB , FILEGROWTH = 10%);
GO


IF NOT EXISTS 
    (SELECT name  
     FROM master.sys.server_principals
     WHERE name = 'test')
BEGIN
    CREATE LOGIN [test]
		WITH PASSWORD = N'test',
		CHECK_POLICY     = OFF,
		CHECK_EXPIRATION = OFF;
END

USE [TfexMIS];
GO

IF NOT EXISTS 
	(SELECT name
	FROM sys.database_principals 
	WHERE name = N'test')
BEGIN
    CREATE USER [test] FOR LOGIN [test] WITH DEFAULT_SCHEMA=[dbo];
    EXEC sp_addrolemember N'db_owner', N'test';
END;
GO


