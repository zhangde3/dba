accept username prompt "username(c##xxx): "
accept userpasswd prompt "userpasswd: "
accept tbs_name prompt "tablespace_name: "
create user &username identified by &userpasswd default tablespace &tbs_name container=all ;
grant create session to &username container=all ;
