USE [EmpManagement]
GO
/****** Object:  StoredProcedure [dbo].[AddEmp]    Script Date: 7/11/2020 8:10:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddEmp]
   @EmpName nvarchar(150),  
    @EmpAddress nvarchar(250),  
    @EmailId nvarchar(150),  
    @MobileNum nvarchar(50),
	@Country  nvarchar(150),
	@State  nvarchar(150),
	@City nvarchar(150),
	@Image nvarchar(max)
   
AS  
 
BEGIN  
SET NOCOUNT ON;  
insert into tblEmp(EmpName, EmpAddress, EmailId, MobileNum,Country,State,City,Image)  
      values(@EmpName, @EmpAddress, @EmailId, @MobileNum,@Country,@State,@City,@Image)  
END  

GO
/****** Object:  StoredProcedure [dbo].[DeleteEmp]    Script Date: 7/11/2020 8:10:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteEmp]
   @Id int
   
AS  
 
BEGIN  
SET NOCOUNT ON;  
DELETE from tblEmp where	Id=@Id 
END  

GO
/****** Object:  StoredProcedure [dbo].[GetAllEmps]    Script Date: 7/11/2020 8:10:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllEmps]
  
   
AS  
 
BEGIN  
SET NOCOUNT ON;  
SELECT * from TBLEMP
END  

GO
/****** Object:  StoredProcedure [dbo].[GetEmpById]    Script Date: 7/11/2020 8:10:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetEmpById]
  @Id int
   
AS  
 
BEGIN  
SET NOCOUNT ON;  
SELECT * from TBLEMP where Id=@Id
END  

GO
/****** Object:  StoredProcedure [dbo].[UpdateEmp]    Script Date: 7/11/2020 8:10:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateEmp]
  @Id int,
  @EmpName nvarchar(150),
  @EmpAddress nvarchar(250),
  @EmailId nvarchar(150),
  @MobileNum nvarchar(50),
  @Country nvarchar(150),
  @State nvarchar(150),
  @City nvarchar(150),
  @Image nvarchar(max)

AS  
BEGIN  
SET NOCOUNT ON;  
UPDATE tblEmp SET EmpName=@EmpName,
                  EmpAddress=@EmpAddress,
                  EmailId=@EmailId,
				  MobileNum=@MobileNum,
				  Country=@Country,
				  State=@State,
				  City=@City,
				  Image=@Image

where Id=@Id	 
END  

GO
/****** Object:  Table [dbo].[tblCity]    Script Date: 7/11/2020 8:10:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCity](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [nvarchar](150) NULL,
	[StateId] [int] NULL,
	[CountryId] [int] NULL,
 CONSTRAINT [PK_tblCity] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblCountry]    Script Date: 7/11/2020 8:10:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCountry](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CountryName] [nvarchar](150) NULL,
 CONSTRAINT [PK_tblCountry] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblEmp]    Script Date: 7/11/2020 8:10:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmp](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmpName] [nvarchar](150) NULL,
	[EmpAddress] [nvarchar](250) NULL,
	[EmailId] [nvarchar](150) NULL,
	[MobileNum] [nvarchar](50) NULL,
	[Country] [nvarchar](150) NULL,
	[State] [nvarchar](150) NULL,
	[City] [nvarchar](150) NULL,
	[Image] [nvarchar](max) NULL,
 CONSTRAINT [PK_tblEmp] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblState]    Script Date: 7/11/2020 8:10:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblState](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StateName] [nvarchar](150) NULL,
	[CountryId] [int] NULL,
 CONSTRAINT [PK_tblState] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[tblCity] ON 

INSERT [dbo].[tblCity] ([Id], [CityName], [StateId], [CountryId]) VALUES (1, N'Bangalore', 1, 2)
INSERT [dbo].[tblCity] ([Id], [CityName], [StateId], [CountryId]) VALUES (2, N'Maysore', 1, 2)
INSERT [dbo].[tblCity] ([Id], [CityName], [StateId], [CountryId]) VALUES (3, N'Mandiya', 1, 2)
INSERT [dbo].[tblCity] ([Id], [CityName], [StateId], [CountryId]) VALUES (4, N'Chickbalapur', 1, 2)
SET IDENTITY_INSERT [dbo].[tblCity] OFF
SET IDENTITY_INSERT [dbo].[tblCountry] ON 

INSERT [dbo].[tblCountry] ([Id], [CountryName]) VALUES (1, N'Nepal')
INSERT [dbo].[tblCountry] ([Id], [CountryName]) VALUES (2, N'India')
INSERT [dbo].[tblCountry] ([Id], [CountryName]) VALUES (3, N'US')
INSERT [dbo].[tblCountry] ([Id], [CountryName]) VALUES (4, N'UK')
SET IDENTITY_INSERT [dbo].[tblCountry] OFF
SET IDENTITY_INSERT [dbo].[tblEmp] ON 

INSERT [dbo].[tblEmp] ([Id], [EmpName], [EmpAddress], [EmailId], [MobileNum], [Country], [State], [City], [Image]) VALUES (1, N'Chandradev', N'Bangalore', N'chandradev@gmail.com', N'1234567890', N'India', N'Karnataka', N'Bangalore', NULL)
SET IDENTITY_INSERT [dbo].[tblEmp] OFF
SET IDENTITY_INSERT [dbo].[tblState] ON 

INSERT [dbo].[tblState] ([Id], [StateName], [CountryId]) VALUES (1, N'Karnataka', 2)
INSERT [dbo].[tblState] ([Id], [StateName], [CountryId]) VALUES (2, N'Bihar', 2)
INSERT [dbo].[tblState] ([Id], [StateName], [CountryId]) VALUES (3, N'UP', 2)
INSERT [dbo].[tblState] ([Id], [StateName], [CountryId]) VALUES (4, N'MP', 2)
INSERT [dbo].[tblState] ([Id], [StateName], [CountryId]) VALUES (5, N'West Bangal', 2)
INSERT [dbo].[tblState] ([Id], [StateName], [CountryId]) VALUES (6, N'Andhra', 2)
INSERT [dbo].[tblState] ([Id], [StateName], [CountryId]) VALUES (7, N'Maharathra', 2)
INSERT [dbo].[tblState] ([Id], [StateName], [CountryId]) VALUES (8, N'Bara', 1)
INSERT [dbo].[tblState] ([Id], [StateName], [CountryId]) VALUES (9, N'Parsha', 1)
INSERT [dbo].[tblState] ([Id], [StateName], [CountryId]) VALUES (10, N'Janakpur', 1)
INSERT [dbo].[tblState] ([Id], [StateName], [CountryId]) VALUES (11, N'Mechi', 1)
INSERT [dbo].[tblState] ([Id], [StateName], [CountryId]) VALUES (12, N'Mahakalli', 1)
SET IDENTITY_INSERT [dbo].[tblState] OFF
ALTER TABLE [dbo].[tblCity]  WITH CHECK ADD  CONSTRAINT [FK_tblCity_tblCity] FOREIGN KEY([StateId])
REFERENCES [dbo].[tblState] ([Id])
GO
ALTER TABLE [dbo].[tblCity] CHECK CONSTRAINT [FK_tblCity_tblCity]
GO
ALTER TABLE [dbo].[tblCity]  WITH CHECK ADD  CONSTRAINT [FK_tblCity_tblCountry] FOREIGN KEY([CountryId])
REFERENCES [dbo].[tblCountry] ([Id])
GO
ALTER TABLE [dbo].[tblCity] CHECK CONSTRAINT [FK_tblCity_tblCountry]
GO
ALTER TABLE [dbo].[tblState]  WITH CHECK ADD  CONSTRAINT [FK_tblState_tblState] FOREIGN KEY([CountryId])
REFERENCES [dbo].[tblCountry] ([Id])
GO
ALTER TABLE [dbo].[tblState] CHECK CONSTRAINT [FK_tblState_tblState]
GO
