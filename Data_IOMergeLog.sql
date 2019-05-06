insert into AppIOMergeLog(TableName, Source, RowNo, Pos, FieldName, Value, LogDate) 
select 'TsbIDPropertiesFhipsMergeImp','TAMS_AMS',1,1,'ID','L122797897', getdate() union all
select 'TsbIDPropertiesFhipsMergeImp','TAMS_AMS',1,2,'Flag','', getdate() union all
select 'TsbIDPropertiesFhipsMergeImp','TAMS_AMS',1,3,'IsFhips1','1', getdate() union all
select 'TsbIDPropertiesFhipsMergeImp','TAMS_AMS',1,4,'IsFhips2','1', getdate() union all
select 'TsbIDPropertiesFhipsMergeImp','TAMS_AMS',1,5,'IsFhips3','1', getdate() union all
select 'TsbIDPropertiesFhipsMergeImp','TAMS_AMS',1,6,'IsFhips4','1', getdate() union all
select 'TsbIDPropertiesFhipsMergeImp','TAMS_AMS',1,7,'IsFhips5','1', getdate() union all
select 'TsbIDPropertiesFhipsMergeImp','TAMS_AMS',1,8,'IsFhips6','1', getdate() union all
select 'TsbIDPropertiesFhipsMergeImp','TAMS_AMS',1,9,'Keep1','', getdate() union all
select 'TsbIDPropertiesFhipsMergeImp','TAMS_AMS',1,10,'DataDate','Apr 29 2019 12:00AM', getdate() union all
select 'TsbIDPropertiesFhipsMergeImp','TAMS_AMS',1,11,'Name','', getdate() union all
select 'TsbIDPropertiesFhipsMergeImp','TAMS_PF_AMS',2,1,'ID','L122797897', getdate() union all
select 'TsbIDPropertiesFhipsMergeImp','TAMS_PF_AMS',2,2,'Flag','', getdate() union all
select 'TsbIDPropertiesFhipsMergeImp','TAMS_PF_AMS',2,3,'IsFhips1','1', getdate() union all
select 'TsbIDPropertiesFhipsMergeImp','TAMS_PF_AMS',2,4,'IsFhips2','1', getdate() union all
select 'TsbIDPropertiesFhipsMergeImp','TAMS_PF_AMS',2,5,'IsFhips3','1', getdate() union all
select 'TsbIDPropertiesFhipsMergeImp','TAMS_PF_AMS',2,6,'IsFhips4','1', getdate() union all
select 'TsbIDPropertiesFhipsMergeImp','TAMS_PF_AMS',2,7,'IsFhips5','1', getdate() union all
select 'TsbIDPropertiesFhipsMergeImp','TAMS_PF_AMS',2,8,'IsFhips6','1', getdate() union all
select 'TsbIDPropertiesFhipsMergeImp','TAMS_PF_AMS',2,9,'Keep1','', getdate() union all
select 'TsbIDPropertiesFhipsMergeImp','TAMS_PF_AMS',2,10,'DataDate','Apr 29 2019 12:00AM', getdate() union all
select 'TsbIDPropertiesFhipsMergeImp','TAMS_PF_AMS',2,11,'Name','', getdate()
