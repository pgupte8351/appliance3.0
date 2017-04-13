prompt this MUST be run as sys or system
Prompt and also edit user name....I could have passed as param, but left it to you to do so

create user dmtest identified by dmtest quota unlimited on USERS;
ALTER USER "DMTEST" DEFAULT TABLESPACE "USERS" TEMPORARY TABLESPACE "TEMP" ACCOUNT UNLOCK ;
grant CONNECT to dmtest;
grant CREATE SESSION to dmtest;
grant ALTER SESSION to dmtest;
grant CREATE ANY PROCEDURE to dmtest;
grant CREATE ANY SEQUENCE to dmtest;
grant CREATE ANY SYNONYM to dmtest;
grant CREATE ANY TABLE to dmtest;
grant CREATE ANY TRIGGER to dmtest;
grant CREATE ANY VIEW to dmtest;
grant CREATE ANY TYPE to dmtest;
grant CREATE ANY JOB to dmtest;
grant execute on utl_http to dmtest ;
grant execute on DBMS_NETWORK_ACL_ADMIN to dmtest;



---
--- run as sys, to clean all job logs > 10 days old
--- 
--- begin
--- DBMS_SCHEDULER.PURGE_LOG(log_history => 10, job_name => 'DMLATEST.CR_SCHED_PROFILE_JOB');
--- end;
--- /

