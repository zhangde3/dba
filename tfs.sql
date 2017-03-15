set lin 600
col file_name for a60
col TABLESPACE_NAME for a20
select file_id,file_name,INST_ID,SHARED,tablespace_name,status,bytes/1024/1024 size_m,autoextensible from dba_temp_files order by file_id;
set lin 80

