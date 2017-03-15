select name, decode(cdb, 'YES', 'Multitenant Option enabled', 'Regular 12c Database: ') "Multitenant Option" , open_mode, con_id from v$database;
