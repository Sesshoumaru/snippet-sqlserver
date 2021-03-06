-- 功能：在名称为table_name的表删除名称为column_name列
-- 变量：table_name 表名 column_name 列名

--1. 如果列不存在默认值，则直接删除列
if exists (select * from sys.columns where object_id = object_id('table_name') and name = 'column_name')
    alter table table_name drop column column_name
go

--2. 如果列存在默认值，则先查询并删除约束，再删除列
--2.1 查询并删除约束
declare @name varchar(200)
select @name = b.name from sysobjects b join syscolumns a on b.id = a.cdefault where a.id = object_id('table_name') and a.name = 'column_name'
if isnull(@name ,'') <> ''
    exec('alter table table_name drop constraint ' + @name)
go

--2.2 删除字段
if exists (select * from sys.columns where object_id = object_id('table_name') and name = 'column_name')
    alter table table_name drop column column_name
go