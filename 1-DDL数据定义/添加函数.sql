-- 功能：添加名称为function_name的函数
-- 变量：function_name 函数名

if exists (select * from sys.objects where name = 'function_name' and type = 'FN')
	drop function function_name
go

create function function_name
    (@parameter_name as int)
returns int
--with encryption|schemabinding, ...
as
begin
    return 0
end
go