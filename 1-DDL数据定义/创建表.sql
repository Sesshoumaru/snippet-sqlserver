-- 功能：创建名称为table_name的表，并添加名称为column_name$的列
-- 变量：table_name 表名 column_name$ 列名

-- 1. 普通创建表脚本
if not exists (select 1 from sys.tables where name = 'table_name')
    create table table_name
    (
        column_name1 int not null default(0),
        column_name2 string not null default(0)
    )
go

-- 2. 带单个主键创建表脚本
if not exists (select 1 from sys.tables where name = 'table_name')
    create table table_name
    (
        column_name1 int not null primary key default(0),
        column_name2 string not null default(0)
    )
go

-- 3. 带多个主键创建表脚本
if not exists (select 1 from sys.tables where name = 'table_name')
    create table table_name
    (
        column_name1 int not null default(0),
        column_name2 string not null default(0),
        constraint pk_table_name PRIMARY KEY (column_name1,column_name2)
    )
go