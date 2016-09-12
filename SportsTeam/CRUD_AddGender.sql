/*************************************************************
DROP PROCEDUERE spAddGender
***********************************************************/

IF EXISTS(SELECT * FROM sys.procedures WHERE name = 'spAddGender')
BEGIN
	DROP PROCEDURE spAddGender
END
GO

CREATE PROCEDURE spAddGender 
	@Gender NVARCHAR(250)
AS
BEGIN
	IF NOT EXISTS(SELECT 1 FROM Gender WHERE Gender = @Gender)
	BEGIN 
		INSERT INTO Gender (Gender)
		VALUES (@Gender)
	END
	RETURN
END
GO