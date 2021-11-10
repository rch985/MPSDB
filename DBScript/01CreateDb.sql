-- **************************************************************************************************
-- File Name	: 01CreateDb.sql
-- Function		: �������ݿ�
-- Notes		: Need modify database filename and path before excute this script. 
-- CreateDate	: 2021-1-18
-- Creator		: 
-- Modify		:
--
-- **************************************************************************************************
USE [master]
GO

IF(EXISTS(SELECT name FROM master.dbo.sysdatabases WHERE name = 'MPS'))
BEGIN
	DROP DATABASE MPS
END
GO

CREATE DATABASE MPS
ON PRIMARY
(
	NAME = N'MPS_MDF',
	FILENAME = N'D:\WorkFile\03WorkProject\MPS\DB\DBFiles\MPS.MDF',
	SIZE = 5MB,
	MAXSIZE = 1024MB,
	FILEGROWTH = 1%
)
LOG ON
(
	NAME = N'MPS_LDF',
	FILENAME = N'D:\WorkFile\03WorkProject\MPS\DB\DBFiles\MPS.LDF',
	SIZE = 5MB,
	MAXSIZE = 1024MB,
	FILEGROWTH = 1%
)
GO

EXEC dbo.sp_dbcmptlevel @dbname = N'MPS', @new_cmptlevel = 100
GO

IF(1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
BEGIN
	EXEC [MPS].[dbo].[sp_fulltext_database] @action = 'enable'
END
GO

ALTER DATABASE [MPS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MPS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MPS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MPS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MPS] SET ARITHABORT OFF 
GO
ALTER DATABASE [MPS] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [MPS] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [MPS] SET AUTO_SHRINK ON 
GO
ALTER DATABASE [MPS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MPS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MPS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MPS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MPS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MPS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MPS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MPS] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MPS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MPS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MPS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MPS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MPS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MPS] SET  READ_WRITE 
GO
ALTER DATABASE [MPS] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MPS] SET  MULTI_USER 
GO
ALTER DATABASE [MPS] SET PAGE_VERIFY TORN_PAGE_DETECTION  
GO
ALTER DATABASE [MPS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MPS] COLLATE chinese_prc_ci_as 
GO
