USE TAMS_LOG
GO
--檔案匯入匯出合併紀錄表
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[IOMergeLog]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
  drop table [dbo].[IOMergeLog]
GO

CREATE TABLE [dbo].[IOMergeLog] (
	[LogNo] [int] identity(1, 1)NOT NULL,	--Log流水號
	[TableName] [varchar](50) NOT NULL,		--TableName
	[Source] [varchar](20) NOT NULL,		--來源DB
	[RowNo] [int] NOT NULL,					--資料列
	[Pos] [int] NOT NULL,					--欄位輸出順序
	[FieldName] [varchar](50) NOT NULL,		--欄位名稱
	[Value] [nvarchar](max),				--欄位值
	[LogDate] [datetime2](3) NOT NULL,		--異動時間
	
) ON [PRIMARY] WITH (DATA_COMPRESSION = PAGE)
GO
