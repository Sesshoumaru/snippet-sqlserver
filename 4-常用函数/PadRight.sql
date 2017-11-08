if exists (select * from sys.objects where name = 'PadRight' and type = 'FN')
	drop function PadRight
go

-- =============================================
-- Create date: 2016-04-19
-- Description:	返回一个新字符串，该字符串通过在此实例中的字符→侧填充指定的 Unicode 字符来达到指定的总长度(最大100)，从而使这些字符左对齐。
-- =============================================
create function PadRight
(
	@value varchar(100),
	@totalWidth int,
	@paddingChar char 
)
returns varchar(100)
as
begin
	if @totalWidth > 100
		set @totalWidth = 100
	declare @result varchar(100)
	set @result = @value;
	while(@totalWidth > len(@result))
	begin
		set @result =  @result + @paddingChar
	end
	
	return @result;
end
go

