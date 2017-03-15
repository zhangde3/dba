col file_name for a60
set lin 600
col file_name for a60
select file_id,file_name ,shared,tablespace_name,status,bytes/1024/1024 size_m,autoextensible,inst_id,con_id from cdb_temp_files order by con_id;
set lin 80
