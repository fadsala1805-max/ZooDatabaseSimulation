/****** Object:  Table [dbo].[Animal]    Script Date: 2026-08-29 11:55:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Animal](
	[AnimalId] [char](5) NOT NULL,
	[SpeciesName] [varchar](15) NOT NULL,
	[ZooName] [varchar](20) NOT NULL,
	[DateOfBirth] [date] NULL,
	[Gender] [char](1) NULL,
	[MotherAnimalId] [char](5) NULL,
	[FatherAnimalId] [char](5) NULL,
 CONSTRAINT [PK_Animal] PRIMARY KEY CLUSTERED 
(
	[AnimalId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 2026-08-29 11:55:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmpNo] [char](4) NOT NULL,
	[EmpName] [char](10) NOT NULL,
	[SpeciesExpertise] [varchar](15) NULL,
	[ZooName] [varchar](20) NOT NULL,
	[Salary] [numeric](8, 2) NOT NULL,
	[Gender] [char](1) NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmpNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Species]    Script Date: 2026-08-29 11:55:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Species](
	[SpeciesName] [varchar](15) NOT NULL,
	[Status] [char](1) NULL,
	[EstNoInWild] [bigint] NULL,
	[WorldBestExpertEmpNo] [char](4) NULL,
 CONSTRAINT [PK_Species] PRIMARY KEY CLUSTERED 
(
	[SpeciesName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Zoo]    Script Date: 2026-08-29 11:55:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zoo](
	[ZooName] [varchar](20) NOT NULL,
	[City] [varchar](18) NOT NULL,
	[AnnualNoVisitors] [int] NULL,
	[Country] [char](12) NULL,
 CONSTRAINT [PK_Zoo] PRIMARY KEY CLUSTERED 
(
	[ZooName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Animal] ([AnimalId], [SpeciesName], [ZooName], [DateOfBirth], [Gender], [MotherAnimalId], [FatherAnimalId]) VALUES (N'001  ', N'Javan Rhino', N'Metro Zoo', CAST(N'2005-10-23' AS Date), N'M', NULL, NULL)
INSERT [dbo].[Animal] ([AnimalId], [SpeciesName], [ZooName], [DateOfBirth], [Gender], [MotherAnimalId], [FatherAnimalId]) VALUES (N'002  ', N'Panda', N'Shanghai Zoo', CAST(N'2004-03-10' AS Date), N'M', NULL, NULL)
INSERT [dbo].[Animal] ([AnimalId], [SpeciesName], [ZooName], [DateOfBirth], [Gender], [MotherAnimalId], [FatherAnimalId]) VALUES (N'003  ', N'Leather Turtle', N'Killman Zoo', CAST(N'2005-03-18' AS Date), N'M', NULL, NULL)
INSERT [dbo].[Animal] ([AnimalId], [SpeciesName], [ZooName], [DateOfBirth], [Gender], [MotherAnimalId], [FatherAnimalId]) VALUES (N'004  ', N'Panda', N'Garden Zoo', CAST(N'2005-11-01' AS Date), N'F', NULL, NULL)
INSERT [dbo].[Animal] ([AnimalId], [SpeciesName], [ZooName], [DateOfBirth], [Gender], [MotherAnimalId], [FatherAnimalId]) VALUES (N'005  ', N'Amur Leopard', N'Boston Zoo', CAST(N'2016-01-01' AS Date), N'F', NULL, NULL)
INSERT [dbo].[Animal] ([AnimalId], [SpeciesName], [ZooName], [DateOfBirth], [Gender], [MotherAnimalId], [FatherAnimalId]) VALUES (N'006  ', N'Sunda Tiger', N'Chengdu Zoo', CAST(N'2016-02-04' AS Date), N'M', NULL, NULL)
INSERT [dbo].[Animal] ([AnimalId], [SpeciesName], [ZooName], [DateOfBirth], [Gender], [MotherAnimalId], [FatherAnimalId]) VALUES (N'007  ', N'Black Rhino', N'Garden Zoo', CAST(N'2016-05-08' AS Date), N'F', NULL, NULL)
INSERT [dbo].[Animal] ([AnimalId], [SpeciesName], [ZooName], [DateOfBirth], [Gender], [MotherAnimalId], [FatherAnimalId]) VALUES (N'008  ', N'Lion', N'Dubai Zoo', CAST(N'2017-06-05' AS Date), N'M', NULL, NULL)
INSERT [dbo].[Animal] ([AnimalId], [SpeciesName], [ZooName], [DateOfBirth], [Gender], [MotherAnimalId], [FatherAnimalId]) VALUES (N'009  ', N'Lion', N'Dubai Zoo', CAST(N'2017-05-06' AS Date), N'F', NULL, N'008  ')
INSERT [dbo].[Animal] ([AnimalId], [SpeciesName], [ZooName], [DateOfBirth], [Gender], [MotherAnimalId], [FatherAnimalId]) VALUES (N'010  ', N'Tiger', N'Garden Zoo', CAST(N'2018-04-05' AS Date), N'F', NULL, NULL)
INSERT [dbo].[Animal] ([AnimalId], [SpeciesName], [ZooName], [DateOfBirth], [Gender], [MotherAnimalId], [FatherAnimalId]) VALUES (N'011  ', N'Crocodile', N'Shanghai Zoo', CAST(N'2018-01-02' AS Date), N'F', NULL, NULL)
INSERT [dbo].[Animal] ([AnimalId], [SpeciesName], [ZooName], [DateOfBirth], [Gender], [MotherAnimalId], [FatherAnimalId]) VALUES (N'012  ', N'Giraffe', N'Miller Zoo', CAST(N'2010-07-02' AS Date), N'M', NULL, NULL)
INSERT [dbo].[Animal] ([AnimalId], [SpeciesName], [ZooName], [DateOfBirth], [Gender], [MotherAnimalId], [FatherAnimalId]) VALUES (N'013  ', N'Monkey', N'New York City Zoo', CAST(N'2011-08-09' AS Date), N'M', NULL, NULL)
INSERT [dbo].[Animal] ([AnimalId], [SpeciesName], [ZooName], [DateOfBirth], [Gender], [MotherAnimalId], [FatherAnimalId]) VALUES (N'014  ', N'Green Sturgeon', N'Toronto Zoo', CAST(N'2012-03-08' AS Date), N'F', NULL, NULL)
INSERT [dbo].[Animal] ([AnimalId], [SpeciesName], [ZooName], [DateOfBirth], [Gender], [MotherAnimalId], [FatherAnimalId]) VALUES (N'015  ', N'Deer', N'Garden Zoo', CAST(N'2012-02-01' AS Date), N'F', NULL, NULL)
INSERT [dbo].[Animal] ([AnimalId], [SpeciesName], [ZooName], [DateOfBirth], [Gender], [MotherAnimalId], [FatherAnimalId]) VALUES (N'016  ', N'Queen Goshawk', N'Toronto Zoo', CAST(N'2013-05-06' AS Date), N'F', NULL, NULL)
INSERT [dbo].[Animal] ([AnimalId], [SpeciesName], [ZooName], [DateOfBirth], [Gender], [MotherAnimalId], [FatherAnimalId]) VALUES (N'017  ', N'USA Alligator', N'Dubai Zoo', CAST(N'2014-07-08' AS Date), N'F', NULL, NULL)
INSERT [dbo].[Animal] ([AnimalId], [SpeciesName], [ZooName], [DateOfBirth], [Gender], [MotherAnimalId], [FatherAnimalId]) VALUES (N'018  ', N'Black Howler', N'Dubai Zoo', CAST(N'2015-06-03' AS Date), N'M', NULL, NULL)
INSERT [dbo].[Animal] ([AnimalId], [SpeciesName], [ZooName], [DateOfBirth], [Gender], [MotherAnimalId], [FatherAnimalId]) VALUES (N'019  ', N'Yellow Parrot', N'Killman Zoo', CAST(N'2014-01-05' AS Date), N'M', NULL, NULL)
INSERT [dbo].[Animal] ([AnimalId], [SpeciesName], [ZooName], [DateOfBirth], [Gender], [MotherAnimalId], [FatherAnimalId]) VALUES (N'020  ', N'Panda', N'Calgary Zoo', CAST(N'2020-05-06' AS Date), N'F', N'004  ', N'002  ')
INSERT [dbo].[Animal] ([AnimalId], [SpeciesName], [ZooName], [DateOfBirth], [Gender], [MotherAnimalId], [FatherAnimalId]) VALUES (N'021  ', N'Panda', N'Calgary Zoo', CAST(N'2020-05-06' AS Date), N'M', N'004  ', N'002  ')
INSERT [dbo].[Animal] ([AnimalId], [SpeciesName], [ZooName], [DateOfBirth], [Gender], [MotherAnimalId], [FatherAnimalId]) VALUES (N'022  ', N'Javan Rhino', N'Metro Zoo', CAST(N'2021-01-02' AS Date), N'F', NULL, N'001  ')
INSERT [dbo].[Animal] ([AnimalId], [SpeciesName], [ZooName], [DateOfBirth], [Gender], [MotherAnimalId], [FatherAnimalId]) VALUES (N'023  ', N'Javan Rhino', N'Metro Zoo', CAST(N'2015-04-06' AS Date), N'M', NULL, N'001  ')
INSERT [dbo].[Animal] ([AnimalId], [SpeciesName], [ZooName], [DateOfBirth], [Gender], [MotherAnimalId], [FatherAnimalId]) VALUES (N'024  ', N'Javan Rhino', N'Boston Zoo', CAST(N'2014-02-01' AS Date), N'M', NULL, N'001  ')
INSERT [dbo].[Animal] ([AnimalId], [SpeciesName], [ZooName], [DateOfBirth], [Gender], [MotherAnimalId], [FatherAnimalId]) VALUES (N'025  ', N'Lion', N'Dubai Zoo', CAST(N'2023-01-01' AS Date), N'F', NULL, N'008  ')
INSERT [dbo].[Animal] ([AnimalId], [SpeciesName], [ZooName], [DateOfBirth], [Gender], [MotherAnimalId], [FatherAnimalId]) VALUES (N'026  ', N'Lion', N'Dubai Zoo', CAST(N'2023-02-02' AS Date), N'M', NULL, N'008  ')
INSERT [dbo].[Animal] ([AnimalId], [SpeciesName], [ZooName], [DateOfBirth], [Gender], [MotherAnimalId], [FatherAnimalId]) VALUES (N'027  ', N'Tiger', N'Miller Zoo', CAST(N'2017-07-09' AS Date), N'M', NULL, NULL)
INSERT [dbo].[Animal] ([AnimalId], [SpeciesName], [ZooName], [DateOfBirth], [Gender], [MotherAnimalId], [FatherAnimalId]) VALUES (N'028  ', N'Tiger', N'Killman Zoo', CAST(N'2024-02-02' AS Date), N'F', N'010  ', N'027  ')
INSERT [dbo].[Animal] ([AnimalId], [SpeciesName], [ZooName], [DateOfBirth], [Gender], [MotherAnimalId], [FatherAnimalId]) VALUES (N'029  ', N'Tiger', N'Killman Zoo', CAST(N'2025-01-03' AS Date), N'M', N'010  ', N'027  ')
INSERT [dbo].[Animal] ([AnimalId], [SpeciesName], [ZooName], [DateOfBirth], [Gender], [MotherAnimalId], [FatherAnimalId]) VALUES (N'030  ', N'Javan Rhino', N'Metro Zoo', CAST(N'2024-07-09' AS Date), N'F', NULL, NULL)
INSERT [dbo].[Animal] ([AnimalId], [SpeciesName], [ZooName], [DateOfBirth], [Gender], [MotherAnimalId], [FatherAnimalId]) VALUES (N'031  ', N'Deer', N'Garden Zoo', CAST(N'2025-01-02' AS Date), N'F', N'015  ', NULL)
INSERT [dbo].[Animal] ([AnimalId], [SpeciesName], [ZooName], [DateOfBirth], [Gender], [MotherAnimalId], [FatherAnimalId]) VALUES (N'032  ', N'Panda', N'Shanghai Zoo', CAST(N'2016-05-06' AS Date), N'M', NULL, NULL)
INSERT [dbo].[Animal] ([AnimalId], [SpeciesName], [ZooName], [DateOfBirth], [Gender], [MotherAnimalId], [FatherAnimalId]) VALUES (N'033  ', N'Panda', N'Beijing Zoo', CAST(N'2017-10-22' AS Date), N'M', NULL, NULL)
INSERT [dbo].[Animal] ([AnimalId], [SpeciesName], [ZooName], [DateOfBirth], [Gender], [MotherAnimalId], [FatherAnimalId]) VALUES (N'034  ', N'Panda', N'Beijing Zoo', CAST(N'2018-12-01' AS Date), N'F', NULL, NULL)
INSERT [dbo].[Animal] ([AnimalId], [SpeciesName], [ZooName], [DateOfBirth], [Gender], [MotherAnimalId], [FatherAnimalId]) VALUES (N'035  ', N'Panda', N'Chengdu Zoo', CAST(N'2019-09-08' AS Date), N'F', NULL, NULL)
INSERT [dbo].[Animal] ([AnimalId], [SpeciesName], [ZooName], [DateOfBirth], [Gender], [MotherAnimalId], [FatherAnimalId]) VALUES (N'036  ', N'Panda', N'Chengdu Zoo', CAST(N'2019-09-08' AS Date), N'F', NULL, NULL)
INSERT [dbo].[Animal] ([AnimalId], [SpeciesName], [ZooName], [DateOfBirth], [Gender], [MotherAnimalId], [FatherAnimalId]) VALUES (N'037  ', N'Panda', N'Chengdu Zoo', CAST(N'2019-09-08' AS Date), N'F', NULL, NULL)
INSERT [dbo].[Animal] ([AnimalId], [SpeciesName], [ZooName], [DateOfBirth], [Gender], [MotherAnimalId], [FatherAnimalId]) VALUES (N'038  ', N'Panda', N'Shanghai Zoo', CAST(N'2018-12-01' AS Date), N'M', NULL, NULL)
INSERT [dbo].[Animal] ([AnimalId], [SpeciesName], [ZooName], [DateOfBirth], [Gender], [MotherAnimalId], [FatherAnimalId]) VALUES (N'039  ', N'Panda', N'Beijing Zoo', CAST(N'2017-10-22' AS Date), N'M', NULL, NULL)
INSERT [dbo].[Animal] ([AnimalId], [SpeciesName], [ZooName], [DateOfBirth], [Gender], [MotherAnimalId], [FatherAnimalId]) VALUES (N'040  ', N'Lion', N'Dubai Zoo', CAST(N'2016-01-01' AS Date), N'F', NULL, NULL)
INSERT [dbo].[Animal] ([AnimalId], [SpeciesName], [ZooName], [DateOfBirth], [Gender], [MotherAnimalId], [FatherAnimalId]) VALUES (N'041  ', N'Lion', N'Metro Zoo', CAST(N'2025-01-02' AS Date), N'F', NULL, NULL)
INSERT [dbo].[Animal] ([AnimalId], [SpeciesName], [ZooName], [DateOfBirth], [Gender], [MotherAnimalId], [FatherAnimalId]) VALUES (N'042  ', N'Lion', N'Metro Zoo', CAST(N'2025-03-04' AS Date), N'M', NULL, NULL)
INSERT [dbo].[Animal] ([AnimalId], [SpeciesName], [ZooName], [DateOfBirth], [Gender], [MotherAnimalId], [FatherAnimalId]) VALUES (N'043  ', N'Lion', N'Boston Zoo', CAST(N'2023-02-04' AS Date), N'M', NULL, NULL)
INSERT [dbo].[Animal] ([AnimalId], [SpeciesName], [ZooName], [DateOfBirth], [Gender], [MotherAnimalId], [FatherAnimalId]) VALUES (N'044  ', N'Lion', N'Boston Zoo', CAST(N'2020-04-05' AS Date), N'F', NULL, NULL)
INSERT [dbo].[Animal] ([AnimalId], [SpeciesName], [ZooName], [DateOfBirth], [Gender], [MotherAnimalId], [FatherAnimalId]) VALUES (N'045  ', N'Lion', N'Boston Zoo', CAST(N'2013-01-01' AS Date), N'F', NULL, NULL)
INSERT [dbo].[Animal] ([AnimalId], [SpeciesName], [ZooName], [DateOfBirth], [Gender], [MotherAnimalId], [FatherAnimalId]) VALUES (N'046  ', N'Lion', N'Metro Zoo', CAST(N'2012-04-05' AS Date), N'F', NULL, NULL)
INSERT [dbo].[Animal] ([AnimalId], [SpeciesName], [ZooName], [DateOfBirth], [Gender], [MotherAnimalId], [FatherAnimalId]) VALUES (N'047  ', N'Panda', N'Calgary Zoo', CAST(N'2020-05-06' AS Date), N'F', N'004  ', N'002  ')
INSERT [dbo].[Animal] ([AnimalId], [SpeciesName], [ZooName], [DateOfBirth], [Gender], [MotherAnimalId], [FatherAnimalId]) VALUES (N'048  ', N'Tiger', N'Killman Zoo', CAST(N'2025-01-03' AS Date), N'M', N'010  ', N'027  ')
INSERT [dbo].[Animal] ([AnimalId], [SpeciesName], [ZooName], [DateOfBirth], [Gender], [MotherAnimalId], [FatherAnimalId]) VALUES (N'049  ', N'Javan Rhino', N'Metro Zoo', CAST(N'2015-02-04' AS Date), N'F', NULL, N'001  ')
INSERT [dbo].[Animal] ([AnimalId], [SpeciesName], [ZooName], [DateOfBirth], [Gender], [MotherAnimalId], [FatherAnimalId]) VALUES (N'050  ', N'Tiger', N'Miami Zoo', CAST(N'2014-01-03' AS Date), N'F', NULL, NULL)
INSERT [dbo].[Animal] ([AnimalId], [SpeciesName], [ZooName], [DateOfBirth], [Gender], [MotherAnimalId], [FatherAnimalId]) VALUES (N'051  ', N'Deer', N'Boston Zoo', CAST(N'2015-01-01' AS Date), N'M', N'015  ', NULL)
INSERT [dbo].[Animal] ([AnimalId], [SpeciesName], [ZooName], [DateOfBirth], [Gender], [MotherAnimalId], [FatherAnimalId]) VALUES (N'052  ', N'Panda', N'Calgary Zoo', CAST(N'2020-05-06' AS Date), N'F', N'004  ', N'002  ')
INSERT [dbo].[Animal] ([AnimalId], [SpeciesName], [ZooName], [DateOfBirth], [Gender], [MotherAnimalId], [FatherAnimalId]) VALUES (N'053  ', N'Leather Turtle', N'Killman Zoo', CAST(N'2014-05-06' AS Date), N'M', NULL, NULL)
INSERT [dbo].[Animal] ([AnimalId], [SpeciesName], [ZooName], [DateOfBirth], [Gender], [MotherAnimalId], [FatherAnimalId]) VALUES (N'054  ', N'Leather Turtle', N'Killman Zoo', CAST(N'2014-05-02' AS Date), N'M', NULL, NULL)
INSERT [dbo].[Animal] ([AnimalId], [SpeciesName], [ZooName], [DateOfBirth], [Gender], [MotherAnimalId], [FatherAnimalId]) VALUES (N'055  ', N'Leather Turtle', N'Killman Zoo', CAST(N'2014-05-02' AS Date), N'F', NULL, NULL)
INSERT [dbo].[Animal] ([AnimalId], [SpeciesName], [ZooName], [DateOfBirth], [Gender], [MotherAnimalId], [FatherAnimalId]) VALUES (N'056  ', N'Monkey', N'Killman Zoo', CAST(N'2012-01-01' AS Date), N'M', NULL, NULL)
INSERT [dbo].[Animal] ([AnimalId], [SpeciesName], [ZooName], [DateOfBirth], [Gender], [MotherAnimalId], [FatherAnimalId]) VALUES (N'057  ', N'Lion', N'Metro Zoo', CAST(N'2018-01-01' AS Date), N'M', NULL, NULL)
INSERT [dbo].[Animal] ([AnimalId], [SpeciesName], [ZooName], [DateOfBirth], [Gender], [MotherAnimalId], [FatherAnimalId]) VALUES (N'058  ', N'Lion', N'Boston Zoo', CAST(N'2017-02-02' AS Date), N'F', NULL, NULL)
GO
INSERT [dbo].[Employee] ([EmpNo], [EmpName], [SpeciesExpertise], [ZooName], [Salary], [Gender]) VALUES (N'001 ', N'Vicky S   ', N'Tiger', N'Toronto Zoo', CAST(900000.00 AS Numeric(8, 2)), N'F')
INSERT [dbo].[Employee] ([EmpNo], [EmpName], [SpeciesExpertise], [ZooName], [Salary], [Gender]) VALUES (N'002 ', N'Roshini G ', N'Panda', N'Metro Zoo', CAST(600000.00 AS Numeric(8, 2)), N'F')
INSERT [dbo].[Employee] ([EmpNo], [EmpName], [SpeciesExpertise], [ZooName], [Salary], [Gender]) VALUES (N'003 ', N'Fadumo S  ', N'Monkey', N'Garden Zoo', CAST(650000.00 AS Numeric(8, 2)), N'F')
INSERT [dbo].[Employee] ([EmpNo], [EmpName], [SpeciesExpertise], [ZooName], [Salary], [Gender]) VALUES (N'004 ', N'Christia N', N'Panda', N'Chengdu Zoo', CAST(655000.00 AS Numeric(8, 2)), N'F')
INSERT [dbo].[Employee] ([EmpNo], [EmpName], [SpeciesExpertise], [ZooName], [Salary], [Gender]) VALUES (N'005 ', N'Jake N    ', NULL, N'Toronto Zoo', CAST(200000.00 AS Numeric(8, 2)), N'M')
INSERT [dbo].[Employee] ([EmpNo], [EmpName], [SpeciesExpertise], [ZooName], [Salary], [Gender]) VALUES (N'006 ', N'Smith S   ', N'Monkey', N'Metro Zoo', CAST(100000.00 AS Numeric(8, 2)), N'M')
INSERT [dbo].[Employee] ([EmpNo], [EmpName], [SpeciesExpertise], [ZooName], [Salary], [Gender]) VALUES (N'007 ', N'Karen W   ', N'Tiger', N'Calgary Zoo', CAST(550000.00 AS Numeric(8, 2)), N'F')
INSERT [dbo].[Employee] ([EmpNo], [EmpName], [SpeciesExpertise], [ZooName], [Salary], [Gender]) VALUES (N'008 ', N'Samantha B', N'Monkey', N'Garden Zoo', CAST(540000.00 AS Numeric(8, 2)), N'F')
INSERT [dbo].[Employee] ([EmpNo], [EmpName], [SpeciesExpertise], [ZooName], [Salary], [Gender]) VALUES (N'009 ', N'Mark J    ', N'Monkey', N'Metro Zoo', CAST(240000.00 AS Numeric(8, 2)), N'M')
INSERT [dbo].[Employee] ([EmpNo], [EmpName], [SpeciesExpertise], [ZooName], [Salary], [Gender]) VALUES (N'010 ', N'Jacob S   ', N'Tiger', N'Killman Zoo', CAST(700000.00 AS Numeric(8, 2)), N'M')
INSERT [dbo].[Employee] ([EmpNo], [EmpName], [SpeciesExpertise], [ZooName], [Salary], [Gender]) VALUES (N'011 ', N'Amanda T  ', N'Black Howler', N'Garden Zoo', CAST(750000.00 AS Numeric(8, 2)), N'F')
INSERT [dbo].[Employee] ([EmpNo], [EmpName], [SpeciesExpertise], [ZooName], [Salary], [Gender]) VALUES (N'012 ', N'Mary X    ', NULL, N'Dubai Zoo', CAST(777000.00 AS Numeric(8, 2)), N'F')
INSERT [dbo].[Employee] ([EmpNo], [EmpName], [SpeciesExpertise], [ZooName], [Salary], [Gender]) VALUES (N'013 ', N'Ethan H   ', N'Yellow Parrot', N'Miller Zoo', CAST(780000.00 AS Numeric(8, 2)), N'M')
INSERT [dbo].[Employee] ([EmpNo], [EmpName], [SpeciesExpertise], [ZooName], [Salary], [Gender]) VALUES (N'014 ', N'Kim K     ', N'Panda', N'Beijing Zoo', CAST(790000.00 AS Numeric(8, 2)), N'F')
INSERT [dbo].[Employee] ([EmpNo], [EmpName], [SpeciesExpertise], [ZooName], [Salary], [Gender]) VALUES (N'015 ', N'Zach E    ', N'Black Howler', N'Garden Zoo', CAST(840000.00 AS Numeric(8, 2)), N'M')
INSERT [dbo].[Employee] ([EmpNo], [EmpName], [SpeciesExpertise], [ZooName], [Salary], [Gender]) VALUES (N'016 ', N'Olivia R  ', NULL, N'Killman Zoo', CAST(50000.00 AS Numeric(8, 2)), N'F')
INSERT [dbo].[Employee] ([EmpNo], [EmpName], [SpeciesExpertise], [ZooName], [Salary], [Gender]) VALUES (N'017 ', N'Simone F  ', N'Leather Turtle', N'Miami Zoo', CAST(45000.00 AS Numeric(8, 2)), N'F')
INSERT [dbo].[Employee] ([EmpNo], [EmpName], [SpeciesExpertise], [ZooName], [Salary], [Gender]) VALUES (N'018 ', N'Cole Q    ', N'USA Alligator', N'New York City Zoo', CAST(65000.00 AS Numeric(8, 2)), N'M')
INSERT [dbo].[Employee] ([EmpNo], [EmpName], [SpeciesExpertise], [ZooName], [Salary], [Gender]) VALUES (N'019 ', N'Tina T    ', NULL, N'Killman Zoo', CAST(55000.00 AS Numeric(8, 2)), N'F')
INSERT [dbo].[Employee] ([EmpNo], [EmpName], [SpeciesExpertise], [ZooName], [Salary], [Gender]) VALUES (N'020 ', N'Bob B     ', N'Leather Turtle', N'Miami Zoo', CAST(80000.00 AS Numeric(8, 2)), N'M')
INSERT [dbo].[Employee] ([EmpNo], [EmpName], [SpeciesExpertise], [ZooName], [Salary], [Gender]) VALUES (N'021 ', N'Rob R     ', N'Leather Turtle', N'Boston Zoo', CAST(85000.00 AS Numeric(8, 2)), N'M')
INSERT [dbo].[Employee] ([EmpNo], [EmpName], [SpeciesExpertise], [ZooName], [Salary], [Gender]) VALUES (N'022 ', N'Kris J    ', N'Lion', N'Dubai Zoo', CAST(90000.00 AS Numeric(8, 2)), N'F')
INSERT [dbo].[Employee] ([EmpNo], [EmpName], [SpeciesExpertise], [ZooName], [Salary], [Gender]) VALUES (N'023 ', N'Kendall J ', NULL, N'Killman Zoo', CAST(500000.00 AS Numeric(8, 2)), N'F')
INSERT [dbo].[Employee] ([EmpNo], [EmpName], [SpeciesExpertise], [ZooName], [Salary], [Gender]) VALUES (N'024 ', N'Kylie J   ', N'Monkey', N'Miller Zoo', CAST(450000.00 AS Numeric(8, 2)), N'F')
INSERT [dbo].[Employee] ([EmpNo], [EmpName], [SpeciesExpertise], [ZooName], [Salary], [Gender]) VALUES (N'025 ', N'Khloe K   ', N'Panda', N'Shanghai Zoo', CAST(10000.00 AS Numeric(8, 2)), N'F')
GO
INSERT [dbo].[Species] ([SpeciesName], [Status], [EstNoInWild], [WorldBestExpertEmpNo]) VALUES (N'Amur Leopard', N'E', 10, NULL)
INSERT [dbo].[Species] ([SpeciesName], [Status], [EstNoInWild], [WorldBestExpertEmpNo]) VALUES (N'Black Howler ', N'T', 600, N'015 ')
INSERT [dbo].[Species] ([SpeciesName], [Status], [EstNoInWild], [WorldBestExpertEmpNo]) VALUES (N'Black Rhino', N'E', 15, NULL)
INSERT [dbo].[Species] ([SpeciesName], [Status], [EstNoInWild], [WorldBestExpertEmpNo]) VALUES (N'Crocodile', N'S', 900000, NULL)
INSERT [dbo].[Species] ([SpeciesName], [Status], [EstNoInWild], [WorldBestExpertEmpNo]) VALUES (N'Deer', N'S', 800000, NULL)
INSERT [dbo].[Species] ([SpeciesName], [Status], [EstNoInWild], [WorldBestExpertEmpNo]) VALUES (N'Giraffe', N'S', 605000, NULL)
INSERT [dbo].[Species] ([SpeciesName], [Status], [EstNoInWild], [WorldBestExpertEmpNo]) VALUES (N'Green Sturgeon', N'T', 200, NULL)
INSERT [dbo].[Species] ([SpeciesName], [Status], [EstNoInWild], [WorldBestExpertEmpNo]) VALUES (N'Javan Rhino', N'E', 10, NULL)
INSERT [dbo].[Species] ([SpeciesName], [Status], [EstNoInWild], [WorldBestExpertEmpNo]) VALUES (N'Leather Turtle', N'E', 12, N'020 ')
INSERT [dbo].[Species] ([SpeciesName], [Status], [EstNoInWild], [WorldBestExpertEmpNo]) VALUES (N'Lion', N'S', 50000, N'022 ')
INSERT [dbo].[Species] ([SpeciesName], [Status], [EstNoInWild], [WorldBestExpertEmpNo]) VALUES (N'Monkey', N'S', 121000, N'009 ')
INSERT [dbo].[Species] ([SpeciesName], [Status], [EstNoInWild], [WorldBestExpertEmpNo]) VALUES (N'Panda', N'E', 30, N'004 ')
INSERT [dbo].[Species] ([SpeciesName], [Status], [EstNoInWild], [WorldBestExpertEmpNo]) VALUES (N'Queen Goshawk', N'T', 450, NULL)
INSERT [dbo].[Species] ([SpeciesName], [Status], [EstNoInWild], [WorldBestExpertEmpNo]) VALUES (N'Sunda Tiger', N'E', 20, NULL)
INSERT [dbo].[Species] ([SpeciesName], [Status], [EstNoInWild], [WorldBestExpertEmpNo]) VALUES (N'Tiger', N'S', 60000, N'010 ')
INSERT [dbo].[Species] ([SpeciesName], [Status], [EstNoInWild], [WorldBestExpertEmpNo]) VALUES (N'USA Alligator', N'T', 300, N'018 ')
INSERT [dbo].[Species] ([SpeciesName], [Status], [EstNoInWild], [WorldBestExpertEmpNo]) VALUES (N'Yellow Parrot', N'T', 400, N'013 ')
GO
INSERT [dbo].[Zoo] ([ZooName], [City], [AnnualNoVisitors], [Country]) VALUES (N'Beijing Zoo', N'Beijing', 2001000, N'China       ')
INSERT [dbo].[Zoo] ([ZooName], [City], [AnnualNoVisitors], [Country]) VALUES (N'Boston Zoo', N'Boston', 1100000, N'USA         ')
INSERT [dbo].[Zoo] ([ZooName], [City], [AnnualNoVisitors], [Country]) VALUES (N'Calgary Zoo', N'Calgary', 2500000, N'Canada      ')
INSERT [dbo].[Zoo] ([ZooName], [City], [AnnualNoVisitors], [Country]) VALUES (N'Chengdu Zoo', N'Chengdu', 2555000, N'China       ')
INSERT [dbo].[Zoo] ([ZooName], [City], [AnnualNoVisitors], [Country]) VALUES (N'Dubai Zoo', N'Dubai', 1666000, N'UAE         ')
INSERT [dbo].[Zoo] ([ZooName], [City], [AnnualNoVisitors], [Country]) VALUES (N'Garden Zoo', N'Boston', 1220000, N'USA         ')
INSERT [dbo].[Zoo] ([ZooName], [City], [AnnualNoVisitors], [Country]) VALUES (N'Killman Zoo', N'Brampton', 1400000, N'Canada      ')
INSERT [dbo].[Zoo] ([ZooName], [City], [AnnualNoVisitors], [Country]) VALUES (N'Metro Zoo', N'Toronto', 2000000, N'Canada      ')
INSERT [dbo].[Zoo] ([ZooName], [City], [AnnualNoVisitors], [Country]) VALUES (N'Miami Zoo', N'Miami', 2200000, N'USA         ')
INSERT [dbo].[Zoo] ([ZooName], [City], [AnnualNoVisitors], [Country]) VALUES (N'Miller Zoo', N'Montreal', 2600000, N'Canada      ')
INSERT [dbo].[Zoo] ([ZooName], [City], [AnnualNoVisitors], [Country]) VALUES (N'New York City Zoo', N'New York', 2300000, N'USA         ')
INSERT [dbo].[Zoo] ([ZooName], [City], [AnnualNoVisitors], [Country]) VALUES (N'Shanghai Zoo', N'Shanghai', 2110000, N'China       ')
INSERT [dbo].[Zoo] ([ZooName], [City], [AnnualNoVisitors], [Country]) VALUES (N'Toronto Zoo', N'Toronto', 1000000, N'Canada      ')
GO
ALTER TABLE [dbo].[Animal]  WITH CHECK ADD  CONSTRAINT [Fathered_By] FOREIGN KEY([FatherAnimalId])
REFERENCES [dbo].[Animal] ([AnimalId])
GO
ALTER TABLE [dbo].[Animal] CHECK CONSTRAINT [Fathered_By]
GO
ALTER TABLE [dbo].[Animal]  WITH CHECK ADD  CONSTRAINT [Held_In] FOREIGN KEY([ZooName])
REFERENCES [dbo].[Zoo] ([ZooName])
GO
ALTER TABLE [dbo].[Animal] CHECK CONSTRAINT [Held_In]
GO
ALTER TABLE [dbo].[Animal]  WITH CHECK ADD  CONSTRAINT [Member_Of] FOREIGN KEY([SpeciesName])
REFERENCES [dbo].[Species] ([SpeciesName])
GO
ALTER TABLE [dbo].[Animal] CHECK CONSTRAINT [Member_Of]
GO
ALTER TABLE [dbo].[Animal]  WITH CHECK ADD  CONSTRAINT [Mothered_By] FOREIGN KEY([MotherAnimalId])
REFERENCES [dbo].[Animal] ([AnimalId])
GO
ALTER TABLE [dbo].[Animal] CHECK CONSTRAINT [Mothered_By]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [Employed_By] FOREIGN KEY([ZooName])
REFERENCES [dbo].[Zoo] ([ZooName])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [Employed_By]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [Expert_In] FOREIGN KEY([SpeciesExpertise])
REFERENCES [dbo].[Species] ([SpeciesName])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [Expert_In]
GO
ALTER TABLE [dbo].[Species]  WITH CHECK ADD  CONSTRAINT [World_Best_Expert] FOREIGN KEY([WorldBestExpertEmpNo])
REFERENCES [dbo].[Employee] ([EmpNo])
GO
ALTER TABLE [dbo].[Species] CHECK CONSTRAINT [World_Best_Expert]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Animal', @level2type=N'CONSTRAINT',@level2name=N'Fathered_By'
GO
