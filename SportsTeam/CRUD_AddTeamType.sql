/*************************************************************
DROP PROCEDUERE spAddTeamType
***********************************************************/

IF EXISTS(SELECT * FROM sys.procedures WHERE name = 'spAddTeamType')
BEGIN
	DROP PROCEDURE spAddTeamType
END
GO

CREATE PROCEDURE spAddTeamType
	@TeamType NVARCHAR(250)	
AS
BEGIN
SET NOCOUNT ON;
	IF NOT EXISTS(SELECT 1 FROM TeamType WHERE TeamType = @TeamType)
	BEGIN 
		INSERT INTO TeamType (TeamType)
		VALUES (@TeamType)
	END	
SET NOCOUNT OFF;
	RETURN
END
GO