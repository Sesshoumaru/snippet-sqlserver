if exists (select * from sys.objects where name = 'TrimAllPrefix' and type = 'FN')
	drop function TrimAllPrefix
go

-- =============================================
-- Create date: 2016/04/23
-- Description:	在字符串开头移除所有指定匹配字符
-- =============================================
create function TrimAllPrefix
(
	@expression varchar(8000),--要操作的字符串表达式实例
	@pattern varchar(100)--要移除匹配字符
)
returns varchar(8000)
as
begin
	declare @result varchar(8000),@ifStartWith bit;
	set @result = @expression
	
	select @ifStartWith = dbo.StartWith(@result,@pattern)
	while @ifStartWith = 1
	begin	
		set @result = substring(@result,len(@pattern) + 1,len(@result) - len(@pattern))
		select @ifStartWith = dbo.StartWith(@result,@pattern)
	end
		
	return @result;
end
go