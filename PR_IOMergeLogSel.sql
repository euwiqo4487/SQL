
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PR_IOMergeLogSel]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) 
	drop procedure [dbo].[PR_IOMergeLogSel] 
GO
--檔案匯入匯出合併紀錄表查詢
Create Procedure [dbo].[PR_IOMergeLogSel] 
( 
	@TableName	varchar(50),	--TableName
    @Date		date,			--查詢日期
	@LogUser	int				--使用者內碼
) 
AS
--exec [PR_IOMergeLogSel] 'PR_TruContractsDDAMLExpMerge', '2019-04-29', 0

declare @ZeroDate	date=JEPUN_AMS_TEST.dbo.FN_ZeroDateTime(),
		@FieldName	varchar(50)=''

select *
  into #ioMergeLog
  from IOMergeLog
 where (TableName=@TableName or @TableName='')
   and (@Date=@ZeroDate or @Date=cast(LogDate as date))
 
declare @table table(RowNo int, FieldName varchar(50))
insert into @table
select Pos, FieldName
  from #ioMergeLog
 group by Pos, FieldName

declare @sql varchar(max), @list varchar(max), @list2 varchar(max), @i int=1
begin
	declare @max int = 0
	select @max=max(RowNo) from @table

	while @i<=@max
	begin
		select @FieldName=FieldName from @table where RowNo=@i
		select @list = isnull(@list+',', '') + '[' + @FieldName + ']'
		select @list2= isnull(@list2+',', '') +  'max('+ '[' + @FieldName + ']) as [' + @FieldName+']'
		select @i=@i+1
	end

	select @sql='select row_number() over (order by p.LogDate, p.RowNo) as [Order], p.RowNo as RowNo, p.Source, '+@list2+',  p.LogDate from #ioMergeLog a pivot(max(Value) for FieldName in ('+@list+')) p group by p.RowNo, p.Source, p.LogDate order by p.LogDate, p.RowNo'
	exec (@sql)
end

if not exists(select 1 from @table)
	select 0 as [Order], RowNo, Source, LogDate from #ioMergeLog where 1=0

GO
GRANT EXEC ON [dbo].[PR_IOMergeLogSel] TO PUBLIC 
GO
