
PROMPT now add seed data

prompt auth_type
INSERT INTO "CPE_AUTH_TYPE" (AUTH_TYPE, NAME, CREATED_BY) VALUES ('1', 'Local Authentication', 'Seed_Data');
INSERT INTO "CPE_AUTH_TYPE" (AUTH_TYPE, NAME, CREATED_BY) VALUES ('2', 'LDAP Authentication', 'Seed_Data');
INSERT INTO "CPE_AUTH_TYPE" (AUTH_TYPE, NAME, CREATED_BY) VALUES ('3', 'FB Authentication', 'Seed_Data');
INSERT INTO "CPE_AUTH_TYPE" (AUTH_TYPE, NAME, CREATED_BY) VALUES ('4', 'google Authentication', 'Seed_Data');
commit;

prompt criticality_type
INSERT INTO "CPE_CRITICALITY_TYPE" ( NAME, CREATED_BY) VALUES ('Low', 'Seed_Data');
INSERT INTO "CPE_CRITICALITY_TYPE" ( NAME, CREATED_BY) VALUES ('Medium', 'Seed_Data');
INSERT INTO "CPE_CRITICALITY_TYPE" ( NAME, CREATED_BY) VALUES ('High', 'Seed_Data');
INSERT INTO "CPE_CRITICALITY_TYPE" ( NAME, CREATED_BY) VALUES ('Critical', 'Seed_Data');
INSERT INTO "CPE_CRITICALITY_TYPE" ( NAME, CREATED_BY) VALUES ('Insane', 'Seed_Data');
INSERT INTO "CPE_CRITICALITY_TYPE" ( NAME, CREATED_BY) VALUES ('Default', 'Seed_Data');
commit;

prompt user type
INSERT INTO "CPE_USER_TYPE" (USER_TYPE, NAME, PRIVILEDGE_TYPE, CREATED_BY) VALUES ('00', 'Internal Admin',0, 'Seed_Data');
INSERT INTO "CPE_USER_TYPE" (USER_TYPE, NAME, PRIVILEDGE_TYPE, CREATED_BY) VALUES ('10', 'Org Admin',10, 'Seed_Data');
INSERT INTO "CPE_USER_TYPE" (USER_TYPE, NAME, PRIVILEDGE_TYPE, CREATED_BY) VALUES ('20', 'Group Admin',20, 'Seed_Data');
INSERT INTO "CPE_USER_TYPE" (USER_TYPE, NAME, PRIVILEDGE_TYPE, CREATED_BY) VALUES ('30', 'Priviledged User',30, 'Seed_Data');
INSERT INTO "CPE_USER_TYPE" (USER_TYPE, NAME, PRIVILEDGE_TYPE, CREATED_BY) VALUES ('31', 'Regular User', 30,'Seed_Data');
INSERT INTO "CPE_USER_TYPE" (USER_TYPE, NAME, PRIVILEDGE_TYPE, CREATED_BY) VALUES ('32', 'Interim User',99, 'Seed_Data');
commit;

prompt user relations
insert into CPE_USER_RELATION ( PARENT_ID , CHILD_ID , CREATED_BY ) 
values ( (select id from cpe_user_type where user_type = '00' ) ,(select id from cpe_user_type where user_type = '00' ) ,'Seed_Data' );
insert into CPE_USER_RELATION ( PARENT_ID , CHILD_ID , CREATED_BY ) 
values ( (select id from cpe_user_type where user_type = '00' ) ,(select id from cpe_user_type where user_type = '10' ) ,'Seed_Data' );
insert into CPE_USER_RELATION ( PARENT_ID , CHILD_ID , CREATED_BY ) 
values ( (select id from cpe_user_type where user_type = '10' ),(select id from cpe_user_type where user_type = '10' ) ,'Seed_Data' );
insert into CPE_USER_RELATION ( PARENT_ID , CHILD_ID , CREATED_BY ) 
values ( (select id from cpe_user_type where user_type = '10' ),(select id from cpe_user_type where user_type = '20' ) ,'Seed_Data' );
insert into CPE_USER_RELATION ( PARENT_ID , CHILD_ID , CREATED_BY ) 
values ( (select id from cpe_user_type where user_type = '10' ),(select id from cpe_user_type where user_type = '30' ) ,'Seed_Data' );
insert into CPE_USER_RELATION ( PARENT_ID , CHILD_ID , CREATED_BY ) 
values ( (select id from cpe_user_type where user_type = '10' ),(select id from cpe_user_type where user_type = '31' ) ,'Seed_Data' );
insert into CPE_USER_RELATION ( PARENT_ID , CHILD_ID , CREATED_BY ) 
values ( (select id from cpe_user_type where user_type = '10' ),(select id from cpe_user_type where user_type = '32' ) ,'Seed_Data' );
insert into CPE_USER_RELATION ( PARENT_ID , CHILD_ID , CREATED_BY ) 
values ( (select id from cpe_user_type where user_type = '20' ),(select id from cpe_user_type where user_type = '20' ) ,'Seed_Data' );
insert into CPE_USER_RELATION ( PARENT_ID , CHILD_ID , CREATED_BY ) 
values ( (select id from cpe_user_type where user_type = '20' ),(select id from cpe_user_type where user_type = '30' ) ,'Seed_Data' );
insert into CPE_USER_RELATION ( PARENT_ID , CHILD_ID , CREATED_BY ) 
values ( (select id from cpe_user_type where user_type = '20' ),(select id from cpe_user_type where user_type = '31' ) ,'Seed_Data' );
insert into CPE_USER_RELATION ( PARENT_ID , CHILD_ID , CREATED_BY ) 
values ( (select id from cpe_user_type where user_type = '20' ),(select id from cpe_user_type where user_type = '32' ) ,'Seed_Data' );
commit;

prompt resourcve_type 
INSERT INTO "CPE_RESOURCE_TYPE" (LEVEL1, LEVEL2, LEVEL3,CREATED_BY ) VALUES ('IaaS', 'Compute', 'Linux-based OS' ,'Seed_Data');
INSERT INTO "CPE_RESOURCE_TYPE" (LEVEL1, LEVEL2, LEVEL3,CREATED_BY ) VALUES ('IaaS', 'Compute', 'Windows Server 2008' ,'Seed_Data');
INSERT INTO "CPE_RESOURCE_TYPE" (LEVEL1, LEVEL2, LEVEL3,CREATED_BY ) VALUES ('IaaS', 'Compute', 'Windows Server 2012' ,'Seed_Data');
INSERT INTO "CPE_RESOURCE_TYPE" (LEVEL1, LEVEL2, LEVEL3,CREATED_BY ) VALUES ('IaaS', 'Compute', 'Windows Server OS' ,'Seed_Data');
INSERT INTO "CPE_RESOURCE_TYPE" (LEVEL1, LEVEL2, LEVEL3,CREATED_BY ) VALUES ('IaaS', 'Compute', 'Windows Desktop OS' ,'Seed_Data');
INSERT INTO "CPE_RESOURCE_TYPE" (LEVEL1, LEVEL2, LEVEL3,CREATED_BY ) VALUES ('IaaS', 'Storage', 'NAS' ,'Seed_Data');
INSERT INTO "CPE_RESOURCE_TYPE" (LEVEL1, LEVEL2, LEVEL3,CREATED_BY ) VALUES ('PaaS', 'Database', 'Oracle' ,'Seed_Data');
INSERT INTO "CPE_RESOURCE_TYPE" (LEVEL1, LEVEL2, LEVEL3,CREATED_BY ) VALUES ('PaaS', 'WebServer', 'Apache' ,'Seed_Data');
INSERT INTO "CPE_RESOURCE_TYPE" (LEVEL1, LEVEL2, LEVEL3,CREATED_BY ) VALUES ('PaaS', 'AppServer', 'webLogic' ,'Seed_Data');
INSERT INTO "CPE_RESOURCE_TYPE" (LEVEL1, LEVEL2, LEVEL3,CREATED_BY ) VALUES ('CaaS', 'ManagementPlane', 'SoftLayer' ,'Seed_Data');
INSERT INTO "CPE_RESOURCE_TYPE" (LEVEL1, LEVEL2, LEVEL3,CREATED_BY ) VALUES ('default', 'default', 'default' ,'Seed_Data');
commit;

prompt resource version
insert into CPE_RESOURCE_VERSION (resource_type, RESOURCE_VERSION , created_by ) 
       values (  ( select id from CPE_RESOURCE_TYPE where level3 = 'Linux-based OS'), 'RHEL 6.5' , 'Seed_Data');
insert into CPE_RESOURCE_VERSION (resource_type, RESOURCE_VERSION , created_by ) 
       values (  ( select id from CPE_RESOURCE_TYPE where level3 = 'Linux-based OS'), 'RHEL 6.6' , 'Seed_Data');
insert into CPE_RESOURCE_VERSION (resource_type, RESOURCE_VERSION , created_by ) 
       values (  ( select id from CPE_RESOURCE_TYPE where level3 = 'Linux-based OS'), 'RHEL 6.7' , 'Seed_Data');
insert into CPE_RESOURCE_VERSION (resource_type, RESOURCE_VERSION , created_by ) 
       values (  ( select id from CPE_RESOURCE_TYPE where level3 = 'Linux-based OS'), 'RHEL 6.8' , 'Seed_Data');
insert into CPE_RESOURCE_VERSION (resource_type, RESOURCE_VERSION , created_by ) 
       values (  ( select id from CPE_RESOURCE_TYPE where level3 = 'Linux-based OS'), 'RHEL 6.9' , 'Seed_Data');
insert into CPE_RESOURCE_VERSION (resource_type, RESOURCE_VERSION , created_by ) 
       values (  ( select id from CPE_RESOURCE_TYPE where level3 = 'Linux-based OS'), 'RHEL 7.1' , 'Seed_Data');
insert into CPE_RESOURCE_VERSION (resource_type, RESOURCE_VERSION , created_by ) 
       values (  ( select id from CPE_RESOURCE_TYPE where level3 = 'Linux-based OS'), 'RHEL 7.2' , 'Seed_Data');
insert into CPE_RESOURCE_VERSION (resource_type, RESOURCE_VERSION , created_by ) 
       values (  ( select id from CPE_RESOURCE_TYPE where level3 = 'Linux-based OS'), 'RHEL 7.3' , 'Seed_Data');
insert into CPE_RESOURCE_VERSION (resource_type, RESOURCE_VERSION , created_by ) 
       values (  ( select id from CPE_RESOURCE_TYPE where level3 = 'Linux-based OS'), 'CentOS 6.5' , 'Seed_Data');
insert into CPE_RESOURCE_VERSION (resource_type, RESOURCE_VERSION , created_by ) 
       values (  ( select id from CPE_RESOURCE_TYPE where level3 = 'Linux-based OS'), 'CentOS 6.6' , 'Seed_Data');
insert into CPE_RESOURCE_VERSION (resource_type, RESOURCE_VERSION , created_by ) 
       values (  ( select id from CPE_RESOURCE_TYPE where level3 = 'Linux-based OS'), 'CentOS 6.7' , 'Seed_Data');
insert into CPE_RESOURCE_VERSION (resource_type, RESOURCE_VERSION , created_by ) 
       values (  ( select id from CPE_RESOURCE_TYPE where level3 = 'Linux-based OS'), 'CentOS 6.8' , 'Seed_Data');
insert into CPE_RESOURCE_VERSION (resource_type, RESOURCE_VERSION , created_by ) 
       values (  ( select id from CPE_RESOURCE_TYPE where level3 = 'Linux-based OS'), 'CentOS 6.9' , 'Seed_Data');
insert into CPE_RESOURCE_VERSION (resource_type, RESOURCE_VERSION , created_by ) 
       values (  ( select id from CPE_RESOURCE_TYPE where level3 = 'Linux-based OS'), 'CentOS 7.1' , 'Seed_Data');
insert into CPE_RESOURCE_VERSION (resource_type, RESOURCE_VERSION , created_by ) 
       values (  ( select id from CPE_RESOURCE_TYPE where level3 = 'Linux-based OS'), 'CentOS 7.2' , 'Seed_Data');
insert into CPE_RESOURCE_VERSION (resource_type, RESOURCE_VERSION , created_by ) 
       values (  ( select id from CPE_RESOURCE_TYPE where level3 = 'Linux-based OS'), 'CentOS 7.3' , 'Seed_Data');
insert into CPE_RESOURCE_VERSION (resource_type, RESOURCE_VERSION , created_by ) 
       values (  ( select id from CPE_RESOURCE_TYPE where level3 = 'Linux-based OS'), 'Debian 6.0' , 'Seed_Data');
insert into CPE_RESOURCE_VERSION (resource_type, RESOURCE_VERSION , created_by ) 
       values (  ( select id from CPE_RESOURCE_TYPE where level3 = 'Linux-based OS'), 'Debian 7.0' , 'Seed_Data');
insert into CPE_RESOURCE_VERSION (resource_type, RESOURCE_VERSION , created_by ) 
       values (  ( select id from CPE_RESOURCE_TYPE where level3 = 'Linux-based OS'), 'Debian 8.0' , 'Seed_Data');
insert into CPE_RESOURCE_VERSION (resource_type, RESOURCE_VERSION , created_by ) 
       values (  ( select id from CPE_RESOURCE_TYPE where level3 = 'Linux-based OS'), 'Ubuntu 12.04' , 'Seed_Data');
insert into CPE_RESOURCE_VERSION (resource_type, RESOURCE_VERSION , created_by ) 
       values (  ( select id from CPE_RESOURCE_TYPE where level3 = 'Linux-based OS'), 'Ubuntu 14.04' , 'Seed_Data');
insert into CPE_RESOURCE_VERSION (resource_type, RESOURCE_VERSION , created_by ) 
       values (  ( select id from CPE_RESOURCE_TYPE where level3 = 'Linux-based OS'), 'Ubuntu 15.04' , 'Seed_Data');
insert into CPE_RESOURCE_VERSION (resource_type, RESOURCE_VERSION , created_by ) 
       values (  ( select id from CPE_RESOURCE_TYPE where level3 = 'Windows Server 2008'), 'Windows 2008-R2' , 'Seed_Data');
insert into CPE_RESOURCE_VERSION (resource_type, RESOURCE_VERSION , created_by ) 
       values (  ( select id from CPE_RESOURCE_TYPE where level3 = 'Windows Server 2012'), 'Windows 2012-R2' , 'Seed_Data');
insert into CPE_RESOURCE_VERSION (resource_type, RESOURCE_VERSION , created_by ) 
       values (  ( select id from CPE_RESOURCE_TYPE where level3 = 'SoftLayer'), 'version 1.0' , 'Seed_Data');
commit;

prompt rule functional group _type 
INSERT INTO "CPE_RULE_FUNCTIONAL_GROUP_TYPE" (NAME, DESCRIPTION, CREATED_BY) 
   VALUES ('Password_Group', 'all rules related to password','Seed_Data');
INSERT INTO "CPE_RULE_FUNCTIONAL_GROUP_TYPE" (NAME, DESCRIPTION, CREATED_BY) 
   VALUES ('Network_Group', 'all rules related to network','Seed_Data');
INSERT INTO "CPE_RULE_FUNCTIONAL_GROUP_TYPE" (NAME, DESCRIPTION, CREATED_BY) 
   VALUES ('Service_Group', 'all rules related to services','Seed_Data');
INSERT INTO "CPE_RULE_FUNCTIONAL_GROUP_TYPE" (NAME, DESCRIPTION, CREATED_BY) 
   VALUES ('FileSystem_Group', 'all rules related to fileSystem','Seed_Data');
INSERT INTO "CPE_RULE_FUNCTIONAL_GROUP_TYPE" (NAME, DESCRIPTION, CREATED_BY) 
   VALUES ('default', 'all rules which we don’t understand','Seed_Data');
commit;

prompt message types

INSERT INTO "CPE_USER_MESSAGE_TYPE" (EVENT_TYPE, DESCRIPTION, CREATED_BY , EVENT_CATEGORY , EVENT_ENTITY) 
        VALUES (1, 'Organization Creation', 'Seed_Data','Info','Org');
INSERT INTO "CPE_USER_MESSAGE_TYPE" (EVENT_TYPE, DESCRIPTION, CREATED_BY , EVENT_CATEGORY , EVENT_ENTITY) 
	VALUES (2, 'Child Creation', 'Seed_Data','Info','User');
INSERT INTO "CPE_USER_MESSAGE_TYPE" (EVENT_TYPE, DESCRIPTION, CREATED_BY , EVENT_CATEGORY , EVENT_ENTITY) 
	VALUES (3, 'Change Org for a User', 'Seed_Data','Info','User');
INSERT INTO "CPE_USER_MESSAGE_TYPE" (EVENT_TYPE, DESCRIPTION, CREATED_BY , EVENT_CATEGORY , EVENT_ENTITY) 
	VALUES (4, 'Change Parent for a User', 'Seed_Data','Info','User');
INSERT INTO "CPE_USER_MESSAGE_TYPE" (EVENT_TYPE, DESCRIPTION, CREATED_BY , EVENT_CATEGORY , EVENT_ENTITY) 
	VALUES (5, 'User attribute adjusted', 'Seed_Data','Info','User');
INSERT INTO "CPE_USER_MESSAGE_TYPE" (EVENT_TYPE, DESCRIPTION, CREATED_BY , EVENT_CATEGORY , EVENT_ENTITY) 
	VALUES (6, 'Revised Quota attribute for Org', 'Seed_Data','Warn','Org');
INSERT INTO "CPE_USER_MESSAGE_TYPE" (EVENT_TYPE, DESCRIPTION, CREATED_BY , EVENT_CATEGORY , EVENT_ENTITY) 
	VALUES (7, 'Welcome new user', 'Seed_Data','Info','User');
INSERT INTO "CPE_USER_MESSAGE_TYPE" (EVENT_TYPE, DESCRIPTION, CREATED_BY , EVENT_CATEGORY , EVENT_ENTITY) 
	VALUES (8, 'Register resouce', 'Seed_Data','Info','Resource');
INSERT INTO "CPE_USER_MESSAGE_TYPE" (EVENT_TYPE, DESCRIPTION, CREATED_BY , EVENT_CATEGORY , EVENT_ENTITY) 
	VALUES (9, 'UN-Register resource', 'Seed_Data','Info','Resource');
INSERT INTO "CPE_USER_MESSAGE_TYPE" (EVENT_TYPE, DESCRIPTION, CREATED_BY , EVENT_CATEGORY , EVENT_ENTITY) 
	VALUES (10, 'Ran a profile on resource', 'Seed_Data','Info','User');
INSERT INTO "CPE_USER_MESSAGE_TYPE" (EVENT_TYPE, DESCRIPTION, CREATED_BY , EVENT_CATEGORY , EVENT_ENTITY) 
	VALUES (11, 'Reset monthly usage data', 'Seed_Data','Info','User');
INSERT INTO "CPE_USER_MESSAGE_TYPE" (EVENT_TYPE, DESCRIPTION, CREATED_BY , EVENT_CATEGORY , EVENT_ENTITY) 
	VALUES (12, 'User status changed to In-Active', 'Seed_Data','Warn','User');
INSERT INTO "CPE_USER_MESSAGE_TYPE" (EVENT_TYPE, DESCRIPTION, CREATED_BY , EVENT_CATEGORY , EVENT_ENTITY) 
	VALUES (13, 'Quota expired', 'Seed_Data','Error','User');
INSERT INTO "CPE_USER_MESSAGE_TYPE" (EVENT_TYPE, DESCRIPTION, CREATED_BY , EVENT_CATEGORY , EVENT_ENTITY) 
	VALUES (14, 'Assigned profile', 'Seed_Data','Info','Profile');
INSERT INTO "CPE_USER_MESSAGE_TYPE" (EVENT_TYPE, DESCRIPTION, CREATED_BY , EVENT_CATEGORY , EVENT_ENTITY) 
	VALUES (15, 'Profile exception created', 'Seed_Data','Warn','Profile');

commit;

prompt SYSTEM ERROR MESSAGES

INSERT INTO "CPE_SYS_ERROR_MESSAGE" (ERROR_NUMBER, ERROR_TEXT , CREATED_BY ) 
   VALUES (-20001, 'Failure:20001: General un-trapped error, call us via telepathy','Seed_Data');
INSERT INTO "CPE_SYS_ERROR_MESSAGE" (ERROR_NUMBER, ERROR_TEXT , CREATED_BY ) 
   VALUES (-20002, 'Failure:20002: Organization Owner not found', 'Seed_Data');
INSERT INTO "CPE_SYS_ERROR_MESSAGE" (ERROR_NUMBER, ERROR_TEXT , CREATED_BY ) 
   VALUES (-20003, 'Failure:20003: Parent Organization not found', 'Seed_Data');
INSERT INTO "CPE_SYS_ERROR_MESSAGE" (ERROR_NUMBER, ERROR_TEXT , CREATED_BY ) 
   VALUES (-20004, 'FAILURE:20004: New Owner for Org is NOT in Creator User org', 'Seed_Data');
INSERT INTO "CPE_SYS_ERROR_MESSAGE" (ERROR_NUMBER, ERROR_TEXT , CREATED_BY ) 
   VALUES (-20005, 'FAILURE:20005: Quota Resource can NOT be more than parent', 'Seed_Data');
INSERT INTO "CPE_SYS_ERROR_MESSAGE" (ERROR_NUMBER, ERROR_TEXT , CREATED_BY ) 
   VALUES (-20006, 'FAILURE:20006: Quota Runs Per Month can NOT be more than parent', 'Seed_Data');
INSERT INTO "CPE_SYS_ERROR_MESSAGE" (ERROR_NUMBER, ERROR_TEXT , CREATED_BY ) 
   VALUES (-20007, 'FAILURE:20007: Quota Cost Per Month can NOT be more than parent', 'Seed_Data');
INSERT INTO "CPE_SYS_ERROR_MESSAGE" (ERROR_NUMBER, ERROR_TEXT , CREATED_BY ) 
   VALUES (-20008, 'FAILURE:20008: Can not Create/Move Org outside Parent Org', 'Seed_Data');
INSERT INTO "CPE_SYS_ERROR_MESSAGE" (ERROR_NUMBER, ERROR_TEXT , CREATED_BY ) 
   VALUES (-20009, 'FAILURE:20009: something went wrong for new user type ID', 'Seed_Data');
INSERT INTO "CPE_SYS_ERROR_MESSAGE" (ERROR_NUMBER, ERROR_TEXT , CREATED_BY ) 
   VALUES (-20010, 'FAILURE:20010: New owner is not ADMIN and can not OWN organization', 'Seed_Data');
INSERT INTO "CPE_SYS_ERROR_MESSAGE" (ERROR_NUMBER, ERROR_TEXT , CREATED_BY ) 
   VALUES (-20011, 'FAILURE:20011: current org not found', 'Seed_Data');
INSERT INTO "CPE_SYS_ERROR_MESSAGE" (ERROR_NUMBER, ERROR_TEXT , CREATED_BY ) 
   VALUES (-20012, 'FAILURE:20012: Given owner does not OWN given organization', 'Seed_Data');
INSERT INTO "CPE_SYS_ERROR_MESSAGE" (ERROR_NUMBER, ERROR_TEXT , CREATED_BY ) 
   VALUES (-20013, 'FAILURE:20013: New user not in owner org', 'Seed_Data');
INSERT INTO "CPE_SYS_ERROR_MESSAGE" (ERROR_NUMBER, ERROR_TEXT , CREATED_BY ) 
   VALUES (-20014, 'FAILURE:20014: auth-type not found', 'Seed_Data');
INSERT INTO "CPE_SYS_ERROR_MESSAGE" (ERROR_NUMBER, ERROR_TEXT , CREATED_BY ) 
   VALUES (-20015, 'FAILURE:20015: user-type not found', 'Seed_Data');
INSERT INTO "CPE_SYS_ERROR_MESSAGE" (ERROR_NUMBER, ERROR_TEXT , CREATED_BY ) 
   VALUES (-20016, 'FAILURE:20016: user orgnization not found', 'Seed_Data');
INSERT INTO "CPE_SYS_ERROR_MESSAGE" (ERROR_NUMBER, ERROR_TEXT , CREATED_BY ) 
   VALUES (-20017, 'FAILURE:20017: creating user not found', 'Seed_Data');
INSERT INTO "CPE_SYS_ERROR_MESSAGE" (ERROR_NUMBER, ERROR_TEXT , CREATED_BY ) 
   VALUES (-20018, 'FAILURE:20018: parent not found', 'Seed_Data');
INSERT INTO "CPE_SYS_ERROR_MESSAGE" (ERROR_NUMBER, ERROR_TEXT , CREATED_BY ) 
   VALUES (-20019, 'FAILURE:20019: Initiator user not found', 'Seed_Data');
INSERT INTO "CPE_SYS_ERROR_MESSAGE" (ERROR_NUMBER, ERROR_TEXT , CREATED_BY ) 
   VALUES (-20020, 'FAILURE:20020: You are NOT entitled to have unlimited resource quota', 'Seed_Data');
INSERT INTO "CPE_SYS_ERROR_MESSAGE" (ERROR_NUMBER, ERROR_TEXT , CREATED_BY ) 
   VALUES (-20021, 'FAILURE:20021: Quota Resource can NOT be more than Org', 'Seed_Data');
INSERT INTO "CPE_SYS_ERROR_MESSAGE" (ERROR_NUMBER, ERROR_TEXT , CREATED_BY ) 
   VALUES (-20022, 'FAILURE:20022: Quota Runs Per Month can NOT be more than Org', 'Seed_Data');
INSERT INTO "CPE_SYS_ERROR_MESSAGE" (ERROR_NUMBER, ERROR_TEXT , CREATED_BY ) 
   VALUES (-20023, 'FAILURE:20023: Quota Cost Per Month can NOT be more than Org', 'Seed_Data');
INSERT INTO "CPE_SYS_ERROR_MESSAGE" (ERROR_NUMBER, ERROR_TEXT , CREATED_BY ) 
   VALUES (-20024, 'FAILURE:20024: Parent- Child relation mismatch', 'Seed_Data');
INSERT INTO "CPE_SYS_ERROR_MESSAGE" (ERROR_NUMBER, ERROR_TEXT , CREATED_BY ) 
   VALUES (-20025, 'FAILURE:20025: something went wrong with parent org', 'Seed_Data');
INSERT INTO "CPE_SYS_ERROR_MESSAGE" (ERROR_NUMBER, ERROR_TEXT , CREATED_BY ) 
   VALUES (-20026, 'FAILURE:20026: Can not create user outside parent Org', 'Seed_Data');
INSERT INTO "CPE_SYS_ERROR_MESSAGE" (ERROR_NUMBER, ERROR_TEXT , CREATED_BY ) 
   VALUES (-20027, 'FAILURE:20027: can not edit active profile', 'Seed_Data');
INSERT INTO "CPE_SYS_ERROR_MESSAGE" (ERROR_NUMBER, ERROR_TEXT , CREATED_BY ) 
   VALUES (-20028, 'FAILURE:20028: can not edit inactive profile', 'Seed_Data');
INSERT INTO "CPE_SYS_ERROR_MESSAGE" (ERROR_NUMBER, ERROR_TEXT , CREATED_BY ) 
   VALUES (-20029, 'FAILURE:20029: can not edit (update or delete) this record', 'Seed_Data');
INSERT INTO "CPE_SYS_ERROR_MESSAGE" (ERROR_NUMBER, ERROR_TEXT , CREATED_BY ) 
   VALUES (-20030, 'FAILURE:20030: Quota Excceded at user/parent/org level', 'Seed_Data');
INSERT INTO "CPE_SYS_ERROR_MESSAGE" (ERROR_NUMBER, ERROR_TEXT , CREATED_BY ) 
   VALUES (-20031, 'FAILURE:20031: Quota can not be updated after expiry date', 'Seed_Data');
INSERT INTO "CPE_SYS_ERROR_MESSAGE" (ERROR_NUMBER, ERROR_TEXT , CREATED_BY ) 
   VALUES (-20032, 'FAILURE:20032: You can not delete record, try making it inactive', 'Seed_Data');
--
INSERT INTO "CPE_SYS_ERROR_MESSAGE" (ERROR_NUMBER, ERROR_TEXT , CREATED_BY ) 
   VALUES (-20100, 'FAILURE:20100: Create-Profile : Owner ID not found', 'Seed_Data');
INSERT INTO "CPE_SYS_ERROR_MESSAGE" (ERROR_NUMBER, ERROR_TEXT , CREATED_BY ) 
   VALUES (-20101, 'FAILURE:20101: Create-Profile : Resource type not found', 'Seed_Data');
INSERT INTO "CPE_SYS_ERROR_MESSAGE" (ERROR_NUMBER, ERROR_TEXT , CREATED_BY ) 
   VALUES (-20102, 'FAILURE:20102: Create-Profile : Resource type mis-match', 'Seed_Data');
INSERT INTO "CPE_SYS_ERROR_MESSAGE" (ERROR_NUMBER, ERROR_TEXT , CREATED_BY ) 
   VALUES (-20103, 'FAILURE:20103: Create-Profile : Resource version error', 'Seed_Data');
INSERT INTO "CPE_SYS_ERROR_MESSAGE" (ERROR_NUMBER, ERROR_TEXT , CREATED_BY ) 
   VALUES (-20104, 'FAILURE:20104: Create-Profile : Profile already exists', 'Seed_Data');
INSERT INTO "CPE_SYS_ERROR_MESSAGE" (ERROR_NUMBER, ERROR_TEXT , CREATED_BY ) 
   VALUES (-20105, 'FAILURE:20105: Create-Profile : Profile creation error', 'Seed_Data');
INSERT INTO "CPE_SYS_ERROR_MESSAGE" (ERROR_NUMBER, ERROR_TEXT , CREATED_BY ) 
   VALUES (-20106, 'FAILURE:20106: Create-Profile : Profile-User relation  error', 'Seed_Data');
commit;

prompt now create internal Org and User
prompt you need to be careful about constraints….
ALTER TABLE CPE_USER disable CONSTRAINT CPE_USER_FK_1 ;
ALTER TABLE CPE_USER disable CONSTRAINT CPE_USER_FK_2 ;
ALTER TABLE CPE_USER disable CONSTRAINT CPE_USER_FK_3 ;
ALTER TABLE CPE_USER disable CONSTRAINT CPE_USER_FK_4 ;
ALTER TRIGGER CPE_USER_TRIG3 DISABLE;
ALTER TRIGGER CPE_USER_TRIG4 DISABLE;
ALTER TRIGGER CPE_ORGANIZATION_TRIG3 DISABLE;
ALTER TRIGGER CPE_ORGANIZATION_TRIG4 DISABLE;
ALTER TRIGGER CPE_ORGANIZATION_TRIG5 DISABLE;
ALTER TABLE CPE_ORGANIZATION disable CONSTRAINT CPE_ORGANIZATION_FK_1 ;
INSERT INTO CPE_USER ( LOGIN_ID,AUTH_TYPE_ID,USER_TYPE_ID,USER_ORG_ID,CREATED_BY,
                       USER_CREATE_DATE,QUOTA_RESOURCE,QUOTA_COST_PER_MONTH,QUOTA_RUNS_PER_MONTH,REMEDIATE_PRIVILEDGE)
   VALUES (  'raxak@cloudraxak.com' , 
            (SELECT ID FROM CPE_AUTH_TYPE WHERE NAME='Local Authentication') ,
            (SELECT ID FROM CPE_USER_TYPE WHERE user_type = '00' ),
             0,'seed_data',
             sysdate,-1,-1,-1,'Y');
INSERT INTO CPE_ORGANIZATION (NAME,OWNER_ID,CREATED_BY,QUOTA_RESOURCE,QUOTA_RUNS_PER_MONTH,QUOTA_COST_PER_MONTH)
   VALUES ('Cloud_Raxak_Org', (SELECT ID FROM CPE_USER), 'seed_data', -1,-1,-1 );
UPDATE CPE_USER SET USER_ORG_ID = ( SELECT ID FROM CPE_ORGANIZATION ); 
UPDATE CPE_ORGANIZATION SET OWNER_ID = (SELECT ID FROM CPE_USER ) ;
commit;
ALTER TABLE CPE_USER enable CONSTRAINT CPE_USER_FK_1 ;
ALTER TABLE CPE_USER enable CONSTRAINT CPE_USER_FK_2 ;
ALTER TABLE CPE_USER enable CONSTRAINT CPE_USER_FK_3 ;
ALTER TABLE CPE_USER ENABLE CONSTRAINT CPE_USER_FK_4 ;
ALTER TRIGGER CPE_USER_TRIG4 ENABLE;
ALTER TRIGGER CPE_USER_TRIG3 ENABLE;
ALTER TRIGGER CPE_ORGANIZATION_TRIG3 ENABLE;
ALTER TRIGGER CPE_ORGANIZATION_TRIG4 ENABLE;
ALTER TRIGGER CPE_ORGANIZATION_TRIG5 ENABLE;
ALTER TABLE CPE_ORGANIZATION ENABLE CONSTRAINT CPE_ORGANIZATION_FK_1 ;

prompt PROFILE 
INSERT INTO CPE_PROFILE (NAME,PROFILE_TYPE, OWNER_ID, RESOURCE_TYPE_ID, PROFILE_CREATE_DATE,CREATED_BY ) 
   VALUES ('ENTRY POINT SEEDED PROFILE', 'CUMMULATION OF ALL PROFILES', (SELECT MIN(ID) FROM CPE_USER),
   (SELECT ID FROM CPE_RESOURCE_TYPE WHERE LEVEL3 = 'default'),  SYSDATE,'Seed_Data');
commit;


PROMPT all done with Seed Data
PROMPT Good bye. 
