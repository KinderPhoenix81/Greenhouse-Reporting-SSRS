USE [Greenhouse]
GO

/****** Object:  Table [dbo].[Employees]    Script Date: 10/21/2025 2:09:50 PM ******/

CREATE TABLE [dbo].[Employees](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](25) NOT NULL,
	[LastName] [nvarchar](25) NOT NULL,
	[Phone] [numeric](15, 0) NULL,
	[Email] [nvarchar](100) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[EmploymentStatus] [nvarchar](50) NOT NULL,
	[OnDuty] [bit] NOT NULL,
	[Opener] [bit] NOT NULL,
	[Closer] [bit] NOT NULL,
	[Wage] [decimal](5, 2) NOT NULL,
	[Position] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


/****** Object:  Table [dbo].[Invoices]    Script Date: 10/21/2025 2:10:13 PM ******/

CREATE TABLE [dbo].[Invoices](
	[InvoiceID] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceTotal] [decimal](8, 2) NOT NULL,
	[InvoiceDate] [date] NOT NULL,
	[InvoiceDueDate] [date] NOT NULL,
	[Paid] [bit] NOT NULL,
 CONSTRAINT [PK_Invoices] PRIMARY KEY CLUSTERED 
(
	[InvoiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Orders]    Script Date: 10/21/2025 2:10:27 PM ******/

CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrderTotal] [decimal](8, 2) NOT NULL,
	[OrderDate] [date] NOT NULL,
	[Received] [bit] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[ProductItems]    Script Date: 10/21/2025 2:10:34 PM ******/

CREATE TABLE [dbo].[ProductItems](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[Category] [nvarchar](50) NOT NULL,
	[OrderCost] [decimal](5, 2) NOT NULL,
	[PurchasePrice] [decimal](5, 2) NOT NULL,
	[QuantityInStock] [int] NOT NULL,
	[Perishable] [bit] NOT NULL,
	[InStock] [bit] NOT NULL,
	[ClearanceItem] [bit] NOT NULL,
	[SeasonalItem] [bit] NOT NULL,
 CONSTRAINT [PK_ProductItems] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[OrderItems]    Script Date: 10/21/2025 2:10:42 PM ******/

CREATE TABLE [dbo].[OrderItems](
	[OrderItemID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[OrderPrice] [decimal](8, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO

ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[ProductItems] ([ProductID])
GO