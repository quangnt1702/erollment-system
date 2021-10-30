USE [master]
GO
/****** Object:  Database [EnrollmentSystem]    Script Date: 10/30/2021 10:44:59 PM ******/
CREATE DATABASE [EnrollmentSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EnrollmentSystem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\EnrollmentSystem.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EnrollmentSystem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\EnrollmentSystem_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [EnrollmentSystem] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EnrollmentSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EnrollmentSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EnrollmentSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EnrollmentSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EnrollmentSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EnrollmentSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [EnrollmentSystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EnrollmentSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EnrollmentSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EnrollmentSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EnrollmentSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EnrollmentSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EnrollmentSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EnrollmentSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EnrollmentSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EnrollmentSystem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EnrollmentSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EnrollmentSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EnrollmentSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EnrollmentSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EnrollmentSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EnrollmentSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EnrollmentSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EnrollmentSystem] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EnrollmentSystem] SET  MULTI_USER 
GO
ALTER DATABASE [EnrollmentSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EnrollmentSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EnrollmentSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EnrollmentSystem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EnrollmentSystem] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EnrollmentSystem] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [EnrollmentSystem] SET QUERY_STORE = OFF
GO
USE [EnrollmentSystem]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 10/30/2021 10:44:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[courseID] [int] IDENTITY(1,1) NOT NULL,
	[courseName] [nvarchar](50) NOT NULL,
	[subjectID] [int] NOT NULL,
	[lecturerID] [varchar](50) NOT NULL,
	[studentQuantity] [int] NULL,
	[startDate] [date] NOT NULL,
	[endDate] [date] NOT NULL,
	[statusID] [int] NOT NULL,
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[courseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedbacks]    Script Date: 10/30/2021 10:44:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedbacks](
	[feedbackID] [int] IDENTITY(1,1) NOT NULL,
	[courseID] [int] NOT NULL,
	[studentID] [varchar](50) NOT NULL,
	[feedbackContent] [nvarchar](max) NULL,
 CONSTRAINT [PK_Feedbacks] PRIMARY KEY CLUSTERED 
(
	[feedbackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Grades]    Script Date: 10/30/2021 10:44:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grades](
	[gradeID] [int] IDENTITY(1,1) NOT NULL,
	[courseID] [int] NOT NULL,
	[studentID] [varchar](50) NOT NULL,
	[progressTest] [float] NULL,
	[midTermTest] [float] NULL,
	[practicalTest] [float] NULL,
	[finalTest] [float] NULL,
 CONSTRAINT [PK_Grades] PRIMARY KEY CLUSTERED 
(
	[gradeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 10/30/2021 10:44:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[roleID] [int] NOT NULL,
	[roleName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StatusCourses]    Script Date: 10/30/2021 10:44:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatusCourses](
	[statusID] [int] NOT NULL,
	[statusName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_StatusCourses] PRIMARY KEY CLUSTERED 
(
	[statusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StatusUsers]    Script Date: 10/30/2021 10:44:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatusUsers](
	[statusID] [int] NOT NULL,
	[statusName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_StatusUsers] PRIMARY KEY CLUSTERED 
(
	[statusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 10/30/2021 10:44:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[subjectID] [int] IDENTITY(1,1) NOT NULL,
	[subjectName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Subject] PRIMARY KEY CLUSTERED 
(
	[subjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 10/30/2021 10:44:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[userID] [varchar](50) NOT NULL,
	[userName] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[phone] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[roleID] [int] NOT NULL,
	[statusID] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Courses] ON 

INSERT [dbo].[Courses] ([courseID], [courseName], [subjectID], [lecturerID], [studentQuantity], [startDate], [endDate], [statusID]) VALUES (1, N'Accounting principles', 1, N'lecturer1', 20, CAST(N'2021-10-01' AS Date), CAST(N'2021-10-31' AS Date), 1)
INSERT [dbo].[Courses] ([courseID], [courseName], [subjectID], [lecturerID], [studentQuantity], [startDate], [endDate], [statusID]) VALUES (2, N'Business Strategy', 1, N'lecturer2', 30, CAST(N'2021-11-01' AS Date), CAST(N'2021-11-30' AS Date), 3)
INSERT [dbo].[Courses] ([courseID], [courseName], [subjectID], [lecturerID], [studentQuantity], [startDate], [endDate], [statusID]) VALUES (3, N'Introduction to programming', 3, N'lecturer2', 10, CAST(N'2021-09-01' AS Date), CAST(N'2021-09-30' AS Date), 2)
SET IDENTITY_INSERT [dbo].[Courses] OFF
GO
SET IDENTITY_INSERT [dbo].[Feedbacks] ON 

INSERT [dbo].[Feedbacks] ([feedbackID], [courseID], [studentID], [feedbackContent]) VALUES (1, 1, N'student1', N'Nice')
INSERT [dbo].[Feedbacks] ([feedbackID], [courseID], [studentID], [feedbackContent]) VALUES (2, 3, N'student2', N'I love it')
SET IDENTITY_INSERT [dbo].[Feedbacks] OFF
GO
SET IDENTITY_INSERT [dbo].[Grades] ON 

INSERT [dbo].[Grades] ([gradeID], [courseID], [studentID], [progressTest], [midTermTest], [practicalTest], [finalTest]) VALUES (1, 1, N'student1', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Grades] OFF
GO
INSERT [dbo].[Roles] ([roleID], [roleName]) VALUES (1, N'Admin')
INSERT [dbo].[Roles] ([roleID], [roleName]) VALUES (2, N'Lecturer')
INSERT [dbo].[Roles] ([roleID], [roleName]) VALUES (3, N'Student')
GO
INSERT [dbo].[StatusCourses] ([statusID], [statusName]) VALUES (1, N'Start')
INSERT [dbo].[StatusCourses] ([statusID], [statusName]) VALUES (2, N'End')
INSERT [dbo].[StatusCourses] ([statusID], [statusName]) VALUES (3, N'Waiting')
GO
INSERT [dbo].[StatusUsers] ([statusID], [statusName]) VALUES (1, N'Approve')
INSERT [dbo].[StatusUsers] ([statusID], [statusName]) VALUES (2, N'Ban')
GO
SET IDENTITY_INSERT [dbo].[Subject] ON 

INSERT [dbo].[Subject] ([subjectID], [subjectName]) VALUES (1, N'Accounting')
INSERT [dbo].[Subject] ([subjectID], [subjectName]) VALUES (2, N'Biomedical Engineering')
INSERT [dbo].[Subject] ([subjectID], [subjectName]) VALUES (3, N'Technology')
INSERT [dbo].[Subject] ([subjectID], [subjectName]) VALUES (4, N'Business English')
INSERT [dbo].[Subject] ([subjectID], [subjectName]) VALUES (5, N'	Economics')
SET IDENTITY_INSERT [dbo].[Subject] OFF
GO
INSERT [dbo].[Users] ([userID], [userName], [password], [phone], [email], [roleID], [statusID]) VALUES (N'admin', N'Admin', N'123', N'000', N'admin@gmail.com', 1, 1)
INSERT [dbo].[Users] ([userID], [userName], [password], [phone], [email], [roleID], [statusID]) VALUES (N'lecturer1', N'Lecturer', N'123', N'000', N'lecturer@gmail.com', 2, 1)
INSERT [dbo].[Users] ([userID], [userName], [password], [phone], [email], [roleID], [statusID]) VALUES (N'lecturer2', N'Lecturer 2', N'123', N'000', N'lecturer2@gmail.com', 2, 1)
INSERT [dbo].[Users] ([userID], [userName], [password], [phone], [email], [roleID], [statusID]) VALUES (N'student1', N'Student 1', N'123', N'000', N'student1@gmail.com', 3, 1)
INSERT [dbo].[Users] ([userID], [userName], [password], [phone], [email], [roleID], [statusID]) VALUES (N'student2', N'Student 2', N'123', N'000', N'student2@gmail.com', 3, 1)
GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [FK_Courses_StatusCourses] FOREIGN KEY([statusID])
REFERENCES [dbo].[StatusCourses] ([statusID])
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [FK_Courses_StatusCourses]
GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [FK_Courses_Subject] FOREIGN KEY([subjectID])
REFERENCES [dbo].[Subject] ([subjectID])
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [FK_Courses_Subject]
GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [FK_Courses_Users] FOREIGN KEY([lecturerID])
REFERENCES [dbo].[Users] ([userID])
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [FK_Courses_Users]
GO
ALTER TABLE [dbo].[Feedbacks]  WITH CHECK ADD  CONSTRAINT [FK_Feedbacks_Courses] FOREIGN KEY([courseID])
REFERENCES [dbo].[Courses] ([courseID])
GO
ALTER TABLE [dbo].[Feedbacks] CHECK CONSTRAINT [FK_Feedbacks_Courses]
GO
ALTER TABLE [dbo].[Feedbacks]  WITH CHECK ADD  CONSTRAINT [FK_Feedbacks_Users] FOREIGN KEY([studentID])
REFERENCES [dbo].[Users] ([userID])
GO
ALTER TABLE [dbo].[Feedbacks] CHECK CONSTRAINT [FK_Feedbacks_Users]
GO
ALTER TABLE [dbo].[Grades]  WITH CHECK ADD  CONSTRAINT [FK_Grades_Courses] FOREIGN KEY([courseID])
REFERENCES [dbo].[Courses] ([courseID])
GO
ALTER TABLE [dbo].[Grades] CHECK CONSTRAINT [FK_Grades_Courses]
GO
ALTER TABLE [dbo].[Grades]  WITH CHECK ADD  CONSTRAINT [FK_Grades_Users] FOREIGN KEY([studentID])
REFERENCES [dbo].[Users] ([userID])
GO
ALTER TABLE [dbo].[Grades] CHECK CONSTRAINT [FK_Grades_Users]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([roleID])
REFERENCES [dbo].[Roles] ([roleID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_StatusUsers] FOREIGN KEY([statusID])
REFERENCES [dbo].[StatusUsers] ([statusID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_StatusUsers]
GO
USE [master]
GO
ALTER DATABASE [EnrollmentSystem] SET  READ_WRITE 
GO
