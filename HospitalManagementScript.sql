USE [master]
GO
/****** Object:  Database [HospitalManagement]    Script Date: 4/28/2020 9:05:53 AM ******/
CREATE DATABASE [HospitalManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HospitalManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\HospitalManagement.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HospitalManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\HospitalManagement_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [HospitalManagement] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HospitalManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HospitalManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HospitalManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HospitalManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HospitalManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HospitalManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [HospitalManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HospitalManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HospitalManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HospitalManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HospitalManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HospitalManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HospitalManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HospitalManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HospitalManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HospitalManagement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HospitalManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HospitalManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HospitalManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HospitalManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HospitalManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HospitalManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HospitalManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HospitalManagement] SET RECOVERY FULL 
GO
ALTER DATABASE [HospitalManagement] SET  MULTI_USER 
GO
ALTER DATABASE [HospitalManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HospitalManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HospitalManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HospitalManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HospitalManagement] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'HospitalManagement', N'ON'
GO
ALTER DATABASE [HospitalManagement] SET QUERY_STORE = OFF
GO
USE [HospitalManagement]
GO
/****** Object:  Table [dbo].[Beds]    Script Date: 4/28/2020 9:05:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Beds](
	[BedID] [int] IDENTITY(1,1) NOT NULL,
	[PatientID] [int] NOT NULL,
	[AllocationDateTime] [datetimeoffset](7) NOT NULL,
	[DateTimeOfDischarge] [datetimeoffset](7) NOT NULL,
 CONSTRAINT [PK_Beds] PRIMARY KEY CLUSTERED 
(
	[BedID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 4/28/2020 9:05:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[DepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [varchar](50) NOT NULL,
	[DepartmentLocation] [varchar](200) NOT NULL,
	[DoctorID] [int] NOT NULL,
	[PatientID] [int] NOT NULL,
	[HealthCareAssistantID] [int] NOT NULL,
	[DepartmentType] [varchar](50) NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doctors]    Script Date: 4/28/2020 9:05:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctors](
	[DoctorID] [int] IDENTITY(1,1) NOT NULL,
	[DoctorName] [varchar](50) NOT NULL,
	[DoctorMobile] [varchar](20) NOT NULL,
	[DoctorEmail] [varchar](50) NOT NULL,
	[DoctorSpeciality] [varchar](50) NULL,
	[DepartmentID] [int] NULL,
 CONSTRAINT [PK_Doctors] PRIMARY KEY CLUSTERED 
(
	[DoctorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HealthCareAssistants]    Script Date: 4/28/2020 9:05:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HealthCareAssistants](
	[HealthCareAssistantID] [int] IDENTITY(1,1) NOT NULL,
	[AssistantName] [varchar](50) NOT NULL,
	[AssistantMobile] [varchar](50) NOT NULL,
	[AssistantAddress] [varchar](200) NOT NULL,
	[DepartmentID] [int] NULL,
	[DoctorID] [int] NULL,
 CONSTRAINT [PK_HealthCareAssistants] PRIMARY KEY CLUSTERED 
(
	[HealthCareAssistantID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicines]    Script Date: 4/28/2020 9:05:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicines](
	[MedicineID] [int] IDENTITY(1,1) NOT NULL,
	[MedicineName] [varchar](50) NOT NULL,
	[MedicineType] [varchar](50) NOT NULL,
	[MedicineDescription] [varchar](200) NOT NULL,
	[PatientID] [int] NULL,
	[MedicineApplyTime] [timestamp] NULL,
 CONSTRAINT [PK_Medicines] PRIMARY KEY CLUSTERED 
(
	[MedicineID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patients]    Script Date: 4/28/2020 9:05:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patients](
	[PatientID] [int] IDENTITY(1,1) NOT NULL,
	[PatientName] [varchar](50) NOT NULL,
	[PatientMobile] [varchar](50) NOT NULL,
	[PatientAddress] [varchar](200) NOT NULL,
	[PatientEmail] [varchar](50) NULL,
	[PatientSymptoms] [varchar](500) NOT NULL,
	[PatientAge] [smallint] NULL,
	[PatientAdmittedDate] [datetimeoffset](7) NULL,
	[PatientDischargeDate] [datetimeoffset](7) NULL,
	[PatientGender] [varchar](10) NULL,
	[DepartmentID] [int] NULL,
	[DoctorID] [int] NULL,
	[BedID] [int] NULL,
 CONSTRAINT [PK_Patients] PRIMARY KEY CLUSTERED 
(
	[PatientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Beds]  WITH CHECK ADD  CONSTRAINT [FK_Beds_Patients] FOREIGN KEY([PatientID])
REFERENCES [dbo].[Patients] ([PatientID])
GO
ALTER TABLE [dbo].[Beds] CHECK CONSTRAINT [FK_Beds_Patients]
GO
ALTER TABLE [dbo].[Departments]  WITH CHECK ADD  CONSTRAINT [FK_Departments_Doctors] FOREIGN KEY([DoctorID])
REFERENCES [dbo].[Doctors] ([DoctorID])
GO
ALTER TABLE [dbo].[Departments] CHECK CONSTRAINT [FK_Departments_Doctors]
GO
ALTER TABLE [dbo].[Departments]  WITH CHECK ADD  CONSTRAINT [FK_Departments_HealthCareAssistants] FOREIGN KEY([HealthCareAssistantID])
REFERENCES [dbo].[HealthCareAssistants] ([HealthCareAssistantID])
GO
ALTER TABLE [dbo].[Departments] CHECK CONSTRAINT [FK_Departments_HealthCareAssistants]
GO
ALTER TABLE [dbo].[Departments]  WITH CHECK ADD  CONSTRAINT [FK_Departments_Patients] FOREIGN KEY([PatientID])
REFERENCES [dbo].[Patients] ([PatientID])
GO
ALTER TABLE [dbo].[Departments] CHECK CONSTRAINT [FK_Departments_Patients]
GO
ALTER TABLE [dbo].[Doctors]  WITH CHECK ADD  CONSTRAINT [FK_Doctors_Departments] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Departments] ([DepartmentID])
GO
ALTER TABLE [dbo].[Doctors] CHECK CONSTRAINT [FK_Doctors_Departments]
GO
ALTER TABLE [dbo].[HealthCareAssistants]  WITH CHECK ADD  CONSTRAINT [FK_HealthCareAssistants_Departments] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Departments] ([DepartmentID])
GO
ALTER TABLE [dbo].[HealthCareAssistants] CHECK CONSTRAINT [FK_HealthCareAssistants_Departments]
GO
ALTER TABLE [dbo].[HealthCareAssistants]  WITH CHECK ADD  CONSTRAINT [FK_HealthCareAssistants_Doctors] FOREIGN KEY([DoctorID])
REFERENCES [dbo].[Doctors] ([DoctorID])
GO
ALTER TABLE [dbo].[HealthCareAssistants] CHECK CONSTRAINT [FK_HealthCareAssistants_Doctors]
GO
ALTER TABLE [dbo].[Medicines]  WITH CHECK ADD  CONSTRAINT [FK_Medicines_Patients] FOREIGN KEY([PatientID])
REFERENCES [dbo].[Patients] ([PatientID])
GO
ALTER TABLE [dbo].[Medicines] CHECK CONSTRAINT [FK_Medicines_Patients]
GO
ALTER TABLE [dbo].[Patients]  WITH CHECK ADD  CONSTRAINT [FK_Patients_Beds] FOREIGN KEY([BedID])
REFERENCES [dbo].[Beds] ([BedID])
GO
ALTER TABLE [dbo].[Patients] CHECK CONSTRAINT [FK_Patients_Beds]
GO
ALTER TABLE [dbo].[Patients]  WITH CHECK ADD  CONSTRAINT [FK_Patients_Departments] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Departments] ([DepartmentID])
GO
ALTER TABLE [dbo].[Patients] CHECK CONSTRAINT [FK_Patients_Departments]
GO
ALTER TABLE [dbo].[Patients]  WITH CHECK ADD  CONSTRAINT [FK_Patients_Doctors] FOREIGN KEY([DoctorID])
REFERENCES [dbo].[Doctors] ([DoctorID])
GO
ALTER TABLE [dbo].[Patients] CHECK CONSTRAINT [FK_Patients_Doctors]
GO
USE [master]
GO
ALTER DATABASE [HospitalManagement] SET  READ_WRITE 
GO
