SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET NOCOUNT ON
GO

IF NOT EXISTS(SELECT * FROM [dbo].[Gender] WHERE Gender = N'Male')
BEGIN
	INSERT INTO [dbo].[Gender] (Gender) VALUES (N'Male')
END
GO
IF NOT EXISTS(SELECT * FROM [dbo].[Gender] WHERE Gender = N'Female')
BEGIN
	INSERT INTO [dbo].[Gender] (Gender) VALUES (N'Female')
END
GO
IF NOT EXISTS(SELECT * FROM [dbo].[Race] WHERE Race = N'White')
BEGIN
	INSERT INTO [dbo].[Race] (Race) VALUES(N'White')
END
GO
IF NOT EXISTS(SELECT * FROM [dbo].[Race] WHERE Race = N'Black')
BEGIN
	INSERT INTO [dbo].[Race] (Race) VALUES(N'Black')
END
GO
IF NOT EXISTS(SELECT * FROM [dbo].[Race] WHERE Race = N'Asian')
BEGIN
	INSERT INTO [dbo].[Race] (Race) VALUES(N'Asian')
END
GO
IF NOT EXISTS(SELECT * FROM [dbo].[Race] WHERE Race = N'Hispanic')
BEGIN
	INSERT INTO [dbo].[Race] (Race) VALUES(N'Hispanic')
END
GO
IF NOT EXISTS(SELECT * FROM [dbo].[Race] WHERE Race = N'Mix')
BEGIN
	INSERT INTO [dbo].[Race] (Race) VALUES(N'Mix')
END
GO
