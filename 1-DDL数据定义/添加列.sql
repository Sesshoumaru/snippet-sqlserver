-- 功能：向名称为table_name的表添加名称为column_name列
-- 变量：table_name 表名 column_name 列名
if not exists (select * from sys.columns where object_id = object_id('table_name') and name = 'column_name')
	alter table table_name add column_name int not null default(0)
go
