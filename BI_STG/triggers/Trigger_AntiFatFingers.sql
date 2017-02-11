SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE TRIGGER [dbo].[Trigger_AntiFatFingers] ON [dbo].[AuxConfig]
AFTER INSERT
	,DELETE
	,UPDATE
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @cnt AS INT

	SELECT @cnt = count(1)
	FROM DELETED

	IF @cnt > 10
	BEGIN
		RAISERROR (
				'
				#### Danger Operation!! Do you really intend to update all those configs??  ###
				'
				,20
				,- 1
				)
		WITH log
	END
END




GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

ENABLE TRIGGER [dbo].[Trigger_AntiFatFingers] ON [dbo].[AuxConfig]
GO

GO
