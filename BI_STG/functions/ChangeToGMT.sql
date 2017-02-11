SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE FUNCTION [dbo].[ChangeToGMT](@Date [datetime], @PaisID [int])
RETURNS [datetime] WITH EXECUTE AS CALLER
AS 
BEGIN

    DECLARE @DateResult Datetime
	DECLARE @CountryTZOffSet int  = (Select top 1 d.CountryTZOffSet from DimGeography d where d.PaisID = @PaisID) 
	
	SET @DateResult = dateadd(hh, (-1) * @CountryTZOffSet, @Date);
	
 
	Return @DateResult

END


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

GO
