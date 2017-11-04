-- 功能：删除名称为function_name的函数
-- 变量：function_name 函数名

if exists (select * from sys.objects where name = 'function_name' and type = 'FN')
	drop function function_name
go
