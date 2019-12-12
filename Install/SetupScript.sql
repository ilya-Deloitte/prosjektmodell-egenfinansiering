BEGIN TRAN

--OPPRETT Kontorelasjonen for egenfinansiering og populer denne for hver konto
SELECT * FROM agldimension WHERE client='BT' AND attribute_id='Q30'
SELECT * FROM agldimvalue WHERE client='BT' AND attribute_id='Q30'
SELECT * FROM aglrelation WHERE client='BT' AND rel_attr_id='Q30'

BEGIN TRAN --SELECT * FROM aglrelvalue WHERE client='BT' AND rel_attr_id='Q30'
INSERT [dbo].[aglrelvalue] 
([att_val_from], [att_val_to], [att_value], [attribute_id], [client], [date_from], [date_to], [last_update], [percentage], [priority], [rel_attr_id], [rel_id], [rel_value], [user_id], [value_1]) 
SELECT dim_value, dim_value, dim_value, 'A0  ','BT', CAST(N'1900-01-01 00:00:00.000' AS DateTime), CAST(N'2099-12-31 00:00:00.000' AS DateTime), GETDATE(), CAST(100.00000000 AS Decimal(28, 8)), 1, 'Q30 ', NEWID(), 'NEI', '8-evla', CAST(0.00000000 AS Decimal(28, 8))
FROM agldimvalue WHERE client='BT' AND attribute_id='A0'

UPDATE a SET a.rel_value='JA' 
FROM aglrelvalue a INNER JOIN agldimvalue b ON(b.client=a.client AND b.dim_value=a.att_value) 
WHERE a.client='BT' AND a.attribute_id='A0' AND a.rel_attr_id='Q30' and ((CAST(a.att_value AS int) BETWEEN 3910 AND 3919) OR (CAST(a.att_value AS int) BETWEEN 4000 AND 8000) OR a.att_value IN('9010','9110','9020','9120','9040','9140'))


ROLLBACK
COMMIT


--Opprette konteringsregler og konto om de ikke fins, er egentlig økonomigruppa sit ansvar
SELECT * FROM aglrules WHERE client='BT' AND account_rule in ('56','61')
SELECT * FROM aglaccounts WHERE client='BT' AND account IN('9431','9432')

--Opprette bilagsart
SELECT * FROM acrvouchtype WHERE client='BT' AND voucher_type='P1'

--Opprett meny punkter
--SELECT * FROM aagmenu WHERE client='BT' AND menu_id='0163'
--SELECT * FROM aagmenu WHERE client='BT' AND menu_id='0151'

-- fetch menu "counters"
DECLARE @parentparentmenuid nvarchar(10)
SET @parentparentmenuid='501'
DECLARE @parentfuncid bigint
SET @parentfuncid=(SELECT MAX(func_id)+1 FROM ( SELECT MAX(func_id) as func_id FROM asysmenu 
WHERE module = '01' UNION SELECT MAX(func_id) as func_id FROM aagmenu WHERE 
module = '01') t )
DECLARE @parentmenuid nvarchar(10)
SET @parentmenuid = (SELECT CONCAT('01',CAST(@parentfuncid as nvarchar(8))))
DECLARE @parentsequenceno bigint
SET @parentsequenceno=(SELECT MAX(sequence_no)+1 FROM ( SELECT MAX(sequence_no) as sequence_no FROM asysmenu 
WHERE module = '01' AND parent_menu_id=@parentparentmenuid UNION SELECT MAX(sequence_no) as sequence_no FROM aagmenu WHERE 
module = '01' AND parent_menu_id=@parentparentmenuid) t )

--Egne menyer, opprette bott mappa og menypunktet. --UNCOMMENT DENNE NÅR FERDIG
INSERT INTO aagmenu (description, bespoke, menu_id_ref, bflag, client, cust_param,
 func_id, parent_menu_id, menu_id, menu_type, module, func_name, func_type 
, help_id, tree_type, licence_ref, argument, platforms, user_id, variant,
 sequence_no, icon_type) VALUES ( 'BOTT', 1, '', 0, 'BT', '', 0, @parentparentmenuid,
 @parentmenuid, 1, '01', '', 0, 0, 1, '', '', 0, '8-evla', 0, @parentsequenceno, 0);

DECLARE @sequenceno bigint
SET @sequenceno=(SELECT MAX(sequence_no)+1 FROM ( SELECT MAX(sequence_no) as sequence_no FROM asysmenu 
WHERE module = '01' AND parent_menu_id=@parentmenuid UNION SELECT MAX(sequence_no) as sequence_no FROM aagmenu WHERE 
module = '01' AND parent_menu_id=@parentmenuid) t )
 -- fetch menu "counters" for child menu
DECLARE @funcid bigint
SET @funcid=(SELECT MAX(func_id)+1 FROM ( SELECT MAX(func_id) as func_id FROM asysmenu 
WHERE module = '01' UNION SELECT MAX(func_id) as func_id FROM aagmenu WHERE 
module = '01') t )
DECLARE @menuid nvarchar(10)
SET @menuid = (SELECT CONCAT('01',CAST(@funcid as nvarchar(8))))
DECLARE @functype int
SET @functype = 32

 INSERT INTO aagmenu (description, bespoke, menu_id_ref, bflag, client, cust_param,
 func_id, parent_menu_id, menu_id, menu_type, module, func_name, func_type 
, help_id, tree_type, licence_ref, argument, platforms, user_id, variant,
 sequence_no, icon_type) VALUES ( 'Egenfinansiering ATSEF ag16', 1, '', 0, 'BT', '', @funcid, @parentmenuid,
@menuid, 4, '01', 'ATSEF', @functype, 0, 1, 'ag16', '', 0, '8-evla', 0, @sequenceno, 0);

--Tilgangsstyr bott mappa og menypunktet for atsef.
--SELECT * FROM aagaccess WHERE menu_id='0163'
--SELECT * FROM aagaccess WHERE menu_id='0151'
INSERT INTO aagaccess (bflag, menu_id, role_id, user_id, tree_type, user_stamp,last_update) VALUES (8, @parentmenuid, 'ADMINM7', '', 1, '8-evla', getdate());
INSERT INTO aagaccess (bflag, menu_id, role_id, user_id, tree_type, user_stamp,last_update) VALUES (8, @menuid, 'ADMINM7', '', 1, '8-evla', getdate());

--egne rapporter 
INSERT INTO aagrepdef(description,priority_no,pwd_check,report_name,report_cols,
variant,bespoke,func_id,module,user_id,last_update,mail_flag) VALUES ('Egenfinansiering ATSEF ag16',
0,0,'ATSEF',132,0,1,@funcid,'01','8-evla',getdate(),0);

INSERT INTO aagreppardef(fixed_flag,data_length,param_id,param_def,report_name,sequence_no,text_type,title,variant,func_id,module) VALUES (1,1,'asqlflag','1','ATSEF',1,'b','ASQL',0,@funcid,'01');
INSERT INTO aagreppardef(fixed_flag,data_length,param_id,param_def,report_name,sequence_no,text_type,title,variant,func_id,module) VALUES (1,4,'konto_ls_god','9421','ATSEF',2,'a','Leiestedskonto godskrevet',0,@funcid,'01');
INSERT INTO aagreppardef(fixed_flag,data_length,param_id,param_def,report_name,sequence_no,text_type,title,variant,func_id,module) VALUES (1,4,'konto_ls_bel','9422','ATSEF',3,'a','Leiestedskonto belastet',0,@funcid,'01');
INSERT INTO aagreppardef(fixed_flag,data_length,param_id,param_def,report_name,sequence_no,text_type,title,variant,func_id,module) VALUES (1,4,'konto_ef_god','9431','ATSEF',2,'a','EF konto godskrevet',0,@funcid,'01');
INSERT INTO aagreppardef(fixed_flag,data_length,param_id,param_def,report_name,sequence_no,text_type,title,variant,func_id,module) VALUES (1,4,'konto_ef_bel','9432','ATSEF',3,'a','EF konto belastet',0,@funcid,'01');

--Egne rapporter
--SELECT * FROM aagrepdef WHERE report_name='ATSEF'
--SELECT * FROM aagreppardef WHERE report_name='ATSEF'




-------------------------------------------------------------Sett inn  fast rapport
BEGIN TRAN

DECLARE @jobid bigint
SET @jobid = (SELECT counter from aagcounter WHERE module = N'AG' AND column_name = N'JOB_ID' )
UPDATE aagcounter SET counter = @jobid + 1 WHERE module = N'AG' AND column_name = N'JOB_ID' ; 

DELETE FROM aagdistrpar WHERE module= N'01'	AND func_id	= @funcid AND report_variant= 0 AND job_id	= @jobid;
INSERT INTO acrrepschedule (client,copies,description,func_id,func_type,job_id,	last_update,mail_flag,menu_id,module,output_id,printer,priority_no,real_user,report_cols,report_name,server_queue,sys_setup_code,user_id,variant) VALUES ('BT',0,'ATSEF - Egenfinansiering BOTT',@funcid,@functype,@jobid,getdate(),0,@menuid,'01',0,'LOKAL-PRINT',1,'SYSTEM',132,'ATSEF','RAPPORT','','8-evla',0);

DECLARE @scheduleid bigint
SET @scheduleid = (SELECT counter from aagcounter WHERE module = 'CR' AND column_name = 'SCHEDULE_ID')
UPDATE aagcounter SET counter = @scheduleid + 1 WHERE module = 'CR' AND column_name = 'SCHEDULE_ID' ; 

INSERT INTO acrschedule (end_after ,end_time ,last_update ,sched_type ,schedule_id ,start_time ,user_id )VALUES ( 0,CAST('2099-12-31 00:00:00' AS datetime),CAST('2019-12-12 13:59:35' AS datetime),'agr_daily',@scheduleid, CAST('2019-12-12 00:00:00' AS datetime),'8-evla');
INSERT INTO acrschedjob (job_id, job_source, next_time, run_overdue_job, schedule_id, status) VALUES ( 1, 'RS',CAST('2019-12-12 14:00:00' AS datetime), 0, @scheduleid, 'N');
DELETE FROM acrschedparam WHERE schedule_id = @scheduleid;
INSERT INTO acrschedparam (schedule_id, sequence_no, param_name, param_value) values (@scheduleid, 0, 'every', '1');
INSERT INTO acrschedparam (schedule_id, sequence_no, param_name, param_value) values (@scheduleid, 1, 'start_time', '00:00:00');
INSERT INTO acrschedparam (schedule_id, sequence_no, param_name, param_value) values (@scheduleid, 2, 'end_time', '23:59:00');
INSERT INTO acrschedparam (schedule_id, sequence_no, param_name, param_value) values (@scheduleid, 3, 'interval', '5');
INSERT INTO acrschedparam (schedule_id, sequence_no, param_name, param_value) values (@scheduleid, 4, 'interv_typ', 'minutes');
INSERT INTO acrschedparam (schedule_id, sequence_no, param_name, param_value) values (@scheduleid, 5, 'start_date', '20191212 00:00:00');

ROLLBACK
COMMIT



SELECT * FROM aagsysvalues WHERE name='EGENFIN_TRIGGER_CLIENT   ' ORDER BY last_update DESC



USE [AgrBOTT_Utv01]
GO

/****** Object:  Table [dbo].[dfo_egenfinansiering]    Script Date: 28.11.2019 10.40.38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[dfo_egenfinansiering](
	[account] [varchar](25) NOT NULL,
	[amount] [decimal](28, 3) NOT NULL,
	[apar_id] [varchar](25) NOT NULL,
	[apar_type] [char](1) NOT NULL,
	[att_1_id] [char](4) NOT NULL,
	[att_2_id] [char](4) NOT NULL,
	[att_3_id] [char](4) NOT NULL,
	[att_4_id] [char](4) NOT NULL,
	[att_5_id] [char](4) NOT NULL,
	[att_6_id] [char](4) NOT NULL,
	[att_7_id] [char](4) NOT NULL,
	[client] [varchar](25) NOT NULL,
	[cur_amount] [decimal](28, 3) NOT NULL,
	[currency] [varchar](25) NOT NULL,
	[dc_flag] [smallint] NOT NULL,
	[description] [varchar](255) NOT NULL,
	[dim_1] [varchar](25) NOT NULL,
	[dim_2] [varchar](25) NOT NULL,
	[dim_3] [varchar](25) NOT NULL,
	[dim_4] [varchar](25) NOT NULL,
	[dim_5] [varchar](25) NOT NULL,
	[dim_6] [varchar](25) NOT NULL,
	[dim_7] [varchar](25) NOT NULL,
	[ext_arch_ref] [varchar](50) NOT NULL,
	[ext_inv_ref] [varchar](100) NOT NULL,
	[ext_ref] [varchar](255) NOT NULL,
	[number_1] [int] NOT NULL,
	[order_id] [bigint] NOT NULL,
	[period] [int] NOT NULL,
	[sequence_no] [int] NOT NULL,
	[status] [char](1) NOT NULL,
	[tax_code] [varchar](25) NOT NULL,
	[tax_system] [varchar](25) NOT NULL,
	[trans_date] [datetime] NOT NULL,
	[value_1] [decimal](28, 8) NOT NULL,
	[value_2] [decimal](28, 3) NOT NULL,
	[value_3] [decimal](28, 3) NOT NULL,
	[voucher_date] [datetime] NOT NULL,
	[voucher_no] [bigint] NOT NULL,
	[voucher_type] [varchar](25) NOT NULL,
	[agrtid] [bigint] IDENTITY(1,1) NOT NULL,
	[step] [tinyint] NOT NULL,
	[last_update] [datetime] NOT NULL,
	[user_id] [nvarchar](25) NOT NULL
) ON [AgrDW]

GO

SET ANSI_PADDING OFF
GO

--Paste inn triggeren her:

--Paste inn ag16 jobben her fra tasks-> generate scripts. 


ROLLBACK
COMMIT
