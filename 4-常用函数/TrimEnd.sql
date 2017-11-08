if exists (select * from sys.objects where name = 'TrimEnd' and type = 'FN')
	drop function TrimEnd
go

-- =============================================
-- Create date: 2016/04/23
-- Description:	在字符串结尾移除指定匹配字符
-- =============================================
create function TrimEnd
(
	@expression varchar(8000),--要操作的字符串表达式实例
	@pattern varchar(100)--要移除匹配字符
)
returns varchar(8000)
as
begin
	declare @result varchar(8000),@ifEndWith bit;
	set @result = @expression
	
	select @ifEndWith = dbo.EndsWith(@expression,@pattern)
	if @ifEndWith = 1
		set @result = substring(@expression,1,len(@expression) - len(@pattern))
		
	return @result;
end
go