accept tbs_name prompt "tablespace name: "
accept df_path prompt "datafile path: "
accept df_size prompt "datafile size_m: "
create temporary tablespace &tbs_name tempfile '&df_path' size &df_size m;
