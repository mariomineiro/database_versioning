CREATE TABLE [sqlver].[tblSysRTLog] (
   [SysRTLogId] [int] NOT NULL
      IDENTITY (1,1),
   [DateLogged] [datetime] NULL
      CONSTRAINT [dftblSysRTLog_DateLogged] DEFAULT (getdate()),
   [Msg] [varchar](max) NULL,
   [MsgXML] [xml] NULL,
   [ThreadGUID] [uniqueidentifier] NULL,
   [SPID] [int] NULL

   ,CONSTRAINT [pkSysRTMessages] PRIMARY KEY CLUSTERED ([SysRTLogId])
)


GO
