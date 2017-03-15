accept pdb_old_name prompt "pdb_old_name: "
accept pdb_new_name prompt "pdb_new_name: "

alter session set container=&pdb_old_name;

alter pluggable database &pdb_old_name close immediate ;

alter pluggable database &pdb_old_name open restricted ;

alter pluggable database &pdb_old_name rename global_name to &pdb_new_name ;

alter pluggable database &pdb_new_name close immediate ;

alter pluggable database &pdb_new_name open;

col name for a50
select name,open_mode,restricted from v$pdbs ;
