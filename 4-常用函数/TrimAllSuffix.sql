if exists (select * from sys.objects where name = 'TrimAllSuffix' and type = 'FN')
	drop function TrimAllSuffix
go

-- =============================================
-- Create date: 2016/04/23
-- Description:	在字符串结尾移除所有指定匹配字符
-- =============================================
create function TrimAllSuffix
(
	@expression varchar(8000),--要操作的字符串表达式实例
	@pattern varchar(100)--要移除匹配字符
)
returns varchar(8000)
as
begin
	declare @result varchar(8000),@ifEndWith bit;
	set @result = @expression
	
	select @ifEndWith = dbo.EndsWith(@result,@pattern)
	while @ifEndWith = 1
	begin	
		set @result = substring(@result,1,len(@result) - len(@pattern))
		select @ifEndWith = dbo.EndsWith(@result,@pattern)
	end
		
	return @result;
end
go