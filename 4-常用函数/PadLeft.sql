if exists (select * from sys.objects where name = 'PadLeft' and type = 'FN')
	drop function PadLeft
go

-- =============================================
-- Create date: 2016/04/23
-- Description:	返回一个新字符串，该字符串通过在此实例中的字符左侧填充指定的 Unicode 字符来达到指定的总长度(最大100)，从而使这些字符右对齐。
-- =============================================
create function PadLeft
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
		set @result = @paddingChar + @result
	end
	
	return @result;
end
go

