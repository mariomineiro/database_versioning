CREATE TABLE [sqlver].[tblSchemaManifest] (
   [SchemaManifestId] [int] NOT NULL
      IDENTITY (1,1),
   [ObjectName] [nvarchar](128) NOT NULL,
   [SchemaName] [nvarchar](128) NOT NULL,
   [DatabaseName] [nvarchar](128) NOT NULL,
   [OrigDefinition] [nvarchar](max) NULL,
   [DateAppeared] [datetime] NULL,
   [CreatedByLoginName] [nvarchar](128) NOT NULL,
   [DateUpdated] [datetime] NULL,
   [OrigHash] [varbinary](128) NULL,
   [CurrentHash] [varbinary](128) NULL,
   [IsEncrypted] [bit] NULL,
   [StillExists] [bit] NULL,
   [SkipLogging] [bit] NULL,
   [Comments] [nvarchar](max) NULL

   ,CONSTRAINT [PK__tblSchem__8681F2C520550284] PRIMARY KEY CLUSTERED ([SchemaManifestId])
)


GO
