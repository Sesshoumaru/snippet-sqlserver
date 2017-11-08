if exists (select * from sys.objects where name = 'Trim' and type = 'FN')
	drop function Trim
go

-- =============================================
-- Create date: 2016/04/23
-- Description:	移除所有前导空白字符和尾部空白字符
-- =============================================
create function Trim
(
	@expression varchar(8000)--字符串表达式实例
)
returns varchar(8000)
as
begin
	return ltrim(rtrim(@expression));
end
go