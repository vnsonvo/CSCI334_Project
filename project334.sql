USE [master]
GO
/****** Object:  Database [project334]    Script Date: 11/16/2020 10:57:28 PM ******/
CREATE DATABASE [project334]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'project334', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\project334.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'project334_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\project334_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [project334] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [project334].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [project334] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [project334] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [project334] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [project334] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [project334] SET ARITHABORT OFF 
GO
ALTER DATABASE [project334] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [project334] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [project334] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [project334] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [project334] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [project334] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [project334] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [project334] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [project334] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [project334] SET  DISABLE_BROKER 
GO
ALTER DATABASE [project334] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [project334] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [project334] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [project334] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [project334] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [project334] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [project334] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [project334] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [project334] SET  MULTI_USER 
GO
ALTER DATABASE [project334] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [project334] SET DB_CHAINING OFF 
GO
ALTER DATABASE [project334] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [project334] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [project334] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [project334] SET QUERY_STORE = OFF
GO
USE [project334]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 11/16/2020 10:57:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[accountID] [int] IDENTITY(1,1) NOT NULL,
	[userName] [nvarchar](50) NOT NULL,
	[fullName] [nvarchar](100) NOT NULL,
	[resetKey] [nvarchar](5) NOT NULL,
	[password] [nvarchar](20) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[role] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[accountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HourSpent]    Script Date: 11/16/2020 10:57:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HourSpent](
	[hourSpentID] [int] IDENTITY(1,1) NOT NULL,
	[date] [date] NOT NULL,
	[workingHour] [int] NOT NULL,
	[requestID] [int] NOT NULL,
	[accountID] [int] NOT NULL,
 CONSTRAINT [PK_HourSpent] PRIMARY KEY CLUSTERED 
(
	[hourSpentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OverWorkingHour]    Script Date: 11/16/2020 10:57:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OverWorkingHour](
	[overTimeID] [int] IDENTITY(1,1) NOT NULL,
	[date] [date] NOT NULL,
	[overHour] [int] NOT NULL,
	[requestID] [int] NOT NULL,
	[accountID] [int] NOT NULL,
	[rate] [float] NOT NULL,
 CONSTRAINT [PK_OverWorkingHour] PRIMARY KEY CLUSTERED 
(
	[overTimeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Request]    Script Date: 11/16/2020 10:57:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Request](
	[requestID] [int] IDENTITY(1,1) NOT NULL,
	[issueName] [nvarchar](100) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[accountID] [int] NOT NULL,
	[personInCharge] [int] NULL,
	[requestDate] [date] NOT NULL,
	[assignedDate] [date] NULL,
	[completedDate] [date] NULL,
	[status] [nvarchar](50) NOT NULL,
	[feedBack] [int] NULL,
	[feedBackDescription] [nvarchar](max) NULL,
	[feedBackRating] [int] NULL,
 CONSTRAINT [PK_Request] PRIMARY KEY CLUSTERED 
(
	[requestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([accountID], [userName], [fullName], [resetKey], [password], [email], [role]) VALUES (1, N'Unassigned', N'Unassigned', N'12345', N'testing0!', N'Unassigned', N'IT Technician')
INSERT [dbo].[Account] ([accountID], [userName], [fullName], [resetKey], [password], [email], [role]) VALUES (2, N'ceoceo', N'John Cena', N'00000', N'ceoceo0!', N'ceo@gmail.com', N'CEO')
INSERT [dbo].[Account] ([accountID], [userName], [fullName], [resetKey], [password], [email], [role]) VALUES (3, N'manager', N'Elon Musk', N'77777', N'manager0!', N'manager@gmail.com', N'Project Manager')
INSERT [dbo].[Account] ([accountID], [userName], [fullName], [resetKey], [password], [email], [role]) VALUES (4, N'ittech01', N'Johny Depp', N'55555', N'ittech01!', N'ittech01@gmail.com', N'IT Technician')
INSERT [dbo].[Account] ([accountID], [userName], [fullName], [resetKey], [password], [email], [role]) VALUES (5, N'ittech02', N'Mark Henry', N'11111', N'ittech02!', N'ittech02@gmail.com', N'IT Technician')
INSERT [dbo].[Account] ([accountID], [userName], [fullName], [resetKey], [password], [email], [role]) VALUES (6, N'ittech03', N'Karim Benzema', N'12345', N'ittech03!', N'ittech03@gmail.com', N'IT Technician')
INSERT [dbo].[Account] ([accountID], [userName], [fullName], [resetKey], [password], [email], [role]) VALUES (7, N'client01', N'David Luiz', N'22222', N'client01!', N'client01@gmail.com', N'Client')
INSERT [dbo].[Account] ([accountID], [userName], [fullName], [resetKey], [password], [email], [role]) VALUES (8, N'client02', N'Green Granite', N'33333', N'client02!', N'client02@yahoo.com', N'Client')
INSERT [dbo].[Account] ([accountID], [userName], [fullName], [resetKey], [password], [email], [role]) VALUES (9, N'client03', N'Vikki Ruckman', N'44444', N'client03!', N'client03@yahoo.com', N'Client')
INSERT [dbo].[Account] ([accountID], [userName], [fullName], [resetKey], [password], [email], [role]) VALUES (10, N'client04', N'Peter Parker', N'99999', N'client04!', N'client04@gmail.com', N'Client')
INSERT [dbo].[Account] ([accountID], [userName], [fullName], [resetKey], [password], [email], [role]) VALUES (16, N'yikai', N'Lee Yi Kai', N'12345', N'yikai0!!', N'yikai@gmail.com', N'Client')
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[HourSpent] ON 

INSERT [dbo].[HourSpent] ([hourSpentID], [date], [workingHour], [requestID], [accountID]) VALUES (1, CAST(N'2020-11-04' AS Date), 4, 42, 6)
INSERT [dbo].[HourSpent] ([hourSpentID], [date], [workingHour], [requestID], [accountID]) VALUES (2, CAST(N'2020-11-05' AS Date), 5, 45, 6)
INSERT [dbo].[HourSpent] ([hourSpentID], [date], [workingHour], [requestID], [accountID]) VALUES (3, CAST(N'2020-11-05' AS Date), 7, 43, 5)
INSERT [dbo].[HourSpent] ([hourSpentID], [date], [workingHour], [requestID], [accountID]) VALUES (4, CAST(N'2020-11-06' AS Date), 6, 42, 6)
INSERT [dbo].[HourSpent] ([hourSpentID], [date], [workingHour], [requestID], [accountID]) VALUES (5, CAST(N'2020-11-04' AS Date), 5, 45, 6)
INSERT [dbo].[HourSpent] ([hourSpentID], [date], [workingHour], [requestID], [accountID]) VALUES (9, CAST(N'2020-11-01' AS Date), 4, 41, 5)
SET IDENTITY_INSERT [dbo].[HourSpent] OFF
GO
SET IDENTITY_INSERT [dbo].[OverWorkingHour] ON 

INSERT [dbo].[OverWorkingHour] ([overTimeID], [date], [overHour], [requestID], [accountID], [rate]) VALUES (1, CAST(N'2020-11-05' AS Date), 2, 42, 6, 20)
INSERT [dbo].[OverWorkingHour] ([overTimeID], [date], [overHour], [requestID], [accountID], [rate]) VALUES (2, CAST(N'2020-11-11' AS Date), 7, 43, 5, 20)
INSERT [dbo].[OverWorkingHour] ([overTimeID], [date], [overHour], [requestID], [accountID], [rate]) VALUES (3, CAST(N'2020-11-11' AS Date), 5, 43, 5, 20)
INSERT [dbo].[OverWorkingHour] ([overTimeID], [date], [overHour], [requestID], [accountID], [rate]) VALUES (4, CAST(N'2020-11-26' AS Date), 8, 42, 6, 20)
INSERT [dbo].[OverWorkingHour] ([overTimeID], [date], [overHour], [requestID], [accountID], [rate]) VALUES (5, CAST(N'2020-11-06' AS Date), 3, 45, 6, 20)
INSERT [dbo].[OverWorkingHour] ([overTimeID], [date], [overHour], [requestID], [accountID], [rate]) VALUES (6, CAST(N'2020-11-06' AS Date), 4, 43, 5, 20)
INSERT [dbo].[OverWorkingHour] ([overTimeID], [date], [overHour], [requestID], [accountID], [rate]) VALUES (7, CAST(N'2020-11-02' AS Date), 2, 42, 6, 20)
INSERT [dbo].[OverWorkingHour] ([overTimeID], [date], [overHour], [requestID], [accountID], [rate]) VALUES (8, CAST(N'2020-11-05' AS Date), 3, 42, 6, 20)
INSERT [dbo].[OverWorkingHour] ([overTimeID], [date], [overHour], [requestID], [accountID], [rate]) VALUES (9, CAST(N'2020-11-06' AS Date), 7, 45, 6, 20)
INSERT [dbo].[OverWorkingHour] ([overTimeID], [date], [overHour], [requestID], [accountID], [rate]) VALUES (10, CAST(N'2020-11-04' AS Date), 6, 42, 6, 20)
INSERT [dbo].[OverWorkingHour] ([overTimeID], [date], [overHour], [requestID], [accountID], [rate]) VALUES (11, CAST(N'2020-11-13' AS Date), 2, 41, 5, 20)
SET IDENTITY_INSERT [dbo].[OverWorkingHour] OFF
GO
SET IDENTITY_INSERT [dbo].[Request] ON 

INSERT [dbo].[Request] ([requestID], [issueName], [description], [accountID], [personInCharge], [requestDate], [assignedDate], [completedDate], [status], [feedBack], [feedBackDescription], [feedBackRating]) VALUES (39, N'Hardware Issue', N'The computer''s fan is about to stop running make my computer very hot.', 7, 5, CAST(N'2020-10-20' AS Date), CAST(N'2020-11-07' AS Date), CAST(N'2020-11-13' AS Date), N'Completed', 0, NULL, NULL)
INSERT [dbo].[Request] ([requestID], [issueName], [description], [accountID], [personInCharge], [requestDate], [assignedDate], [completedDate], [status], [feedBack], [feedBackDescription], [feedBackRating]) VALUES (40, N'Software Issue', N'Can''t open the application to perform accounting.', 7, 4, CAST(N'2020-10-26' AS Date), CAST(N'2020-11-13' AS Date), NULL, N'Processing', 0, NULL, NULL)
INSERT [dbo].[Request] ([requestID], [issueName], [description], [accountID], [personInCharge], [requestDate], [assignedDate], [completedDate], [status], [feedBack], [feedBackDescription], [feedBackRating]) VALUES (41, N'Security Issue', N'I can login my account to the software without typing correct password.', 7, 4, CAST(N'2020-10-24' AS Date), CAST(N'2020-11-13' AS Date), NULL, N'Processing', 0, NULL, NULL)
INSERT [dbo].[Request] ([requestID], [issueName], [description], [accountID], [personInCharge], [requestDate], [assignedDate], [completedDate], [status], [feedBack], [feedBackDescription], [feedBackRating]) VALUES (42, N'Software Has Problem', N'I can''t edit the my profile data', 7, 6, CAST(N'2020-10-30' AS Date), CAST(N'2020-11-01' AS Date), NULL, N'Processing', 0, NULL, NULL)
INSERT [dbo].[Request] ([requestID], [issueName], [description], [accountID], [personInCharge], [requestDate], [assignedDate], [completedDate], [status], [feedBack], [feedBackDescription], [feedBackRating]) VALUES (43, N'Mouse Issue', N'Mouse can''t be used in my PC, my children''s PC can use mouse normally', 7, 5, CAST(N'2020-10-30' AS Date), CAST(N'2020-10-24' AS Date), CAST(N'2020-11-04' AS Date), N'Completed', 0, NULL, NULL)
INSERT [dbo].[Request] ([requestID], [issueName], [description], [accountID], [personInCharge], [requestDate], [assignedDate], [completedDate], [status], [feedBack], [feedBackDescription], [feedBackRating]) VALUES (44, N'Speaker Issue', N'My laptop speaker has some problem, I can''t hear any sound even with maximum volume', 7, 1, CAST(N'2020-11-05' AS Date), NULL, NULL, N'Pending', 0, NULL, NULL)
INSERT [dbo].[Request] ([requestID], [issueName], [description], [accountID], [personInCharge], [requestDate], [assignedDate], [completedDate], [status], [feedBack], [feedBackDescription], [feedBackRating]) VALUES (45, N'Printer Connection', N'I can''t connect my printer to my PC through Wifi', 8, 6, CAST(N'2020-11-10' AS Date), CAST(N'2020-11-05' AS Date), NULL, N'Processing', 0, NULL, NULL)
INSERT [dbo].[Request] ([requestID], [issueName], [description], [accountID], [personInCharge], [requestDate], [assignedDate], [completedDate], [status], [feedBack], [feedBackDescription], [feedBackRating]) VALUES (46, N'Hardware Issue', N'The computer''s fan is about to stop running make my computer very hot.', 8, 1, CAST(N'2020-10-31' AS Date), NULL, NULL, N'Pending', 0, NULL, NULL)
INSERT [dbo].[Request] ([requestID], [issueName], [description], [accountID], [personInCharge], [requestDate], [assignedDate], [completedDate], [status], [feedBack], [feedBackDescription], [feedBackRating]) VALUES (47, N'Software Issue', N'Can''t open the application to perform accounting.', 8, 1, CAST(N'2020-11-05' AS Date), NULL, NULL, N'Pending', 0, NULL, NULL)
INSERT [dbo].[Request] ([requestID], [issueName], [description], [accountID], [personInCharge], [requestDate], [assignedDate], [completedDate], [status], [feedBack], [feedBackDescription], [feedBackRating]) VALUES (48, N'Security Issue', N'I can login my account to the software without typing correct password.', 8, 1, CAST(N'2020-11-06' AS Date), NULL, NULL, N'Pending', 0, NULL, NULL)
INSERT [dbo].[Request] ([requestID], [issueName], [description], [accountID], [personInCharge], [requestDate], [assignedDate], [completedDate], [status], [feedBack], [feedBackDescription], [feedBackRating]) VALUES (49, N'Software Has Problem', N'I can''t edit the my profile data', 8, 1, CAST(N'2020-11-04' AS Date), NULL, NULL, N'Pending', 0, NULL, NULL)
INSERT [dbo].[Request] ([requestID], [issueName], [description], [accountID], [personInCharge], [requestDate], [assignedDate], [completedDate], [status], [feedBack], [feedBackDescription], [feedBackRating]) VALUES (50, N'Mouse Issue', N'Mouse can''t be used in my PC, my children''s PC can use mouse normally', 8, 1, CAST(N'2020-11-02' AS Date), NULL, NULL, N'Pending', 0, NULL, NULL)
INSERT [dbo].[Request] ([requestID], [issueName], [description], [accountID], [personInCharge], [requestDate], [assignedDate], [completedDate], [status], [feedBack], [feedBackDescription], [feedBackRating]) VALUES (51, N'Speaker Issue', N'My laptop speaker has some problem, I can''t hear any sound even with maximum volume', 8, 1, CAST(N'2020-11-01' AS Date), NULL, NULL, N'Pending', 0, NULL, NULL)
INSERT [dbo].[Request] ([requestID], [issueName], [description], [accountID], [personInCharge], [requestDate], [assignedDate], [completedDate], [status], [feedBack], [feedBackDescription], [feedBackRating]) VALUES (52, N'Printer Connection', N'I can''t connect my printer to my PC through Wifi', 8, 1, CAST(N'2020-10-31' AS Date), NULL, NULL, N'Pending', 0, NULL, NULL)
INSERT [dbo].[Request] ([requestID], [issueName], [description], [accountID], [personInCharge], [requestDate], [assignedDate], [completedDate], [status], [feedBack], [feedBackDescription], [feedBackRating]) VALUES (63, N'Mouse Connection', N'I can''t use my mouse', 7, 1, CAST(N'2020-11-08' AS Date), NULL, NULL, N'Pending', 0, NULL, NULL)
INSERT [dbo].[Request] ([requestID], [issueName], [description], [accountID], [personInCharge], [requestDate], [assignedDate], [completedDate], [status], [feedBack], [feedBackDescription], [feedBackRating]) VALUES (66, N'Mouse Issue', N'I cant use my mouse.', 8, 6, CAST(N'2020-11-13' AS Date), CAST(N'2020-11-13' AS Date), NULL, N'Processing', 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Request] OFF
GO
ALTER TABLE [dbo].[HourSpent]  WITH CHECK ADD  CONSTRAINT [FK_HourSpent_Account] FOREIGN KEY([accountID])
REFERENCES [dbo].[Account] ([accountID])
GO
ALTER TABLE [dbo].[HourSpent] CHECK CONSTRAINT [FK_HourSpent_Account]
GO
ALTER TABLE [dbo].[HourSpent]  WITH CHECK ADD  CONSTRAINT [FK_HourSpent_Request] FOREIGN KEY([requestID])
REFERENCES [dbo].[Request] ([requestID])
GO
ALTER TABLE [dbo].[HourSpent] CHECK CONSTRAINT [FK_HourSpent_Request]
GO
ALTER TABLE [dbo].[OverWorkingHour]  WITH CHECK ADD  CONSTRAINT [FK_OverWorkingHour_Account] FOREIGN KEY([accountID])
REFERENCES [dbo].[Account] ([accountID])
GO
ALTER TABLE [dbo].[OverWorkingHour] CHECK CONSTRAINT [FK_OverWorkingHour_Account]
GO
ALTER TABLE [dbo].[OverWorkingHour]  WITH CHECK ADD  CONSTRAINT [FK_OverWorkingHour_Request] FOREIGN KEY([requestID])
REFERENCES [dbo].[Request] ([requestID])
GO
ALTER TABLE [dbo].[OverWorkingHour] CHECK CONSTRAINT [FK_OverWorkingHour_Request]
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Request_Account] FOREIGN KEY([accountID])
REFERENCES [dbo].[Account] ([accountID])
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FK_Request_Account]
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Request_Account1] FOREIGN KEY([personInCharge])
REFERENCES [dbo].[Account] ([accountID])
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FK_Request_Account1]
GO
USE [master]
GO
ALTER DATABASE [project334] SET  READ_WRITE 
GO
