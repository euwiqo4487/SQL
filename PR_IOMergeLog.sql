
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PR_IOMergeLog]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) 
	 drop procedure [dbo].[PR_IOMergeLog] 
GO 
--檔案匯入匯出Log處理
CREATE Procedure [dbo].[PR_IOMergeLog] 
(
	@QueryKey	varchar(50),	--QueryKey(ex.SPName)
	@TableName	varchar(50),	--TableName(temp table name)
	@LogUser	int				--使用者
)
AS 
begin
	if not exists(select 1 from tempdb.sys.columns where object_id = Object_id('tempdb..'+@TableName))
		return

	--Table.Log檔
	select RowNo, Source, Pos, Value, FieldName 
	  into #log
	  from IOMergeLog
	 where 1=0
 
	--Table.Table與欄位對應
	select name as Column_Name,
		   ROW_NUMBER() over (order by column_id) as Column_ID
	  into #colunn
	  from tempdb.sys.columns
	 where object_id = Object_id('tempdb..'+@TableName)
	   and name not in ('MergeRowNo', 'MergeSource')
	 order by column_id

	declare @i int=0, @sql varchar(max), @columnName varchar(max)
	 select @i=isnull((select min(Column_ID) from #colunn), 0)
	 
	while @i>0
	begin
		select @columnName=Column_Name from #colunn where Column_ID=@i
		select @sql='insert into #log '+
					'select MergeRowNo, MergeSource, '+ltrim(@i)+ ' as Pos, ltrim(['+@columnName+']) as Value, '''+@columnName+''' as FieldName'+
					'  from '+@TableName
		  exec (@sql)
		  
		select @i=isnull((select min(Column_ID) from #colunn where Column_ID>@i), 0)
	end

	--塞入Log檔紀錄
	insert into IOMergeLog (TableName, Source, RowNo, Pos, FieldName, Value, LogDate)
	select @QueryKey, Source, RowNo, Pos, FieldName, Value, getdate()
	  from #log 
	 order by RowNo, Pos

	drop table #log
end
GO
GRANT EXEC ON [dbo].[PR_IOMergeLog] TO PUBLIC 
GO 
