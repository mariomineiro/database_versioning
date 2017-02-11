SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE PROC [dbo].[ARQ_REBUILD_INDEX] (@table_name varchar(100)) AS
declare @idx_to_rebuild nvarchar(max)
declare @idx_name nvarchar(max)
declare @object_id int
declare @q_table_name  nvarchar(max)


IF OBJECT_ID('tempdb..#idx_to_rebuild') IS NOT NULL
    DROP TABLE #idx_to_rebuild

select OBJECT_NAME(ind.OBJECT_ID) table_name,object_id,name
 into #idx_to_rebuild
from sys.indexes ind
where OBJECT_NAME(ind.OBJECT_ID) = @table_name -- @table_name
and name is not null



While (Select Count(*) From #idx_to_rebuild) > 0
Begin

    Select Top 1 @object_id = object_id, @idx_name = name, @q_table_name = table_name From #idx_to_rebuild
	SET  @idx_to_rebuild = 'ALTER INDEX '+@idx_name+' ON '+@q_table_name+' REBUILD'
	 
    --print @idx_to_rebuild
	exec sp_executesql @idx_to_rebuild

    Delete #idx_to_rebuild Where object_id = @object_id

End



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

GO
