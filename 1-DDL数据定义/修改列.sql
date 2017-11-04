-- 功能：对名称为table_name的表修改名称为column_name列
-- 变量：table_name 表名 column_name 列名
if  exists (select * from sys.columns where object_id = object_id('table_name') and name = 'column_name')
	alter table table_name alter column column_name int not null default(0)
go
