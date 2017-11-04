-- 功能：修改名称为function_name的函数
-- 变量：function_name 函数名

alter function function_name
   (@parameter_name as int)
returns int
    --with encryption|schemabinding, ...
as
begin
    return 0
end
go