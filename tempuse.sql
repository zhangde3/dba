set line 200
column used  for 999,999
column TOTAL for 999,999
column free for 999,999
set pagesize 200

with tf AS
(SELECT tablespace_name,
         SUM(bytes) bytes,
         COUNT(*) cnt,
         DECODE(SUM(DECODE(autoextensible, 'NO', 0, 1)), 0, 'NO', 'YES') autoext
    FROM dba_temp_files
   GROUP BY tablespace_name)
SELECT d.tablespace_name,
       NVL(a.bytes / 1024 / 1024, 0) "TOTAL",
       round(NVL(t.ub * d.block_size, 0) / 1024 / 1024,1) "USED",
       round(NVL((t.ub * d.block_size) / a.bytes * 100, 0),0) "PERCENT",
       a.autoext ,
       (NVL(a.bytes, 0) / 1024 / 1024 -
       NVL((t.ub * d.block_size), 0) / 1024 / 1024) "FREE"
  FROM dba_tablespaces d,
       tf a,
       (SELECT ss.tablespace_name, sum(ss.used_blocks) ub
          FROM gv$sort_segment ss
         GROUP BY ss.tablespace_name) t
WHERE d.tablespace_name = a.tablespace_name(+)
   AND d.tablespace_name = t.tablespace_name(+)
   AND d.extent_management = 'LOCAL'
   AND d.contents = 'TEMPORARY'
ORDER BY 1
/
set lin 80
