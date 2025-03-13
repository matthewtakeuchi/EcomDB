CREATE DATABASE Ecom
/*ON 
( NAME = ecom_data, 
  FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ecom.mdf',
  SIZE = 10MB, 
  MAXSIZE = 100MB, 
  FILEGROWTH = 10MB )
LOG ON 
( NAME = ecom_log, 
  FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ecom.ldf',
  SIZE = 5MB, 
  MAXSIZE = 50MB, 
  FILEGROWTH = 5MB );*/-- manipulate this as needed for filegrowth, location, mdf/ldf file locations
;
GO

USE [Ecom]
GO

/****** Object:  Table [dbo].[Buys] ******/
--used to store all inventory bought at any given time. most columns are self-explanatory except for [refunded?], which is whether or not the item was returned and a refund was received. price effective is a computed column that calculates price per unit vs total for all units paid.   
	
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Buys](
	[ID_Number] [bigint] IDENTITY(1,1) NOT NULL,
	[Product_Name] [varchar](max) NOT NULL,
	[Purchase_Date] [varchar](max) NULL,
	[Quantity] [int] NOT NULL,
	[Price_Effective]  AS ([Price_total]/[quantity]),
	[Price_Total] [money] NOT NULL,
	[Refunded?] [varchar](1) NOT NULL,
 CONSTRAINT [PK__Buys__01631DBF82F5C186] PRIMARY KEY CLUSTERED 
(
	[ID_Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO




/****** Object:  Table [dbo].[Inventory]  ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Inventory](
	[ID_Number] [bigint] NOT NULL,
	[Product_Name] [varchar](max) NULL,
	[Quantity] [bigint] NOT NULL,
	[Inventory_Value] [money] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[Inventory]  WITH CHECK ADD  CONSTRAINT [fk_id_number_inventory] FOREIGN KEY([ID_Number])
REFERENCES [dbo].[Buys] ([ID_Number])
GO

ALTER TABLE [dbo].[Inventory] CHECK CONSTRAINT [fk_id_number_inventory]
GO

USE [Ecom]
GO

/****** Object:  Table [dbo].[Misc_Expenses]  ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Misc_Expenses](
	[MiscE_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Sale_ID] [bigint] NULL,
	[ID_Number] [bigint] NULL,
	[Expense_Amount] [money] NOT NULL,
	[Description] [varchar](max) NULL,
 CONSTRAINT [PK__Misc_Exp__314D94417D3107BA] PRIMARY KEY CLUSTERED 
(
	[MiscE_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[Misc_Expenses]  WITH CHECK ADD  CONSTRAINT [fk_id_number_misc_expenses] FOREIGN KEY([ID_Number])
REFERENCES [dbo].[Buys] ([ID_Number])
GO

ALTER TABLE [dbo].[Misc_Expenses] CHECK CONSTRAINT [fk_id_number_misc_expenses]
GO

ALTER TABLE [dbo].[Misc_Expenses]  WITH CHECK ADD  CONSTRAINT [FK_Misc_Expenses_Sells] FOREIGN KEY([Sale_ID])
REFERENCES [dbo].[Sells] ([Sale_ID])
GO

ALTER TABLE [dbo].[Misc_Expenses] CHECK CONSTRAINT [FK_Misc_Expenses_Sells]
GO



/****** Object:  Table [dbo].[Misc_Profit]  ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Misc_Profit](
	[MiscP_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Sale_ID] [bigint] NULL,
	[ID_Number] [bigint] NULL,
	[Profit_Amount] [money] NOT NULL,
	[Comment] [varchar](max) NULL,
 CONSTRAINT [PK_MiscP_ID] PRIMARY KEY CLUSTERED 
(
	[MiscP_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


/****** Object:  Table [dbo].[Sells] ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Sells](
	[Sale_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[ID_Number] [bigint] NOT NULL,
	[Product_Name] [varchar](max) NULL,
	[Platform] [nchar](10) NULL,
	[Sale_Date] [varchar](max) NOT NULL,
	[Quantity] [bigint] NOT NULL,
	[Sale_Amount] [money] NOT NULL,
	[Effective_Sale_Amount]  AS ([Sale_Amount]/[quantity]),
	[Transaction_Fees] [money] NOT NULL,
	[Ad_Fees] [money] NOT NULL,
	[Shipping_Fees] [money] NOT NULL,
	[Proceeds]  AS ((([Sale_amount]-[Transaction_Fees])-[Ad_Fees])-[Shipping_Fees]),
	[Profit/Loss] [money] NULL,
	[Comprehensive_Profit/Loss] [money] NULL,
 CONSTRAINT [PK__Sells__FB91209F3758120D] PRIMARY KEY CLUSTERED 
(
	[Sale_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[Sells]  WITH CHECK ADD  CONSTRAINT [fk_id_number_sells] FOREIGN KEY([ID_Number])
REFERENCES [dbo].[Buys] ([ID_Number])
GO

ALTER TABLE [dbo].[Sells] CHECK CONSTRAINT [fk_id_number_sells]
GO




/****** Object:  Table [dbo].[Platforms] ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Platforms](
	[Platform] [nvarchar](50) NOT NULL,
	[Code] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Platforms] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO



/****** Object:  Table [dbo].[plhist] ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PLhist](
	[revenue] [money] NULL,
	[Total_Expenses] [money] NULL,
	[Inventory_Value] [money] NULL,
	[Profit] [money] NULL,
	[Total_Account_Value] [money] NULL,
	[Cash_On_Hand] [money] NULL,
	[Timestamp] [datetime] NOT NULL
) ON [PRIMARY]
GO

