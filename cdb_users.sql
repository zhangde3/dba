set lin 600
col username for a30
select username,account_status,default_tablespace,temporary_tablespace,con_id from cdb_users order by account_status,con_id,default_tablespace,username;
set lin 80
