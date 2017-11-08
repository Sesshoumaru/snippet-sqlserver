if exists (select * from sys.objects where name = 'TrimStart' and type = 'FN')
	drop function TrimStart
go

-- =============================================
-- Create date: 2016/04/23
-- Description:	在字符串开头移除指定匹配字符
-- =============================================
create function TrimStart
(
	@expression varchar(8000),--要操作的字符串表达式实例
	@pattern varchar(100)--要移除匹配字符
)
returns varchar(8000)
as
begin
	declare @result varchar(8000),@ifStartWith bit;
	set @result = @expression
	
	select @ifStartWith = dbo.StartWith(@expression,@pattern)
	if @ifStartWith = 1
		set @result = substring(@expression,len(@pattern) + 1,len(@expression) - len(@pattern))
		
	return @result;
end
go