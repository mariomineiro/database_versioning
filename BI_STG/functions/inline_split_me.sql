SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO
CREATE FUNCTION inline_split_me(@param nvarchar(MAX))
RETURNS TABLE AS
RETURN(SELECT ltrim(rtrim(convert(nvarchar(4000),
                  substring(@param, Number,
                            charindex(N',' COLLATE Slovenian_BIN2,
                                      @param + convert(nvarchar(MAX), N','),
                                      Number) -
                            Number)
              ))) AS Value
       FROM   Numbers -- just adding a comment
       WHERE  Number <= convert(int, len(@param))
         AND  substring(convert(nvarchar(MAX), N',') + @param, Number, 1) =
                        N',' COLLATE Slovenian_BIN2)
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

GO
