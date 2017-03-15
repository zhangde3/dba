set lin 600
col file_name for a60
col TABLESPACE_NAME for a20
select file_id,file_name,con_id,tablespace_name,status,online_status,bytes/1024/1024 size_m,autoextensible from cdb_data_files order by con_id;
set lin 80
