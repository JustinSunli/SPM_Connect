USE [master]
GO
/****** Object:  Database [SPM_Database]    Script Date: 2020-03-13 9:26:17 AM ******/
CREATE DATABASE [SPM_Database]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SPM_Database', FILENAME = N'F:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\SPM_Database.mdf' , SIZE = 204800KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SPM_Database_log', FILENAME = N'F:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\SPM_Database_log.ldf' , SIZE = 139264KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [SPM_Database] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SPM_Database].[dbo].[sp_fulltext_database] @action = 'disable'
end
GO
ALTER DATABASE [SPM_Database] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SPM_Database] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SPM_Database] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SPM_Database] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SPM_Database] SET ARITHABORT OFF 
GO
ALTER DATABASE [SPM_Database] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SPM_Database] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SPM_Database] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SPM_Database] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SPM_Database] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SPM_Database] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SPM_Database] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SPM_Database] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SPM_Database] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SPM_Database] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SPM_Database] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SPM_Database] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SPM_Database] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SPM_Database] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SPM_Database] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SPM_Database] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SPM_Database] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SPM_Database] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SPM_Database] SET  MULTI_USER 
GO
ALTER DATABASE [SPM_Database] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SPM_Database] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SPM_Database] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SPM_Database] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SPM_Database] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SPM_Database] SET QUERY_STORE = OFF
GO
USE [SPM_Database]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [SPM_Database]
GO
/****** Object:  User [SPM_Agent]    Script Date: 2020-03-13 9:26:17 AM ******/
CREATE USER [SPM_Agent] FOR LOGIN [SPM_Agent] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [SPM\shail]    Script Date: 2020-03-13 9:26:17 AM ******/
CREATE USER [SPM\shail] FOR LOGIN [SPM\shail] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [shail]    Script Date: 2020-03-13 9:26:17 AM ******/
CREATE USER [shail] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [SPM_Agent]
GO
ALTER ROLE [db_datareader] ADD MEMBER [SPM_Agent]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [SPM_Agent]
GO
ALTER ROLE [db_owner] ADD MEMBER [shail]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [shail]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [shail]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [shail]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [shail]
GO
ALTER ROLE [db_datareader] ADD MEMBER [shail]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [shail]
GO
ALTER ROLE [db_denydatareader] ADD MEMBER [shail]
GO
ALTER ROLE [db_denydatawriter] ADD MEMBER [shail]
GO
/****** Object:  FullTextCatalog [ConnectItemSearch]    Script Date: 2020-03-13 9:26:17 AM ******/
CREATE FULLTEXT CATALOG [ConnectItemSearch] WITH ACCENT_SENSITIVITY = ON
AS DEFAULT
GO
/****** Object:  FullTextCatalog [ItemSearch]    Script Date: 2020-03-13 9:26:17 AM ******/
CREATE FULLTEXT CATALOG [ItemSearch] WITH ACCENT_SENSITIVITY = ON
GO
/****** Object:  FullTextCatalog [Searchtool]    Script Date: 2020-03-13 9:26:17 AM ******/
CREATE FULLTEXT CATALOG [Searchtool] WITH ACCENT_SENSITIVITY = OFF
GO
/****** Object:  UserDefinedTableType [dbo].[UserActionsBulk]    Script Date: 2020-03-13 9:26:17 AM ******/
CREATE TYPE [dbo].[UserActionsBulk] AS TABLE(
	[timeStamp] [datetime] NULL,
	[formName] [varchar](max) NULL,
	[ctrlName] [varchar](max) NULL,
	[eventName] [varchar](max) NULL,
	[value] [varchar](max) NULL,
	[UserName] [nvarchar](50) NULL
)
GO
/****** Object:  View [dbo].[SPMJobs]    Script Date: 2020-03-13 9:26:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO








CREATE view [dbo].[SPMJobs]
as
SELECT [Job]
,[BomVersionId] as EstId
,[EstimateDocumentLink] as EstDoc
,LEFT([Product],6) AS BOMItem
,[Description1] AS Description
,[CustomerOrder] AS SalesOrder
,[CustomerName]
,[PlannedQuantity] AS Qty
,[TendersOfContract] AS Note
,CONCAT(Job,' ' ,EstimateDocumentLink, ' ', Product,' ',Description1,' ',CustomerOrder,' ',CustomerName) AS FullSearch
,[CustomerID]
FROM [SPMDB].[dbo].[vgJcoJob]
WHERE LEN(Job)=5
and isnumeric(substring(Job, 0, 5)) = 1
and JobStatusCode != 'Canceled'
GO
/****** Object:  Table [dbo].[WOReleaseLog]    Script Date: 2020-03-13 9:26:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WOReleaseLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RlogNo] [varchar](50) NOT NULL,
	[JobNo] [varchar](50) NOT NULL,
	[WO] [int] NOT NULL,
	[AssyNo] [varchar](50) NULL,
	[ReleaseType] [varchar](50) NOT NULL,
	[ReleaseNotes] [varchar](max) NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[LastSavedBy] [varchar](50) NULL,
	[LastSaved] [datetime] NULL,
	[NxtReleaseNo] [int] NOT NULL,
 CONSTRAINT [PK_WOReleaseLog] PRIMARY KEY CLUSTERED 
(
	[RlogNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[VReleaseLogs]    Script Date: 2020-03-13 9:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[VReleaseLogs]
AS
Select 
	ab.RlogNo,
	ab.JobNo,
	jb.Description as JobDescription,
	ab.WO,
	ab.AssyNo,
	ab.Description,
	ab.ReleaseType,
	ab.CreatedBy,
	ab.CreatedOn,
	CONCAT(ab.JobNo, ' ' ,jb.Description, ' ',ab.WO, ' ' ,ab.AssyNo, ' ', ab.Description, ' ' ,ab.ReleaseType)  AS FullSearch from
(SELECT 
	b.RlogNo,
	b.JobNo,
	b.WO,
	b.AssyNo,
	a.Description1 as Description,
	b.ReleaseType,
	b.CreatedBy,
	b.CreatedOn
	FROM [SPM_Database].[dbo].[WOReleaseLog] b
	inner join [SPMDB].[dbo].[vgJcoWorkOrder] a on a.WorkOrder = b.WO)ab
	inner join [SPM_Database].[dbo].[SPMJobs] jb on jb.Job = ab.JobNo
GO
/****** Object:  View [dbo].[SpareBOM]    Script Date: 2020-03-13 9:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE view  [dbo].[SpareBOM]
as
SELECT       [SPMDB].[dbo].[Bom].Item AS ItemNumber,  CONVERT(INT, [SPMDB].[dbo].[Bom].Qte) AS QuantityPerAssembly,  [SPMDB].[dbo].[Edb].Des AS Description,
 [SPMDB].[dbo].[Edb].Famille, [SPMDB].[dbo].[Edb].Des4 AS Manufacturer,  [SPMDB].[dbo].[Edb].Des2 as ManufacturerItemNumber,
 [SPMDB].[dbo].[Edb].Spec1 as Spare,
                         [SPMDB].[dbo].[Bom].Produit as Product
FROM            [SPMDB].[dbo].[Bom] INNER JOIN
                        [SPMDB].[dbo].[Edb] ON [SPMDB].[dbo].[Bom].Item = [SPMDB].[dbo].[Edb].Item




GO
/****** Object:  View [dbo].[SPMConnectBOMbACKUP]    Script Date: 2020-03-13 9:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[SPMConnectBOMbACKUP]
AS
SELECT        dbo.SpareBOM.ItemNumber, dbo.SpareBOM.QuantityPerAssembly, dbo.SpareBOM.Description, dbo.SpareBOM.Famille as ItemFamily, dbo.SpareBOM.Manufacturer, dbo.SpareBOM.ManufacturerItemNumber, dbo.SpareBOM.Spare, 
                         dbo.SpareBOM.Product AS AssyNo, SPMDB.dbo.Edb.Famille AS AssyFamily, SPMDB.dbo.Edb.Des AS AssyDescription, SPMDB.dbo.Edb.Des4 as AssyManufacturer, SPMDB.dbo.Edb.Des2 as AssyManufacturerItemNumber, SPMDB.dbo.Edb.Spec1 as AssySpare
FROM            dbo.SpareBOM INNER JOIN
                         SPMDB.dbo.Edb ON dbo.SpareBOM.Product = SPMDB.dbo.Edb.Item
						 
GO
/****** Object:  Table [dbo].[OperationCostCode]    Script Date: 2020-03-13 9:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OperationCostCode](
	[Code] [nvarchar](255) NULL,
	[Des] [nvarchar](255) NULL,
	[OCE_OperationCodeID] [float] NULL,
	[CostCategoryId] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[EmpHoursByJob]    Script Date: 2020-03-13 9:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO









CREATE View  [dbo].[EmpHoursByJob]

as

select Job, Des,  Code_Ope, Des_Ope,  sum(EmpHOursSpent) as EmpHoursSpent, CostCategoryId,  Code, Nom from 
(SELECT
		wd.Job
		,j.Des
		,wd.Code_Ope
		,wd.Des_Ope
		,tt.EmployeeTimeSheetId
		,sum(tt.Temps) as EmpHoursSpent
		,CONCAT(emp.Prenom, ' ', emp.Nom) as EmpName
		,ccc.CostCategoryId
		,tcc.Code
		,emp.Nom
FROM	[SPMDB].[dbo].[Wodet] wd
INNER JOIN [SPMDB].[dbo].[Carte] tt ON tt.Wo = wd.Wo and tt.Code_Ope = wd.Code_Ope 
INNER JOIN [SPMDB].[dbo].[Emp] emp ON emp.No_Emp = tt.No_Emp
INNER JOIN [SPMDB].[dbo].[Car] j ON j.Produit  = wd.Item
INNER JOIN [SPMDB].[dbo].[Edb] i ON i.Item = wd.Item
INNER JOIN[SPM_Database].[dbo].[OperationCostCode] ccc ON ccc.Code  = wd.Code_Ope
INNER JOIN [SPMDB].[dbo]. tcCostCategory tcc on tcc.Id = ccc.CostCategoryId
where LEN(wd.Job ) = 5 and ISNUMERIC(SUBSTRING(wd.Job, 0, 6)) = 1

group by wd.Job
		,j.Des
		,wd.Code_Ope
		,wd.Des_Ope
		,tt.EmployeeTimeSheetId
		,CONCAT(emp.Prenom, ' ', emp.Nom) 
		,ccc.CostCategoryId
		,tcc.Code
		,emp.Nom) a

	group by Job, Des,  Code_Ope, Des_Ope,  CostCategoryId,  Code,Nom


GO
/****** Object:  Table [dbo].[Inventory]    Script Date: 2020-03-13 9:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventory](
	[ItemNumber] [nvarchar](255) NULL,
	[Description] [nvarchar](255) NULL,
	[FamilyCode] [nvarchar](255) NULL,
	[Manufacturer] [nvarchar](255) NULL,
	[ManufacturerItemNumber] [nvarchar](255) NULL,
	[Material] [nvarchar](255) NULL,
	[Spare] [nvarchar](255) NULL,
	[DesignedBy] [nvarchar](255) NULL,
	[FamilyType] [nvarchar](255) NULL,
	[SurfaceProtection] [nvarchar](255) NULL,
	[HeatTreatment] [nvarchar](255) NULL,
	[LastSavedBy] [nvarchar](255) NULL,
	[Rupture] [nvarchar](255) NULL,
	[JobPlanning] [nvarchar](255) NULL,
	[Notes] [nvarchar](max) NULL,
	[DateCreated] [datetime] NULL,
	[LastEdited] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ClusteredIndex-20191118-125122]    Script Date: 2020-03-13 9:26:18 AM ******/
CREATE UNIQUE CLUSTERED INDEX [ClusteredIndex-20191118-125122] ON [dbo].[Inventory]
(
	[ItemNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Designers]    Script Date: 2020-03-13 9:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view  [dbo].[Designers]
as

select distinct DesignedBy  from Inventory
where (isnull(DesignedBy, '') <> '' and DesignedBy <> '-')
GO
/****** Object:  View [dbo].[SurfaceProtections]    Script Date: 2020-03-13 9:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view  [dbo].[SurfaceProtections]
as

select distinct SurfaceProtection  from Inventory
where (isnull(SurfaceProtection, '') <> '' and SurfaceProtection <> '-')
GO
/****** Object:  View [dbo].[HeatTreatments]    Script Date: 2020-03-13 9:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view  [dbo].[HeatTreatments]
as

select distinct HeatTreatment  from Inventory
where (isnull(HeatTreatment, '') <> '' and HeatTreatment <> '-')
GO
/****** Object:  View [dbo].[TestVlogs]    Script Date: 2020-03-13 9:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE View [dbo].[TestVlogs]
as


SELECT  a.RlogNo, a.JobNo, a.JobDescription, a.WO, a.AssyNo, a.Description, a.ReleaseType,a.CreatedOn, a.CreatedBy
FROM [SPM_Database].[dbo].[VReleaseLogs] a
INNER JOIN 
  (SELECT WO,
    MIN(RlogNo) as id
  FROM [SPM_Database].[dbo].[VReleaseLogs] 
  GROUP BY WO 
) AS b
  ON a.WO = b.WO 
  AND a.RlogNo = b.id

  UNION ALL
  SELECT RlogNo, WO AS JobNo, JobDescription, WO, AssyNo, Description, ReleaseType,CreatedOn, CreatedBy  FROM [SPM_Database].[dbo].[VReleaseLogs] 
  
GO
/****** Object:  View [dbo].[Manufacturers]    Script Date: 2020-03-13 9:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view  [dbo].[Manufacturers]
as

select distinct Manufacturer from Inventory
where (isnull(Manufacturer, '') <> '' and Manufacturer <> '-')
GO
/****** Object:  View [dbo].[ManufacturersItemNumbers]    Script Date: 2020-03-13 9:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view  [dbo].[ManufacturersItemNumbers]
as

select distinct ManufacturerItemNumber from Inventory
where (isnull(ManufacturerItemNumber, '') <> '' and ManufacturerItemNumber <> '-')
GO
/****** Object:  Table [dbo].[Opportunities]    Script Date: 2020-03-13 9:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Opportunities](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Opportunity ID] [int] NULL,
	[Quote] [nvarchar](50) NOT NULL,
	[Quote_Date] [date] NULL,
	[Customer] [nvarchar](50) NULL,
	[Company_Name] [nvarchar](50) NULL,
	[Title] [varchar](max) NULL,
	[Description] [varchar](max) NULL,
	[Employee] [nvarchar](100) NULL,
	[Category] [nvarchar](50) NULL,
	[Sub_Category] [nvarchar](50) NULL,
	[Rating] [nvarchar](50) NULL,
	[How_Found] [nvarchar](50) NULL,
	[Open_Date] [datetime2](7) NULL,
	[Est_Closed_Date] [datetime2](7) NULL,
	[Probability] [float] NULL,
	[Est_Revenue] [nvarchar](50) NULL,
	[Currency] [nvarchar](50) NULL,
	[Exchange_Rate] [float] NULL,
	[Closed] [int] NULL,
	[Comments] [nvarchar](max) NULL,
	[Part_Name] [nvarchar](100) NULL,
	[Part_Number] [nvarchar](50) NULL,
	[Engineering_Level] [nvarchar](50) NULL,
	[Part_Type] [nvarchar](50) NULL,
	[Part_Variations] [nvarchar](150) NULL,
	[OEM_Name] [nvarchar](50) NULL,
	[Timing] [nvarchar](50) NULL,
	[Est_Order_Date] [datetime2](7) NULL,
	[Est_Acceptance_Run_Date] [nvarchar](50) NULL,
	[Est_Installation_Date] [nvarchar](50) NULL,
	[Status] [nvarchar](50) NULL,
	[RfQ_Date] [nvarchar](1) NULL,
	[RfQ_Name] [nvarchar](50) NULL,
	[RfQ_Revision] [nvarchar](50) NULL,
	[RfQ_Received_Date] [datetime2](7) NULL,
	[RfQ_Document] [nvarchar](300) NULL,
	[RfQ_Doc_Date] [nvarchar](50) NULL,
	[RfQ_Drawings] [nvarchar](150) NULL,
	[Calculated_Price] [nvarchar](50) NULL,
	[Calculation] [nvarchar](100) NULL,
	[Quote_Document] [nvarchar](150) NULL,
	[Converted_to_Job] [int] NULL,
	[Supplier_Number] [nvarchar](1) NULL,
	[Supplier] [nvarchar](1) NULL,
	[LastSavedby] [nvarchar](100) NULL,
	[Lastsaved] [datetime] NULL,
	[DateCreated] [datetime] NULL,
	[FolderPath] [nvarchar](500) NULL,
 CONSTRAINT [PK_Opportunities] PRIMARY KEY CLUSTERED 
(
	[Quote] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[Quotes]    Script Date: 2020-03-13 9:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



/****** Script for SelectTopNRows command from SSMS  ******/
CREATE view  [dbo].[Quotes]
as

SELECT	[Quote]
      ,[Quote_Date]
      ,[Company_Name]
      ,[Title]
      ,[Category]
	  ,[DateCreated]
	  ,CONCAT([Quote], ' ' ,[Quote_Date], ' ',[Company_Name], ' ' ,[Title], ' ' ,[Category])  AS FullSearch     
  FROM [SPM_Database].[dbo].[Opportunities]
GO
/****** Object:  View [dbo].[Descriptions]    Script Date: 2020-03-13 9:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Descriptions]
as
SELECT DISTINCT Description from Inventory
where (isnull(Description, '') <> '' and Description <> '-')
GO
/****** Object:  View [dbo].[CustomersShipTo]    Script Date: 2020-03-13 9:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/****** Script for SelectTopNRows command from SSMS  ******/
CREATE View [dbo].[CustomersShipTo]
as

SELECT [C_No]
      ,[Nom]
      ,[Adresse]
	  ,[CTR_Address2]
      ,[Ville]
      ,[Province]
      ,[Pays]
      ,[Codepostal]
      ,[Telephone]
      ,[Fax]
      ,[Contact]
      ,[Transport]
      ,[Devise]
      ,[Terri]
      ,[Taxes]      
      ,[Abrege]      
      ,[Groupe]      
      ,[Datecree]
      ,[Datemod]     
      ,[CTR_FullSearch]	 
  FROM [SPMDB].[dbo].[Cli]
 

GO
/****** Object:  View [dbo].[VendorsShipTo]    Script Date: 2020-03-13 9:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/****** Script for SelectTopNRows command from SSMS  ******/
CREATE View [dbo].[VendorsShipTo]
as

SELECT  [Code]
      ,[Name]
      ,[Address1]
	  ,[Address2]
      ,[City]
      ,[Province]
      ,[Country]
      ,[ZipCode]
      ,[Phone]
      ,[Fax]
      ,[SalesContact]
      ,[PaymentTermCode]
      ,[CurrencyCode]
      ,[GlAccountCode]
      ,[Export]
      ,[TaxGroupHeaderCode]
      ,[CarrierCode]
      ,[TollFree]
      ,[ShortName]
      ,[Email]
      ,[VendorGroupCode]
      ,[FullSearch]
  FROM [SPMDB].[dbo].[vcVendor]
GO
/****** Object:  Table [dbo].[ShippingBase]    Script Date: 2020-03-13 9:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShippingBase](
	[InvoiceNo] [varchar](50) NOT NULL,
	[DateCreated] [datetime] NULL,
	[CreatedBy] [varchar](30) NULL,
	[DateLastSaved] [datetime] NULL,
	[LastSavedBy] [varchar](30) NULL,
	[JobNumber] [varchar](150) NULL,
	[SalesPerson] [varchar](30) NULL,
	[Requistioner] [varchar](30) NULL,
	[Carrier] [varchar](50) NULL,
	[Collect_Prepaid] [int] NULL,
	[FobPoint] [varchar](25) NULL,
	[Terms] [varchar](25) NULL,
	[Currency] [nchar](10) NULL,
	[Total] [money] NULL,
	[Vendor_Cust] [int] NULL,
	[SoldTo] [varchar](8) NULL,
	[ShipTo] [varchar](8) NULL,
	[Notes] [varchar](max) NULL,
	[CarrierCode] [varchar](50) NULL,
	[IsSubmitted] [int] NOT NULL,
	[SubmittedBy] [varchar](50) NULL,
	[SubmittedOn] [datetime] NULL,
	[SubmittedTo] [int] NOT NULL,
	[IsApproved] [int] NOT NULL,
	[ApprovedBy] [varchar](50) NULL,
	[ApprovedOn] [datetime] NULL,
	[IsShipped] [int] NOT NULL,
	[ShippedBy] [varchar](50) NULL,
	[ShippedOn] [datetime] NULL,
 CONSTRAINT [PK_ShippingBase] PRIMARY KEY CLUSTERED 
(
	[InvoiceNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[ShippingCustInfo]    Script Date: 2020-03-13 9:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO









CREATE View [dbo].[ShippingCustInfo]
as
	Select	a.InvoiceNo,
			c.Nom as SoldToName, 
			c.Adresse as SoldToAddress, 
			c.CTR_Address2 as SoldToAddress2, 
			c.Ville as SoldToCity, 
			c.Province as SoldToProvince, 
			c.Pays as SoldToCountry, 
			c.Codepostal as SoldToPostalCode, 
			c.Telephone as SoldToTelephone, 
			c.Fax as SoldToFax, 
			cd.Nom as ShipToName, 
			cd.Adresse as ShipToAddress, 
			cd.CTR_Address2 as ShipToAddress2, 
			cd.Ville as ShipToCity, 
			cd.Province as ShipToProvince, 
			cd.Pays as ShipToCountry, 
			cd.Codepostal as ShipToPostalCode, 
			cd.Telephone as ShipToTelephone, 
			cd.Fax as ShipToFax
			From [dbo].[ShippingBase] a	
			left join [dbo].[CustomersShipTo]	c	on c.[C_No] = a.[SoldTo] 
			left join [dbo].[CustomersShipTo]	cd	on cd.[C_No] = a.[ShipTo]
			where a.[Vendor_Cust] = 1
union all
	Select	a2.InvoiceNo,
			c2.Name as SoldToName, 
			c2.Address1 as SoldToAddress, 
			c2.Address2 as SoldToAddress2, 
			c2.City as SoldToCity, 
			c2.Province as SoldToProvince, 
			c2.Country as SoldToCountry, 
			c2.ZipCode as SoldToPostalCode, 
			c2.Phone as SoldToTelephone, 
			c2.Fax as SoldToFax, 
			cd2.Name as ShipToName, 
			cd2.Address1 as ShipToAddress, 
			cd2.Address2 as ShipToAddress2, 
			cd2.City as ShipToCity, 
			cd2.Province as ShipToProvince, 
			cd2.Country as ShipToCountry, 
			cd2.ZipCode as ShipToPostalCode, 
			cd2.Phone as ShipToTelephone, 
			cd2.Fax as ShipToFax
			From [dbo].[ShippingBase] a2 
			left join [dbo].[VendorsShipTo]	c2	on c2.[Code] = a2.[SoldTo] 
			left join [dbo].[VendorsShipTo]	cd2	on cd2.[Code] = a2.[ShipTo]
			where a2.[Vendor_Cust] = 0
GO
/****** Object:  Table [dbo].[CustomersAAA]    Script Date: 2020-03-13 9:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomersAAA](
	[Customers] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 2020-03-13 9:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerId] [int] NOT NULL,
	[Name] [varchar](64) NULL,
	[ShortName] [varchar](10) NULL,
	[Alias] [nvarchar](50) NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Customersmerged]    Script Date: 2020-03-13 9:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/****** Script for SelectTopNRows command from SSMS  ******/
CREATE View [dbo].[Customersmerged]
as
SELECT DISTINCT Customers from
(SELECT *
  FROM [dbo].[CustomersAAA]
  UNION ALL
  select Name from [dbo].[Customers]
  UNION ALL
  SELECT SPMDB.dbo.Cli.Nom AS Customers FROM [SPMDB].[dbo].[Cli])a
GO
/****** Object:  View [dbo].[newquotenumber]    Script Date: 2020-03-13 9:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create View [dbo].[newquotenumber]
as
select max(quote) + 1 as NextQuoteNo
from
(SELECT *
 FROM [SPM_Database].[dbo].[Opportunities]
 where  LEN([Quote]) >= 4 and ISNUMERIC(Quote) = 1)a
GO
/****** Object:  View [dbo].[UnionInventory]    Script Date: 2020-03-13 9:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[UnionInventory]
AS
     
SELECT
  [ItemNumber],
  [Description],
  [FamilyCode],
  [Manufacturer],
  [ManufacturerItemNumber],
  [DesignedBy],
  [DateCreated],
  [LastSavedBy],
  [LastEdited],
  [Material],
  [SurfaceProtection],
  [HeatTreatment],
  [Notes],
  Concat(itemnumber, ' ', description, ' ', familycode, ' ', manufacturer,
  ' ',
  manufactureritemnumber) AS FullSearch
FROM (SELECT
  --Item Number
  ISNULL(tt2.item, tt1.itemnumber) AS [ItemNumber],
  --Description 
  CASE
    WHEN CONVERT(datetime, tt2.modif_le) < CONVERT(datetime, tt1.lastedited) THEN ISNULL(tt1.Description, tt2.Des)
    ELSE ISNULL(tt2.Des, tt1.Description)
  END AS [Description],
  --FamilyCode
  CASE
    WHEN CONVERT(datetime, tt2.modif_le) < CONVERT(datetime, tt1.lastedited) THEN ISNULL(tt1.FamilyCode, tt2.Famille)
    ELSE ISNULL(tt2.Famille, tt1.FamilyCode)
  END AS [FamilyCode],
  --Manufacturer
  CASE
    WHEN CONVERT(datetime, tt2.modif_le) < CONVERT(datetime, tt1.lastedited) THEN ISNULL(tt1.Manufacturer, tt2.Des4)
    ELSE ISNULL(tt2.Des4, tt1.Manufacturer)
  END AS [Manufacturer],
  --Manufacturer Item Number
  CASE
    WHEN CONVERT(datetime, tt2.modif_le) < CONVERT(datetime, tt1.lastedited) THEN ISNULL(tt1.ManufacturerItemNumber, tt2.Des2)
    ELSE ISNULL(tt2.Des2, tt1.ManufacturerItemNumber)
  END AS [ManufacturerItemNumber],
  --Designed By
  CASE
    WHEN CONVERT(datetime, tt2.modif_le) < CONVERT(datetime, tt1.lastedited) THEN ISNULL(tt1.DesignedBy, tt2.UsagerCreation)
    ELSE ISNULL(tt2.UsagerCreation, tt1.DesignedBy)
  END AS [DesignedBy],
  --Date Created
  CASE
    WHEN CONVERT(datetime, tt2.modif_le) < CONVERT(datetime, tt1.lastedited) THEN ISNULL(tt1.DateCreated, tt2.DateCreation)
    ELSE ISNULL(tt2.DateCreation, tt1.DateCreated)
  END AS [DateCreated],
  --Last Saved By
  CASE
    WHEN CONVERT(datetime, tt2.modif_le) < CONVERT(datetime, tt1.lastedited) THEN ISNULL(tt1.LastSavedBy, tt2.Modif_Par)
    ELSE ISNULL(tt2.Modif_Par, tt1.LastSavedBy)
  END AS [LastSavedBy],
  --Last Edited
  CASE
    WHEN CONVERT(datetime, tt2.modif_le) < CONVERT(datetime, tt1.lastedited) THEN ISNULL(tt1.lastedited, tt2.modif_le)
    ELSE ISNULL(tt2.modif_le, tt1.lastedited)
  END AS [LastEdited],
  --Material
  tt1.Material AS [Material],
  --Surface Protection
  tt1.SurfaceProtection AS [SurfaceProtection],
  --Heat Treatment
  tt1.HeatTreatment AS [HeatTreatment],
  --Notes
  tt1.Notes AS [Notes],
  ISNULL(tt2.actif, 'O') AS Active

FROM [SPMDB].[dbo].[edb] tt2
FULL
OUTER JOIN [SPM_Database].[dbo].[inventory] tt1
  ON tt1.itemnumber = tt2.item) a
WHERE active = 'O'
AND SUBSTRING(ItemNumber, 1, 1) NOT LIKE '[0-9]%'
AND ISNUMERIC(
SUBSTRING(ItemNumber, 2, 5)
) = 1
AND LEN(ItemNumber) = 6
AND SUBSTRING(ItemNumber, 2, 1) NOT LIKE '-';
GO
/****** Object:  View [dbo].[GeniusChildren]    Script Date: 2020-03-13 9:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[GeniusChildren]
AS
SELECT        SPMDB.dbo.Bom.Item AS ItemNumber, CONVERT(INT, SPMDB.dbo.Bom.Qte) AS QuantityPerAssembly, dbo.UnionInventory.Description, dbo.UnionInventory.FamilyCode, dbo.UnionInventory.Manufacturer, 
                         dbo.UnionInventory.ManufacturerItemNumber, SPMDB.dbo.Bom.Produit
FROM            SPMDB.dbo.Bom INNER JOIN
                         dbo.UnionInventory ON SPMDB.dbo.Bom.Item = dbo.UnionInventory.ItemNumber
GO
/****** Object:  View [dbo].[GeniusParent]    Script Date: 2020-03-13 9:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[GeniusParent]
AS

SELECT        [SPMDB].[dbo].[Bom].Produit AS AssemblyNumber, [SPM_Database].[dbo].[UnionInventory].Description, [SPM_Database].[dbo].[UnionInventory].FamilyCode, [SPM_Database].[dbo].[UnionInventory].Manufacturer, [SPMDB].[dbo].[Bom].Item AS ItemNumber
FROM            [SPMDB].[dbo].[Bom] INNER JOIN
                  [SPM_Database].[dbo].[UnionInventory] ON [SPMDB].[dbo].[Bom].Produit = [SPM_Database].[dbo].[UnionInventory].ItemNumber

GO
/****** Object:  Table [dbo].[PurchaseReqBase]    Script Date: 2020-03-13 9:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseReqBase](
	[ReqNumber] [int] NOT NULL,
	[JobNumber] [varchar](50) NOT NULL,
	[RequestedBy] [varchar](50) NULL,
	[DateCreated] [datetime] NULL,
	[LastSavedBy] [varchar](50) NULL,
	[DateLastSaved] [datetime] NULL,
	[SubAssyNumber] [varchar](50) NULL,
	[Notes] [varchar](max) NULL,
	[DateRequired] [date] NULL,
	[Validate] [int] NULL,
	[DateValidated] [datetime] NULL,
	[Approved] [int] NULL,
	[Approvedby] [varchar](50) NULL,
	[DateApproved] [datetime] NULL,
	[Total] [money] NULL,
	[SupervisorId] [int] NULL,
	[HApproval] [int] NULL,
	[Happroved] [int] NULL,
	[HApprovedBy] [varchar](50) NULL,
	[HDateApproved] [datetime] NULL,
	[PApproval] [int] NULL,
	[Papproved] [int] NULL,
	[PDateApproved] [datetime] NULL,
	[PApprovedBy] [varchar](50) NULL,
	[PONumber] [varchar](50) NULL,
	[PODate] [date] NULL,
 CONSTRAINT [PK_PurchaseReqBase] PRIMARY KEY CLUSTERED 
(
	[ReqNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[Purchasereqstatus]    Script Date: 2020-03-13 9:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Purchasereqstatus]
AS
SELECT        ReqNumber, JobNumber, RequestedBy, Validate, Approved, Approvedby, SupervisorId, Total, PONumber, PApprovedBy, Happroved, Papproved, SubAssyNumber
FROM            dbo.PurchaseReqBase
GO
/****** Object:  Table [dbo].[ItemDependencies]    Script Date: 2020-03-13 9:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemDependencies](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AssyNo] [varchar](50) NOT NULL,
	[ItemNo] [varchar](50) NOT NULL,
	[Qty] [int] NOT NULL,
	[DateCreated] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[LastSaved] [datetime] NULL,
	[LastUser] [varchar](50) NULL,
 CONSTRAINT [PK_ItemDependencies] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ItemsDependenciesBOM]    Script Date: 2020-03-13 9:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE VIEW [dbo].[ItemsDependenciesBOM]
AS
select a.* 
, eb2.FamilyCode AS AssyFamily
, eb2.Description AS AssyDescription
, eb2.Manufacturer as AssyManufacturer
, eb2.ManufacturerItemNumber as AssyManufacturerItemNumber
from (
SELECT    bm.[ItemNo] AS ItemNumber
		,  CONVERT(INT, bm.[Qty]) AS QuantityPerAssembly
		, eb.Description AS Description
		, eb.FamilyCode AS ItemFamily
		, eb.Manufacturer AS Manufacturer
		, eb.ManufacturerItemNumber AS ManufacturerItemNumber
		, bm.[AssyNo] AS AssyNo
FROM  [SPM_Database].[dbo].[ItemDependencies] bm 
	INNER JOIN  [SPM_Database].[dbo].[Inventory] eb 
		ON bm.[ItemNo] = eb.ItemNumber

)a
inner join  [SPM_Database].[dbo].[UnionInventory] eb2 
	ON a.AssyNo = eb2.ItemNumber
GO
/****** Object:  View [dbo].[EFTVendors]    Script Date: 2020-03-13 9:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** Script for SelectTopNRows command from SSMS  ******/
CREATE View [dbo].[EFTVendors]
as
SELECT [F_No]
      ,[Nom]
      ,[Adresse]
      ,[Ville]
      ,[Province]
      ,[Pays]
      ,[Codepostal]
      ,[Telephone]
      ,[Fax]
      ,[Contact]
      ,[Termeach]
      ,[Devise]     
      ,[Actif]
      ,[Datecree]
      ,[Datemod]
      ,[VendorID]
  FROM [SPM-Proto].[dbo].[Fou]
  where Actif <> 'N'
GO
/****** Object:  View [dbo].[EFTVendorsToEmail]    Script Date: 2020-03-13 9:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** Script for SelectTopNRows command from SSMS  ******/ 
CREATE View [dbo].[EFTVendorsToEmail]
as
SELECT [f_no] as VCode, 
       [nom] as VendorName, 
       a.VendorID, 
       cl.contactid as ContactID, 
       co.firstname as FirstName, 
       co.lastname as LastName, 
       cg.contactgroupid as GroupID, 
       ce.email as Email 
FROM   [SPM_Database].[dbo].[EFTVendors] a 
       INNER JOIN [SPM-Proto].[dbo].[tccontactlinked] cl 
               ON cl.vendorid = a.VendorID 
       INNER JOIN [SPM-Proto].[dbo].[tccontact] co 
               ON co.id = cl.contactid 
       INNER JOIN [SPM-Proto].[dbo].[tccontactlinkedgroup] cg 
               ON cg.contactlinkedid = cl.id 
       INNER JOIN [SPM-Proto].[dbo].[tccontactemail] ce 
               ON ce.contactid = cl.contactid 
WHERE  a.actif <> 'N' 
       AND co.isactive = '1' 
       AND cg.contactgroupid = '1555' 
       AND ce.isprimary = '1' 
GO
/****** Object:  Table [dbo].[Purchase_Order_Lineitems]    Script Date: 2020-03-13 9:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Purchase_Order_Lineitems](
	[Purchase Order Number] [nvarchar](255) NULL,
	[Line Number] [float] NULL,
	[Item Number] [nvarchar](255) NULL,
	[Drawing] [nvarchar](255) NULL,
	[Stock Item Number] [nvarchar](255) NULL,
	[Quantity] [float] NULL,
	[Unit of Measure] [nvarchar](255) NULL,
	[Tax1_but] [bit] NOT NULL,
	[Tax2_but] [bit] NOT NULL,
	[Qty Recvd] [float] NULL,
	[Date Expec] [nvarchar](255) NULL,
	[Date Recvd] [nvarchar](255) NULL,
	[Description] [nvarchar](255) NULL,
	[Sub Category] [nvarchar](255) NULL,
	[Manufacturer data] [nvarchar](255) NULL,
	[Price] [float] NULL,
	[Received] [bit] NOT NULL,
	[Comment] [nvarchar](255) NULL,
	[Serial Number] [nvarchar](255) NULL,
	[Color] [nvarchar](255) NULL,
	[Size] [nvarchar](255) NULL,
	[Line Note] [nvarchar](255) NULL,
	[Job Number] [nvarchar](255) NULL,
	[Qty Recvd Now] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[PriceItemsFromPO]    Script Date: 2020-03-13 9:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE View [dbo].[PriceItemsFromPO]
as
  SELECT	Item,			
			PriceItem,
			Currency,  
			LastUpdate,
			PurchaseOrder
			FROM [SPMDB].[dbo].[vgPoeDetailCurrency]	
			WHERE IsCompleted = '1' AND QuantityOrdered  not like '-%'
			union 
SELECT		concat('A',[Item Number]) as Item,
			Price,
			null,
			null,
			concat('AAA - ',[Purchase Order Number])
			FROM Purchase_Order_Lineitems
			
GO
/****** Object:  View [dbo].[UnionInventorybck]    Script Date: 2020-03-13 9:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE view  [dbo].[UnionInventorybck]
as
select *, concat(ItemNumber,' ',Description,' ',FamilyCode,' ',Manufacturer,' ',ManufacturerItemNumber) as FullSearch from 
(select [ItemNumber],[Description],[FamilyCode],[Manufacturer],[ManufacturerItemNumber] from [SPM_Database].dbo.Inventory 
union 
select e.Item AS ItemNumber,
e.Des as Description,
e.Famille as FamilyCode,
e.Des4 as Manufacturer,
e.Des2 as ManufactureItemNumber
 from [SPMDB].[dbo].[Edb] e 
 where not exists (select 1 from [SPM_Database].dbo.Inventory i
					where i.ItemNumber = e.Item )) u
where  substring(ItemNumber, 1, 1)  NOT LIKE  '[0-9]%'
and isnumeric(substring(ItemNumber, 2, 5)) = 1
and LEN(ItemNumber) < 7
GO
/****** Object:  Table [dbo].[WOReleaseDetails]    Script Date: 2020-03-13 9:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WOReleaseDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RlogNo] [varchar](50) NOT NULL,
	[ReleaseType] [varchar](50) NULL,
	[JobNo] [varchar](50) NULL,
	[WO] [int] NOT NULL,
	[AssyNo] [varchar](50) NOT NULL,
	[ItemId] [varchar](50) NOT NULL,
	[ItemNotes] [varchar](250) NULL,
	[ItemQty] [int] NOT NULL,
	[IsRevised] [int] NOT NULL,
	[ItemCreatedOn] [datetime] NULL,
	[ItemCreatedBy] [varchar](50) NULL,
	[ItemLastSaved] [datetime] NULL,
	[ItemLastSavedBy] [varchar](50) NULL,
 CONSTRAINT [PK_WOReleaseDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VReleaseBOM]    Script Date: 2020-03-13 9:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE VIEW [dbo].[VReleaseBOM]
AS


SELECT
  ab.RlogNo,
  ab.JobNo,
  ab.Parent,
  jb.Description AS JobDescription,
  ab.WO,
  ab.AssyNo,
  ab.Description,
  ab.OEM,
  ab.OEMItemNo,
  ab.Family,
  ab.ReleaseType,
  ab.IsRevised,
  ab.ReleaseNotes,
  ab.CreatedBy,
  ab.CreatedOn,
  ab.LastSavedBy,
  ab.LastSaved
FROM (SELECT
  b.RlogNo,
  b.JobNo,
  b.JobNo AS Parent,
  b.WO,
  b.AssyNo,
  a.Des AS Description,
  a.Des4 AS OEM,
  a.Des2 AS OEMItemNo,
  a.Famille AS Family,
  b.ReleaseType,
  '3' as IsRevised,
  b.ReleaseNotes,
  b.CreatedBy,
  b.CreatedOn,
  b.LastSavedBy,
  b.LastSaved
FROM [SPM_Database].[dbo].[WOReleaseLog] b
INNER JOIN [SPMDB].[dbo].[Edb] a
  ON a.Item = b.AssyNo) ab
INNER JOIN [SPM_Database].[dbo].[SPMJobs] jb
  ON jb.Job = ab.JobNo
INNER JOIN (SELECT
  WO,
  MIN(RlogNo) AS id
FROM [SPM_Database].[dbo].[VReleaseLogs]
GROUP BY WO) AS b
  ON ab.WO = b.WO
  AND ab.RlogNo = b.id

UNION ALL

SELECT
  ab.RlogNo,
  ab.JobNo ,
  ab.Parent,
  jb.Description AS JobDescription,
  ab.WO,
  ab.AssyNo,
  ab.Description,
  ab.OEM,
  ab.OEMItemNo,
  ab.Family,
  ab.ReleaseType,
  ab.IsRevised,
  ab.ReleaseNotes,
  ab.CreatedBy,
  ab.CreatedOn,
  ab.LastSavedBy,
  ab.LastSaved
FROM (SELECT
  b.RlogNo,
  b.JobNo,
  b.WO AS Parent,
  b.WO,
  b.AssyNo,
  a.Des AS Description,
  a.Des4 AS OEM,
  a.Des2 AS OEMItemNo,
  a.Famille AS Family,
  b.ReleaseType,
  '3' as IsRevised,
  b.ReleaseNotes,
  b.CreatedBy,
  b.CreatedOn,
  b.LastSavedBy,
  b.LastSaved
FROM [SPM_Database].[dbo].[WOReleaseLog] b
INNER JOIN [SPMDB].[dbo].[Edb] a
  ON a.Item = b.AssyNo) ab
INNER JOIN [SPM_Database].[dbo].[SPMJobs] jb
  ON jb.Job = ab.JobNo

UNION ALL

SELECT
  bm.RlogNo,
  bm.JobNo AS JobNo,
  bm.RlogNo AS Parent,
  NULL AS JobDescription,
  bm.WO,
  bm.ItemId AS AssyNo,
  eb.Des AS Description,
  eb.Des4 AS OEM,
  eb.Des2 AS OEMItemNo,
  eb.Famille AS Family,
  CONVERT(varchar, bm.ItemQty) AS ReleaseType,
  bm.IsRevised,
  bm.ItemNotes AS ReleaseNotes,
  bm.ItemCreatedBy AS CreatedBy,
  bm.ItemCreatedOn AS CreatedOn,
  bm.ItemLastSavedBy AS LastSavedBy,
  bm.ItemLastSaved AS LastSaved
FROM [SPM_Database].[dbo].[WOReleaseDetails] bm
INNER JOIN [SPMDB].[dbo].[Edb] eb
  ON bm.ItemId = eb.Item


GO
/****** Object:  View [dbo].[unioninv]    Script Date: 2020-03-13 9:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[unioninv]
as 


SELECT
  [ItemNumber],
  [Description],
  [FamilyCode],
  [Manufacturer],
  [ManufacturerItemNumber],
  [DesignedBy],
  [DateCreated],
  [LastSavedBy],
  [LastEdited],
  [Material],
  [SurfaceProtection],
  [HeatTreatment],
  [Notes],
  Concat(itemnumber, ' ', description, ' ', familycode, ' ', manufacturer,
  ' ',
  manufactureritemnumber) AS FullSearch
FROM (SELECT
  --Item Number
  ISNULL(tt2.item, tt1.itemnumber) AS [ItemNumber],
  --Description 
  CASE
    WHEN CONVERT(datetime, tt2.modif_le) < CONVERT(datetime, tt1.lastedited) THEN ISNULL(tt1.Description, tt2.Des)
    ELSE ISNULL(tt2.Des, tt1.Description)
  END AS [Description],
  --FamilyCode
  CASE
    WHEN CONVERT(datetime, tt2.modif_le) < CONVERT(datetime, tt1.lastedited) THEN ISNULL(tt1.FamilyCode, tt2.Famille)
    ELSE ISNULL(tt2.Famille, tt1.FamilyCode)
  END AS [FamilyCode],
  --Manufacturer
  CASE
    WHEN CONVERT(datetime, tt2.modif_le) < CONVERT(datetime, tt1.lastedited) THEN ISNULL(tt1.Manufacturer, tt2.Des4)
    ELSE ISNULL(tt2.Des4, tt1.Manufacturer)
  END AS [Manufacturer],
  --Manufacturer Item Number
  CASE
    WHEN CONVERT(datetime, tt2.modif_le) < CONVERT(datetime, tt1.lastedited) THEN ISNULL(tt1.ManufacturerItemNumber, tt2.Des2)
    ELSE ISNULL(tt2.Des2, tt1.ManufacturerItemNumber)
  END AS [ManufacturerItemNumber],
  --Designed By
  CASE
    WHEN CONVERT(datetime, tt2.modif_le) < CONVERT(datetime, tt1.lastedited) THEN ISNULL(tt1.DesignedBy, tt2.UsagerCreation)
    ELSE ISNULL(tt2.UsagerCreation, tt1.DesignedBy)
  END AS [DesignedBy],
  --Date Created
  CASE
    WHEN CONVERT(datetime, tt2.modif_le) < CONVERT(datetime, tt1.lastedited) THEN ISNULL(tt1.DateCreated, tt2.DateCreation)
    ELSE ISNULL(tt2.DateCreation, tt1.DateCreated)
  END AS [DateCreated],
  --Last Saved By
  CASE
    WHEN CONVERT(datetime, tt2.modif_le) < CONVERT(datetime, tt1.lastedited) THEN ISNULL(tt1.LastSavedBy, tt2.Modif_Par)
    ELSE ISNULL(tt2.Modif_Par, tt1.LastSavedBy)
  END AS [LastSavedBy],
  --Last Edited
  CASE
    WHEN CONVERT(datetime, tt2.modif_le) < CONVERT(datetime, tt1.lastedited) THEN ISNULL(tt1.lastedited, tt2.modif_le)
    ELSE ISNULL(tt2.modif_le, tt1.lastedited)
  END AS [LastEdited],
  --Material
  tt1.Material AS [Material],
  --Surface Protection
  tt1.SurfaceProtection AS [SurfaceProtection],
  --Heat Treatment
  tt1.HeatTreatment AS [HeatTreatment],
  --Notes
  tt1.Notes AS [Notes],
  ISNULL(tt2.actif, 'O') AS Active

FROM [SPMDB].[dbo].[edb] tt2
FULL
OUTER JOIN [SPM_Database].[dbo].[inventory] tt1
  ON tt1.itemnumber = tt2.item) a
WHERE active = 'O'
AND SUBSTRING(ItemNumber, 1, 1) NOT LIKE '[0-9]%'
AND ISNUMERIC(
SUBSTRING(ItemNumber, 2, 5)
) = 1
AND LEN(ItemNumber) = 6
AND SUBSTRING(ItemNumber, 2, 1) NOT LIKE '-';
GO
/****** Object:  Table [dbo].[WOInOut]    Script Date: 2020-03-13 9:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WOInOut](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[WO] [int] NOT NULL,
	[Emp_idCheckOut] [int] NOT NULL,
	[Emp_idCheckIn] [int] NOT NULL,
	[PunchIn] [datetime] NULL,
	[PunchOut] [datetime] NULL,
	[TimeElapsed] [datetime] NULL,
	[CheckOutApprovedBy] [int] NOT NULL,
	[CheckInApprovedBy] [int] NOT NULL,
	[InBuilt] [int] NOT NULL,
	[Completed] [int] NOT NULL,
 CONSTRAINT [PK_WOInOut] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2020-03-13 9:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Emp_Id] [int] NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Department] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[ActiveBlockNumber] [nvarchar](50) NULL,
	[Admin] [int] NOT NULL,
	[Developer] [int] NOT NULL,
	[Management] [int] NOT NULL,
	[Quote] [int] NOT NULL,
	[PurchaseReq] [int] NOT NULL,
	[PurchaseReqApproval] [int] NOT NULL,
	[PurchaseReqApproval2] [int] NOT NULL,
	[PurchaseReqBuyer] [int] NOT NULL,
	[PriceRight] [int] NOT NULL,
	[Shipping] [int] NOT NULL,
	[WOScan] [int] NOT NULL,
	[CribCheckout] [int] NOT NULL,
	[CribShort] [int] NOT NULL,
	[ECR] [int] NOT NULL,
	[ECRApproval] [int] NOT NULL,
	[ECRApproval2] [int] NOT NULL,
	[ECRHandler] [int] NOT NULL,
	[ECRSup] [int] NOT NULL,
	[ItemDependencies] [int] NOT NULL,
	[WORelease] [int] NOT NULL,
	[ShipSupervisor] [int] NOT NULL,
	[ShipSup] [int] NOT NULL,
	[ShippingManager] [int] NOT NULL,
	[CheckDrawing] [int] NOT NULL,
	[ApproveDrawing] [int] NOT NULL,
	[Supervisor] [int] NULL,
	[Email] [varchar](100) NULL,
	[SharesFolder] [nvarchar](250) NULL,
	[ReadWhatsNew] [int] NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Users_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[WO_BinStatus]    Script Date: 2020-03-13 9:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[WO_BinStatus]
as
  SELECT 
    b.[WO],
	b.Id,	
	c.Name as EmpCheckOutby,
	b.PunchIn as CheckOutTime,
	cd.Name as CheckOutApprovedby,
	a.Name as EmpCheckInby,
	b.PunchOut as CheckInTime,
	ad.Name as CheckInApprovedby,
	IIF(b.[InBuilt] = 1,'Yes','No') AS Inbuilt,
	IIF(b.Completed = 1,'Yes','No') as Completed
FROM [SPM_Database].[dbo].[WOInOut] b
	left join 
	[SPM_Database].[dbo].[Users]	c	on c.Emp_Id = b.Emp_idCheckOut 
	left join 
	[SPM_Database].[dbo].[Users]	cd	on cd.Emp_Id = b.CheckOutApprovedBy
	left join 
	[SPM_Database].[dbo].[Users]	a	on a.Emp_Id = b.Emp_idCheckIn 
	left join 
	[SPM_Database].[dbo].[Users]	ad	on ad.Emp_Id = b.CheckInApprovedBy


GO
/****** Object:  Table [dbo].[favourite]    Script Date: 2020-03-13 9:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[favourite](
	[Item] [varchar](10) NULL,
	[UserName] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[SPMConnectFavorites]    Script Date: 2020-03-13 9:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE VIEW [dbo].[SPMConnectFavorites]
AS
SELECT       uinv.*,
			 fav.UserName                   
FROM         [dbo].[UnionInventory] as uinv INNER JOIN
             [dbo].[favourite] as fav ON uinv.ItemNumber =  fav.Item
						 
GO
/****** Object:  Table [dbo].[inventorybackup]    Script Date: 2020-03-13 9:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inventorybackup](
	[ItemNumber] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[FamilyCode] [nvarchar](255) NULL,
	[Manufacturer] [nvarchar](255) NULL,
	[ManufacturerItemNumber] [nvarchar](255) NULL,
	[Material] [nvarchar](255) NULL,
	[Spare] [nvarchar](255) NULL,
	[DesignedBy] [nvarchar](255) NULL,
	[FamilyType] [nvarchar](255) NULL,
	[SurfaceProtection] [nvarchar](255) NULL,
	[HeatTreatment] [nvarchar](255) NULL,
	[LastSavedBy] [nvarchar](255) NULL,
	[Rupture] [nvarchar](255) NULL,
	[JobPlanning] [nvarchar](255) NULL,
	[Notes] [nvarchar](max) NULL,
	[DateCreated] [datetime] NULL,
	[LastEdited] [datetime] NULL,
	[ItemId] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_inventorybackup] PRIMARY KEY CLUSTERED 
(
	[ItemNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [ItemID] UNIQUE NONCLUSTERED 
(
	[ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[InventoryBackView]    Script Date: 2020-03-13 9:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[InventoryBackView]
WITH SCHEMABINDING AS
SELECT       [ItemNumber]
			,[Description]
			,[FamilyCode]
			,[Manufacturer]
			,[ManufacturerItemNumber]
			, ItemId
			, IsNull(ItemNumber,'') + ' ' + 
			IsNull(Description,'') + ' ' + 
			IsNull(FamilyCode,'') + ' ' + 
			IsNull(Manufacturer,'') + ' ' + 
			IsNull(ManufacturerItemNumber,'') + ' ' as fullsearch
FROM          [dbo].[inventorybackup]  
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF
GO
/****** Object:  Index [vcSearchItem_EntityId]    Script Date: 2020-03-13 9:26:18 AM ******/
CREATE UNIQUE CLUSTERED INDEX [vcSearchItem_EntityId] ON [dbo].[InventoryBackView]
(
	[ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VWOReleaseDetails]    Script Date: 2020-03-13 9:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE VIEW [dbo].[VWOReleaseDetails]
AS
select a.* 
, eb2.Famille AS AssyFamily
, eb2.Des AS AssyDescription
, eb2.Des4 as AssyManufacturer
, eb2.Des2 as AssyManufacturerItemNumber
from (
SELECT    bm.ItemId AS ItemNumber
		, bm.WO
		, bm.RlogNo
		,  CONVERT(INT, bm.ItemQty) AS QuantityPerAssembly
		, bm.ItemNotes
		, bm.IsRevised
		, eb.Description AS Description
		, eb.FamilyCode AS ItemFamily
		, eb.Manufacturer AS Manufacturer
		, eb.ManufacturerItemNumber AS ManufacturerItemNumber
		, bm.[AssyNo] AS AssyNo
FROM  [SPM_Database].[dbo].[WOReleaseDetails] bm 
	INNER JOIN  [SPM_Database].[dbo].[Inventory] eb 
		ON bm.ItemId = eb.ItemNumber

)a
inner join SPMDB.dbo.Edb eb2 
	ON a.AssyNo = eb2.Item
GO
/****** Object:  View [dbo].[SpareBOMProductDes]    Script Date: 2020-03-13 9:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[SpareBOMProductDes]
AS
SELECT        dbo.SpareBOM.ItemNumber, dbo.SpareBOM.QuantityPerAssembly, dbo.SpareBOM.Description, dbo.SpareBOM.Famille, dbo.SpareBOM.Manufacturer, dbo.SpareBOM.ManufacturerItemNumber, dbo.SpareBOM.Spare, 
                         dbo.SpareBOM.Product AS AssyNo, SPMDB.dbo.Edb.Famille AS AssyFamily, SPMDB.dbo.Edb.Des AS AssyDescription
FROM            dbo.SpareBOM INNER JOIN
                         SPMDB.dbo.Edb ON dbo.SpareBOM.Product = SPMDB.dbo.Edb.Item
GO
/****** Object:  Table [dbo].[EFTEmailTracker]    Script Date: 2020-03-13 9:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EFTEmailTracker](
	[ID] [int] NOT NULL,
	[PaymentNo] [int] NOT NULL,
	[EmailSent] [int] NOT NULL,
	[DateSent] [datetime] NULL,
 CONSTRAINT [PK_EFTEmailTracker] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[EFTHome]    Script Date: 2020-03-13 9:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO












CREATE view [dbo].[EFTHome]
as

SELECT
  tcapp.[Id],
  tcapp.[PaymentNo],
  CONVERT(varchar, tcapp.[PaymentDate], 23) AS PaymentDate,
  tcapp.[VendorName],
  tcapp.[VendorId],
  pm.Code as PaymentType,
  tcapp.[TotalAmount],
  CONVERT(varchar, tcapp.[LastUpdate], 20) AS LastUpdate,
  CONVERT(varchar, tcapp.[CreateDate], 20) AS DateCreated,
  CASE
    WHEN ISNULL(et.EmailSent, 0) = 1 THEN 'Yes'
    WHEN ISNULL(et.EmailSent, 0) = 0 THEN 'No'
    ELSE 'No'
  END AS EmailSent,
  ce.FirstName,
  ce.LastName,
  ce.Email
FROM [SPM-Proto].[dbo].[tcAPPayment] tcapp
FULL
OUTER JOIN [SPM_Database].[dbo].[EFTEmailTracker] et
  ON et.ID = tcapp.Id
INNER JOIN [SPM_Database].[dbo].[EFTVendorsToEmail] ce
  ON ce.[VendorID] = tcapp.VendorId
INNER JOIN [SPM-Proto].[dbo].[tcAPPaymentMode] pm
  ON tcapp.PaymentModeId = pm.ID

WHERE ISNULL(tcapp.VendorId, '') <> ''
AND tcapp.PaymentTypeID = '1380'
AND (tcapp.PaymentModeId = '7' OR tcapp.PaymentModeId = '11')
AND tcapp.APPaymentStatusId = '1385'
AND tcapp.PaymentDate > '2018-03-01'
GO
/****** Object:  View [dbo].[TimeBudgetBI]    Script Date: 2020-03-13 9:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE View  [dbo].[TimeBudgetBI]

as

select Job, Des, Wo, Code_Ope, Des_Ope, Code_Id, sum(EmpHOursSpent) as EmpHoursSpent, CostCategoryId, EmpHours as HoursQuoted, Code from 
(SELECT
		wd.Job
		,j.Des
		,wd.Wo
		,wd.Code_Ope
		,wd.Des_Ope
		,wd.Code_Id
		,tt.EmployeeTimeSheetId
		,sum(tt.Temps) as EmpHoursSpent
		,CONCAT(emp.Prenom, ' ', emp.Nom) as EmpName
		,ccc.CostCategoryId
		,ib.EmpHours
		,tcc.Code
FROM	[SPM-Proto].[dbo].[Wodet] wd
INNER JOIN [SPM-Proto].[dbo].[Carte] tt ON tt.Wo = wd.Wo and tt.Code_Ope = wd.Code_Ope 
INNER JOIN [SPM-Proto].[dbo].[Emp] emp ON emp.No_Emp = tt.No_Emp
INNER JOIN [SPM-Proto].[dbo].[Car] j ON j.Produit  = wd.Item
INNER JOIN [SPM-Proto].[dbo].[Edb] i ON i.Item = wd.Item
INNER JOIN[SPM_Database].[dbo].[OperationCostCode] ccc ON ccc.Code  = wd.Code_Ope
INNER JOIN [SPM-Proto].[dbo]. tcItemBudget ib on ib.CostCategoryId = ccc.CostCategoryId and ib.ItemId = i.ItemID
INNER JOIN [SPM-Proto].[dbo]. tcCostCategory tcc on tcc.Id = ccc.CostCategoryId

group by wd.Job
		,j.Des
		,wd.Wo
		,wd.Code_Ope
		,wd.Des_Ope
		,wd.Code_Id
		,tt.EmployeeTimeSheetId
		,CONCAT(emp.Prenom, ' ', emp.Nom) 
		,ccc.CostCategoryId
		,ib.EmpHours
		,tcc.Code) a

	group by Job, Des, Wo, Code_Ope, Des_Ope, Code_Id, CostCategoryId, EmpHours, Code


GO
/****** Object:  View [dbo].[ItemsToSelect]    Script Date: 2020-03-13 9:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO









CREATE view  [dbo].[ItemsToSelect]
as
select concat(ItemNumber,' ',Description,' ',FamilyCode,' ',Manufacturer,' ',ManufacturerItemNumber) as Items from [dbo].[UnionInventory]

GO
/****** Object:  View [dbo].[ShippingBaseWithNames]    Script Date: 2020-03-13 9:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO














CREATE View [dbo].[ShippingBaseWithNames]
as
	Select	a.InvoiceNo,
			a.DateCreated,
			a.CreatedBy,
			a.DateLastSaved,
			a.LastSavedBy,
			a.JobNumber,
			a.SalesPerson,
			a.Requistioner,
			a.Carrier,
			a.Collect_Prepaid,
			a.FobPoint,
			a.Terms,
			a.Currency,
			a.Total,
			a.Vendor_Cust,
			a.SoldTo,
			a.ShipTo,
			a.Notes,
			a.CarrierCode,
			c.Nom as SoldToName, 
			cd.Nom as ShipToName,
			concat(a.InvoiceNo,' ',c.Nom,' ',cd.Nom,' ',a.JobNumber) as FullSearch,
			a.IsSubmitted,
			a.SubmittedTo,
			a.IsApproved,
			a.IsShipped
			From [dbo].[ShippingBase] a	
			left join [dbo].[CustomersShipTo]	c	on c.[C_No] = a.[SoldTo] 
			left join [dbo].[CustomersShipTo]	cd	on cd.[C_No] = a.[ShipTo]
			where a.[Vendor_Cust] = 1
union all
	Select	a2.InvoiceNo,
			a2.DateCreated,
			a2.CreatedBy,
			a2.DateLastSaved,
			a2.LastSavedBy,
			a2.JobNumber,
			a2.SalesPerson,
			a2.Requistioner,
			a2.Carrier,
			a2.Collect_Prepaid,
			a2.FobPoint,
			a2.Terms,
			a2.Currency,
			a2.Total,
			a2.Vendor_Cust,
			a2.SoldTo,
			a2.ShipTo,
			a2.Notes,
			a2.CarrierCode,
			c2.Name as SoldToName, 
			cd2.Name as ShipToName,
			concat(a2.InvoiceNo,' ',c2.Name,' ',cd2.Name,' ',a2.JobNumber) as FullSearch,
			a2.IsSubmitted,
			a2.SubmittedTo,
			a2.IsApproved,
			a2.IsShipped
			From [dbo].[ShippingBase] a2 
			left join [dbo].[VendorsShipTo]	c2	on c2.[Code] = a2.[SoldTo] 
			left join [dbo].[VendorsShipTo]	cd2	on cd2.[Code] = a2.[ShipTo]
			where a2.[Vendor_Cust] = 0
GO
/****** Object:  Table [dbo].[Materials]    Script Date: 2020-03-13 9:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Materials](
	[MaterialNames] [nvarchar](255) NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Materials] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[FilterMaterialsMerged]    Script Date: 2020-03-13 9:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create View [dbo].[FilterMaterialsMerged]
as

select distinct Material from [dbo].[Inventory]
where (isnull(Material, '') <> '' and Material <> '-')
union
  select [MaterialNames] from [dbo].[Materials]


GO
/****** Object:  View [dbo].[UnionPurchaseItems]    Script Date: 2020-03-13 9:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[UnionPurchaseItems]
as
select * from 
(select [ItemNumber],[Description],[FamilyCode],[Manufacturer],[ManufacturerItemNumber] from [SPM_Database].dbo.Inventory 
union 
select e.Item AS ItemNumber,
e.Des as Description,
e.Famille as FamilyCode,
e.Des4 as Manufacturer,
e.Des2 as ManufactureItemNumber
 from [SPMDB].[dbo].[Edb] e 
 where not exists (select 1 from [SPM_Database].dbo.Inventory i
					where i.ItemNumber = e.Item )) u
where  substring(ItemNumber, 1, 1)  NOT LIKE  '[0-9]%'
and isnumeric(substring(ItemNumber, 2, 5)) = 1
and LEN(ItemNumber) < 7
and FamilyCode in('ECC', 'ASEL','PCC','ASPN', 'PU','MPC')
GO
/****** Object:  Table [dbo].[UserActions]    Script Date: 2020-03-13 9:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserActions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[timeStamp] [datetime] NULL,
	[formName] [varchar](max) NULL,
	[ctrlName] [varchar](max) NULL,
	[eventName] [varchar](max) NULL,
	[value] [varchar](max) NULL,
	[UserName] [nvarchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Log]    Script Date: 2020-03-13 9:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Log](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NOT NULL,
	[Thread] [varchar](255) NOT NULL,
	[Level] [varchar](50) NOT NULL,
	[Logger] [varchar](255) NOT NULL,
	[Message] [varchar](4000) NOT NULL,
	[Exception] [varchar](2000) NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[UnionLogs]    Script Date: 2020-03-13 9:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO











CREATE view  [dbo].[UnionLogs]
as
SELECT [Date]
      ,[Logger] as loggerFrmName
      ,[Thread] as ctrlNameThread
      ,[Level] as EventLevel
      ,[Message] as MessageValue
      ,[Exception] as ExceptionUser
 from [SPM_Database].[dbo].[Log]
union ALL
select [timeStamp]
      ,[formName]
      ,[ctrlName] 
      ,[eventName]
      ,[value]
      ,[UserName]
 from [SPM_Database].[dbo].[UserActions]
GO
/****** Object:  View [dbo].[ManufactureItemDuplicatesView]    Script Date: 2020-03-13 9:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE view  [dbo].[ManufactureItemDuplicatesView]
as	
	
	select *  ,
	row_number() over (partition by ManufacturerItemNumber order by ItemNumber) as RNumber
	from [SPM_Database].[dbo].[UnionInventory] i 
	where ManufacturerItemNumber in (
	select ManufacturerItemNumber from (
		select ManufacturerItemNumber , 
		row_number() over (partition by ManufacturerItemNumber order by ManufacturerItemNumber) as RowNumber
		from [SPM_Database].[dbo].[UnionInventory]
		where (isnull(ManufacturerItemNumber, '') <> '' and ManufacturerItemNumber <> '-')
		) a
	where RowNumber > 1) 
GO
/****** Object:  Table [dbo].[spservicereports]    Script Date: 2020-03-13 9:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[spservicereports](
	[Title] [nvarchar](50) NULL,
	[ReportMapId] [nvarchar](50) NULL,
	[Report_Id] [nvarchar](50) NULL,
	[ProjectNo] [nvarchar](50) NULL,
	[RefJob] [nvarchar](50) NULL,
	[ProjectManager] [nvarchar](50) NULL,
	[Customer] [nvarchar](50) NULL,
	[Planloc] [nvarchar](max) NULL,
	[ContactName] [nvarchar](50) NULL,
	[Authorizedby] [nvarchar](50) NULL,
	[Equipment] [nvarchar](150) NULL,
	[Techname] [nvarchar](50) NULL,
	[DateCreated] [nvarchar](50) NULL,
	[FurtherActions] [nvarchar](max) NULL,
	[CustComments] [nvarchar](max) NULL,
	[CustRep] [nvarchar](50) NULL,
	[CustEmail] [nvarchar](50) NULL,
	[CustContact] [nvarchar](50) NULL,
	[Published] [nvarchar](50) NULL,
	[Signed] [nvarchar](50) NULL,
	[Uploadedby] [nvarchar](50) NULL,
	[Spare1] [varchar](max) NULL,
	[Spare2] [varchar](max) NULL,
	[Spare3] [varchar](max) NULL,
	[Spare4] [varchar](max) NULL,
	[Spare5] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[ServiceReports]    Script Date: 2020-03-13 9:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[ServiceReports]

as 
  SELECT Title AS ReportId
		 ,ProjectNo as [Job No]
		 ,RefJob
		 ,ProjectManager
		 ,Customer
		 ,Planloc as [Plant Location]
		 ,ContactName
		 ,Authorizedby
		 ,Equipment
		 ,Techname as [Tech Name]
		 ,DateCreated
		 ,concat(Title, ' ', ProjectNo, ' ', Customer, ' ', Planloc, ' ', Equipment) AS FullSearch		 	
		 FROM [SPM_Database].[dbo].[spservicereports]
GO
/****** Object:  View [dbo].[WorkOrderManagement]    Script Date: 2020-03-13 9:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[WorkOrderManagement]
AS
SELECT [Job]
      ,[WorkOrder]
      , [Product] AS AssyNo
      ,[Item]
      ,[Description1] AS Description
      ,[PlannedQuantity] AS Qty
      ,CONCAT(Job, ' ' ,Item, ' ',WorkOrder, ' ' ,Description1)  AS FullSearch
  FROM [SPMDB].[dbo].[vgJcoWorkOrder]
  WHERE LEN(Job)= 5 and isnumeric(substring(Job, 1, 5)) = 1
GO
/****** Object:  View [dbo].[WOInOutStatus]    Script Date: 2020-03-13 9:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




 CREATE VIEW  [dbo].[WOInOutStatus]
 as 
  SELECT 
    b.[WO],      
	a.Item,
	a.Description,
	a.Qty,
	a.Job,
	IIF(b.[InBuilt] = 1,'Yes','No') AS Inbuilt,
	IIF(b.Completed = 1,'Yes','No') as Completed,
	Id
FROM [SPM_Database].[dbo].[WOInOut] b
	INNER JOIN 
	[SPM_Database].[dbo].[WorkOrderManagement] a on a.WorkOrder = b.WO
GO
/****** Object:  View [dbo].[Carriers]    Script Date: 2020-03-13 9:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create View [dbo].[Carriers]
as
select Description1 from [SPMDB].dbo.dimCarriers
where Description1 != ''
GO
/****** Object:  View [dbo].[CostByJobBI]    Script Date: 2020-03-13 9:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE view [dbo].[CostByJobBI]
as
select
	D.PurchaseOrder,
	H.Buyer,
	H.BoughtFromVendorName,
	H.DatePurchase,
	D.Item,D.ItemDescription1,
	D.ItemDescription2,
	D.ItemDescription3,
	D.ItemDescription4,
	--D.QuantityOrdered as oldqtyordered,
	isnull(M.QtyOrigin,D.QuantityOrdered) as QuantityOrdered,
	ISNULL((M.QtyOrigin-M.QtyAllocated),D.QuantityReceived) as QuantityReceived,
	--D.QuantityReceived as oldqtyreceived,
	D.QuantityRejected,
	isnull(M.QtyAllocated,D.OpenQuantity) as OpenQuantity,
	--D.OpenQuantity as oldopenqty,
	D.PriceItem ,
	D.PurchaseUnit,
	isnull(ISNULL(M.job,S.JobCode),'Stock') as Job,
	isnull(isnull(M.ParentWorkOrder,P.WorkOrder),0) as WorkOrder,
	D.DateDelivery,
	ed.Famille,
	D.PriceItem * D.QuantityOrdered as total
from [SPMDB].[dbo].vgPoeDetail D 
left join [SPMDB].[dbo].vgPoeHeader H on D.PurchaseOrderHeaderLink=H.PurchaseOrder
left join  [SPMDB].[dbo].vgPoeAutomaticAllocationUponReceipt M on D.Link=M.PurchaseOrderDetailLink
left join [SPMDB].[dbo].vgPoeSubcontractingAssignment S on D.Link=S.PurchaseOrderDetailLink
left join [SPMDB].[dbo].vgJcoProductionTasks P on S.ProductionTasksLink=P.Link
left join [SPMDB].[dbo].Edb ed on D.Item=ed.Item
GO
/****** Object:  View [dbo].[JobBudgetBI]    Script Date: 2020-03-13 9:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE View  [dbo].[JobBudgetBI]

as

SELECT
		j.Job,
		j.Des as JobDescription,
		i.Item as ItemNo,
		i.Des as ItemDescription,
		ib.CalculatedAmount,
		ib.RevisedAmount,
		ib.UsedAmount,
		ib.EmpHours,
		cc.Code as Catergory,
		cc.Type as CostCatergoryType 
 
FROM	[SPM-Proto].[dbo].[tcItemBudget] ib

INNER JOIN [SPM-Proto].[dbo].[Edb] i ON i.ItemID = ib.ItemId
INNER JOIN [SPM-Proto].[dbo].[tcCostCategory] cc ON cc.Id = ib.CostCategoryId
INNER JOIN [SPM-Proto].[dbo].[Car] j ON j.Produit  = i.Item

GO
/****** Object:  View [dbo].[SPMConnectBOM]    Script Date: 2020-03-13 9:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[SPMConnectBOM]
AS
select a.* 
, eb2.Famille AS AssyFamily
, eb2.Des AS AssyDescription
, eb2.Des4 as AssyManufacturer
, eb2.Des2 as AssyManufacturerItemNumber
, eb2.Spec1 as AssySpare
from (
SELECT       bm.Item AS ItemNumber
		,  CONVERT(INT, bm.Qte) AS QuantityPerAssembly
		, eb.Des AS Description
		, eb.Famille AS ItemFamily
		, eb.Des4 AS Manufacturer
		, eb.Des2 AS ManufacturerItemNumber
		, eb.Spec1 AS Spare
		, bm.Produit AS AssyNo
FROM  [SPMDB].[dbo].[Bom] bm 
	INNER JOIN  [SPMDB].[dbo].[Edb] eb 
		ON bm.Item = eb.Item
)a
inner join SPMDB.dbo.Edb eb2 
	ON a.AssyNo = eb2.Item
						 
GO
/****** Object:  View [dbo].[SPMConnectBOMWorkOrder]    Script Date: 2020-03-13 9:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE view [dbo].[SPMConnectBOMWorkOrder]
as

select a.* 
, eb2.Famille AS AssyFamily
, eb2.Des AS AssyDescription
, eb2.Des4 as AssyManufacturer
, eb2.Des2 as AssyManufacturerItemNumber
, eb2.Spec1 as AssySpare
from (
SELECT   bm.Item AS ItemNumber
		,CONVERT(INT, bm.Qte_Ass) AS QuantityPerAssembly
		, eb.Des AS Description
		, eb.Famille
		, eb.Des4 AS Manufacturer
		, eb.Des2 as ManufacturerItemNumber
		, eb.Spec1 as Spare
		, bm.Type 
		, bm.Ordre as [Order]
		, bm.Wo as WorkOrderNo
		, bm.Woprec as AssyWo
		, bm.Piece as AssyNo		
FROM  [SPMDB].[dbo].[Mrpres] bm 
	INNER JOIN  [SPMDB].[dbo].[Edb] eb 
		ON bm.Item = eb.Item
)a
inner join SPMDB.dbo.Edb eb2 
	ON a.AssyNo = eb2.Item

GO
/****** Object:  View [dbo].[SPMConnectEstimate]    Script Date: 2020-03-13 9:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE view [dbo].[SPMConnectEstimate]
as
select a.* 
, eb2.Famille AS AssyFamily
, eb2.Des AS AssyDescription
, eb2.Des4 as AssyManufacturer
, eb2.Des2 as AssyManufacturerItemNumber
, eb2.Spec1 as AssySpare
from (
SELECT       bm.Item AS ItemNumber
		,  CONVERT(INT, bm.Qte) AS QuantityPerAssembly
		, eb.Des AS Description
		, eb.Famille AS ItemFamily
		, eb.Des4 AS Manufacturer
		, eb.Des2 AS ManufacturerItemNumber
		, eb.Spec1 AS Spare
		, bm.Produit AS AssyNo
		,bm.BomVersionId AS estid
FROM    [SPMDB].[dbo].[tcBomItemVersion] bm 
	INNER JOIN  [SPMDB].[dbo].[Edb] eb 
		ON bm.Item = eb.Item

)a
inner join SPMDB.dbo.Edb eb2 
	ON a.AssyNo = eb2.Item
						 



GO
/****** Object:  View [dbo].[SPMConnectWOBOM]    Script Date: 2020-03-13 9:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO









CREATE VIEW [dbo].[SPMConnectWOBOM]
AS
SELECT
  a.*,
  eb2.Famille AS AssyFamily,
  eb2.Des AS AssyDescription,
  eb2.Des4 AS AssyManufacturer,
  eb2.Des2 AS AssyManufacturerItemNumber,
  eb2.Spec1 AS AssySpare
FROM (SELECT
  bm.Job,
  bm.Woprec,
  bm.Wo,
  bm.Item AS ItemNumber,
  CONVERT(int, bm.Qte_Ass) AS QuantityPerAssembly,
  eb.Des AS Description,
  eb.Famille AS ItemFamily,
  eb.Des4 AS Manufacturer,
  eb.Des2 AS ManufacturerItemNumber,
  eb.Spec1 AS Spare,
  bm.Piece AS AssyNo
FROM [SPMDB].[dbo].[Mrpres] bm
INNER JOIN [SPMDB].[dbo].[Edb] eb
  ON bm.Item = eb.Item
WHERE bm.RML_Active = '1') a
INNER JOIN SPMDB.dbo.Edb eb2
  ON a.AssyNo = eb2.Item

GO
/****** Object:  View [dbo].[WorkOrders]    Script Date: 2020-03-13 9:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view  [dbo].[WorkOrders]
as
SELECT [Job]
      ,[WorkOrder]
      ,[ParentWorkOrder]
      ,[Product]
      ,[Item]
      ,[Description1]
      ,[Description2]
      ,[LEVEL]
      ,[JobType]
      ,[PlannedQuantity]
      ,[ProducedDate]
      ,[StartDate]
      ,[DeliveryDate]
      ,[CreateDate]
      ,[LastUpdate]
      ,[LastUser]
      ,[CustomerName]
      ,[QtyOfPrintedCopy]
      ,[Active]
      ,[WorkOrderStatus]
      ,[WorkOrderStatusLink]
      ,[FullSearch]
      ,[SalesOrderNumber]
  FROM [SPMDB].[dbo].[vgJcoWorkOrder]
GO
/****** Object:  View [dbo].[workordertemp]    Script Date: 2020-03-13 9:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[workordertemp]
as

SELECT       bm.ParentWorkOrderId 
		, bm.JobId 
		, eb.Job
		, eb.Code_Ope 
		, eb.Wo 
		,eb.Code_Id
		, eb.Des_Ope 
		,eb.Item 
		, bm.ChildWorkOrderId 
FROM  [SPMDB].[dbo].dimWorkOrderTreeView bm 
	INNER JOIN  [SPMDB].[dbo].Wodet eb 
		ON bm.ChildWorkOrderId = eb.Wo




GO
/****** Object:  Table [dbo].[Checkin]    Script Date: 2020-03-13 9:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Checkin](
	[Last Login] [varchar](50) NULL,
	[Application Running] [nvarchar](100) NULL,
	[User Name] [nvarchar](50) NULL,
	[Computer Name] [nvarchar](50) NULL,
	[Version] [nchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConnectParamaters]    Script Date: 2020-03-13 9:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConnectParamaters](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Parameter] [nvarchar](50) NULL,
	[Description] [nvarchar](max) NULL,
	[ParameterValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_ConnectParamaters] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 2020-03-13 9:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[Departments] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DrawingApprovals]    Script Date: 2020-03-13 9:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DrawingApprovals](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ItemNo] [varchar](10) NULL,
	[CheckedOn] [datetime] NULL,
	[CheckedBy] [varchar](50) NULL,
	[ApprovedOn] [datetime] NULL,
	[ApprovedBy] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ECR]    Script Date: 2020-03-13 9:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ECR](
	[ECRNo] [int] NOT NULL,
	[JobNo] [varchar](10) NULL,
	[JobName] [varchar](250) NULL,
	[SANo] [varchar](10) NULL,
	[SAName] [varchar](250) NULL,
	[PartNo] [varchar](250) NULL,
	[ProjectManager] [varchar](50) NULL,
	[Description] [varchar](max) NULL,
	[Comments] [varchar](max) NULL,
	[Status] [varchar](50) NULL,
	[CreatedBy] [varchar](30) NULL,
	[DateCreated] [datetime] NULL,
	[RequestedBy] [varchar](50) NULL,
	[DateLastSaved] [datetime] NULL,
	[LastSavedBy] [varchar](50) NULL,
	[Department] [varchar](50) NULL,
	[Submitted] [int] NOT NULL,
	[Submittedby] [varchar](50) NULL,
	[SubmittedOn] [datetime] NULL,
	[SupervisorId] [int] NOT NULL,
	[SupApproval] [int] NOT NULL,
	[SupApprovalBy] [varchar](50) NULL,
	[SupApprovedOn] [datetime] NULL,
	[SubmitToId] [int] NOT NULL,
	[Approved] [int] NOT NULL,
	[ApprovedBy] [varchar](50) NULL,
	[ApprovedOn] [datetime] NULL,
	[AssignedTo] [int] NOT NULL,
	[Completed] [int] NOT NULL,
	[CompletedBy] [varchar](50) NULL,
	[CompletedOn] [datetime] NULL,
 CONSTRAINT [PK_ECRBase] PRIMARY KEY CLUSTERED 
(
	[ECRNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeLogin]    Script Date: 2020-03-13 9:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeLogin](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmpId] [nchar](10) NULL,
	[UserName] [nchar](100) NULL,
	[Password] [nvarchar](max) NOT NULL,
	[EmpName] [varchar](50) NULL,
	[EmpLastname] [varchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FamilyCodes]    Script Date: 2020-03-13 9:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FamilyCodes](
	[FamilyCodes] [nvarchar](50) NULL,
	[Category] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GenBom]    Script Date: 2020-03-13 9:26:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GenBom](
	[Id] [nvarchar](max) NULL,
	[Product] [nvarchar](max) NULL,
	[Order] [nvarchar](max) NULL,
	[ItemCode] [nvarchar](max) NULL,
	[QuantityInConversionUnit] [nvarchar](max) NULL,
	[ConversionUnitCode] [nvarchar](max) NULL,
	[OptionType] [nvarchar](max) NULL,
	[QuantityPerAssembly] [nvarchar](max) NULL,
	[UnitCode] [nvarchar](max) NULL,
	[RejectPercentage] [nvarchar](max) NULL,
	[IsPhantom] [nvarchar](max) NULL,
	[IsGroupingWo] [nvarchar](max) NULL,
	[Reserved] [nvarchar](max) NULL,
	[Balloon] [nvarchar](max) NULL,
	[BomRoutingLink] [nvarchar](max) NULL,
	[BomRoutingLinkOrder] [nvarchar](max) NULL,
	[Description1] [nvarchar](max) NULL,
	[Note] [nvarchar](max) NULL,
	[LastUser] [nvarchar](max) NULL,
	[LastUpdate] [nvarchar](max) NULL,
	[CreationDate] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Item_CostRollup]    Script Date: 2020-03-13 9:26:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item_CostRollup](
	[ItemId] [nvarchar](50) NULL,
	[Cost] [money] NULL,
	[SalesPrice] [money] NULL,
	[Qty] [nchar](10) NULL,
	[Notes] [nvarchar](max) NULL,
	[Date] [datetime] NULL,
	[LastSavedBy] [nvarchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialReallocation]    Script Date: 2020-03-13 9:26:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialReallocation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceNo] [varchar](50) NOT NULL,
	[DateCreated] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[EmployeeId] [int] NULL,
	[EmployeeName] [varchar](50) NULL,
	[ItemId] [varchar](20) NULL,
	[Description] [varchar](150) NULL,
	[OEM] [varchar](100) NULL,
	[OEMItem] [varchar](100) NULL,
	[Qty] [int] NULL,
	[JobReq] [varchar](50) NULL,
	[WOReq] [varchar](50) NULL,
	[JobTaken] [varchar](50) NULL,
	[WOTaken] [varchar](50) NULL,
	[ApprovedId] [int] NULL,
	[ApprovedName] [varchar](50) NULL,
	[LastSavedBy] [varchar](50) NULL,
	[LastSavedOn] [datetime] NULL,
	[Notes] [varchar](max) NULL,
 CONSTRAINT [PK_MaterialReallocation] PRIMARY KEY CLUSTERED 
(
	[InvoiceNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Purchase_Order]    Script Date: 2020-03-13 9:26:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Purchase_Order](
	[Purchase Order Number] [nvarchar](255) NULL,
	[Supplier Number] [nvarchar](255) NULL,
	[PO Date] [datetime] NULL,
	[Inv Date] [datetime] NULL,
	[Due Date] [datetime] NULL,
	[Ship To Contact] [nvarchar](255) NULL,
	[Bill To Contact] [nvarchar](255) NULL,
	[Ordered By] [nvarchar](255) NULL,
	[Terms] [nvarchar](255) NULL,
	[FOB] [nvarchar](255) NULL,
	[Shipped Via] [nvarchar](255) NULL,
	[Ship Date] [datetime] NULL,
	[Approved by] [nvarchar](255) NULL,
	[Approved date] [datetime] NULL,
	[Tax1] [money] NULL,
	[Tax2] [money] NULL,
	[Freight] [money] NULL,
	[Freight Tax1] [bit] NOT NULL,
	[Freight Tax2] [bit] NOT NULL,
	[Other] [money] NULL,
	[Other Tax1] [bit] NOT NULL,
	[Other Tax2] [bit] NOT NULL,
	[Total] [money] NULL,
	[Received] [bit] NOT NULL,
	[Paid] [bit] NOT NULL,
	[Ship Customer Display] [float] NULL,
	[Bill Customer Display] [float] NULL,
	[Note] [nvarchar](max) NULL,
	[Label] [nvarchar](255) NULL,
	[Currency] [nvarchar](255) NULL,
	[Supplier Company] [nvarchar](255) NULL,
	[Supplier Name] [nvarchar](255) NULL,
	[Supplier Suite] [nvarchar](255) NULL,
	[Supplier Street] [nvarchar](255) NULL,
	[Supplier CityStZip] [nvarchar](255) NULL,
	[Supplier Country] [nvarchar](255) NULL,
	[Supplier Phone] [nvarchar](255) NULL,
	[Supplier Fax] [nvarchar](255) NULL,
	[Bill to Company] [nvarchar](255) NULL,
	[Bill To Contact Name] [nvarchar](255) NULL,
	[Bill to Suite] [nvarchar](255) NULL,
	[Bill to Street] [nvarchar](255) NULL,
	[Bill To City State Zip] [nvarchar](255) NULL,
	[Bill to Country] [nvarchar](255) NULL,
	[Bill to Phone] [nvarchar](255) NULL,
	[Bill to Fax] [nvarchar](255) NULL,
	[Ship to Company] [nvarchar](255) NULL,
	[Ship to Contact Name] [nvarchar](255) NULL,
	[Ship to Suite] [nvarchar](255) NULL,
	[Ship to Street] [nvarchar](255) NULL,
	[Ship to City State Zip] [nvarchar](255) NULL,
	[Ship to Country] [nvarchar](255) NULL,
	[Ship to Phone] [nvarchar](255) NULL,
	[Ship to Fax] [nvarchar](255) NULL,
	[Select] [bit] NOT NULL,
	[Confirmation Number] [nvarchar](255) NULL,
	[Label Company] [nvarchar](255) NULL,
	[Job and Subassembly Info] [nvarchar](255) NULL,
	[Tax1 Rate] [float] NULL,
	[Tax2 Rate] [float] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PurchaseReq]    Script Date: 2020-03-13 9:26:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseReq](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ReqNumber] [int] NOT NULL,
	[OrderId] [int] NULL,
	[Item] [nchar](10) NULL,
	[Qty] [int] NULL,
	[Description] [nvarchar](max) NULL,
	[Manufacturer] [nvarchar](max) NULL,
	[OEMItemNumber] [nvarchar](max) NULL,
	[Price] [money] NULL,
	[Notes] [nvarchar](max) NULL,
 CONSTRAINT [PK__Purchase__3214EC27C1B1F482] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuoteFilters]    Script Date: 2020-03-13 9:26:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuoteFilters](
	[Category] [nvarchar](255) NULL,
	[Rating] [nvarchar](255) NULL,
	[How Found] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShippingItems]    Script Date: 2020-03-13 9:26:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShippingItems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NULL,
	[Item] [varchar](10) NULL,
	[Description] [varchar](max) NULL,
	[Origin] [varchar](50) NULL,
	[TarriffCode] [varchar](150) NULL,
	[Qty] [int] NULL,
	[Cost] [money] NULL,
	[Total] [money] NULL,
	[InvoiceNo] [varchar](50) NULL,
 CONSTRAINT [PK_ShippingItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SPMJobsPath]    Script Date: 2020-03-13 9:26:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SPMJobsPath](
	[JobNo] [nvarchar](max) NULL,
	[BOMNo] [nvarchar](max) NULL,
	[Path] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[spserviceReportImages]    Script Date: 2020-03-13 9:26:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[spserviceReportImages](
	[ReportNo] [varchar](50) NULL,
	[FileName] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[spservicereporttasks]    Script Date: 2020-03-13 9:26:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[spservicereporttasks](
	[Title] [varchar](50) NULL,
	[ReporNo] [varchar](50) NULL,
	[Task_Id] [varchar](50) NULL,
	[ItemNo] [varchar](50) NULL,
	[Starttime] [varchar](50) NULL,
	[Endtime] [varchar](50) NULL,
	[Hours] [varchar](50) NULL,
	[WorkPerformed] [varchar](max) NULL,
	[Published] [varchar](50) NULL,
	[DateCreated] [varchar](50) NULL,
	[Uploadedby] [varchar](50) NULL,
	[Spare1] [varchar](max) NULL,
	[Spare2] [varchar](max) NULL,
	[Spare3] [varchar](max) NULL,
	[Spare4] [varchar](max) NULL,
	[Spare5] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserBlockNumbers]    Script Date: 2020-03-13 9:26:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserBlockNumbers](
	[UserName] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[ActiveBlockNumber] [nvarchar](50) NULL,
	[PreviousBlockNumber] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserHolding]    Script Date: 2020-03-13 9:26:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserHolding](
	[App] [varchar](50) NULL,
	[UserName] [varchar](50) NULL,
	[ItemId] [varchar](50) NULL,
	[CheckInDateTime] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WO_Tracking]    Script Date: 2020-03-13 9:26:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WO_Tracking](
	[WO] [int] NOT NULL,
	[Engin] [int] NOT NULL,
	[EngWho] [varchar](50) NULL,
	[EngWhen] [datetime] NULL,
	[Ctrlin] [int] NOT NULL,
	[CtrlWho] [varchar](50) NULL,
	[CtrlWhen] [datetime] NULL,
	[Prodin] [int] NOT NULL,
	[ProdinWho] [varchar](50) NULL,
	[ProdinWhen] [datetime] NULL,
	[Prodout] [int] NOT NULL,
	[ProdoutWho] [varchar](50) NULL,
	[ProdoutWhen] [datetime] NULL,
	[TimeInProd] [varchar](50) NULL,
	[Purin] [int] NOT NULL,
	[PurinWho] [varchar](50) NULL,
	[PurinWhen] [datetime] NULL,
	[Purout] [int] NOT NULL,
	[PuroutWho] [varchar](50) NULL,
	[PuroutWhen] [datetime] NULL,
	[TimeInPur] [varchar](50) NULL,
	[Cribin] [int] NOT NULL,
	[CribinWho] [varchar](50) NULL,
	[CribinWhen] [datetime] NULL,
	[Cribout] [int] NOT NULL,
	[CriboutWho] [varchar](50) NULL,
	[CriboutWhen] [datetime] NULL,
	[TimeInCrib] [varchar](50) NULL,
	[Status] [varchar](50) NULL,
	[TotalTimeSpent] [varchar](50) NULL,
 CONSTRAINT [PK_WO_Tracking] PRIMARY KEY CLUSTERED 
(
	[WO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ECR] ADD  CONSTRAINT [DF_ECRBase_Submitted]  DEFAULT ((0)) FOR [Submitted]
GO
ALTER TABLE [dbo].[ECR] ADD  CONSTRAINT [DF_ECR_SupervisorId]  DEFAULT ((0)) FOR [SupervisorId]
GO
ALTER TABLE [dbo].[ECR] ADD  CONSTRAINT [DF_ECRBase_SupApproval]  DEFAULT ((0)) FOR [SupApproval]
GO
ALTER TABLE [dbo].[ECR] ADD  CONSTRAINT [DF_ECR_SubmitToId]  DEFAULT ((0)) FOR [SubmitToId]
GO
ALTER TABLE [dbo].[ECR] ADD  CONSTRAINT [DF_ECRBase_Approved]  DEFAULT ((0)) FOR [Approved]
GO
ALTER TABLE [dbo].[ECR] ADD  CONSTRAINT [DF_ECR_AssignedTo]  DEFAULT ((0)) FOR [AssignedTo]
GO
ALTER TABLE [dbo].[ECR] ADD  CONSTRAINT [DF_ECRBase_Completed]  DEFAULT ((0)) FOR [Completed]
GO
ALTER TABLE [dbo].[EFTEmailTracker] ADD  CONSTRAINT [DF_EFTEmailTracker_EmailSent]  DEFAULT ((0)) FOR [EmailSent]
GO
ALTER TABLE [dbo].[ItemDependencies] ADD  CONSTRAINT [DF_ItemDependencies_Qty]  DEFAULT ((1)) FOR [Qty]
GO
ALTER TABLE [dbo].[ShippingBase] ADD  CONSTRAINT [DF_ShippingBase_IsSubmitted]  DEFAULT ((0)) FOR [IsSubmitted]
GO
ALTER TABLE [dbo].[ShippingBase] ADD  CONSTRAINT [DF_ShippingBase_SubmittedTo]  DEFAULT ((0)) FOR [SubmittedTo]
GO
ALTER TABLE [dbo].[ShippingBase] ADD  CONSTRAINT [DF_ShippingBase_IsApproved]  DEFAULT ((0)) FOR [IsApproved]
GO
ALTER TABLE [dbo].[ShippingBase] ADD  CONSTRAINT [DF_ShippingBase_IsShipped]  DEFAULT ((0)) FOR [IsShipped]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_Admin]  DEFAULT ((0)) FOR [Admin]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_Developer]  DEFAULT ((0)) FOR [Developer]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_Management]  DEFAULT ((0)) FOR [Management]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_Quote]  DEFAULT ((0)) FOR [Quote]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_PurchaseReq]  DEFAULT ((0)) FOR [PurchaseReq]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_PurchaseReqApproval]  DEFAULT ((0)) FOR [PurchaseReqApproval]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_PurchaseReqApproval2]  DEFAULT ((0)) FOR [PurchaseReqApproval2]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_PurchaseReqBuyer]  DEFAULT ((0)) FOR [PurchaseReqBuyer]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_PriceRight]  DEFAULT ((0)) FOR [PriceRight]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_Shipping]  DEFAULT ((0)) FOR [Shipping]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_ScanWo]  DEFAULT ((0)) FOR [WOScan]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_CribCheckout]  DEFAULT ((0)) FOR [CribCheckout]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_CribShort]  DEFAULT ((0)) FOR [CribShort]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_PurchaseReq1]  DEFAULT ((0)) FOR [ECR]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_PurchaseReqApproval1]  DEFAULT ((0)) FOR [ECRApproval]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_PurchaseReqApproval21]  DEFAULT ((0)) FOR [ECRApproval2]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_PurchaseReqBuyer1]  DEFAULT ((0)) FOR [ECRHandler]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_ECRSup]  DEFAULT ((0)) FOR [ECRSup]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_ItmDependencies]  DEFAULT ((0)) FOR [ItemDependencies]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_ReleaseLog]  DEFAULT ((0)) FOR [WORelease]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_ShippingManager]  DEFAULT ((0)) FOR [ShipSupervisor]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_ShipSup]  DEFAULT ((0)) FOR [ShipSup]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_Shipper]  DEFAULT ((0)) FOR [ShippingManager]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_CheckDrawing]  DEFAULT ((0)) FOR [CheckDrawing]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_ApproveDrawing]  DEFAULT ((0)) FOR [ApproveDrawing]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_ReadWhatsNew]  DEFAULT ((0)) FOR [ReadWhatsNew]
GO
ALTER TABLE [dbo].[WO_Tracking] ADD  CONSTRAINT [DF_WO_Tracking_ChkinEng]  DEFAULT ((0)) FOR [Engin]
GO
ALTER TABLE [dbo].[WO_Tracking] ADD  CONSTRAINT [DF_WO_Tracking_Ctlrin]  DEFAULT ((0)) FOR [Ctrlin]
GO
ALTER TABLE [dbo].[WO_Tracking] ADD  CONSTRAINT [DF_WO_Tracking_ChkinProd]  DEFAULT ((0)) FOR [Prodin]
GO
ALTER TABLE [dbo].[WO_Tracking] ADD  CONSTRAINT [DF_WO_Tracking_ChkoutProd]  DEFAULT ((0)) FOR [Prodout]
GO
ALTER TABLE [dbo].[WO_Tracking] ADD  CONSTRAINT [DF_WO_Tracking_TimeInProd]  DEFAULT ((0)) FOR [TimeInProd]
GO
ALTER TABLE [dbo].[WO_Tracking] ADD  CONSTRAINT [DF_WO_Tracking_ChkinPur]  DEFAULT ((0)) FOR [Purin]
GO
ALTER TABLE [dbo].[WO_Tracking] ADD  CONSTRAINT [DF_WO_Tracking_ChkoutPur]  DEFAULT ((0)) FOR [Purout]
GO
ALTER TABLE [dbo].[WO_Tracking] ADD  CONSTRAINT [DF_WO_Tracking_TimeInPur]  DEFAULT ((0)) FOR [TimeInPur]
GO
ALTER TABLE [dbo].[WO_Tracking] ADD  CONSTRAINT [DF_WO_Tracking_ChkinCrib]  DEFAULT ((0)) FOR [Cribin]
GO
ALTER TABLE [dbo].[WO_Tracking] ADD  CONSTRAINT [DF_WO_Tracking_ChkoutCrib]  DEFAULT ((0)) FOR [Cribout]
GO
ALTER TABLE [dbo].[WO_Tracking] ADD  CONSTRAINT [DF_WO_Tracking_TimeInCrib]  DEFAULT ((0)) FOR [TimeInCrib]
GO
ALTER TABLE [dbo].[WO_Tracking] ADD  CONSTRAINT [DF_WO_Tracking_TotalTimeSpent]  DEFAULT ((0)) FOR [TotalTimeSpent]
GO
ALTER TABLE [dbo].[WOInOut] ADD  CONSTRAINT [DF_WOInOut_Emp_idCheckOut]  DEFAULT ((0)) FOR [Emp_idCheckOut]
GO
ALTER TABLE [dbo].[WOInOut] ADD  CONSTRAINT [DF_WOInOut_Emp_idCheckIn]  DEFAULT ((0)) FOR [Emp_idCheckIn]
GO
ALTER TABLE [dbo].[WOInOut] ADD  CONSTRAINT [DF_WOInOut_CheckOutApprovedBy]  DEFAULT ((0)) FOR [CheckOutApprovedBy]
GO
ALTER TABLE [dbo].[WOInOut] ADD  CONSTRAINT [DF_WOInOut_CheckInApprovedBy]  DEFAULT ((0)) FOR [CheckInApprovedBy]
GO
ALTER TABLE [dbo].[WOInOut] ADD  CONSTRAINT [DF_WOInOut_InBuilt]  DEFAULT ((0)) FOR [InBuilt]
GO
ALTER TABLE [dbo].[WOInOut] ADD  CONSTRAINT [DF_WOInOut_Completed]  DEFAULT ((0)) FOR [Completed]
GO
ALTER TABLE [dbo].[WOReleaseDetails] ADD  CONSTRAINT [DF_WOReleaseDetails_ItemQty]  DEFAULT ((1)) FOR [ItemQty]
GO
ALTER TABLE [dbo].[WOReleaseDetails] ADD  CONSTRAINT [DF_WOReleaseDetails_IsRevised]  DEFAULT ((0)) FOR [IsRevised]
GO
ALTER TABLE [dbo].[PurchaseReq]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseReq_PurchaseReq] FOREIGN KEY([ReqNumber])
REFERENCES [dbo].[PurchaseReqBase] ([ReqNumber])
GO
ALTER TABLE [dbo].[PurchaseReq] CHECK CONSTRAINT [FK_PurchaseReq_PurchaseReq]
GO
ALTER TABLE [dbo].[ShippingItems]  WITH CHECK ADD  CONSTRAINT [FK_ShippingItems_ShippingBase] FOREIGN KEY([InvoiceNo])
REFERENCES [dbo].[ShippingBase] ([InvoiceNo])
GO
ALTER TABLE [dbo].[ShippingItems] CHECK CONSTRAINT [FK_ShippingItems_ShippingBase]
GO
ALTER TABLE [dbo].[WOInOut]  WITH CHECK ADD  CONSTRAINT [FK_WO] FOREIGN KEY([WO])
REFERENCES [dbo].[WO_Tracking] ([WO])
GO
ALTER TABLE [dbo].[WOInOut] CHECK CONSTRAINT [FK_WO]
GO
ALTER TABLE [dbo].[WOReleaseDetails]  WITH CHECK ADD  CONSTRAINT [FK_WOReleaseDetails_WOReleaseLog] FOREIGN KEY([RlogNo])
REFERENCES [dbo].[WOReleaseLog] ([RlogNo])
GO
ALTER TABLE [dbo].[WOReleaseDetails] CHECK CONSTRAINT [FK_WOReleaseDetails_WOReleaseLog]
GO
ALTER TABLE [dbo].[WOReleaseLog]  WITH CHECK ADD  CONSTRAINT [FK_WOReleaseLog_WOReleaseLog] FOREIGN KEY([RlogNo])
REFERENCES [dbo].[WOReleaseLog] ([RlogNo])
GO
ALTER TABLE [dbo].[WOReleaseLog] CHECK CONSTRAINT [FK_WOReleaseLog_WOReleaseLog]
GO
/****** Object:  StoredProcedure [dbo].[dbo_Checkin_0a354242-2ce4-40cd-b612-344aacc5d176_QueueActivationSender]    Script Date: 2020-03-13 9:26:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[dbo_Checkin_0a354242-2ce4-40cd-b612-344aacc5d176_QueueActivationSender] AS 
BEGIN 
    SET NOCOUNT ON;
    DECLARE @h AS UNIQUEIDENTIFIER;
    DECLARE @mt NVARCHAR(200);

    RECEIVE TOP(1) @h = conversation_handle, @mt = message_type_name FROM [dbo].[dbo_Checkin_0a354242-2ce4-40cd-b612-344aacc5d176_Sender];

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/EndDialog'
    BEGIN
        END CONVERSATION @h;
    END

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/DialogTimer' OR @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/Error'
    BEGIN 
        

        END CONVERSATION @h;

        DECLARE @conversation_handle UNIQUEIDENTIFIER;
        DECLARE @schema_id INT;
        SELECT @schema_id = schema_id FROM sys.schemas WITH (NOLOCK) WHERE name = N'dbo';

        
        IF EXISTS (SELECT * FROM sys.triggers WITH (NOLOCK) WHERE object_id = OBJECT_ID(N'[dbo].[tr_dbo_Checkin_0a354242-2ce4-40cd-b612-344aacc5d176_Sender]')) DROP TRIGGER [dbo].[tr_dbo_Checkin_0a354242-2ce4-40cd-b612-344aacc5d176_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_Checkin_0a354242-2ce4-40cd-b612-344aacc5d176_Sender') EXEC (N'ALTER QUEUE [dbo].[dbo_Checkin_0a354242-2ce4-40cd-b612-344aacc5d176_Sender] WITH ACTIVATION (STATUS = OFF)');

        
        SELECT conversation_handle INTO #Conversations FROM sys.conversation_endpoints WITH (NOLOCK) WHERE far_service LIKE N'dbo_Checkin_0a354242-2ce4-40cd-b612-344aacc5d176_%' ORDER BY is_initiator ASC;
        DECLARE conversation_cursor CURSOR FAST_FORWARD FOR SELECT conversation_handle FROM #Conversations;
        OPEN conversation_cursor;
        FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        WHILE @@FETCH_STATUS = 0 
        BEGIN
            END CONVERSATION @conversation_handle WITH CLEANUP;
            FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        END
        CLOSE conversation_cursor;
        DEALLOCATE conversation_cursor;
        DROP TABLE #Conversations;

        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_Checkin_0a354242-2ce4-40cd-b612-344aacc5d176_Receiver') DROP SERVICE [dbo_Checkin_0a354242-2ce4-40cd-b612-344aacc5d176_Receiver];
        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_Checkin_0a354242-2ce4-40cd-b612-344aacc5d176_Sender') DROP SERVICE [dbo_Checkin_0a354242-2ce4-40cd-b612-344aacc5d176_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_Checkin_0a354242-2ce4-40cd-b612-344aacc5d176_Receiver') DROP QUEUE [dbo].[dbo_Checkin_0a354242-2ce4-40cd-b612-344aacc5d176_Receiver];
        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_Checkin_0a354242-2ce4-40cd-b612-344aacc5d176_Sender') DROP QUEUE [dbo].[dbo_Checkin_0a354242-2ce4-40cd-b612-344aacc5d176_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_contracts WITH (NOLOCK) WHERE name = N'dbo_Checkin_0a354242-2ce4-40cd-b612-344aacc5d176') DROP CONTRACT [dbo_Checkin_0a354242-2ce4-40cd-b612-344aacc5d176];
        
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_Checkin_0a354242-2ce4-40cd-b612-344aacc5d176/StartMessage/Insert') DROP MESSAGE TYPE [dbo_Checkin_0a354242-2ce4-40cd-b612-344aacc5d176/StartMessage/Insert];
IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_Checkin_0a354242-2ce4-40cd-b612-344aacc5d176/StartMessage/Update') DROP MESSAGE TYPE [dbo_Checkin_0a354242-2ce4-40cd-b612-344aacc5d176/StartMessage/Update];
IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_Checkin_0a354242-2ce4-40cd-b612-344aacc5d176/StartMessage/Delete') DROP MESSAGE TYPE [dbo_Checkin_0a354242-2ce4-40cd-b612-344aacc5d176/StartMessage/Delete];
IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_Checkin_0a354242-2ce4-40cd-b612-344aacc5d176/Computer Name') DROP MESSAGE TYPE [dbo_Checkin_0a354242-2ce4-40cd-b612-344aacc5d176/Computer Name];
IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_Checkin_0a354242-2ce4-40cd-b612-344aacc5d176/User Name') DROP MESSAGE TYPE [dbo_Checkin_0a354242-2ce4-40cd-b612-344aacc5d176/User Name];
IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_Checkin_0a354242-2ce4-40cd-b612-344aacc5d176/EndMessage') DROP MESSAGE TYPE [dbo_Checkin_0a354242-2ce4-40cd-b612-344aacc5d176/EndMessage];

        
        IF EXISTS (SELECT * FROM sys.objects WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_Checkin_0a354242-2ce4-40cd-b612-344aacc5d176_QueueActivationSender') DROP PROCEDURE [dbo].[dbo_Checkin_0a354242-2ce4-40cd-b612-344aacc5d176_QueueActivationSender];

        
    END
END
GO
/****** Object:  StoredProcedure [dbo].[dbo_Checkin_1c84deb9-0b74-4733-a72d-a3ec8cf65fd9_QueueActivationSender]    Script Date: 2020-03-13 9:26:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[dbo_Checkin_1c84deb9-0b74-4733-a72d-a3ec8cf65fd9_QueueActivationSender] AS 
BEGIN 
    SET NOCOUNT ON;
    DECLARE @h AS UNIQUEIDENTIFIER;
    DECLARE @mt NVARCHAR(200);

    RECEIVE TOP(1) @h = conversation_handle, @mt = message_type_name FROM [dbo].[dbo_Checkin_1c84deb9-0b74-4733-a72d-a3ec8cf65fd9_Sender];

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/EndDialog'
    BEGIN
        END CONVERSATION @h;
    END

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/DialogTimer' OR @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/Error'
    BEGIN 
        

        END CONVERSATION @h;

        DECLARE @conversation_handle UNIQUEIDENTIFIER;
        DECLARE @schema_id INT;
        SELECT @schema_id = schema_id FROM sys.schemas WITH (NOLOCK) WHERE name = N'dbo';

        
        IF EXISTS (SELECT * FROM sys.triggers WITH (NOLOCK) WHERE object_id = OBJECT_ID(N'[dbo].[tr_dbo_Checkin_1c84deb9-0b74-4733-a72d-a3ec8cf65fd9_Sender]')) DROP TRIGGER [dbo].[tr_dbo_Checkin_1c84deb9-0b74-4733-a72d-a3ec8cf65fd9_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_Checkin_1c84deb9-0b74-4733-a72d-a3ec8cf65fd9_Sender') EXEC (N'ALTER QUEUE [dbo].[dbo_Checkin_1c84deb9-0b74-4733-a72d-a3ec8cf65fd9_Sender] WITH ACTIVATION (STATUS = OFF)');

        
        SELECT conversation_handle INTO #Conversations FROM sys.conversation_endpoints WITH (NOLOCK) WHERE far_service LIKE N'dbo_Checkin_1c84deb9-0b74-4733-a72d-a3ec8cf65fd9_%' ORDER BY is_initiator ASC;
        DECLARE conversation_cursor CURSOR FAST_FORWARD FOR SELECT conversation_handle FROM #Conversations;
        OPEN conversation_cursor;
        FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        WHILE @@FETCH_STATUS = 0 
        BEGIN
            END CONVERSATION @conversation_handle WITH CLEANUP;
            FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        END
        CLOSE conversation_cursor;
        DEALLOCATE conversation_cursor;
        DROP TABLE #Conversations;

        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_Checkin_1c84deb9-0b74-4733-a72d-a3ec8cf65fd9_Receiver') DROP SERVICE [dbo_Checkin_1c84deb9-0b74-4733-a72d-a3ec8cf65fd9_Receiver];
        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_Checkin_1c84deb9-0b74-4733-a72d-a3ec8cf65fd9_Sender') DROP SERVICE [dbo_Checkin_1c84deb9-0b74-4733-a72d-a3ec8cf65fd9_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_Checkin_1c84deb9-0b74-4733-a72d-a3ec8cf65fd9_Receiver') DROP QUEUE [dbo].[dbo_Checkin_1c84deb9-0b74-4733-a72d-a3ec8cf65fd9_Receiver];
        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_Checkin_1c84deb9-0b74-4733-a72d-a3ec8cf65fd9_Sender') DROP QUEUE [dbo].[dbo_Checkin_1c84deb9-0b74-4733-a72d-a3ec8cf65fd9_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_contracts WITH (NOLOCK) WHERE name = N'dbo_Checkin_1c84deb9-0b74-4733-a72d-a3ec8cf65fd9') DROP CONTRACT [dbo_Checkin_1c84deb9-0b74-4733-a72d-a3ec8cf65fd9];
        
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_Checkin_1c84deb9-0b74-4733-a72d-a3ec8cf65fd9/StartMessage/Insert') DROP MESSAGE TYPE [dbo_Checkin_1c84deb9-0b74-4733-a72d-a3ec8cf65fd9/StartMessage/Insert];
IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_Checkin_1c84deb9-0b74-4733-a72d-a3ec8cf65fd9/StartMessage/Update') DROP MESSAGE TYPE [dbo_Checkin_1c84deb9-0b74-4733-a72d-a3ec8cf65fd9/StartMessage/Update];
IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_Checkin_1c84deb9-0b74-4733-a72d-a3ec8cf65fd9/StartMessage/Delete') DROP MESSAGE TYPE [dbo_Checkin_1c84deb9-0b74-4733-a72d-a3ec8cf65fd9/StartMessage/Delete];
IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_Checkin_1c84deb9-0b74-4733-a72d-a3ec8cf65fd9/Computer Name') DROP MESSAGE TYPE [dbo_Checkin_1c84deb9-0b74-4733-a72d-a3ec8cf65fd9/Computer Name];
IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_Checkin_1c84deb9-0b74-4733-a72d-a3ec8cf65fd9/User Name') DROP MESSAGE TYPE [dbo_Checkin_1c84deb9-0b74-4733-a72d-a3ec8cf65fd9/User Name];
IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_Checkin_1c84deb9-0b74-4733-a72d-a3ec8cf65fd9/EndMessage') DROP MESSAGE TYPE [dbo_Checkin_1c84deb9-0b74-4733-a72d-a3ec8cf65fd9/EndMessage];

        
        IF EXISTS (SELECT * FROM sys.objects WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_Checkin_1c84deb9-0b74-4733-a72d-a3ec8cf65fd9_QueueActivationSender') DROP PROCEDURE [dbo].[dbo_Checkin_1c84deb9-0b74-4733-a72d-a3ec8cf65fd9_QueueActivationSender];

        
    END
END
GO
/****** Object:  StoredProcedure [dbo].[dbo_Checkin_21574ebe-3ca9-4528-8bd4-61c2cba8a343_QueueActivationSender]    Script Date: 2020-03-13 9:26:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[dbo_Checkin_21574ebe-3ca9-4528-8bd4-61c2cba8a343_QueueActivationSender] AS 
BEGIN 
    SET NOCOUNT ON;
    DECLARE @h AS UNIQUEIDENTIFIER;
    DECLARE @mt NVARCHAR(200);

    RECEIVE TOP(1) @h = conversation_handle, @mt = message_type_name FROM [dbo].[dbo_Checkin_21574ebe-3ca9-4528-8bd4-61c2cba8a343_Sender];

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/EndDialog'
    BEGIN
        END CONVERSATION @h;
    END

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/DialogTimer' OR @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/Error'
    BEGIN 
        

        END CONVERSATION @h;

        DECLARE @conversation_handle UNIQUEIDENTIFIER;
        DECLARE @schema_id INT;
        SELECT @schema_id = schema_id FROM sys.schemas WITH (NOLOCK) WHERE name = N'dbo';

        
        IF EXISTS (SELECT * FROM sys.triggers WITH (NOLOCK) WHERE object_id = OBJECT_ID(N'[dbo].[tr_dbo_Checkin_21574ebe-3ca9-4528-8bd4-61c2cba8a343_Sender]')) DROP TRIGGER [dbo].[tr_dbo_Checkin_21574ebe-3ca9-4528-8bd4-61c2cba8a343_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_Checkin_21574ebe-3ca9-4528-8bd4-61c2cba8a343_Sender') EXEC (N'ALTER QUEUE [dbo].[dbo_Checkin_21574ebe-3ca9-4528-8bd4-61c2cba8a343_Sender] WITH ACTIVATION (STATUS = OFF)');

        
        SELECT conversation_handle INTO #Conversations FROM sys.conversation_endpoints WITH (NOLOCK) WHERE far_service LIKE N'dbo_Checkin_21574ebe-3ca9-4528-8bd4-61c2cba8a343_%' ORDER BY is_initiator ASC;
        DECLARE conversation_cursor CURSOR FAST_FORWARD FOR SELECT conversation_handle FROM #Conversations;
        OPEN conversation_cursor;
        FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        WHILE @@FETCH_STATUS = 0 
        BEGIN
            END CONVERSATION @conversation_handle WITH CLEANUP;
            FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        END
        CLOSE conversation_cursor;
        DEALLOCATE conversation_cursor;
        DROP TABLE #Conversations;

        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_Checkin_21574ebe-3ca9-4528-8bd4-61c2cba8a343_Receiver') DROP SERVICE [dbo_Checkin_21574ebe-3ca9-4528-8bd4-61c2cba8a343_Receiver];
        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_Checkin_21574ebe-3ca9-4528-8bd4-61c2cba8a343_Sender') DROP SERVICE [dbo_Checkin_21574ebe-3ca9-4528-8bd4-61c2cba8a343_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_Checkin_21574ebe-3ca9-4528-8bd4-61c2cba8a343_Receiver') DROP QUEUE [dbo].[dbo_Checkin_21574ebe-3ca9-4528-8bd4-61c2cba8a343_Receiver];
        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_Checkin_21574ebe-3ca9-4528-8bd4-61c2cba8a343_Sender') DROP QUEUE [dbo].[dbo_Checkin_21574ebe-3ca9-4528-8bd4-61c2cba8a343_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_contracts WITH (NOLOCK) WHERE name = N'dbo_Checkin_21574ebe-3ca9-4528-8bd4-61c2cba8a343') DROP CONTRACT [dbo_Checkin_21574ebe-3ca9-4528-8bd4-61c2cba8a343];
        
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_Checkin_21574ebe-3ca9-4528-8bd4-61c2cba8a343/StartMessage/Insert') DROP MESSAGE TYPE [dbo_Checkin_21574ebe-3ca9-4528-8bd4-61c2cba8a343/StartMessage/Insert];
IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_Checkin_21574ebe-3ca9-4528-8bd4-61c2cba8a343/StartMessage/Update') DROP MESSAGE TYPE [dbo_Checkin_21574ebe-3ca9-4528-8bd4-61c2cba8a343/StartMessage/Update];
IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_Checkin_21574ebe-3ca9-4528-8bd4-61c2cba8a343/StartMessage/Delete') DROP MESSAGE TYPE [dbo_Checkin_21574ebe-3ca9-4528-8bd4-61c2cba8a343/StartMessage/Delete];
IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_Checkin_21574ebe-3ca9-4528-8bd4-61c2cba8a343/Computer Name') DROP MESSAGE TYPE [dbo_Checkin_21574ebe-3ca9-4528-8bd4-61c2cba8a343/Computer Name];
IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_Checkin_21574ebe-3ca9-4528-8bd4-61c2cba8a343/User Name') DROP MESSAGE TYPE [dbo_Checkin_21574ebe-3ca9-4528-8bd4-61c2cba8a343/User Name];
IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_Checkin_21574ebe-3ca9-4528-8bd4-61c2cba8a343/EndMessage') DROP MESSAGE TYPE [dbo_Checkin_21574ebe-3ca9-4528-8bd4-61c2cba8a343/EndMessage];

        
        IF EXISTS (SELECT * FROM sys.objects WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_Checkin_21574ebe-3ca9-4528-8bd4-61c2cba8a343_QueueActivationSender') DROP PROCEDURE [dbo].[dbo_Checkin_21574ebe-3ca9-4528-8bd4-61c2cba8a343_QueueActivationSender];

        
    END
END
GO
/****** Object:  StoredProcedure [dbo].[dbo_Checkin_309b3fd4-5842-46ef-9542-c28adcb61488_QueueActivationSender]    Script Date: 2020-03-13 9:26:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[dbo_Checkin_309b3fd4-5842-46ef-9542-c28adcb61488_QueueActivationSender] AS 
BEGIN 
    SET NOCOUNT ON;
    DECLARE @h AS UNIQUEIDENTIFIER;
    DECLARE @mt NVARCHAR(200);

    RECEIVE TOP(1) @h = conversation_handle, @mt = message_type_name FROM [dbo].[dbo_Checkin_309b3fd4-5842-46ef-9542-c28adcb61488_Sender];

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/EndDialog'
    BEGIN
        END CONVERSATION @h;
    END

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/DialogTimer' OR @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/Error'
    BEGIN 
        

        END CONVERSATION @h;

        DECLARE @conversation_handle UNIQUEIDENTIFIER;
        DECLARE @schema_id INT;
        SELECT @schema_id = schema_id FROM sys.schemas WITH (NOLOCK) WHERE name = N'dbo';

        
        IF EXISTS (SELECT * FROM sys.triggers WITH (NOLOCK) WHERE object_id = OBJECT_ID(N'[dbo].[tr_dbo_Checkin_309b3fd4-5842-46ef-9542-c28adcb61488_Sender]')) DROP TRIGGER [dbo].[tr_dbo_Checkin_309b3fd4-5842-46ef-9542-c28adcb61488_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_Checkin_309b3fd4-5842-46ef-9542-c28adcb61488_Sender') EXEC (N'ALTER QUEUE [dbo].[dbo_Checkin_309b3fd4-5842-46ef-9542-c28adcb61488_Sender] WITH ACTIVATION (STATUS = OFF)');

        
        SELECT conversation_handle INTO #Conversations FROM sys.conversation_endpoints WITH (NOLOCK) WHERE far_service LIKE N'dbo_Checkin_309b3fd4-5842-46ef-9542-c28adcb61488_%' ORDER BY is_initiator ASC;
        DECLARE conversation_cursor CURSOR FAST_FORWARD FOR SELECT conversation_handle FROM #Conversations;
        OPEN conversation_cursor;
        FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        WHILE @@FETCH_STATUS = 0 
        BEGIN
            END CONVERSATION @conversation_handle WITH CLEANUP;
            FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        END
        CLOSE conversation_cursor;
        DEALLOCATE conversation_cursor;
        DROP TABLE #Conversations;

        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_Checkin_309b3fd4-5842-46ef-9542-c28adcb61488_Receiver') DROP SERVICE [dbo_Checkin_309b3fd4-5842-46ef-9542-c28adcb61488_Receiver];
        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_Checkin_309b3fd4-5842-46ef-9542-c28adcb61488_Sender') DROP SERVICE [dbo_Checkin_309b3fd4-5842-46ef-9542-c28adcb61488_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_Checkin_309b3fd4-5842-46ef-9542-c28adcb61488_Receiver') DROP QUEUE [dbo].[dbo_Checkin_309b3fd4-5842-46ef-9542-c28adcb61488_Receiver];
        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_Checkin_309b3fd4-5842-46ef-9542-c28adcb61488_Sender') DROP QUEUE [dbo].[dbo_Checkin_309b3fd4-5842-46ef-9542-c28adcb61488_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_contracts WITH (NOLOCK) WHERE name = N'dbo_Checkin_309b3fd4-5842-46ef-9542-c28adcb61488') DROP CONTRACT [dbo_Checkin_309b3fd4-5842-46ef-9542-c28adcb61488];
        
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_Checkin_309b3fd4-5842-46ef-9542-c28adcb61488/StartMessage/Insert') DROP MESSAGE TYPE [dbo_Checkin_309b3fd4-5842-46ef-9542-c28adcb61488/StartMessage/Insert];
IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_Checkin_309b3fd4-5842-46ef-9542-c28adcb61488/StartMessage/Update') DROP MESSAGE TYPE [dbo_Checkin_309b3fd4-5842-46ef-9542-c28adcb61488/StartMessage/Update];
IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_Checkin_309b3fd4-5842-46ef-9542-c28adcb61488/StartMessage/Delete') DROP MESSAGE TYPE [dbo_Checkin_309b3fd4-5842-46ef-9542-c28adcb61488/StartMessage/Delete];
IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_Checkin_309b3fd4-5842-46ef-9542-c28adcb61488/Computer Name') DROP MESSAGE TYPE [dbo_Checkin_309b3fd4-5842-46ef-9542-c28adcb61488/Computer Name];
IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_Checkin_309b3fd4-5842-46ef-9542-c28adcb61488/User Name') DROP MESSAGE TYPE [dbo_Checkin_309b3fd4-5842-46ef-9542-c28adcb61488/User Name];
IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_Checkin_309b3fd4-5842-46ef-9542-c28adcb61488/EndMessage') DROP MESSAGE TYPE [dbo_Checkin_309b3fd4-5842-46ef-9542-c28adcb61488/EndMessage];

        
        IF EXISTS (SELECT * FROM sys.objects WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_Checkin_309b3fd4-5842-46ef-9542-c28adcb61488_QueueActivationSender') DROP PROCEDURE [dbo].[dbo_Checkin_309b3fd4-5842-46ef-9542-c28adcb61488_QueueActivationSender];

        
    END
END
GO
/****** Object:  StoredProcedure [dbo].[dbo_Checkin_56072cf0-7b21-4797-9979-30becd6137ea_QueueActivationSender]    Script Date: 2020-03-13 9:26:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[dbo_Checkin_56072cf0-7b21-4797-9979-30becd6137ea_QueueActivationSender] AS 
BEGIN 
    SET NOCOUNT ON;
    DECLARE @h AS UNIQUEIDENTIFIER;
    DECLARE @mt NVARCHAR(200);

    RECEIVE TOP(1) @h = conversation_handle, @mt = message_type_name FROM [dbo].[dbo_Checkin_56072cf0-7b21-4797-9979-30becd6137ea_Sender];

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/EndDialog'
    BEGIN
        END CONVERSATION @h;
    END

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/DialogTimer' OR @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/Error'
    BEGIN 
        

        END CONVERSATION @h;

        DECLARE @conversation_handle UNIQUEIDENTIFIER;
        DECLARE @schema_id INT;
        SELECT @schema_id = schema_id FROM sys.schemas WITH (NOLOCK) WHERE name = N'dbo';

        
        IF EXISTS (SELECT * FROM sys.triggers WITH (NOLOCK) WHERE object_id = OBJECT_ID(N'[dbo].[tr_dbo_Checkin_56072cf0-7b21-4797-9979-30becd6137ea_Sender]')) DROP TRIGGER [dbo].[tr_dbo_Checkin_56072cf0-7b21-4797-9979-30becd6137ea_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_Checkin_56072cf0-7b21-4797-9979-30becd6137ea_Sender') EXEC (N'ALTER QUEUE [dbo].[dbo_Checkin_56072cf0-7b21-4797-9979-30becd6137ea_Sender] WITH ACTIVATION (STATUS = OFF)');

        
        SELECT conversation_handle INTO #Conversations FROM sys.conversation_endpoints WITH (NOLOCK) WHERE far_service LIKE N'dbo_Checkin_56072cf0-7b21-4797-9979-30becd6137ea_%' ORDER BY is_initiator ASC;
        DECLARE conversation_cursor CURSOR FAST_FORWARD FOR SELECT conversation_handle FROM #Conversations;
        OPEN conversation_cursor;
        FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        WHILE @@FETCH_STATUS = 0 
        BEGIN
            END CONVERSATION @conversation_handle WITH CLEANUP;
            FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        END
        CLOSE conversation_cursor;
        DEALLOCATE conversation_cursor;
        DROP TABLE #Conversations;

        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_Checkin_56072cf0-7b21-4797-9979-30becd6137ea_Receiver') DROP SERVICE [dbo_Checkin_56072cf0-7b21-4797-9979-30becd6137ea_Receiver];
        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_Checkin_56072cf0-7b21-4797-9979-30becd6137ea_Sender') DROP SERVICE [dbo_Checkin_56072cf0-7b21-4797-9979-30becd6137ea_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_Checkin_56072cf0-7b21-4797-9979-30becd6137ea_Receiver') DROP QUEUE [dbo].[dbo_Checkin_56072cf0-7b21-4797-9979-30becd6137ea_Receiver];
        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_Checkin_56072cf0-7b21-4797-9979-30becd6137ea_Sender') DROP QUEUE [dbo].[dbo_Checkin_56072cf0-7b21-4797-9979-30becd6137ea_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_contracts WITH (NOLOCK) WHERE name = N'dbo_Checkin_56072cf0-7b21-4797-9979-30becd6137ea') DROP CONTRACT [dbo_Checkin_56072cf0-7b21-4797-9979-30becd6137ea];
        
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_Checkin_56072cf0-7b21-4797-9979-30becd6137ea/StartMessage/Insert') DROP MESSAGE TYPE [dbo_Checkin_56072cf0-7b21-4797-9979-30becd6137ea/StartMessage/Insert];
IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_Checkin_56072cf0-7b21-4797-9979-30becd6137ea/StartMessage/Update') DROP MESSAGE TYPE [dbo_Checkin_56072cf0-7b21-4797-9979-30becd6137ea/StartMessage/Update];
IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_Checkin_56072cf0-7b21-4797-9979-30becd6137ea/StartMessage/Delete') DROP MESSAGE TYPE [dbo_Checkin_56072cf0-7b21-4797-9979-30becd6137ea/StartMessage/Delete];
IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_Checkin_56072cf0-7b21-4797-9979-30becd6137ea/Computer Name') DROP MESSAGE TYPE [dbo_Checkin_56072cf0-7b21-4797-9979-30becd6137ea/Computer Name];
IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_Checkin_56072cf0-7b21-4797-9979-30becd6137ea/User Name') DROP MESSAGE TYPE [dbo_Checkin_56072cf0-7b21-4797-9979-30becd6137ea/User Name];
IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_Checkin_56072cf0-7b21-4797-9979-30becd6137ea/EndMessage') DROP MESSAGE TYPE [dbo_Checkin_56072cf0-7b21-4797-9979-30becd6137ea/EndMessage];

        
        IF EXISTS (SELECT * FROM sys.objects WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_Checkin_56072cf0-7b21-4797-9979-30becd6137ea_QueueActivationSender') DROP PROCEDURE [dbo].[dbo_Checkin_56072cf0-7b21-4797-9979-30becd6137ea_QueueActivationSender];

        
    END
END
GO
/****** Object:  StoredProcedure [dbo].[dbo_Checkin_59d95ec9-2e0d-48f6-902d-11249b05c74b_QueueActivationSender]    Script Date: 2020-03-13 9:26:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[dbo_Checkin_59d95ec9-2e0d-48f6-902d-11249b05c74b_QueueActivationSender] AS 
BEGIN 
    SET NOCOUNT ON;
    DECLARE @h AS UNIQUEIDENTIFIER;
    DECLARE @mt NVARCHAR(200);

    RECEIVE TOP(1) @h = conversation_handle, @mt = message_type_name FROM [dbo].[dbo_Checkin_59d95ec9-2e0d-48f6-902d-11249b05c74b_Sender];

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/EndDialog'
    BEGIN
        END CONVERSATION @h;
    END

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/DialogTimer' OR @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/Error'
    BEGIN 
        

        END CONVERSATION @h;

        DECLARE @conversation_handle UNIQUEIDENTIFIER;
        DECLARE @schema_id INT;
        SELECT @schema_id = schema_id FROM sys.schemas WITH (NOLOCK) WHERE name = N'dbo';

        
        IF EXISTS (SELECT * FROM sys.triggers WITH (NOLOCK) WHERE object_id = OBJECT_ID(N'[dbo].[tr_dbo_Checkin_59d95ec9-2e0d-48f6-902d-11249b05c74b_Sender]')) DROP TRIGGER [dbo].[tr_dbo_Checkin_59d95ec9-2e0d-48f6-902d-11249b05c74b_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_Checkin_59d95ec9-2e0d-48f6-902d-11249b05c74b_Sender') EXEC (N'ALTER QUEUE [dbo].[dbo_Checkin_59d95ec9-2e0d-48f6-902d-11249b05c74b_Sender] WITH ACTIVATION (STATUS = OFF)');

        
        SELECT conversation_handle INTO #Conversations FROM sys.conversation_endpoints WITH (NOLOCK) WHERE far_service LIKE N'dbo_Checkin_59d95ec9-2e0d-48f6-902d-11249b05c74b_%' ORDER BY is_initiator ASC;
        DECLARE conversation_cursor CURSOR FAST_FORWARD FOR SELECT conversation_handle FROM #Conversations;
        OPEN conversation_cursor;
        FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        WHILE @@FETCH_STATUS = 0 
        BEGIN
            END CONVERSATION @conversation_handle WITH CLEANUP;
            FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        END
        CLOSE conversation_cursor;
        DEALLOCATE conversation_cursor;
        DROP TABLE #Conversations;

        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_Checkin_59d95ec9-2e0d-48f6-902d-11249b05c74b_Receiver') DROP SERVICE [dbo_Checkin_59d95ec9-2e0d-48f6-902d-11249b05c74b_Receiver];
        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_Checkin_59d95ec9-2e0d-48f6-902d-11249b05c74b_Sender') DROP SERVICE [dbo_Checkin_59d95ec9-2e0d-48f6-902d-11249b05c74b_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_Checkin_59d95ec9-2e0d-48f6-902d-11249b05c74b_Receiver') DROP QUEUE [dbo].[dbo_Checkin_59d95ec9-2e0d-48f6-902d-11249b05c74b_Receiver];
        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_Checkin_59d95ec9-2e0d-48f6-902d-11249b05c74b_Sender') DROP QUEUE [dbo].[dbo_Checkin_59d95ec9-2e0d-48f6-902d-11249b05c74b_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_contracts WITH (NOLOCK) WHERE name = N'dbo_Checkin_59d95ec9-2e0d-48f6-902d-11249b05c74b') DROP CONTRACT [dbo_Checkin_59d95ec9-2e0d-48f6-902d-11249b05c74b];
        
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_Checkin_59d95ec9-2e0d-48f6-902d-11249b05c74b/StartMessage/Insert') DROP MESSAGE TYPE [dbo_Checkin_59d95ec9-2e0d-48f6-902d-11249b05c74b/StartMessage/Insert];
IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_Checkin_59d95ec9-2e0d-48f6-902d-11249b05c74b/StartMessage/Update') DROP MESSAGE TYPE [dbo_Checkin_59d95ec9-2e0d-48f6-902d-11249b05c74b/StartMessage/Update];
IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_Checkin_59d95ec9-2e0d-48f6-902d-11249b05c74b/StartMessage/Delete') DROP MESSAGE TYPE [dbo_Checkin_59d95ec9-2e0d-48f6-902d-11249b05c74b/StartMessage/Delete];
IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_Checkin_59d95ec9-2e0d-48f6-902d-11249b05c74b/Computer Name') DROP MESSAGE TYPE [dbo_Checkin_59d95ec9-2e0d-48f6-902d-11249b05c74b/Computer Name];
IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_Checkin_59d95ec9-2e0d-48f6-902d-11249b05c74b/User Name') DROP MESSAGE TYPE [dbo_Checkin_59d95ec9-2e0d-48f6-902d-11249b05c74b/User Name];
IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_Checkin_59d95ec9-2e0d-48f6-902d-11249b05c74b/EndMessage') DROP MESSAGE TYPE [dbo_Checkin_59d95ec9-2e0d-48f6-902d-11249b05c74b/EndMessage];

        
        IF EXISTS (SELECT * FROM sys.objects WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_Checkin_59d95ec9-2e0d-48f6-902d-11249b05c74b_QueueActivationSender') DROP PROCEDURE [dbo].[dbo_Checkin_59d95ec9-2e0d-48f6-902d-11249b05c74b_QueueActivationSender];

        
    END
END
GO
/****** Object:  StoredProcedure [dbo].[dbo_Checkin_68fb4600-5f2d-4921-8376-3f4f0adee754_QueueActivationSender]    Script Date: 2020-03-13 9:26:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[dbo_Checkin_68fb4600-5f2d-4921-8376-3f4f0adee754_QueueActivationSender] AS 
BEGIN 
    SET NOCOUNT ON;
    DECLARE @h AS UNIQUEIDENTIFIER;
    DECLARE @mt NVARCHAR(200);

    RECEIVE TOP(1) @h = conversation_handle, @mt = message_type_name FROM [dbo].[dbo_Checkin_68fb4600-5f2d-4921-8376-3f4f0adee754_Sender];

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/EndDialog'
    BEGIN
        END CONVERSATION @h;
    END

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/DialogTimer' OR @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/Error'
    BEGIN 
        

        END CONVERSATION @h;

        DECLARE @conversation_handle UNIQUEIDENTIFIER;
        DECLARE @schema_id INT;
        SELECT @schema_id = schema_id FROM sys.schemas WITH (NOLOCK) WHERE name = N'dbo';

        
        IF EXISTS (SELECT * FROM sys.triggers WITH (NOLOCK) WHERE object_id = OBJECT_ID(N'[dbo].[tr_dbo_Checkin_68fb4600-5f2d-4921-8376-3f4f0adee754_Sender]')) DROP TRIGGER [dbo].[tr_dbo_Checkin_68fb4600-5f2d-4921-8376-3f4f0adee754_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_Checkin_68fb4600-5f2d-4921-8376-3f4f0adee754_Sender') EXEC (N'ALTER QUEUE [dbo].[dbo_Checkin_68fb4600-5f2d-4921-8376-3f4f0adee754_Sender] WITH ACTIVATION (STATUS = OFF)');

        
        SELECT conversation_handle INTO #Conversations FROM sys.conversation_endpoints WITH (NOLOCK) WHERE far_service LIKE N'dbo_Checkin_68fb4600-5f2d-4921-8376-3f4f0adee754_%' ORDER BY is_initiator ASC;
        DECLARE conversation_cursor CURSOR FAST_FORWARD FOR SELECT conversation_handle FROM #Conversations;
        OPEN conversation_cursor;
        FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        WHILE @@FETCH_STATUS = 0 
        BEGIN
            END CONVERSATION @conversation_handle WITH CLEANUP;
            FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        END
        CLOSE conversation_cursor;
        DEALLOCATE conversation_cursor;
        DROP TABLE #Conversations;

        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_Checkin_68fb4600-5f2d-4921-8376-3f4f0adee754_Receiver') DROP SERVICE [dbo_Checkin_68fb4600-5f2d-4921-8376-3f4f0adee754_Receiver];
        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_Checkin_68fb4600-5f2d-4921-8376-3f4f0adee754_Sender') DROP SERVICE [dbo_Checkin_68fb4600-5f2d-4921-8376-3f4f0adee754_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_Checkin_68fb4600-5f2d-4921-8376-3f4f0adee754_Receiver') DROP QUEUE [dbo].[dbo_Checkin_68fb4600-5f2d-4921-8376-3f4f0adee754_Receiver];
        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_Checkin_68fb4600-5f2d-4921-8376-3f4f0adee754_Sender') DROP QUEUE [dbo].[dbo_Checkin_68fb4600-5f2d-4921-8376-3f4f0adee754_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_contracts WITH (NOLOCK) WHERE name = N'dbo_Checkin_68fb4600-5f2d-4921-8376-3f4f0adee754') DROP CONTRACT [dbo_Checkin_68fb4600-5f2d-4921-8376-3f4f0adee754];
        
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_Checkin_68fb4600-5f2d-4921-8376-3f4f0adee754/StartMessage/Insert') DROP MESSAGE TYPE [dbo_Checkin_68fb4600-5f2d-4921-8376-3f4f0adee754/StartMessage/Insert];
IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_Checkin_68fb4600-5f2d-4921-8376-3f4f0adee754/StartMessage/Update') DROP MESSAGE TYPE [dbo_Checkin_68fb4600-5f2d-4921-8376-3f4f0adee754/StartMessage/Update];
IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_Checkin_68fb4600-5f2d-4921-8376-3f4f0adee754/StartMessage/Delete') DROP MESSAGE TYPE [dbo_Checkin_68fb4600-5f2d-4921-8376-3f4f0adee754/StartMessage/Delete];
IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_Checkin_68fb4600-5f2d-4921-8376-3f4f0adee754/Computer Name') DROP MESSAGE TYPE [dbo_Checkin_68fb4600-5f2d-4921-8376-3f4f0adee754/Computer Name];
IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_Checkin_68fb4600-5f2d-4921-8376-3f4f0adee754/User Name') DROP MESSAGE TYPE [dbo_Checkin_68fb4600-5f2d-4921-8376-3f4f0adee754/User Name];
IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_Checkin_68fb4600-5f2d-4921-8376-3f4f0adee754/EndMessage') DROP MESSAGE TYPE [dbo_Checkin_68fb4600-5f2d-4921-8376-3f4f0adee754/EndMessage];

        
        IF EXISTS (SELECT * FROM sys.objects WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_Checkin_68fb4600-5f2d-4921-8376-3f4f0adee754_QueueActivationSender') DROP PROCEDURE [dbo].[dbo_Checkin_68fb4600-5f2d-4921-8376-3f4f0adee754_QueueActivationSender];

        
    END
END
GO
/****** Object:  StoredProcedure [dbo].[dbo_Checkin_9970dfbe-87c7-4beb-bf53-fbfe9e3c71d3_QueueActivationSender]    Script Date: 2020-03-13 9:26:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[dbo_Checkin_9970dfbe-87c7-4beb-bf53-fbfe9e3c71d3_QueueActivationSender] AS 
BEGIN 
    SET NOCOUNT ON;
    DECLARE @h AS UNIQUEIDENTIFIER;
    DECLARE @mt NVARCHAR(200);

    RECEIVE TOP(1) @h = conversation_handle, @mt = message_type_name FROM [dbo].[dbo_Checkin_9970dfbe-87c7-4beb-bf53-fbfe9e3c71d3_Sender];

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/EndDialog'
    BEGIN
        END CONVERSATION @h;
    END

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/DialogTimer' OR @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/Error'
    BEGIN 
        

        END CONVERSATION @h;

        DECLARE @conversation_handle UNIQUEIDENTIFIER;
        DECLARE @schema_id INT;
        SELECT @schema_id = schema_id FROM sys.schemas WITH (NOLOCK) WHERE name = N'dbo';

        
        IF EXISTS (SELECT * FROM sys.triggers WITH (NOLOCK) WHERE object_id = OBJECT_ID(N'[dbo].[tr_dbo_Checkin_9970dfbe-87c7-4beb-bf53-fbfe9e3c71d3_Sender]')) DROP TRIGGER [dbo].[tr_dbo_Checkin_9970dfbe-87c7-4beb-bf53-fbfe9e3c71d3_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_Checkin_9970dfbe-87c7-4beb-bf53-fbfe9e3c71d3_Sender') EXEC (N'ALTER QUEUE [dbo].[dbo_Checkin_9970dfbe-87c7-4beb-bf53-fbfe9e3c71d3_Sender] WITH ACTIVATION (STATUS = OFF)');

        
        SELECT conversation_handle INTO #Conversations FROM sys.conversation_endpoints WITH (NOLOCK) WHERE far_service LIKE N'dbo_Checkin_9970dfbe-87c7-4beb-bf53-fbfe9e3c71d3_%' ORDER BY is_initiator ASC;
        DECLARE conversation_cursor CURSOR FAST_FORWARD FOR SELECT conversation_handle FROM #Conversations;
        OPEN conversation_cursor;
        FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        WHILE @@FETCH_STATUS = 0 
        BEGIN
            END CONVERSATION @conversation_handle WITH CLEANUP;
            FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        END
        CLOSE conversation_cursor;
        DEALLOCATE conversation_cursor;
        DROP TABLE #Conversations;

        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_Checkin_9970dfbe-87c7-4beb-bf53-fbfe9e3c71d3_Receiver') DROP SERVICE [dbo_Checkin_9970dfbe-87c7-4beb-bf53-fbfe9e3c71d3_Receiver];
        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_Checkin_9970dfbe-87c7-4beb-bf53-fbfe9e3c71d3_Sender') DROP SERVICE [dbo_Checkin_9970dfbe-87c7-4beb-bf53-fbfe9e3c71d3_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_Checkin_9970dfbe-87c7-4beb-bf53-fbfe9e3c71d3_Receiver') DROP QUEUE [dbo].[dbo_Checkin_9970dfbe-87c7-4beb-bf53-fbfe9e3c71d3_Receiver];
        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_Checkin_9970dfbe-87c7-4beb-bf53-fbfe9e3c71d3_Sender') DROP QUEUE [dbo].[dbo_Checkin_9970dfbe-87c7-4beb-bf53-fbfe9e3c71d3_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_contracts WITH (NOLOCK) WHERE name = N'dbo_Checkin_9970dfbe-87c7-4beb-bf53-fbfe9e3c71d3') DROP CONTRACT [dbo_Checkin_9970dfbe-87c7-4beb-bf53-fbfe9e3c71d3];
        
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_Checkin_9970dfbe-87c7-4beb-bf53-fbfe9e3c71d3/StartMessage/Insert') DROP MESSAGE TYPE [dbo_Checkin_9970dfbe-87c7-4beb-bf53-fbfe9e3c71d3/StartMessage/Insert];
IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_Checkin_9970dfbe-87c7-4beb-bf53-fbfe9e3c71d3/StartMessage/Update') DROP MESSAGE TYPE [dbo_Checkin_9970dfbe-87c7-4beb-bf53-fbfe9e3c71d3/StartMessage/Update];
IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_Checkin_9970dfbe-87c7-4beb-bf53-fbfe9e3c71d3/StartMessage/Delete') DROP MESSAGE TYPE [dbo_Checkin_9970dfbe-87c7-4beb-bf53-fbfe9e3c71d3/StartMessage/Delete];
IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_Checkin_9970dfbe-87c7-4beb-bf53-fbfe9e3c71d3/Computer Name') DROP MESSAGE TYPE [dbo_Checkin_9970dfbe-87c7-4beb-bf53-fbfe9e3c71d3/Computer Name];
IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_Checkin_9970dfbe-87c7-4beb-bf53-fbfe9e3c71d3/User Name') DROP MESSAGE TYPE [dbo_Checkin_9970dfbe-87c7-4beb-bf53-fbfe9e3c71d3/User Name];
IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_Checkin_9970dfbe-87c7-4beb-bf53-fbfe9e3c71d3/EndMessage') DROP MESSAGE TYPE [dbo_Checkin_9970dfbe-87c7-4beb-bf53-fbfe9e3c71d3/EndMessage];

        
        IF EXISTS (SELECT * FROM sys.objects WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_Checkin_9970dfbe-87c7-4beb-bf53-fbfe9e3c71d3_QueueActivationSender') DROP PROCEDURE [dbo].[dbo_Checkin_9970dfbe-87c7-4beb-bf53-fbfe9e3c71d3_QueueActivationSender];

        
    END
END
GO
/****** Object:  StoredProcedure [dbo].[dbo_Checkin_d3677660-6179-4050-8f1b-fd083f235bd1_QueueActivationSender]    Script Date: 2020-03-13 9:26:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[dbo_Checkin_d3677660-6179-4050-8f1b-fd083f235bd1_QueueActivationSender] AS 
BEGIN 
    SET NOCOUNT ON;
    DECLARE @h AS UNIQUEIDENTIFIER;
    DECLARE @mt NVARCHAR(200);

    RECEIVE TOP(1) @h = conversation_handle, @mt = message_type_name FROM [dbo].[dbo_Checkin_d3677660-6179-4050-8f1b-fd083f235bd1_Sender];

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/EndDialog'
    BEGIN
        END CONVERSATION @h;
    END

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/DialogTimer' OR @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/Error'
    BEGIN 
        

        END CONVERSATION @h;

        DECLARE @conversation_handle UNIQUEIDENTIFIER;
        DECLARE @schema_id INT;
        SELECT @schema_id = schema_id FROM sys.schemas WITH (NOLOCK) WHERE name = N'dbo';

        
        IF EXISTS (SELECT * FROM sys.triggers WITH (NOLOCK) WHERE object_id = OBJECT_ID(N'[dbo].[tr_dbo_Checkin_d3677660-6179-4050-8f1b-fd083f235bd1_Sender]')) DROP TRIGGER [dbo].[tr_dbo_Checkin_d3677660-6179-4050-8f1b-fd083f235bd1_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_Checkin_d3677660-6179-4050-8f1b-fd083f235bd1_Sender') EXEC (N'ALTER QUEUE [dbo].[dbo_Checkin_d3677660-6179-4050-8f1b-fd083f235bd1_Sender] WITH ACTIVATION (STATUS = OFF)');

        
        SELECT conversation_handle INTO #Conversations FROM sys.conversation_endpoints WITH (NOLOCK) WHERE far_service LIKE N'dbo_Checkin_d3677660-6179-4050-8f1b-fd083f235bd1_%' ORDER BY is_initiator ASC;
        DECLARE conversation_cursor CURSOR FAST_FORWARD FOR SELECT conversation_handle FROM #Conversations;
        OPEN conversation_cursor;
        FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        WHILE @@FETCH_STATUS = 0 
        BEGIN
            END CONVERSATION @conversation_handle WITH CLEANUP;
            FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        END
        CLOSE conversation_cursor;
        DEALLOCATE conversation_cursor;
        DROP TABLE #Conversations;

        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_Checkin_d3677660-6179-4050-8f1b-fd083f235bd1_Receiver') DROP SERVICE [dbo_Checkin_d3677660-6179-4050-8f1b-fd083f235bd1_Receiver];
        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_Checkin_d3677660-6179-4050-8f1b-fd083f235bd1_Sender') DROP SERVICE [dbo_Checkin_d3677660-6179-4050-8f1b-fd083f235bd1_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_Checkin_d3677660-6179-4050-8f1b-fd083f235bd1_Receiver') DROP QUEUE [dbo].[dbo_Checkin_d3677660-6179-4050-8f1b-fd083f235bd1_Receiver];
        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_Checkin_d3677660-6179-4050-8f1b-fd083f235bd1_Sender') DROP QUEUE [dbo].[dbo_Checkin_d3677660-6179-4050-8f1b-fd083f235bd1_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_contracts WITH (NOLOCK) WHERE name = N'dbo_Checkin_d3677660-6179-4050-8f1b-fd083f235bd1') DROP CONTRACT [dbo_Checkin_d3677660-6179-4050-8f1b-fd083f235bd1];
        
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_Checkin_d3677660-6179-4050-8f1b-fd083f235bd1/StartMessage/Insert') DROP MESSAGE TYPE [dbo_Checkin_d3677660-6179-4050-8f1b-fd083f235bd1/StartMessage/Insert];
IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_Checkin_d3677660-6179-4050-8f1b-fd083f235bd1/StartMessage/Update') DROP MESSAGE TYPE [dbo_Checkin_d3677660-6179-4050-8f1b-fd083f235bd1/StartMessage/Update];
IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_Checkin_d3677660-6179-4050-8f1b-fd083f235bd1/StartMessage/Delete') DROP MESSAGE TYPE [dbo_Checkin_d3677660-6179-4050-8f1b-fd083f235bd1/StartMessage/Delete];
IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_Checkin_d3677660-6179-4050-8f1b-fd083f235bd1/Computer Name') DROP MESSAGE TYPE [dbo_Checkin_d3677660-6179-4050-8f1b-fd083f235bd1/Computer Name];
IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_Checkin_d3677660-6179-4050-8f1b-fd083f235bd1/User Name') DROP MESSAGE TYPE [dbo_Checkin_d3677660-6179-4050-8f1b-fd083f235bd1/User Name];
IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_Checkin_d3677660-6179-4050-8f1b-fd083f235bd1/EndMessage') DROP MESSAGE TYPE [dbo_Checkin_d3677660-6179-4050-8f1b-fd083f235bd1/EndMessage];

        
        IF EXISTS (SELECT * FROM sys.objects WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_Checkin_d3677660-6179-4050-8f1b-fd083f235bd1_QueueActivationSender') DROP PROCEDURE [dbo].[dbo_Checkin_d3677660-6179-4050-8f1b-fd083f235bd1_QueueActivationSender];

        
    END
END
GO
/****** Object:  StoredProcedure [dbo].[dbo_Checkin_d3e3f5be-e135-4db6-b60b-d917fd920f7b_QueueActivationSender]    Script Date: 2020-03-13 9:26:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[dbo_Checkin_d3e3f5be-e135-4db6-b60b-d917fd920f7b_QueueActivationSender] AS 
BEGIN 
    SET NOCOUNT ON;
    DECLARE @h AS UNIQUEIDENTIFIER;
    DECLARE @mt NVARCHAR(200);

    RECEIVE TOP(1) @h = conversation_handle, @mt = message_type_name FROM [dbo].[dbo_Checkin_d3e3f5be-e135-4db6-b60b-d917fd920f7b_Sender];

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/EndDialog'
    BEGIN
        END CONVERSATION @h;
    END

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/DialogTimer' OR @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/Error'
    BEGIN 
        

        END CONVERSATION @h;

        DECLARE @conversation_handle UNIQUEIDENTIFIER;
        DECLARE @schema_id INT;
        SELECT @schema_id = schema_id FROM sys.schemas WITH (NOLOCK) WHERE name = N'dbo';

        
        IF EXISTS (SELECT * FROM sys.triggers WITH (NOLOCK) WHERE object_id = OBJECT_ID(N'[dbo].[tr_dbo_Checkin_d3e3f5be-e135-4db6-b60b-d917fd920f7b_Sender]')) DROP TRIGGER [dbo].[tr_dbo_Checkin_d3e3f5be-e135-4db6-b60b-d917fd920f7b_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_Checkin_d3e3f5be-e135-4db6-b60b-d917fd920f7b_Sender') EXEC (N'ALTER QUEUE [dbo].[dbo_Checkin_d3e3f5be-e135-4db6-b60b-d917fd920f7b_Sender] WITH ACTIVATION (STATUS = OFF)');

        
        SELECT conversation_handle INTO #Conversations FROM sys.conversation_endpoints WITH (NOLOCK) WHERE far_service LIKE N'dbo_Checkin_d3e3f5be-e135-4db6-b60b-d917fd920f7b_%' ORDER BY is_initiator ASC;
        DECLARE conversation_cursor CURSOR FAST_FORWARD FOR SELECT conversation_handle FROM #Conversations;
        OPEN conversation_cursor;
        FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        WHILE @@FETCH_STATUS = 0 
        BEGIN
            END CONVERSATION @conversation_handle WITH CLEANUP;
            FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        END
        CLOSE conversation_cursor;
        DEALLOCATE conversation_cursor;
        DROP TABLE #Conversations;

        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_Checkin_d3e3f5be-e135-4db6-b60b-d917fd920f7b_Receiver') DROP SERVICE [dbo_Checkin_d3e3f5be-e135-4db6-b60b-d917fd920f7b_Receiver];
        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_Checkin_d3e3f5be-e135-4db6-b60b-d917fd920f7b_Sender') DROP SERVICE [dbo_Checkin_d3e3f5be-e135-4db6-b60b-d917fd920f7b_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_Checkin_d3e3f5be-e135-4db6-b60b-d917fd920f7b_Receiver') DROP QUEUE [dbo].[dbo_Checkin_d3e3f5be-e135-4db6-b60b-d917fd920f7b_Receiver];
        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_Checkin_d3e3f5be-e135-4db6-b60b-d917fd920f7b_Sender') DROP QUEUE [dbo].[dbo_Checkin_d3e3f5be-e135-4db6-b60b-d917fd920f7b_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_contracts WITH (NOLOCK) WHERE name = N'dbo_Checkin_d3e3f5be-e135-4db6-b60b-d917fd920f7b') DROP CONTRACT [dbo_Checkin_d3e3f5be-e135-4db6-b60b-d917fd920f7b];
        
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_Checkin_d3e3f5be-e135-4db6-b60b-d917fd920f7b/StartMessage/Insert') DROP MESSAGE TYPE [dbo_Checkin_d3e3f5be-e135-4db6-b60b-d917fd920f7b/StartMessage/Insert];
IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_Checkin_d3e3f5be-e135-4db6-b60b-d917fd920f7b/StartMessage/Update') DROP MESSAGE TYPE [dbo_Checkin_d3e3f5be-e135-4db6-b60b-d917fd920f7b/StartMessage/Update];
IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_Checkin_d3e3f5be-e135-4db6-b60b-d917fd920f7b/StartMessage/Delete') DROP MESSAGE TYPE [dbo_Checkin_d3e3f5be-e135-4db6-b60b-d917fd920f7b/StartMessage/Delete];
IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_Checkin_d3e3f5be-e135-4db6-b60b-d917fd920f7b/Computer Name') DROP MESSAGE TYPE [dbo_Checkin_d3e3f5be-e135-4db6-b60b-d917fd920f7b/Computer Name];
IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_Checkin_d3e3f5be-e135-4db6-b60b-d917fd920f7b/User Name') DROP MESSAGE TYPE [dbo_Checkin_d3e3f5be-e135-4db6-b60b-d917fd920f7b/User Name];
IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_Checkin_d3e3f5be-e135-4db6-b60b-d917fd920f7b/EndMessage') DROP MESSAGE TYPE [dbo_Checkin_d3e3f5be-e135-4db6-b60b-d917fd920f7b/EndMessage];

        
        IF EXISTS (SELECT * FROM sys.objects WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_Checkin_d3e3f5be-e135-4db6-b60b-d917fd920f7b_QueueActivationSender') DROP PROCEDURE [dbo].[dbo_Checkin_d3e3f5be-e135-4db6-b60b-d917fd920f7b_QueueActivationSender];

        
    END
END
GO
/****** Object:  StoredProcedure [dbo].[dbo_Checkin_ddd376ca-0554-4374-9206-562ccc6d7645_QueueActivationSender]    Script Date: 2020-03-13 9:26:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[dbo_Checkin_ddd376ca-0554-4374-9206-562ccc6d7645_QueueActivationSender] AS 
BEGIN 
    SET NOCOUNT ON;
    DECLARE @h AS UNIQUEIDENTIFIER;
    DECLARE @mt NVARCHAR(200);

    RECEIVE TOP(1) @h = conversation_handle, @mt = message_type_name FROM [dbo].[dbo_Checkin_ddd376ca-0554-4374-9206-562ccc6d7645_Sender];

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/EndDialog'
    BEGIN
        END CONVERSATION @h;
    END

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/DialogTimer' OR @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/Error'
    BEGIN 
        

        END CONVERSATION @h;

        DECLARE @conversation_handle UNIQUEIDENTIFIER;
        DECLARE @schema_id INT;
        SELECT @schema_id = schema_id FROM sys.schemas WITH (NOLOCK) WHERE name = N'dbo';

        
        IF EXISTS (SELECT * FROM sys.triggers WITH (NOLOCK) WHERE object_id = OBJECT_ID(N'[dbo].[tr_dbo_Checkin_ddd376ca-0554-4374-9206-562ccc6d7645_Sender]')) DROP TRIGGER [dbo].[tr_dbo_Checkin_ddd376ca-0554-4374-9206-562ccc6d7645_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_Checkin_ddd376ca-0554-4374-9206-562ccc6d7645_Sender') EXEC (N'ALTER QUEUE [dbo].[dbo_Checkin_ddd376ca-0554-4374-9206-562ccc6d7645_Sender] WITH ACTIVATION (STATUS = OFF)');

        
        SELECT conversation_handle INTO #Conversations FROM sys.conversation_endpoints WITH (NOLOCK) WHERE far_service LIKE N'dbo_Checkin_ddd376ca-0554-4374-9206-562ccc6d7645_%' ORDER BY is_initiator ASC;
        DECLARE conversation_cursor CURSOR FAST_FORWARD FOR SELECT conversation_handle FROM #Conversations;
        OPEN conversation_cursor;
        FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        WHILE @@FETCH_STATUS = 0 
        BEGIN
            END CONVERSATION @conversation_handle WITH CLEANUP;
            FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        END
        CLOSE conversation_cursor;
        DEALLOCATE conversation_cursor;
        DROP TABLE #Conversations;

        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_Checkin_ddd376ca-0554-4374-9206-562ccc6d7645_Receiver') DROP SERVICE [dbo_Checkin_ddd376ca-0554-4374-9206-562ccc6d7645_Receiver];
        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_Checkin_ddd376ca-0554-4374-9206-562ccc6d7645_Sender') DROP SERVICE [dbo_Checkin_ddd376ca-0554-4374-9206-562ccc6d7645_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_Checkin_ddd376ca-0554-4374-9206-562ccc6d7645_Receiver') DROP QUEUE [dbo].[dbo_Checkin_ddd376ca-0554-4374-9206-562ccc6d7645_Receiver];
        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_Checkin_ddd376ca-0554-4374-9206-562ccc6d7645_Sender') DROP QUEUE [dbo].[dbo_Checkin_ddd376ca-0554-4374-9206-562ccc6d7645_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_contracts WITH (NOLOCK) WHERE name = N'dbo_Checkin_ddd376ca-0554-4374-9206-562ccc6d7645') DROP CONTRACT [dbo_Checkin_ddd376ca-0554-4374-9206-562ccc6d7645];
        
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_Checkin_ddd376ca-0554-4374-9206-562ccc6d7645/StartMessage/Insert') DROP MESSAGE TYPE [dbo_Checkin_ddd376ca-0554-4374-9206-562ccc6d7645/StartMessage/Insert];
IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_Checkin_ddd376ca-0554-4374-9206-562ccc6d7645/StartMessage/Update') DROP MESSAGE TYPE [dbo_Checkin_ddd376ca-0554-4374-9206-562ccc6d7645/StartMessage/Update];
IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_Checkin_ddd376ca-0554-4374-9206-562ccc6d7645/StartMessage/Delete') DROP MESSAGE TYPE [dbo_Checkin_ddd376ca-0554-4374-9206-562ccc6d7645/StartMessage/Delete];
IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_Checkin_ddd376ca-0554-4374-9206-562ccc6d7645/Computer Name') DROP MESSAGE TYPE [dbo_Checkin_ddd376ca-0554-4374-9206-562ccc6d7645/Computer Name];
IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_Checkin_ddd376ca-0554-4374-9206-562ccc6d7645/User Name') DROP MESSAGE TYPE [dbo_Checkin_ddd376ca-0554-4374-9206-562ccc6d7645/User Name];
IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_Checkin_ddd376ca-0554-4374-9206-562ccc6d7645/EndMessage') DROP MESSAGE TYPE [dbo_Checkin_ddd376ca-0554-4374-9206-562ccc6d7645/EndMessage];

        
        IF EXISTS (SELECT * FROM sys.objects WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_Checkin_ddd376ca-0554-4374-9206-562ccc6d7645_QueueActivationSender') DROP PROCEDURE [dbo].[dbo_Checkin_ddd376ca-0554-4374-9206-562ccc6d7645_QueueActivationSender];

        
    END
END
GO
/****** Object:  StoredProcedure [dbo].[findInventory]    Script Date: 2020-03-13 9:26:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[findInventory]
@itemnumber varchar(30)

as

select * from Inventory
where ItemNumber = @itemnumber
GO
/****** Object:  StoredProcedure [dbo].[fulltextsearch]    Script Date: 2020-03-13 9:26:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/
create procedure [dbo].[fulltextsearch]
@filtertext varchar
as

SELECT *
  FROM [dbo].[InventoryBackView]
  where  contains(fullsearch, @filtertext)



GO
/****** Object:  StoredProcedure [dbo].[GetBOMTree]    Script Date: 2020-03-13 9:26:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE procedure [dbo].[GetBOMTree] 
 @product varchar(25)
as

WITH  q AS 
        (
        SELECT  *
        FROM    [dbo].SPMConnectBOM
       WHERE   AssyNo = @product

        UNION ALL

        SELECT  m.*
        FROM  [dbo].SPMConnectBOM  m
		JOIN    q
        ON       q.ItemNumber = m.AssyNo 
        )
SELECT  q.AssyNo as parent_id, q.ItemNumber  as children,q.ItemNumber  , q.QuantityPerAssembly,q.Description,q.Manufacturer,q.ManufacturerItemNumber
FROM    q

 UNION  
SELECT top(1) NUll as parent_id , a.ItemNumber  as children, a.ItemNumber  , 0 as QuantityPerAssembly ,a.Description,a.Manufacturer,a.ManufacturerItemNumber
from [dbo].UnionInventory a
where a.ItemNumber = @product

GO
/****** Object:  StoredProcedure [dbo].[GetEmployeeLogininfo]    Script Date: 2020-03-13 9:26:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[GetEmployeeLogininfo]

@username varchar(30),
@password varchar(150)


as

SELECT COUNT(*) FROM [SPM_Database].[dbo].[EmployeeLogin] 
WHERE UserName = @username AND Password = @password






GO
/****** Object:  StoredProcedure [dbo].[getnewquotenumber]    Script Date: 2020-03-13 9:26:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/
create procedure [dbo].[getnewquotenumber]
as
select max(quote) + 1 as NextQuoteNo
from
(SELECT *
 FROM [SPM_Database].[dbo].[Opportunities]
 where  LEN([Quote]) >= 4 and ISNUMERIC(Quote) = 1)a
GO
/****** Object:  StoredProcedure [dbo].[GetReleaseSuggestions]    Script Date: 2020-03-13 9:26:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[GetReleaseSuggestions]
@job varchar(30),
@assyno varchar(30),
@wo varchar(30)

as

SELECT a.item AS ItemId, 
       eb.description, 
       eb.manufacturer, 
       eb.manufactureritemnumber, 
       CONVERT(INT, a.qte_ass) AS Qty 
FROM  (SELECT e.* 
       FROM   [SPMDB].[dbo].mrpres e 
       WHERE  NOT EXISTS (SELECT * 
                          FROM   [SPM_Database].[dbo].[woreleasedetails] wd 
                          WHERE  wd.jobno = @job 
                                 AND wd.assyno = @assyno 
                                 AND wd.itemid = e.item) 
              AND e.job = @job 
              AND e.piece = @assyno 
              AND e.woprec = @wo
			  AND e.RML_Active = '1')a 
      INNER JOIN [SPM_Database].[dbo].[inventory] eb 
              ON a.item = eb.itemnumber 
		
GO
/****** Object:  StoredProcedure [dbo].[GetWhereUsedTree]    Script Date: 2020-03-13 9:26:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE procedure [dbo].[GetWhereUsedTree] 
 @product varchar(25)
as

WITH  q AS 
        (
        SELECT  *
        FROM    [dbo].SPMConnectBOM
       WHERE   ItemNumber = @product

        UNION ALL

        SELECT  m.*
        FROM  [dbo].SPMConnectBOM  m
		JOIN    q
        ON       q.AssyNo = m.ItemNumber 
        )
SELECT  q.ItemNumber as parent_id, q.AssyNo  as children,q.AssyNo  , q.QuantityPerAssembly,q.AssyDescription,q.AssyManufacturer,q.AssyManufacturerItemNumber
FROM    q

 UNION  
SELECT top(1) NUll as parent_id , a.ItemNumber  as children, a.ItemNumber  , 0 as QuantityPerAssembly ,a.Description,a.Manufacturer,a.ManufacturerItemNumber
from [dbo].Inventory a
where a.ItemNumber = @product

GO
/****** Object:  StoredProcedure [dbo].[insertServiceReport]    Script Date: 2020-03-13 9:26:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[insertServiceReport] @title         NVARCHAR(50), 
                                            @reportmapid   NVARCHAR(50), 
                                            @reportid      NVARCHAR(50), 
                                            @projectno     NVARCHAR(50), 
                                            @refjob        NVARCHAR(50), 
                                            @pm            NVARCHAR(50), 
                                            @customer      NVARCHAR(50), 
                                            @planloc       NVARCHAR(max), 
                                            @contactname   NVARCHAR(50), 
                                            @authorizedby  NVARCHAR(50), 
                                            @equipment     NVARCHAR(150), 
                                            @techname      NVARCHAR(50), 
                                            @datecreated   NVARCHAR(50), 
                                            @futheractions NVARCHAR(max), 
                                            @custcomments  NVARCHAR(max), 
                                            @custrep       NVARCHAR(50), 
                                            @custemail     NVARCHAR(50), 
                                            @custcontact   NVARCHAR(50), 
                                            @published     NVARCHAR(50), 
                                            @signed        NVARCHAR(50), 
                                            @uploadedby    NVARCHAR(50), 
                                            @spare1        NVARCHAR(50), 
                                            @spare2        NVARCHAR(50), 
                                            @spare3        NVARCHAR(50), 
                                            @spare4        NVARCHAR(50), 
                                            @spare5        NVARCHAR(50) 
AS 
    INSERT INTO [dbo].[spservicereports] 
                ([title], 
                 [reportmapid], 
                 [report_id], 
                 [projectno], 
                 [refjob], 
                 [projectmanager], 
                 customer, 
                 planloc, 
                 contactname, 
                 authorizedby, 
                 equipment, 
                 techname, 
                 datecreated, 
                 furtheractions, 
                 custcomments, 
                 custrep, 
                 custemail, 
                 custcontact, 
                 published, 
                 signed, 
                 uploadedby, 
                 spare1, 
                 spare2, 
                 spare3, 
                 spare4, 
                 spare5) 
    VALUES      (@title, 
                 @reportmapid, 
                 @reportid, 
                 @projectno, 
                 @refjob, 
                 @pm, 
                 @customer, 
                 @planloc, 
                 @contactname, 
                 @authorizedby, 
                 @equipment, 
                 @techname, 
                 @datecreated, 
                 @futheractions, 
                 @custcomments, 
                 @custrep, 
                 @custemail, 
                 @custcontact, 
                 @published, 
                 @signed, 
                 @uploadedby, 
                 @spare1, 
                 @spare2, 
                 @spare3, 
                 @spare4, 
                 @spare5) 
GO
/****** Object:  StoredProcedure [dbo].[inset_user_actions]    Script Date: 2020-03-13 9:26:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[inset_user_actions]

    @mytable [UserActionsBulk] READONLY

AS



INSERT INTO UserActions

    (timeStamp,formName,ctrlName,eventName,value,UserName)

SELECT

    timeStamp,formName,ctrlName,eventName,value,UserName

FROM

    @mytable
GO
/****** Object:  StoredProcedure [dbo].[ItemNumberStartingLowercase]    Script Date: 2020-03-13 9:26:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ItemNumberStartingLowercase]
as



SELECT *
FROM [SPM_Database].[dbo].[Inventory] 
WHERE ItemNumber 
LIKE '%[abcdefghijklmnopqrstuvwxyz]%'
collate Latin1_General_CS_AS
GO
/****** Object:  StoredProcedure [dbo].[ManufactureItemDuplicates]    Script Date: 2020-03-13 9:26:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[ManufactureItemDuplicates]
as	
	
	select *  ,
	row_number() over (partition by ManufacturerItemNumber order by ItemNumber) as RNumber
	from [SPM_Database].[dbo].[UnionInventory] i 
	where ManufacturerItemNumber in (
	select ManufacturerItemNumber from (
		select ManufacturerItemNumber , 
		row_number() over (partition by ManufacturerItemNumber order by ManufacturerItemNumber) as RowNumber
		from [SPM_Database].[dbo].[UnionInventory]
		where (isnull(ManufacturerItemNumber, '') <> '' and ManufacturerItemNumber <> '-')
		) a
	where RowNumber > 1) 
GO
/****** Object:  StoredProcedure [dbo].[MissingGeniusItems]    Script Date: 2020-03-13 9:26:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[MissingGeniusItems]
as
insert [SPM_Database].[dbo].[Inventory] (ItemNumber,Description,FamilyCode,Manufacturer,ManufacturerItemNumber,DesignedBy,DateCreated,LastSavedBy,LastEdited)
select * from 
(
select e.Item AS ItemNumber,
e.Des as Description,
e.Famille as FamilyCode,
e.Des4 as Manufacturer,
e.Des2 as ManufactureItemNumber,
e.Cree_Par as DesignedBy,
e.Cree_Le as DateCreated,
e.Modif_Par as LastSavedBy,
e.Modif_Le as LastEdited

 from [SPMDB].[dbo].[Edb] e 
 where not exists (select 1 from [SPM_Database].dbo.Inventory i
					where i.ItemNumber = e.Item )) u
where  substring(ItemNumber, 1, 1)  NOT LIKE  '[0-9]%'
and isnumeric(substring(ItemNumber, 2, 5)) = 1
and LEN(ItemNumber) = 6
GO
/****** Object:  StoredProcedure [dbo].[ShowAllEFTRecords]    Script Date: 2020-03-13 9:26:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure  [dbo].[ShowAllEFTRecords]
as
select *  FROM [SPM_Database].[dbo].[EFTHome]
ORDER BY [PaymentDate] DESC
GO
/****** Object:  StoredProcedure [dbo].[ShowAllRecordsBetween]    Script Date: 2020-03-13 9:26:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure  [dbo].[ShowAllRecordsBetween]
@datestart datetime,
@dateto datetime

as
SELECT * FROM [dbo].[EFTHome]

		where 
		 EmailSent = 'No'AND (
		(left(PaymentDate,11) BETWEEN @datestart AND @dateto) OR 
		(left(PaymentDate,11) BETWEEN @datestart AND @dateto) OR 
		(left(PaymentDate,11) <= @datestart AND PaymentDate >= @dateto))
		
		order by PaymentDate
GO
/****** Object:  StoredProcedure [dbo].[ShowAllRecordsByType]    Script Date: 2020-03-13 9:26:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE Procedure  [dbo].[ShowAllRecordsByType]
@filterby varchar

as
SELECT * FROM [dbo].[EFTHome]
WHERE   EmailSent LIKE @filterby+'%'
OR      @filterby = ''		
		
		order by PaymentDate DESC
GO
/****** Object:  StoredProcedure [dbo].[UnionInventoryID]    Script Date: 2020-03-13 9:26:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[UnionInventoryID]
AS
  SELECT  u.ItemNumber, u.Description, u.FamilyCode, u.Manufacturer, u.ManufacturerItemNumber, u.DesignedBy,u.DateCreated,u.LastSavedBy, u.LastEdited,   ROW_NUMBER() OVER(ORDER BY u.ItemNumber, u.ItemNumber) AS 'ID',concat(u.ItemNumber,' ',u.Description,' ',u.FamilyCode,' ',u.Manufacturer,' ',u.ManufacturerItemNumber) as FullSearch from 
(select a.[ItemNumber],a.[Description],a.[FamilyCode],a.[Manufacturer],a.[ManufacturerItemNumber],a.DesignedBy,a.DateCreated,a.LastSavedBy,a.LastEdited from [SPM_Database].dbo.Inventory a
union 
select e.Item AS ItemNumber,
e.Des as Description,
e.Famille as FamilyCode,
e.Des4 as Manufacturer,
e.Des2 as ManufactureItemNumber,
e.Cree_Par as DesignedBy,
e.Cree_Le as DateCreated,
e.Modif_Par as LastSavedBy,
e.Modif_Le as LastEdited
 from [SPMDB].[dbo].[Edb] e 
 where not exists (select 1 from [SPM_Database].dbo.Inventory i
					where i.ItemNumber = e.Item )) u
where  substring(u.ItemNumber, 1, 1)  NOT LIKE  '[0-9]%'
and isnumeric(substring(u.ItemNumber, 2, 5)) = 1
and LEN(u.ItemNumber) < 7
   
GO
/****** Object:  StoredProcedure [dbo].[UnionItems]    Script Date: 2020-03-13 9:26:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UnionItems]
as

With cte_duplicate ([ItemNumber], Description, FamilyCode, Manufacturer, ManufacturerItemNumber, rownumber)
as (
select [ItemNumber]
, Description
, FamilyCode
, Manufacturer
, ManufacturerItemNumber
, row_number()over(partition by [ItemNumber] order by ItemNumber DESC)as rownumber
 from [SPM_Database].[dbo].[UnionInventory]

)
Select * from cte_duplicate where rownumber = 1 and ItemNumber BETWEEN 'A00000' AND 'A99999'
order by ItemNumber DESC
GO
/****** Object:  StoredProcedure [dbo].[UpdateOrderId]    Script Date: 2020-03-13 9:26:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[UpdateOrderId]
@itemnumber int

as	

with cte as
(
  select *
    , new_row_id=row_number() over (partition by ReqNumber order by ReqNumber)
  from [dbo].[PurchaseReq]
  where ReqNumber = @itemnumber
)
update cte
set OrderId = new_row_id
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Bom (SPMDB.dbo)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 263
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "UnionInventory"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 268
               Right = 267
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'GeniusChildren'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'GeniusChildren'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Bom (SPMDB.dbo)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 263
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Inventory"
            Begin Extent = 
               Top = 37
               Left = 449
               Bottom = 167
               Right = 678
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'GeniusParent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'GeniusParent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[46] 4[20] 2[19] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -96
         Left = 0
      End
      Begin Tables = 
         Begin Table = "PurchaseReqBase"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 462
               Right = 893
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Purchasereqstatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Purchasereqstatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "SpareBOM"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 344
               Right = 267
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Edb (SPMDB.dbo)"
            Begin Extent = 
               Top = 103
               Left = 416
               Bottom = 326
               Right = 839
            End
            DisplayFlags = 280
            TopColumn = 2
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SpareBOMProductDes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SpareBOMProductDes'
GO
USE [master]
GO
ALTER DATABASE [SPM_Database] SET  READ_WRITE 
GO
