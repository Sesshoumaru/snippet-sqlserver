if exists (select * from sys.objects where name = 'newemptyid' and type = 'FN')
	drop function newemptyid
go

-- =============================================
-- Create date: 2016/04/23
-- Description:	返回空的uniqueidentifier
-- =============================================
create function newemptyid()
returns uniqueidentifier
as
begin
    return cast(cast(0 as binary) as uniqueidentifier)
end
go
