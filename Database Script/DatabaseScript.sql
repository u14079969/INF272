USE [master]
GO
/****** Object:  Database [DBDonationSystem]    Script Date: 2019/10/10 22:31:53 ******/
CREATE DATABASE [DBDonationSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBDonationSystem', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\DBDonationSystem.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DBDonationSystem_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\DBDonationSystem_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DBDonationSystem] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBDonationSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBDonationSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBDonationSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBDonationSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBDonationSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBDonationSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBDonationSystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DBDonationSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBDonationSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBDonationSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBDonationSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBDonationSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBDonationSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBDonationSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBDonationSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBDonationSystem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DBDonationSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBDonationSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBDonationSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBDonationSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBDonationSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBDonationSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBDonationSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBDonationSystem] SET RECOVERY FULL 
GO
ALTER DATABASE [DBDonationSystem] SET  MULTI_USER 
GO
ALTER DATABASE [DBDonationSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBDonationSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBDonationSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBDonationSystem] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [DBDonationSystem] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DBDonationSystem', N'ON'
GO
USE [DBDonationSystem]
GO
/****** Object:  Table [dbo].[Clothes]    Script Date: 2019/10/10 22:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Clothes](
	[ItemID] [int] NOT NULL,
	[GenderID] [int] NOT NULL,
	[Description] [varchar](100) NOT NULL,
	[Size] [int] NOT NULL,
 CONSTRAINT [PK_Clothes] PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Donation]    Script Date: 2019/10/10 22:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Donation](
	[DonationID] [int] NOT NULL,
	[DonationType] [varchar](50) NOT NULL,
	[Units] [int] NOT NULL,
	[DonationDate] [datetime] NOT NULL,
	[DonorID] [int] NOT NULL,
	[ItemID] [int] NOT NULL,
 CONSTRAINT [PK_Donation] PRIMARY KEY CLUSTERED 
(
	[DonationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DonationItem]    Script Date: 2019/10/10 22:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonationItem](
	[ItemID] [int] NOT NULL,
	[TypeID] [int] NOT NULL,
	[DonationID] [int] NOT NULL,
	[DonorID] [int] NOT NULL,
	[RecipientID] [int] NOT NULL,
	[ReqID] [int] NOT NULL,
 CONSTRAINT [PK_DonationItem] PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Donor]    Script Date: 2019/10/10 22:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Donor](
	[DonorID] [int] NOT NULL,
	[PersonID] [int] NOT NULL,
 CONSTRAINT [PK_Donor] PRIMARY KEY CLUSTERED 
(
	[DonorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Food]    Script Date: 2019/10/10 22:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Food](
	[ItemID] [int] NOT NULL,
	[Description] [varchar](100) NOT NULL,
	[BestBeforeDate] [date] NOT NULL,
 CONSTRAINT [PK_Food] PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Furniture]    Script Date: 2019/10/10 22:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Furniture](
	[ItemID] [int] NOT NULL,
	[Description] [varchar](100) NOT NULL,
	[Model] [varchar](50) NOT NULL,
	[Material] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Furniture] PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 2019/10/10 22:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gender](
	[GenderID] [int] NOT NULL,
	[GenderType] [varchar](6) NOT NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[GenderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ItemType]    Script Date: 2019/10/10 22:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemType](
	[TypeID] [int] NOT NULL,
	[ItemID] [int] NOT NULL,
	[Units] [int] NOT NULL,
 CONSTRAINT [PK_ItemType] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC,
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Organisation]    Script Date: 2019/10/10 22:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Organisation](
	[OrganisationID] [int] NOT NULL,
	[OrganisationName] [varchar](100) NOT NULL,
	[OrganisationAddress] [varchar](150) NOT NULL,
	[OrganisationEmail] [varchar](50) NOT NULL,
	[OrganisationPhone] [varchar](30) NOT NULL,
	[Points] [int] NULL,
	[ReqID] [int] NULL,
	[RecipientID] [int] NULL,
 CONSTRAINT [PK_Organisation] PRIMARY KEY CLUSTERED 
(
	[OrganisationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Person]    Script Date: 2019/10/10 22:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Person](
	[PersonID] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Surname] [varchar](50) NOT NULL,
	[PhoneNumber] [varchar](50) NOT NULL,
	[GenderID] [int] NOT NULL,
	[RecipientID] [int] NULL,
	[ReqID] [int] NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Recipient]    Script Date: 2019/10/10 22:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recipient](
	[RecipientID] [int] NOT NULL,
	[PersonID] [int] NOT NULL,
	[ReceivedDate] [datetime] NOT NULL,
	[PointLess] [int] NOT NULL,
 CONSTRAINT [PK_Recipient] PRIMARY KEY CLUSTERED 
(
	[RecipientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RequestInfo]    Script Date: 2019/10/10 22:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RequestInfo](
	[ReqID] [int] NOT NULL,
	[ReqItem] [varchar](20) NOT NULL,
	[OrganisationID] [int] NOT NULL,
	[PersonID] [int] NOT NULL,
	[StatusID] [int] NOT NULL,
 CONSTRAINT [PK_RequestInfo] PRIMARY KEY CLUSTERED 
(
	[ReqID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RequestItem]    Script Date: 2019/10/10 22:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RequestItem](
	[ReqID] [int] NOT NULL,
	[TypeID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_RequestItem] PRIMARY KEY CLUSTERED 
(
	[ReqID] ASC,
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RequestStatus]    Script Date: 2019/10/10 22:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RequestStatus](
	[StatusID] [int] NOT NULL,
	[StatusDescription] [varchar](20) NOT NULL,
 CONSTRAINT [PK_RequestStatus] PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Shoes]    Script Date: 2019/10/10 22:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Shoes](
	[ItemID] [int] NOT NULL,
	[GenderID] [int] NOT NULL,
	[Description] [varchar](100) NOT NULL,
	[Size] [int] NOT NULL,
 CONSTRAINT [PK_Shoes] PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Toiletries]    Script Date: 2019/10/10 22:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Toiletries](
	[ItemID] [int] NOT NULL,
	[GenderID] [int] NOT NULL,
	[Description] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Toiletries] PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Clothes]  WITH CHECK ADD  CONSTRAINT [FK_Clothes_Gender] FOREIGN KEY([GenderID])
REFERENCES [dbo].[Gender] ([GenderID])
GO
ALTER TABLE [dbo].[Clothes] CHECK CONSTRAINT [FK_Clothes_Gender]
GO
ALTER TABLE [dbo].[Donation]  WITH CHECK ADD  CONSTRAINT [FK_Donation_DonationItem] FOREIGN KEY([ItemID])
REFERENCES [dbo].[DonationItem] ([ItemID])
GO
ALTER TABLE [dbo].[Donation] CHECK CONSTRAINT [FK_Donation_DonationItem]
GO
ALTER TABLE [dbo].[Donation]  WITH CHECK ADD  CONSTRAINT [FK_Donation_Donor] FOREIGN KEY([DonorID])
REFERENCES [dbo].[Donor] ([DonorID])
GO
ALTER TABLE [dbo].[Donation] CHECK CONSTRAINT [FK_Donation_Donor]
GO
ALTER TABLE [dbo].[DonationItem]  WITH CHECK ADD  CONSTRAINT [FK_DonationItem_Donor] FOREIGN KEY([DonorID])
REFERENCES [dbo].[Donor] ([DonorID])
GO
ALTER TABLE [dbo].[DonationItem] CHECK CONSTRAINT [FK_DonationItem_Donor]
GO
ALTER TABLE [dbo].[DonationItem]  WITH CHECK ADD  CONSTRAINT [FK_DonationItem_Recipient] FOREIGN KEY([RecipientID])
REFERENCES [dbo].[Recipient] ([RecipientID])
GO
ALTER TABLE [dbo].[DonationItem] CHECK CONSTRAINT [FK_DonationItem_Recipient]
GO
ALTER TABLE [dbo].[DonationItem]  WITH CHECK ADD  CONSTRAINT [FK_DonationItem_RequestInfo] FOREIGN KEY([ReqID])
REFERENCES [dbo].[RequestInfo] ([ReqID])
GO
ALTER TABLE [dbo].[DonationItem] CHECK CONSTRAINT [FK_DonationItem_RequestInfo]
GO
ALTER TABLE [dbo].[Donor]  WITH CHECK ADD  CONSTRAINT [FK_Donor_Person] FOREIGN KEY([PersonID])
REFERENCES [dbo].[Person] ([PersonID])
GO
ALTER TABLE [dbo].[Donor] CHECK CONSTRAINT [FK_Donor_Person]
GO
ALTER TABLE [dbo].[Food]  WITH CHECK ADD  CONSTRAINT [FK_Food_DonationItem] FOREIGN KEY([ItemID])
REFERENCES [dbo].[DonationItem] ([ItemID])
GO
ALTER TABLE [dbo].[Food] CHECK CONSTRAINT [FK_Food_DonationItem]
GO
ALTER TABLE [dbo].[Furniture]  WITH CHECK ADD  CONSTRAINT [FK_Furniture_DonationItem] FOREIGN KEY([ItemID])
REFERENCES [dbo].[DonationItem] ([ItemID])
GO
ALTER TABLE [dbo].[Furniture] CHECK CONSTRAINT [FK_Furniture_DonationItem]
GO
ALTER TABLE [dbo].[ItemType]  WITH CHECK ADD  CONSTRAINT [FK_ItemType_DonationItem] FOREIGN KEY([ItemID])
REFERENCES [dbo].[DonationItem] ([ItemID])
GO
ALTER TABLE [dbo].[ItemType] CHECK CONSTRAINT [FK_ItemType_DonationItem]
GO
ALTER TABLE [dbo].[Organisation]  WITH CHECK ADD  CONSTRAINT [FK_Organisation_Recipient] FOREIGN KEY([RecipientID])
REFERENCES [dbo].[Recipient] ([RecipientID])
GO
ALTER TABLE [dbo].[Organisation] CHECK CONSTRAINT [FK_Organisation_Recipient]
GO
ALTER TABLE [dbo].[Organisation]  WITH CHECK ADD  CONSTRAINT [FK_Organisation_RequestInfo] FOREIGN KEY([ReqID])
REFERENCES [dbo].[RequestInfo] ([ReqID])
GO
ALTER TABLE [dbo].[Organisation] CHECK CONSTRAINT [FK_Organisation_RequestInfo]
GO
ALTER TABLE [dbo].[Person]  WITH CHECK ADD  CONSTRAINT [FK_Person_Gender] FOREIGN KEY([GenderID])
REFERENCES [dbo].[Gender] ([GenderID])
GO
ALTER TABLE [dbo].[Person] CHECK CONSTRAINT [FK_Person_Gender]
GO
ALTER TABLE [dbo].[Person]  WITH CHECK ADD  CONSTRAINT [FK_Person_RequestInfo] FOREIGN KEY([ReqID])
REFERENCES [dbo].[RequestInfo] ([ReqID])
GO
ALTER TABLE [dbo].[Person] CHECK CONSTRAINT [FK_Person_RequestInfo]
GO
ALTER TABLE [dbo].[Recipient]  WITH CHECK ADD  CONSTRAINT [FK_Recipient_Person] FOREIGN KEY([PersonID])
REFERENCES [dbo].[Person] ([PersonID])
GO
ALTER TABLE [dbo].[Recipient] CHECK CONSTRAINT [FK_Recipient_Person]
GO
ALTER TABLE [dbo].[RequestInfo]  WITH CHECK ADD  CONSTRAINT [FK_RequestInfo_Organisation] FOREIGN KEY([OrganisationID])
REFERENCES [dbo].[Organisation] ([OrganisationID])
GO
ALTER TABLE [dbo].[RequestInfo] CHECK CONSTRAINT [FK_RequestInfo_Organisation]
GO
ALTER TABLE [dbo].[RequestInfo]  WITH CHECK ADD  CONSTRAINT [FK_RequestInfo_RequestStatus] FOREIGN KEY([StatusID])
REFERENCES [dbo].[RequestStatus] ([StatusID])
GO
ALTER TABLE [dbo].[RequestInfo] CHECK CONSTRAINT [FK_RequestInfo_RequestStatus]
GO
ALTER TABLE [dbo].[RequestItem]  WITH CHECK ADD  CONSTRAINT [FK_RequestItem_RequestInfo] FOREIGN KEY([ReqID])
REFERENCES [dbo].[RequestInfo] ([ReqID])
GO
ALTER TABLE [dbo].[RequestItem] CHECK CONSTRAINT [FK_RequestItem_RequestInfo]
GO
ALTER TABLE [dbo].[Shoes]  WITH CHECK ADD  CONSTRAINT [FK_Shoes_DonationItem] FOREIGN KEY([ItemID])
REFERENCES [dbo].[DonationItem] ([ItemID])
GO
ALTER TABLE [dbo].[Shoes] CHECK CONSTRAINT [FK_Shoes_DonationItem]
GO
ALTER TABLE [dbo].[Shoes]  WITH CHECK ADD  CONSTRAINT [FK_Shoes_Gender] FOREIGN KEY([GenderID])
REFERENCES [dbo].[Gender] ([GenderID])
GO
ALTER TABLE [dbo].[Shoes] CHECK CONSTRAINT [FK_Shoes_Gender]
GO
ALTER TABLE [dbo].[Toiletries]  WITH CHECK ADD  CONSTRAINT [FK_Toiletries_DonationItem] FOREIGN KEY([ItemID])
REFERENCES [dbo].[DonationItem] ([ItemID])
GO
ALTER TABLE [dbo].[Toiletries] CHECK CONSTRAINT [FK_Toiletries_DonationItem]
GO
USE [master]
GO
ALTER DATABASE [DBDonationSystem] SET  READ_WRITE 
GO
