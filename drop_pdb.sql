accept pdb_name prompt "pdb_name: "
alter pluggable database &pdb_name close immediate ;
drop pluggable database &pdb_name including datafiles ;
