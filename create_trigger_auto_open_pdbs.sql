create or replace trigger sys.after_startup after startup on database
begin
execute immediate 'alter pluggable database all open ' ;
end after_startup ;
/
