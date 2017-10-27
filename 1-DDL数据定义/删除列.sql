--1. 如果列不存在默认值，则直接删除列
alter table table_name drop column column_name


--2. 如果列存在默认值，则先查询并删除约束，再删除列
--2.1 查询并删除约束
declare @name varchar(20)
select @name = b.name
from sysobjects b join syscolumns a on b.id = a.cdefault
where a.id = object_id('table_name') and a.name = 'column_name'
exec('alter table table_name drop constraint ' + @name)

--2.2 删除字段
alter table table_name drop column_name