/*************************************************************
DROP TABLE Player
DROP TABLE Ownership
DROP TABLE Jersey
DROP TABLE OWNER
DROP TABLE Team
DROP TABLE TeamType
DROP TABLE Stadium
DROP TABLE Salary
DROP TABLE GeneralManager
DROP TABLE College
DROP TABLE Gender
DROP TABLE Ethnicity
DROP TABLE Coach
DROP TABLE City
DROP TABLE CountryState
DROP TABLE Country
***********************************************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET NOCOUNT ON
GO


IF NOT EXISTS(SELECT * FROM sys.tables WHERE name = N'Country')
BEGIN
CREATE TABLE [dbo].[Country](
	  [Id]					[INT] IDENTITY(1,1) NOT NULL
	, [CountryName]			[NVARCHAR](250) NOT NULL 
	, [CountryAbbreviation] [NVARCHAR](250) NULL
	, CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED ([Id] ASC)
);
END 
GO

IF NOT EXISTS(SELECT * FROM sys.tables WHERE name = N'CountryState')
BEGIN
CREATE TABLE [dbo].[CountryState](
	  [Id]					[INT] IDENTITY(1,1) NOT NULL
    , [CountryId]			[INT] NOT NULL
	, [StateName]			[NVARCHAR](250) NOT NULL
	, [StateAbbreviation]	[NVARCHAR](250) NULL
	, CONSTRAINT [PK_CountryState] PRIMARY KEY CLUSTERED ([Id] ASC)
);

ALTER TABLE [dbo].[CountryState]  WITH CHECK ADD  CONSTRAINT [FK_CountryState_Country] FOREIGN KEY([CountryId]) REFERENCES [dbo].[Country] ([Id]);

END
GO

IF NOT EXISTS(SELECT * FROM sys.tables WHERE name = N'City')
BEGIN
CREATE TABLE [dbo].[City](
      [Id]			[INT] IDENTITY(1,1) NOT NULL
	, [CityName]	[NVARCHAR](250) NULL
	, [CityState]	[NVARCHAR](250) NULL
	, CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED ([Id] ASC)
);
END 
GO

IF NOT EXISTS(SELECT * FROM sys.tables WHERE name = N'Coach')
BEGIN
CREATE TABLE [dbo].[Coach](
	  [Id] [INT] IDENTITY(1,1) NOT NULL
	, CONSTRAINT [PK_Coach] PRIMARY KEY CLUSTERED ([Id] ASC)
);
END
GO

IF NOT EXISTS(SELECT * FROM sys.tables WHERE name = N'Ethnicity')
BEGIN
CREATE TABLE [dbo].[Ethnicity](
	  [Id]			[INT] IDENTITY(1,1) NOT NULL
	, [Ethnicity]	[NVARCHAR](500) NOT NULL
	, CONSTRAINT [PK_Ethnicity] PRIMARY KEY CLUSTERED ([Id] ASC)
);
END
GO

IF NOT EXISTS(SELECT * FROM sys.tables WHERE name = N'Gender')
BEGIN
CREATE TABLE [dbo].[Gender](
	  [Id]		[INT] IDENTITY(1,1) NOT NULL
	, [Gender]	[NVARCHAR](250) NULL
	, CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED ([Id] ASC)
);
END
GO

IF NOT EXISTS(SELECT * FROM sys.tables WHERE name = N'College')
BEGIN
CREATE TABLE [dbo].[College](
	  [Id]			[INT] IDENTITY(1,1) NOT NULL
	, [CollegeName] [NVARCHAR](250) NOT NULL
	, [Address]		[NVARCHAR](250) NULL
	, CONSTRAINT [PK_College] PRIMARY KEY CLUSTERED ([Id] ASC)
);
END
GO

IF NOT EXISTS(SELECT * FROM sys.tables WHERE name = N'GeneralManager')
BEGIN
CREATE TABLE [dbo].[GeneralManager](
	  [Id] [INT] IDENTITY(1,1) NOT NULL
    , CONSTRAINT [PK_GeneralManager] PRIMARY KEY CLUSTERED ([Id] ASC)
); 
END
GO

IF NOT EXISTS(SELECT * FROM sys.tables WHERE name = N'Salary')
BEGIN
CREATE TABLE [dbo].[Salary](
	  [Id]		[INT] IDENTITY(1,1) NOT NULL
	, [Year]	[INT] NOT NULL
	, [Salary]	[DECIMAL](21, 8) NULL
    , CONSTRAINT [PK_Salary] PRIMARY KEY CLUSTERED ([Id] ASC)
);
END
GO

IF NOT EXISTS(SELECT * FROM sys.tables WHERE name = N'Stadium')
BEGIN
CREATE TABLE [dbo].[Stadium](
	  [Id]			[INT] IDENTITY(1,1) NOT NULL
	, [StadiumName] [NVARCHAR](250) NULL
	, CONSTRAINT [PK_Stadium] PRIMARY KEY CLUSTERED ([Id] ASC)
); 
END
GO

IF NOT EXISTS(SELECT * FROM sys.tables WHERE name = N'TeamType')
BEGIN
CREATE TABLE [dbo].[TeamType](
	  [Id]		 [INT] IDENTITY(1,1) NOT NULL
	, [TeamType] [NVARCHAR](250) NOT NULL
	, CONSTRAINT [PK_TeamType] PRIMARY KEY CLUSTERED ([Id] ASC)
);
END
GO

IF NOT EXISTS(SELECT * FROM sys.tables WHERE name = N'Team')
BEGIN
CREATE TABLE [dbo].[Team](
	  [Id]					[INT] IDENTITY(1,1) NOT NULL
	, [TeamName]			[NVARCHAR](250) NOT NULL
	, [CityId]				[INT] NOT NULL
	, [StadiumId]			[INT] NOT NULL
	, [TeamTypeId]			[INT] NOT NULL
	, [GeneralManagerId]	[INT] NULL
	, [CoachId]				[INT] NULL
    , CONSTRAINT [PK_Team] PRIMARY KEY CLUSTERED ([Id] ASC)
);


ALTER TABLE [dbo].[Team]  WITH CHECK ADD  CONSTRAINT [FK_Team_City] FOREIGN KEY([CityId]) REFERENCES [dbo].[City] ([Id]);
ALTER TABLE [dbo].[Team]  WITH CHECK ADD  CONSTRAINT [FK_Team_Coach] FOREIGN KEY([CoachId]) REFERENCES [dbo].[Coach] ([Id]);
ALTER TABLE [dbo].[Team]  WITH CHECK ADD  CONSTRAINT [FK_Team_GeneralManager] FOREIGN KEY([GeneralManagerId]) REFERENCES [dbo].[GeneralManager] ([Id]);
ALTER TABLE [dbo].[Team]  WITH CHECK ADD  CONSTRAINT [FK_Team_Stadium] FOREIGN KEY([StadiumId]) REFERENCES [dbo].[Stadium] ([Id]);
ALTER TABLE [dbo].[Team]  WITH CHECK ADD  CONSTRAINT [FK_Team_TeamType] FOREIGN KEY([TeamTypeId]) REFERENCES [dbo].[TeamType] ([Id]);

END
GO

IF NOT EXISTS(SELECT * FROM sys.tables WHERE name = N'Jersey')
BEGIN
CREATE TABLE [dbo].[Jersey](
	  [Id]			[INT] IDENTITY(1,1) NOT NULL
	, [TeamId]		[INT] NULL
	, [Number]		[INT] NULL
	, [IsCurrent]	[INT] NULL
	, CONSTRAINT [PK_Jersey] PRIMARY KEY CLUSTERED ([Id] ASC)
);

ALTER TABLE [dbo].[Jersey]  WITH CHECK ADD  CONSTRAINT [FK_Jersey_Team] FOREIGN KEY([TeamId]) REFERENCES [dbo].[Team] ([Id]);

END
GO

IF NOT EXISTS(SELECT * FROM sys.tables WHERE name = N'Owner')
BEGIN
CREATE TABLE [dbo].[Owner](
	  [Id]			[INT] IDENTITY(1,1) NOT NULL
	, [FirstName]	[NVARCHAR](500) NULL
	, [LastName]	[NVARCHAR](500) NULL
	, [EthnicityId] [INT] NULL
	, [NetWorth]	[DECIMAL](21, 8) NULL
	, [GenderId]	[INT] NULL
	, CONSTRAINT [PK_Owner] PRIMARY KEY CLUSTERED ([Id] ASC) 
);

ALTER TABLE [dbo].[Owner]  WITH CHECK ADD  CONSTRAINT [FK_Owner_Ethnicity] FOREIGN KEY([EthnicityId]) REFERENCES [dbo].[Ethnicity] ([Id]);
ALTER TABLE [dbo].[Owner]  WITH CHECK ADD  CONSTRAINT [FK_Owner_Gender] FOREIGN KEY([GenderId]) REFERENCES [dbo].[Gender] ([Id]);

END
GO

IF NOT EXISTS(SELECT * FROM sys.tables WHERE name = N'Ownership')
BEGIN
CREATE TABLE [dbo].[Ownership](
	  [Id]					[INT] IDENTITY(1,1) NOT NULL
	, [OwnerId]				[INT] NOT NULL
	, [TeamId]				[INT] NOT NULL
	, [OwnershipYear]		[INT] NULL
	, [OwnershipEndYear]	[INT] NULL
    , CONSTRAINT [PK_Ownership] PRIMARY KEY CLUSTERED ([Id] ASC)
);


ALTER TABLE [dbo].[Ownership]  WITH CHECK ADD  CONSTRAINT [FK_Ownership_Owner] FOREIGN KEY([OwnerId]) REFERENCES [dbo].[Owner] ([Id]);
ALTER TABLE [dbo].[Ownership]  WITH CHECK ADD  CONSTRAINT [FK_Ownership_Team] FOREIGN KEY([TeamId]) REFERENCES [dbo].[Team] ([Id]);

END
GO


IF NOT EXISTS(SELECT * FROM sys.tables WHERE name = N'Player')
BEGIN
CREATE TABLE [dbo].[Player](
	  [Id]				[INT] IDENTITY(1,1) NOT NULL
	, [TeamId]			[INT] NULL
	, [EthnicityId]		[INT] NOT NULL
	, [FirstName]		[NVARCHAR](500) NULL
	, [LastName]		[NVARCHAR](500) NULL
	, [CollegeId]		[INT] NULL
	, [HeightInches]	[INT] NULL
	, [WeightLbs]		[INT] NULL
	, [GenderId]		[INT] NULL	
	, [JerseyId]		[INT] NULL
	, [SalaryId]		[INT] NULL
	, CONSTRAINT [PK_Player] PRIMARY KEY CLUSTERED ([Id] ASC)
);

ALTER TABLE [dbo].[Player]  WITH CHECK ADD  CONSTRAINT [FK_Player_College] FOREIGN KEY([CollegeId]) REFERENCES [dbo].[College] ([Id]);
ALTER TABLE [dbo].[Player]  WITH CHECK ADD  CONSTRAINT [FK_Player_Ethnicity] FOREIGN KEY([EthnicityId]) REFERENCES [dbo].[Ethnicity] ([Id]);
ALTER TABLE [dbo].[Player]  WITH CHECK ADD  CONSTRAINT [FK_Player_Gender] FOREIGN KEY([GenderId]) REFERENCES [dbo].[Gender] ([Id]);
ALTER TABLE [dbo].[Player]  WITH CHECK ADD  CONSTRAINT [FK_Player_Jersey] FOREIGN KEY([JerseyId]) REFERENCES [dbo].[Jersey] ([Id]);
ALTER TABLE [dbo].[Player]  WITH CHECK ADD  CONSTRAINT [FK_Player_Salary] FOREIGN KEY([SalaryId]) REFERENCES [dbo].[Salary] ([Id]);
ALTER TABLE [dbo].[Player]  WITH CHECK ADD  CONSTRAINT [FK_Player_Team] FOREIGN KEY([TeamId]) REFERENCES [dbo].[Team] ([Id]);

END
GO

