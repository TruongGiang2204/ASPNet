USE [master]
GO
/****** Object:  Database [WebASPNet]    Script Date: 15/01/2025 1:53:59 PM ******/
CREATE DATABASE [WebASPNet]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WebASPNet', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.TRUONGGIANG\MSSQL\DATA\WebASPNet.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WebASPNet_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.TRUONGGIANG\MSSQL\DATA\WebASPNet_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [WebASPNet] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WebASPNet].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WebASPNet] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WebASPNet] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WebASPNet] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WebASPNet] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WebASPNet] SET ARITHABORT OFF 
GO
ALTER DATABASE [WebASPNet] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WebASPNet] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WebASPNet] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WebASPNet] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WebASPNet] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WebASPNet] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WebASPNet] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WebASPNet] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WebASPNet] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WebASPNet] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WebASPNet] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WebASPNet] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WebASPNet] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WebASPNet] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WebASPNet] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WebASPNet] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WebASPNet] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WebASPNet] SET RECOVERY FULL 
GO
ALTER DATABASE [WebASPNet] SET  MULTI_USER 
GO
ALTER DATABASE [WebASPNet] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WebASPNet] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WebASPNet] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WebASPNet] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [WebASPNet] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [WebASPNet] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'WebASPNet', N'ON'
GO
ALTER DATABASE [WebASPNet] SET QUERY_STORE = OFF
GO
USE [WebASPNet]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 15/01/2025 1:53:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Image] [nvarchar](100) NULL,
	[Slug] [nvarchar](100) NULL,
	[ShowOnHomePage] [bit] NULL,
	[DisplayOrder] [int] NULL,
	[CreatedOnUtc] [datetime] NULL,
	[UpdatedOnUtc] [datetime] NULL,
	[Deleted] [bit] NULL,
 CONSTRAINT [PK_Brand] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 15/01/2025 1:53:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Image] [nvarchar](100) NULL,
	[Slug] [nvarchar](100) NULL,
	[ShowOnHomePage] [bit] NULL,
	[DisplayOrder] [int] NULL,
	[Deleted] [bit] NULL,
	[CreatedOnUtc] [datetime] NULL,
	[UpdatedOnutc] [datetime] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 15/01/2025 1:53:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NULL,
	[ProductId] [int] NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 15/01/2025 1:53:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
	[UserId] [int] NULL,
	[Status] [int] NULL,
	[CreatedOnUtc] [datetime] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 15/01/2025 1:53:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NULL,
	[BrandId] [int] NULL,
	[TypeId] [int] NULL,
	[ShortDes] [nvarchar](100) NULL,
	[Name] [nvarchar](100) NULL,
	[FullDescription] [nvarchar](500) NULL,
	[Price] [float] NULL,
	[PriceDiscount] [float] NULL,
	[Slug] [nvarchar](50) NULL,
	[Image] [nvarchar](100) NULL,
	[Deleted] [bit] NULL,
	[ShowOnHomePage] [bit] NULL,
	[DisplayOrder] [int] NULL,
	[CreatedOnUtc] [datetime] NULL,
	[UpdatedOnUtc] [datetime] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 15/01/2025 1:53:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[IsAdmin] [bit] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Brand] ON 

INSERT [dbo].[Brand] ([Id], [Name], [Image], [Slug], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc], [Deleted]) VALUES (1, N'Apple', N'Apple482-b_37.jpg', N'apple', 1, 1, CAST(N'2024-12-29T13:51:32.000' AS DateTime), CAST(N'2024-12-29T13:51:32.000' AS DateTime), 0)
INSERT [dbo].[Brand] ([Id], [Name], [Image], [Slug], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc], [Deleted]) VALUES (2, N'Samsung', N'3f68e22880dd800e9e34d55245048a0f.png', N'samsung', 1, 2, CAST(N'2024-12-29T13:51:32.000' AS DateTime), CAST(N'2024-12-29T13:51:32.000' AS DateTime), 0)
INSERT [dbo].[Brand] ([Id], [Name], [Image], [Slug], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc], [Deleted]) VALUES (3, N'Xiaomi', N'e9df3ae9fb60a1460e9030975d0e024a.png', N'xiaomi', 1, 3, CAST(N'2024-12-29T13:51:32.000' AS DateTime), CAST(N'2024-12-29T13:51:32.000' AS DateTime), 0)
INSERT [dbo].[Brand] ([Id], [Name], [Image], [Slug], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc], [Deleted]) VALUES (4, N'Oppo', N'2cea467041fb9effb3a6d3dcc88f38f8.png', N'oppo', 1, 4, CAST(N'2024-12-29T13:51:32.000' AS DateTime), CAST(N'2024-12-29T13:51:32.000' AS DateTime), 0)
INSERT [dbo].[Brand] ([Id], [Name], [Image], [Slug], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc], [Deleted]) VALUES (5, N'Dell', N'c9eac61be9530e9c6c4404ba573086c4.png', N'dell', 1, 5, CAST(N'2024-12-29T13:51:32.000' AS DateTime), CAST(N'2024-12-29T13:51:32.000' AS DateTime), 0)
INSERT [dbo].[Brand] ([Id], [Name], [Image], [Slug], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc], [Deleted]) VALUES (6, N'HP', N'b2118350c0f60b9ecb1e8ef65cb2de96.png', N'hp', 1, 6, CAST(N'2024-12-29T13:51:32.000' AS DateTime), CAST(N'2024-12-29T13:51:32.000' AS DateTime), 0)
INSERT [dbo].[Brand] ([Id], [Name], [Image], [Slug], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc], [Deleted]) VALUES (7, N'Asus', N'9f72697b78e17090628020cca9cce5e6.png', N'asus', 1, 7, CAST(N'2024-12-29T13:51:32.000' AS DateTime), CAST(N'2024-12-29T13:51:32.000' AS DateTime), 0)
INSERT [dbo].[Brand] ([Id], [Name], [Image], [Slug], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc], [Deleted]) VALUES (8, N'Lenovo', N'0b907e4551b7ad8857426905ae627cad.png', N'lenovo', 1, 8, CAST(N'2024-12-29T13:51:32.000' AS DateTime), CAST(N'2024-12-29T13:51:32.000' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Brand] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Name], [Image], [Slug], [ShowOnHomePage], [DisplayOrder], [Deleted], [CreatedOnUtc], [UpdatedOnutc]) VALUES (1, N'Điện thoại', N'dien-thoai.jpg', N'dien-thoai', 1, 1, 0, CAST(N'2024-12-29T13:48:57.293' AS DateTime), CAST(N'2024-12-29T13:48:57.293' AS DateTime))
INSERT [dbo].[Category] ([Id], [Name], [Image], [Slug], [ShowOnHomePage], [DisplayOrder], [Deleted], [CreatedOnUtc], [UpdatedOnutc]) VALUES (2, N'Máy tính', N'may-tinh.jpg', N'may-tinh', 0, 2, 0, CAST(N'2024-12-29T13:48:57.293' AS DateTime), CAST(N'2024-12-29T13:48:57.293' AS DateTime))
INSERT [dbo].[Category] ([Id], [Name], [Image], [Slug], [ShowOnHomePage], [DisplayOrder], [Deleted], [CreatedOnUtc], [UpdatedOnutc]) VALUES (3, N'Máy tính bảng', N'may-tinh-bang.jpg', N'may-tinh-bang', 1, 3, 0, CAST(N'2024-12-29T13:48:57.293' AS DateTime), CAST(N'2024-12-29T13:48:57.293' AS DateTime))
INSERT [dbo].[Category] ([Id], [Name], [Image], [Slug], [ShowOnHomePage], [DisplayOrder], [Deleted], [CreatedOnUtc], [UpdatedOnutc]) VALUES (4, N'Phụ kiện', N'phu-kien.jpg', N'phu-kien', 0, 4, 0, CAST(N'2024-12-29T13:48:57.293' AS DateTime), CAST(N'2024-12-29T13:48:57.293' AS DateTime))
INSERT [dbo].[Category] ([Id], [Name], [Image], [Slug], [ShowOnHomePage], [DisplayOrder], [Deleted], [CreatedOnUtc], [UpdatedOnutc]) VALUES (5, N'Đồng hồ thông minh', N'dong-ho-thong-minh.jpg', N'dong-ho-thong-minh', 1, 5, 0, CAST(N'2024-12-29T13:48:57.293' AS DateTime), CAST(N'2024-12-29T13:48:57.293' AS DateTime))
INSERT [dbo].[Category] ([Id], [Name], [Image], [Slug], [ShowOnHomePage], [DisplayOrder], [Deleted], [CreatedOnUtc], [UpdatedOnutc]) VALUES (6, N'Đồng hồ thời trang', N'dong-ho-thoi-trang.jpg', N'dong-ho-thoi-trang', 0, 6, 0, CAST(N'2024-12-29T13:48:57.293' AS DateTime), CAST(N'2024-12-29T13:48:57.293' AS DateTime))
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (1, 1, 71, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (2, 2, 71, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (3, 2, 72, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (4, 3, 73, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (5, 4, 75, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (6, 5, 71, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (7, 6, 83, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (8, 7, 71, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (9, 8, 72, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (10, 9, 72, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (11, 10, 71, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (12, 11, 71, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (13, 12, 71, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (14, 12, 72, 1)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [name], [UserId], [Status], [CreatedOnUtc]) VALUES (1, N'DonHang-20241229143036', NULL, 17, CAST(N'2024-12-29T14:30:36.573' AS DateTime))
INSERT [dbo].[Orders] ([Id], [name], [UserId], [Status], [CreatedOnUtc]) VALUES (2, N'DonHang-20241229143110', NULL, 17, CAST(N'2024-12-29T14:31:10.527' AS DateTime))
INSERT [dbo].[Orders] ([Id], [name], [UserId], [Status], [CreatedOnUtc]) VALUES (3, N'DonHang-20241229143410', 1, 17, CAST(N'2024-12-29T14:34:10.093' AS DateTime))
INSERT [dbo].[Orders] ([Id], [name], [UserId], [Status], [CreatedOnUtc]) VALUES (4, N'DonHang-20241230085130', 1, 17, CAST(N'2024-12-30T08:51:30.197' AS DateTime))
INSERT [dbo].[Orders] ([Id], [name], [UserId], [Status], [CreatedOnUtc]) VALUES (5, N'DonHang-20241230121802', 1, 17, CAST(N'2024-12-30T12:18:02.963' AS DateTime))
INSERT [dbo].[Orders] ([Id], [name], [UserId], [Status], [CreatedOnUtc]) VALUES (6, N'DonHang-20241230134320', 1, 17, CAST(N'2024-12-30T13:43:20.167' AS DateTime))
INSERT [dbo].[Orders] ([Id], [name], [UserId], [Status], [CreatedOnUtc]) VALUES (7, N'DonHang-20241230160032', 1, 17, CAST(N'2024-12-30T16:00:32.553' AS DateTime))
INSERT [dbo].[Orders] ([Id], [name], [UserId], [Status], [CreatedOnUtc]) VALUES (8, N'DonHang-20250115131616', 2, 17, CAST(N'2025-01-15T13:16:16.980' AS DateTime))
INSERT [dbo].[Orders] ([Id], [name], [UserId], [Status], [CreatedOnUtc]) VALUES (9, N'DonHang-20250115131623', 2, 17, CAST(N'2025-01-15T13:16:23.213' AS DateTime))
INSERT [dbo].[Orders] ([Id], [name], [UserId], [Status], [CreatedOnUtc]) VALUES (10, N'DonHang-20250115133602', 2, 17, CAST(N'2025-01-15T13:36:02.160' AS DateTime))
INSERT [dbo].[Orders] ([Id], [name], [UserId], [Status], [CreatedOnUtc]) VALUES (11, N'DonHang-20250115133646', 2, 17, CAST(N'2025-01-15T13:36:46.303' AS DateTime))
INSERT [dbo].[Orders] ([Id], [name], [UserId], [Status], [CreatedOnUtc]) VALUES (12, N'DonHang-20250115134730', 1, 17, CAST(N'2025-01-15T13:47:30.890' AS DateTime))
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [CategoryId], [BrandId], [TypeId], [ShortDes], [Name], [FullDescription], [Price], [PriceDiscount], [Slug], [Image], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (71, 1, 1, NULL, N'Mẫu iPhone cao cấp nhất với camera đỉnh cao.', N'iPhone 14 Pro Max', N'iPhone 14 Pro Max mang lại trải nghiệm chụp ảnh và hiệu năng vượt trội.', 29990000, 26991000, N'iphone-14-pro-max', N'iphone14promax.jpg', NULL, 1, NULL, CAST(N'2024-12-29T14:07:15.760' AS DateTime), CAST(N'2024-12-29T14:07:15.760' AS DateTime))
INSERT [dbo].[Product] ([Id], [CategoryId], [BrandId], [TypeId], [ShortDes], [Name], [FullDescription], [Price], [PriceDiscount], [Slug], [Image], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (72, 1, 1, NULL, N'Thiết kế sang trọng và hiệu năng mạnh mẽ.', N'iPhone 13 Pro', N'iPhone 13 Pro cung cấp hiệu năng mạnh mẽ và camera tiên tiến.', 24990000, 22491000, N'iphone-13-pro', N'iphone13pro.jpg', NULL, 1, NULL, CAST(N'2024-12-29T14:07:15.760' AS DateTime), CAST(N'2024-12-29T14:07:15.760' AS DateTime))
INSERT [dbo].[Product] ([Id], [CategoryId], [BrandId], [TypeId], [ShortDes], [Name], [FullDescription], [Price], [PriceDiscount], [Slug], [Image], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (73, 1, 1, NULL, N'Mẫu iPhone phổ biến với thiết kế hiện đại.', N'iPhone 12', N'iPhone 12 mang đến giá trị vượt trội với hiệu năng ổn định.', 19990000, 17991000, N'iphone-12', N'iphone12.jpg', NULL, 1, NULL, CAST(N'2024-12-29T14:07:15.760' AS DateTime), CAST(N'2024-12-29T14:07:15.760' AS DateTime))
INSERT [dbo].[Product] ([Id], [CategoryId], [BrandId], [TypeId], [ShortDes], [Name], [FullDescription], [Price], [PriceDiscount], [Slug], [Image], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (74, 1, 1, NULL, N'Mẫu iPhone nhỏ gọn với hiệu năng mạnh mẽ.', N'iPhone SE 2022', N'iPhone SE 2022 mang lại hiệu năng tốt trong một thiết kế nhỏ gọn.', 12990000, 11691000, N'iphone-se-2022', N'iphonese2022.jpg', NULL, 1, NULL, CAST(N'2024-12-29T14:07:15.760' AS DateTime), CAST(N'2024-12-29T14:07:15.760' AS DateTime))
INSERT [dbo].[Product] ([Id], [CategoryId], [BrandId], [TypeId], [ShortDes], [Name], [FullDescription], [Price], [PriceDiscount], [Slug], [Image], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (75, 1, 1, NULL, N'Màn hình lớn, pin bền bỉ.', N'iPhone 14 Plus', N'iPhone 14 Plus mang đến trải nghiệm giải trí vượt trội với màn hình lớn.', 22990000, 20691000, N'iphone-14-plus', N'iphone14plus.jpg', NULL, 1, NULL, CAST(N'2024-12-29T14:07:15.760' AS DateTime), CAST(N'2024-12-29T14:07:15.760' AS DateTime))
INSERT [dbo].[Product] ([Id], [CategoryId], [BrandId], [TypeId], [ShortDes], [Name], [FullDescription], [Price], [PriceDiscount], [Slug], [Image], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (76, 1, 2, NULL, N'Mẫu flagship với camera ấn tượng.', N'Samsung Galaxy S23 Ultra', N'Samsung Galaxy S23 Ultra là lựa chọn hoàn hảo cho nhiếp ảnh di động.', 24990000, 22491000, N'samsung-galaxy-s23-ultra', N'samsung-s23ultra.jpg', NULL, 0, NULL, CAST(N'2024-12-29T14:07:15.760' AS DateTime), CAST(N'2024-12-29T14:07:15.760' AS DateTime))
INSERT [dbo].[Product] ([Id], [CategoryId], [BrandId], [TypeId], [ShortDes], [Name], [FullDescription], [Price], [PriceDiscount], [Slug], [Image], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (77, 1, 2, NULL, N'Thiết kế gọn nhẹ, hiệu năng mạnh.', N'Samsung Galaxy S22', N'Samsung Galaxy S22 đáp ứng mọi nhu cầu sử dụng hàng ngày.', 21990000, 19791000, N'samsung-galaxy-s22', N'samsung-s22.jpg', NULL, 0, NULL, CAST(N'2024-12-29T14:07:15.760' AS DateTime), CAST(N'2024-12-29T14:07:15.760' AS DateTime))
INSERT [dbo].[Product] ([Id], [CategoryId], [BrandId], [TypeId], [ShortDes], [Name], [FullDescription], [Price], [PriceDiscount], [Slug], [Image], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (78, 1, 2, NULL, N'Điện thoại màn hình gập tiên tiến.', N'Samsung Galaxy Z Fold 4', N'Samsung Galaxy Z Fold 4 mang đến trải nghiệm độc đáo và linh hoạt.', 42990000, 38691000, N'samsung-galaxy-z-fold-4', N'samsung-zfold4.jpg', NULL, 0, NULL, CAST(N'2024-12-29T14:07:15.760' AS DateTime), CAST(N'2024-12-29T14:07:15.760' AS DateTime))
INSERT [dbo].[Product] ([Id], [CategoryId], [BrandId], [TypeId], [ShortDes], [Name], [FullDescription], [Price], [PriceDiscount], [Slug], [Image], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (79, 1, 2, NULL, N'Mẫu điện thoại gập nhỏ gọn.', N'Samsung Galaxy Z Flip 4', N'Samsung Galaxy Z Flip 4 kết hợp thời trang và công nghệ.', 25990000, 23391000, N'samsung-galaxy-z-flip-4', N'samsung-zflip4.jpg', NULL, 0, NULL, CAST(N'2024-12-29T14:07:15.760' AS DateTime), CAST(N'2024-12-29T14:07:15.760' AS DateTime))
INSERT [dbo].[Product] ([Id], [CategoryId], [BrandId], [TypeId], [ShortDes], [Name], [FullDescription], [Price], [PriceDiscount], [Slug], [Image], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (80, 2, 5, NULL, N'Mẫu laptop cao cấp cho dân chuyên nghiệp.', N'Dell XPS 15', N'Dell XPS 15 mang lại hiệu năng vượt trội và thiết kế sang trọng.', 35990000, 32391000, N'dell-xps-15', N'dell-xps-15.jpg', NULL, 0, NULL, CAST(N'2024-12-29T14:07:15.760' AS DateTime), CAST(N'2024-12-29T14:07:15.760' AS DateTime))
INSERT [dbo].[Product] ([Id], [CategoryId], [BrandId], [TypeId], [ShortDes], [Name], [FullDescription], [Price], [PriceDiscount], [Slug], [Image], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (81, 2, 5, NULL, N'Lựa chọn phù hợp cho học sinh, sinh viên.', N'Dell Inspiron 14', N'Dell Inspiron 14 có thiết kế hiện đại và hiệu năng ổn định.', 19990000, 17991000, N'dell-inspiron-14', N'dell-inspiron-14.jpg', NULL, 0, NULL, CAST(N'2024-12-29T14:07:15.760' AS DateTime), CAST(N'2024-12-29T14:07:15.760' AS DateTime))
INSERT [dbo].[Product] ([Id], [CategoryId], [BrandId], [TypeId], [ShortDes], [Name], [FullDescription], [Price], [PriceDiscount], [Slug], [Image], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (82, 2, 5, NULL, N'Dành cho doanh nhân với độ bền cao.', N'Dell Latitude 7420', N'Dell Latitude 7420 cung cấp tính bảo mật và hiệu năng tối ưu.', 24990000, 22491000, N'dell-latitude-7420', N'dell-latitude-7420.jpg', NULL, 0, NULL, CAST(N'2024-12-29T14:07:15.760' AS DateTime), CAST(N'2024-12-29T14:07:15.760' AS DateTime))
INSERT [dbo].[Product] ([Id], [CategoryId], [BrandId], [TypeId], [ShortDes], [Name], [FullDescription], [Price], [PriceDiscount], [Slug], [Image], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (83, 2, 5, NULL, N'Laptop chơi game cao cấp.', N'Dell Alienware M15', N'Dell Alienware M15 mang lại trải nghiệm gaming đỉnh cao.', 49990000, 44991000, N'dell-alienware-m15', N'dell-alienware-m15.jpg', NULL, 1, NULL, CAST(N'2024-12-29T14:07:15.760' AS DateTime), CAST(N'2024-12-29T14:07:15.760' AS DateTime))
INSERT [dbo].[Product] ([Id], [CategoryId], [BrandId], [TypeId], [ShortDes], [Name], [FullDescription], [Price], [PriceDiscount], [Slug], [Image], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (84, 2, 7, NULL, N'Mẫu laptop gaming mỏng nhẹ.', N'Asus ROG Zephyrus G14', N'Asus ROG Zephyrus G14 kết hợp hiệu năng mạnh mẽ và thiết kế nhỏ gọn.', 39990000, 35991000, N'asus-rog-zephyrus-g14', N'asus-rog-zephyrus-g14.jpg', NULL, 0, NULL, CAST(N'2024-12-29T14:07:15.760' AS DateTime), CAST(N'2024-12-29T14:07:15.760' AS DateTime))
INSERT [dbo].[Product] ([Id], [CategoryId], [BrandId], [TypeId], [ShortDes], [Name], [FullDescription], [Price], [PriceDiscount], [Slug], [Image], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (85, 2, 7, NULL, N'Lựa chọn phù hợp cho học tập và làm việc.', N'Asus VivoBook 15', N'Asus VivoBook 15 có thiết kế trẻ trung và cấu hình tốt.', 16990000, 15291000, N'asus-vivobook-15', N'asus-vivobook-15.jpg', NULL, 1, NULL, CAST(N'2024-12-29T14:07:15.760' AS DateTime), CAST(N'2024-12-29T14:07:15.760' AS DateTime))
INSERT [dbo].[Product] ([Id], [CategoryId], [BrandId], [TypeId], [ShortDes], [Name], [FullDescription], [Price], [PriceDiscount], [Slug], [Image], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (86, 2, 7, NULL, N'Laptop siêu mỏng với màn hình đẹp.', N'Asus ZenBook 14', N'Asus ZenBook 14 mang lại trải nghiệm đẳng cấp với màn hình sắc nét.', 25990000, 23391000, N'asus-zenbook-14', N'asus-zenbook-14.jpg', NULL, 0, NULL, CAST(N'2024-12-29T14:07:15.760' AS DateTime), CAST(N'2024-12-29T14:07:15.760' AS DateTime))
INSERT [dbo].[Product] ([Id], [CategoryId], [BrandId], [TypeId], [ShortDes], [Name], [FullDescription], [Price], [PriceDiscount], [Slug], [Image], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (87, 1, 3, NULL, N'Mẫu flagship với camera Leica.', N'Xiaomi 13 Pro', N'Xiaomi 13 Pro mang lại trải nghiệm cao cấp với công nghệ tiên tiến.', 18990000, 17091000, N'xiaomi-13-pro', N'xiaomi-13-pro.jpg', NULL, 0, NULL, CAST(N'2024-12-29T14:12:06.930' AS DateTime), CAST(N'2024-12-29T14:12:06.930' AS DateTime))
INSERT [dbo].[Product] ([Id], [CategoryId], [BrandId], [TypeId], [ShortDes], [Name], [FullDescription], [Price], [PriceDiscount], [Slug], [Image], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (88, 1, 3, NULL, N'Dòng điện thoại tầm trung giá tốt.', N'Xiaomi Redmi Note 12', N'Xiaomi Redmi Note 12 kết hợp giá trị và hiệu năng vượt trội.', 6999000, 6299100, N'xiaomi-redmi-note-12', N'xiaomi-redmi-note-12.jpg', NULL, 1, NULL, CAST(N'2024-12-29T14:12:06.930' AS DateTime), CAST(N'2024-12-29T14:12:06.930' AS DateTime))
INSERT [dbo].[Product] ([Id], [CategoryId], [BrandId], [TypeId], [ShortDes], [Name], [FullDescription], [Price], [PriceDiscount], [Slug], [Image], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (89, 1, 3, NULL, N'Điện thoại hiệu năng mạnh, giá tốt.', N'Xiaomi Poco X5 Pro', N'Xiaomi Poco X5 Pro phù hợp cho người dùng yêu thích gaming.', 8999000, 8099100, N'xiaomi-poco-x5-pro', N'xiaomi-poco-x5-pro.jpg', NULL, 0, NULL, CAST(N'2024-12-29T14:12:06.930' AS DateTime), CAST(N'2024-12-29T14:12:06.930' AS DateTime))
INSERT [dbo].[Product] ([Id], [CategoryId], [BrandId], [TypeId], [ShortDes], [Name], [FullDescription], [Price], [PriceDiscount], [Slug], [Image], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (90, 1, 4, NULL, N'Mẫu flagship với camera hàng đầu.', N'Oppo Find X6 Pro', N'Oppo Find X6 Pro mang đến trải nghiệm nhiếp ảnh chuyên nghiệp.', 19990000, 17991000, N'oppo-find-x6-pro', N'oppo-find-x6-pro.jpg', NULL, 0, NULL, CAST(N'2024-12-29T14:12:06.930' AS DateTime), CAST(N'2024-12-29T14:12:06.930' AS DateTime))
INSERT [dbo].[Product] ([Id], [CategoryId], [BrandId], [TypeId], [ShortDes], [Name], [FullDescription], [Price], [PriceDiscount], [Slug], [Image], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (91, 1, 4, NULL, N'Mẫu điện thoại thời trang.', N'Oppo Reno 10', N'Oppo Reno 10 kết hợp thiết kế trẻ trung và hiệu năng tốt.', 10990000, 9899100, N'oppo-reno-10', N'oppo-reno-10.jpg', NULL, 0, NULL, CAST(N'2024-12-29T14:12:06.930' AS DateTime), CAST(N'2024-12-29T14:12:06.930' AS DateTime))
INSERT [dbo].[Product] ([Id], [CategoryId], [BrandId], [TypeId], [ShortDes], [Name], [FullDescription], [Price], [PriceDiscount], [Slug], [Image], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (92, 1, 4, NULL, N'Điện thoại giá rẻ, hiệu năng ổn định.', N'Oppo A78', N'Oppo A78 phù hợp cho nhu cầu cơ bản hàng ngày.', 5999000, 5399100, N'oppo-a78', N'oppo-a78.jpg', NULL, 0, NULL, CAST(N'2024-12-29T14:12:06.930' AS DateTime), CAST(N'2024-12-29T14:12:06.930' AS DateTime))
INSERT [dbo].[Product] ([Id], [CategoryId], [BrandId], [TypeId], [ShortDes], [Name], [FullDescription], [Price], [PriceDiscount], [Slug], [Image], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (93, 2, 8, NULL, N'Mẫu laptop cao cấp cho doanh nhân.', N'Lenovo ThinkPad X1 Carbon', N'Lenovo ThinkPad X1 Carbon nổi bật với độ bền và tính bảo mật cao.', 40990000, 36891000, N'lenovo-thinkpad-x1-carbon', N'lenovo-thinkpad-x1-carbon.jpg', NULL, 1, NULL, CAST(N'2024-12-29T14:12:06.930' AS DateTime), CAST(N'2024-12-29T14:12:06.930' AS DateTime))
INSERT [dbo].[Product] ([Id], [CategoryId], [BrandId], [TypeId], [ShortDes], [Name], [FullDescription], [Price], [PriceDiscount], [Slug], [Image], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (94, 2, 8, NULL, N'Lựa chọn phù hợp cho sinh viên.', N'Lenovo IdeaPad 3', N'Lenovo IdeaPad 3 kết hợp thiết kế hiện đại và giá cả phải chăng.', 12990000, 11691000, N'lenovo-ideapad-3', N'lenovo-ideapad-3.jpg', NULL, 1, NULL, CAST(N'2024-12-29T14:12:06.930' AS DateTime), CAST(N'2024-12-29T14:12:06.930' AS DateTime))
INSERT [dbo].[Product] ([Id], [CategoryId], [BrandId], [TypeId], [ShortDes], [Name], [FullDescription], [Price], [PriceDiscount], [Slug], [Image], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (95, 2, 8, NULL, N'Laptop gaming mạnh mẽ.', N'Lenovo Legion 5', N'Lenovo Legion 5 mang lại hiệu năng vượt trội cho game thủ.', 29990000, 26991000, N'lenovo-legion-5', N'lenovo-legion-5.jpg', NULL, 1, NULL, CAST(N'2024-12-29T14:12:06.930' AS DateTime), CAST(N'2024-12-29T14:12:06.930' AS DateTime))
INSERT [dbo].[Product] ([Id], [CategoryId], [BrandId], [TypeId], [ShortDes], [Name], [FullDescription], [Price], [PriceDiscount], [Slug], [Image], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (96, 3, 8, NULL, N'Máy tính bảng cao cấp.', N'Lenovo Tab P11 Pro', N'Lenovo Tab P11 Pro là lựa chọn hoàn hảo cho công việc và giải trí.', 10990000, 9899100, N'lenovo-tab-p11-pro', N'lenovo-tab-p11-pro.jpg', NULL, 0, NULL, CAST(N'2024-12-29T14:12:06.930' AS DateTime), CAST(N'2024-12-29T14:12:06.930' AS DateTime))
INSERT [dbo].[Product] ([Id], [CategoryId], [BrandId], [TypeId], [ShortDes], [Name], [FullDescription], [Price], [PriceDiscount], [Slug], [Image], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (97, 3, 8, NULL, N'Mẫu máy tính bảng giá rẻ.', N'Lenovo Tab M10 Plus', N'Lenovo Tab M10 Plus phù hợp cho nhu cầu giải trí cơ bản.', 5999000, 5399100, N'lenovo-tab-m10-plus', N'lenovo-tab-m10-plus.jpg', NULL, 1, NULL, CAST(N'2024-12-29T14:12:06.930' AS DateTime), CAST(N'2024-12-29T14:12:06.930' AS DateTime))
INSERT [dbo].[Product] ([Id], [CategoryId], [BrandId], [TypeId], [ShortDes], [Name], [FullDescription], [Price], [PriceDiscount], [Slug], [Image], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (98, 3, 8, NULL, N'Máy tính bảng cho dân chuyên nghiệp.', N'Lenovo Yoga Tab 13', N'Lenovo Yoga Tab 13 mang lại hiệu năng cao với thiết kế độc đáo.', 18990000, 17091000, N'lenovo-yoga-tab-13', N'lenovo-yoga-tab-13.jpg', NULL, 0, NULL, CAST(N'2024-12-29T14:12:06.930' AS DateTime), CAST(N'2024-12-29T14:12:06.930' AS DateTime))
INSERT [dbo].[Product] ([Id], [CategoryId], [BrandId], [TypeId], [ShortDes], [Name], [FullDescription], [Price], [PriceDiscount], [Slug], [Image], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (119, 1, 1, NULL, NULL, N'a', N'a', NULL, NULL, NULL, N'kangaroo-kg380b-190x190.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Id], [CategoryId], [BrandId], [TypeId], [ShortDes], [Name], [FullDescription], [Price], [PriceDiscount], [Slug], [Image], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (120, 1, 1, 1, N'1', N'1', N'a', 1, 1, N'1', NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Id], [CategoryId], [BrandId], [TypeId], [ShortDes], [Name], [FullDescription], [Price], [PriceDiscount], [Slug], [Image], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (121, 1, 1, 2, N'a', N'a', N'<table border="1" cellpadding="1" cellspacing="1" style="width:500px">
	<tbody>
		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
	</tbody>
</table>

<p>&nbsp;</p>
', NULL, NULL, NULL, N'z6033344320231_e33867c4802e8a3a0de4821c202e237b.jpg', 1, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (1, N'Giang', N'Nguyễn Trường', N'nguyentruonggiangmc113@gmail.com', N'4297f44b13955235245b2497399d7a93', 0)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (2, N'Giang', N'Nguyễn Trường', N'sieumvp22182@gmail.com', N'4297f44b13955235245b2497399d7a93', 1)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (3, N'a', N'aa', N'a@gmail.com', N'ypeBEsobvcr6wjGzmiPcTaeG7/gUfE5yuYB3ha/uSLs=', NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (4, N'Giang', N'Trường', N'giang@gmail.com', N'6e9abeea535938c496a261b3b39c0d79', NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Orders]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Product]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Brand] FOREIGN KEY([BrandId])
REFERENCES [dbo].[Brand] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Brand]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
USE [master]
GO
ALTER DATABASE [WebASPNet] SET  READ_WRITE 
GO
