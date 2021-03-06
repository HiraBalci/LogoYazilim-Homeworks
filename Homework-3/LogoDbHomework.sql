USE [LogoDB]
GO
/****** Object:  Table [dbo].[Company]    Script Date: 28.03.2022 00:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[Id] [int] NOT NULL,
	[Company_Name] [nvarchar](50) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[Region] [nvarchar](50) NOT NULL,
	[Country] [nvarchar](50) NOT NULL,
	[Website] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 28.03.2022 00:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(9,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[Profession] [nvarchar](50) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[Age] [int] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Company] ([Id], [Company_Name], [City], [Region], [Country], [Website]) VALUES (11, N'Aselsan', N'Ankara', N'Yenimahalle', N'Türkiye', N'www.aselsan.com.tr')
INSERT [dbo].[Company] ([Id], [Company_Name], [City], [Region], [Country], [Website]) VALUES (12, N'Roketsan', N'Ankara', N'Çankaya', N'Türkiye', N'www.roketsan.com.tr')
INSERT [dbo].[Company] ([Id], [Company_Name], [City], [Region], [Country], [Website]) VALUES (21, N'Baykar', N'İstanbul', N'Esenyurt', N'Türkiye', N'www.baykar.com.tr')
INSERT [dbo].[Company] ([Id], [Company_Name], [City], [Region], [Country], [Website]) VALUES (22, N'Logo Yazılım', N'Ankara', N'Çankaya', N'Ankara', N'www.logoyazilim.com.tr')
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [Name], [Surname], [Profession], [City], [Age]) VALUES (11, N'Hira', N'Balcı', N'Electric and Electronic Engineer', N'Ankara', 25)
INSERT [dbo].[User] ([Id], [Name], [Surname], [Profession], [City], [Age]) VALUES (12, N'Berke', N'Balcı', N'Test Engineer', N'Ankara', 28)
INSERT [dbo].[User] ([Id], [Name], [Surname], [Profession], [City], [Age]) VALUES (21, N'Veli', N'Çakır', N'Product Manager', N'İstanbul', 30)
INSERT [dbo].[User] ([Id], [Name], [Surname], [Profession], [City], [Age]) VALUES (22, N'Eda', N'Boz', N'Computer Engineer', N'Ankara', 40)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Company]  WITH CHECK ADD  CONSTRAINT [FK_Company_User] FOREIGN KEY([Id])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Company] CHECK CONSTRAINT [FK_Company_User]
GO
/****** Object:  StoredProcedure [dbo].[spCompanyInsert]    Script Date: 28.03.2022 00:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create Proc [dbo].[spCompanyInsert]
(
  @Id int,
  @Company_Name nvarchar(50),
  @City nvarchar(50),
  @Region nvarchar(50),
  @Country nvarchar(50),
  @Website nvarchar(50)
)
As 
Begin
INSERT INTO [dbo].[Company]
           ([Id]
           ,[Company_Name]
           ,[City]
           ,[Region]
           ,[Country]
           ,[Website])
     VALUES
           (@Id
           ,@Company_Name 
           ,@City	
           ,@Region	
           ,@Country
           ,@Website)
End
GO
/****** Object:  StoredProcedure [dbo].[spUserInsert]    Script Date: 28.03.2022 00:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Proc [dbo].[spUserInsert]
(
  @Name nvarchar(50),
  @Surname nvarchar(50),
  @Profession nvarchar(50),
  @City nvarchar(50),
  @Age int
)
As 
Begin

INSERT INTO [dbo].[User]
           ([Name]
           ,[Surname]
           ,[Profession]
           ,[City]
           ,[Age])
     VALUES
           (@Name
           ,@Surname
           ,@Profession
           ,@City
           ,@Age)


End
GO
