CREATE TABLE [sqlver].[tblSchemaLog] (
   [SchemaLogId] [int] NOT NULL
      IDENTITY (1,1),
   [SPID] [smallint] NULL,
   [EventType] [varchar](50) NULL,
   [ObjectName] [nvarchar](128) NOT NULL,
   [SchemaName] [nvarchar](128) NOT NULL,
   [DatabaseName] [nvarchar](128) NOT NULL,
   [ObjectType] [varchar](25) NULL,
   [SQLCommand] [nvarchar](max) NULL,
   [EventDate] [datetime] NULL,
   [LoginName] [nvarchar](128) NOT NULL,
   [EventData] [xml] NULL,
   [Hash] [varbinary](128) NULL,
   [Comments] [nvarchar](max) NULL

   ,CONSTRAINT [PK__tblSchem__1F146C467558536A] PRIMARY KEY CLUSTERED ([SchemaLogId])
)


GO

alter table [sqlver].[tblSchemaLog] add anothercolumnexample varchar(100)
