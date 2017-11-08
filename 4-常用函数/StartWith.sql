if exists (select * from sys.objects where name = 'StartWith' and type = 'FN')
	drop function StartWith
go

-- =============================================
-- Create date: 2016/04/23
-- Description:	确定此字符串实例的开头是否与指定的字符串匹配
-- =============================================
create function StartWith
(
	@expression varchar(8000),--要搜索的字符串表达式实例
	@pattern varchar(100)--要进行比较的子字符串
)
returns bit
as
begin
	if @expression is null or @pattern is null
		return 0;
	
	if len(@expression) < len(@pattern)
		return 0;
	
	if left(@expression,len(@pattern)) != @pattern
		return 0
		
	return 1;
end
go