SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO
create procedure IsValidSQL (@sql varchar(max)) as
begin
    begin try
        set @sql = 'set parseonly on;'+@sql;
        exec(@sql);
    end try
    begin catch
        return(1);
    end catch;
    return(0);
end; 
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

GO
