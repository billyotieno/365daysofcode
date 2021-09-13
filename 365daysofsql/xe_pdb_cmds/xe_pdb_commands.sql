---- Oracle Database Administration Certification: https://learn.oracle.com/ols/learning-path/oracle-database-administrator/38560/54112
---- Oracle Database Administration Learning Path: 

----- Oracle NLS Lang Tips: http://www.dba-oracle.com/t_nls_lang.htm


select name, pdb from v$services order by name; -- List pdb's containers as well
alter session set container=<container_name>

-- Setting session for PDB
alter session set container=ANUJ1 ;
create user test1 identified by test123 container=anuj1 ;

-- Displaying pdb users
alter session set nls_date_format='dd-mm-yyyy hh24:mi:ss' ;
set pagesize 200
col USERNAME format a25
col PDB_NAME format a15
select USERNAME,CON_ID,PDB_NAME,CREATED from CDB_USERS ,dba_pdbs
where PDB_ID=CON_ID
and username like 'TEST%'
and CON_ID>2 ;


--- Chris Pearce Grants
CREATE USER books_admin IDENTIFIED BY MyPassword;
GRANT CONNECT TO books_admin;
GRANT CONNECT, RESOURCE, DBA TO books_admin;
GRANT CREATE SESSION GRANT ANY PRIVILEGE TO books_admin;
GRANT UNLIMITED TABLESPACE TO books_admin;


show con_name; --- Show container name
cd $ORACLE_HOME/network/admin 

show user;

sqlplus hr/hr@HRPDB @scriptsql

---- Graphical User Interface Tools to connect to Oracle DB
SQL Developer
DBCA - Database Configuration Assistance
OEM Database Express - 
OEM Cloud Control - 


alter pluggable database pdb1 open;
alter pluggable database all open;
alter pluggable database all close;

--- PDB Open Mode - Read Only, Migrate, Mounted, Read Write 
alter pluggable database pdb1 save state;
alter pluggable database all save state;
alter pluggable database pdba discard state;



---- DB Commands
startup nomount
alter database mount;
alter database open;
show pdbs;


select con_name, state from dba_pdb_saved_states; --- check for pdb saved states
alter pluggable database orclpdb1 open;

se
----- Creating datawarehouse PDB
create pluggable  database dwpdb admin user dwadmin identified by oracle1234 
file_name_convert = ('c:\app\billy\product\18.0.0\oradata\xe\pdbseed\',
'c:\app\billy\product\18.0.0\oradata\xe\dwpdb\');

------ Creating a ODI Repository PDB
create pluggable  database odipdb admin user odiadmin identified by oracle1234 
file_name_convert = ('c:\app\billy\product\18.0.0\oradata\xe\pdbseed\',
'c:\app\billy\product\18.0.0\oradata\xe\odipdb\');

------ Creating a DEMO Source DB PDB
Our source pdb will be the XEPDB1


----- Checking the listener
lsnrctl status
	
	
---- Show pdb DATAFILES
select df.name from v$datafile df
	inner join dba_pdbs pdb
	on pdb.con_id = df.con_id; and pdb.pdb_name = 'XEPDB1';

----- check the open mode for XEPDB1
select name, open_mode
from v$pdbs
where name = 'XEPDB1'

----- Oracle pluggable database
https://mikesmithers.wordpress.com/2020/06/26/making-the-most-of-oracle-18c-xe-pluggable-databases-and-the-oracle-eco-system/
https://biljanadavidovic.com/2015/09/11/create-pluggable-database-using-the-seed-database-as-a-template/


COMMON DBA COMMANDS

select * from all_users; (To get all db users)

alter user <name> identified by <password> account unlock;

cx_Oracle Tutorial: https://oracle.github.io/python-cx_Oracle/samples/tutorial/Python-and-Oracle-Database-Scripting-for-the-Future.html


oracle1234 
SYSAUX
TEMP
oracle1234 
C:\app\billy\product\18.0.0\datafile
C:\app\billy\product\18.0.0\logfile
18
//localhost:1521/xepdb1 as sysdba