-- Create the user 
create user TASK4
identified by "OLAP"
  default tablespace USERS
  temporary tablespace TEMP
  profile DEFAULT;
-- Grant/Revoke role privileges 
grant connect to TASK4;
grant resource to TASK4;
-- Grant/Revoke system privileges 
grant unlimited tablespace to TASK4;
grant all privileges to TASK4;