BEGIN TRAN
DECLARE @envclient nvarchar(2) = '72';
DECLARE @userid nvarchar(10)='8-evla';

DECLARE @grantroleaccess nvarchar(10)='ADMINM7';
DECLARE @parentmenuid nvarchar(10) = (SELECT menu_id FROM aagmenu where description='Prosjektøkonomi (BOTT)');
DECLARE @module nvarchar(10)=TRIM((SELECT module FROM aagmenu where description='Prosjektøkonomi (BOTT)'))
DECLARE @database nvarchar(20) = (select DB_NAME());

--OPPRETT Kontorelasjonen for egenfinansiering og populer denne for hver konto
INSERT INTO agldimension (att_name, attribute_id, client, data_length, data_type,description, dim_grp, dim_position, dim_v1_txt, last_update, maintenance, period_type, rel_attr_id, related_attr, status, user_id,bflag) 
	VALUES ('EGENFIN', 'Q30',@envclient,12, 'A', 'Egenfinansiering trigges på kostnad ført på konto', 0, 'X', '', getdate(), 'M', 0, '', '', 'N', @userid,2);
INSERT INTO agldescription ( client , attribute_id , dim_value , description , language ) 
	VALUES ( @envclient , 'Q30' , '' , '' , 'NO' ) ;
INSERT INTO agldescription ( client , attribute_id , dim_value , description , language ) 
	VALUES ( @envclient , 'Q30' , 'JA' , 'Inkluder konto' , 'NO' ) ;
INSERT INTO agldimvalue (description,rel_value,value_1,period_to,status,client,last_update,user_id,attribute_id,dim_value,period_from) 
	VALUES ('Inkluder konto','',0.00000000,209999,'N',@envclient,getdate(),@userid,'Q30','JA',0 );
INSERT INTO agldescription ( client , attribute_id , dim_value , description , language ) 
	VALUES ( @envclient , 'Q30' , 'Nei' , 'Ekskluder konto' , 'NO' ) ;
INSERT INTO agldimvalue (description,rel_value,value_1,period_to,status,client,last_update,user_id,attribute_id,dim_value,period_from) 
	VALUES ('ekskluder konto','',0.00000000,209999,'N',@envclient,getdate(),@userid,'Q30','Nei',0 );
INSERT INTO aglrelation(att_name,attribute_id,bflag, client, dim_v1_txt,duplicates,flag,last_update,maintenance,module,period_id,rel_attr_id,related_attr,required,sort_order,user_id,percent_set,rel_grp) 
	VALUES ('KONTO','A0',0,@envclient ,'',0,'W',getdate(),'M','','N','Q30','EGENFIN','V',42,@userid,0,'');
INSERT [dbo].[aglrelvalue] ([att_val_from], [att_val_to], [att_value], [attribute_id], [client], [date_from], [date_to], [last_update], [percentage], [priority], [rel_attr_id], [rel_id], [rel_value], [user_id], [value_1]) 
	SELECT dim_value, dim_value, dim_value, 'A0  ',@envclient, CAST('1900-01-01 00:00:00.000' AS DateTime), CAST('2099-12-31 00:00:00.000' AS DateTime), GETDATE(), CAST(100.00000000 AS Decimal(28, 8)), 1, 'Q30 ', NEWID(), 'NEI', @userid, CAST(0.00000000 AS Decimal(28, 8))
	FROM agldimvalue WHERE client=@envclient AND attribute_id='A0'
UPDATE a SET a.rel_value='JA' 
	FROM aglrelvalue a INNER JOIN agldimvalue b ON(b.client=a.client AND b.dim_value=a.att_value) 
	WHERE a.client=@envclient AND a.attribute_id='A0' AND a.rel_attr_id='Q30' and ((CAST(a.att_value AS int) BETWEEN 3910 AND 3919) OR (CAST(a.att_value AS int) BETWEEN 4000 AND 8000) OR a.att_value IN('9112','9422','9412'))

--Opprette bilagsart
INSERT INTO agldimvalue ( attribute_id , client , description , dim_value , period_from , period_to , rel_value , status , value_1 , user_id , last_update ) 
	VALUES (  'AX' ,  @envclient ,  'Egenfinansiering BOA' ,  'P1' , 199401 , 209912 ,'' ,  'N' , 0.00000000 ,  @userid , getdate() ) ;
INSERT INTO agldescription ( client , attribute_id , dim_value , description , language ) 
	VALUES (  @envclient ,  'AX' ,  'P1' ,  'Egenfinansiering BOA' ,  'NO' ) ;
INSERT INTO acrvouchtype (description,treat_code,vouch_series,status,client,last_update,user_id,voucher_type) 
	VALUES ( 'Egenfinansiering BOA', 'B*', 'HB', 'P',@envclient,getdate(), @userid, 'P1' );

-- Opprett dfo_egenfinansiering-stabellen
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
) 

--Opprett klientbegrensning
INSERT INTO aagsysvalues (text1,number1,text2,number2,text3,number3,description,last_update,user_id,sys_setup_code,name,sequence_no) 
	VALUES (@envclient,0,'',0,'',0,'Firmaet benytter egenfinansieringsløsningen for bott',getdate(),@userid,'NO','EGENFIN_TRIGGER_CLIENT',0 );

-------------------------------------
-------------------------------------
-------------------------------------
--Paste inn ag16 jobben her fra tasks-> generate scripts. 
-------------------------------------
-------------------------------------
-------------------------------------
INSERT [dbo].[aagbatquery] ([commit_flag], [description], [exit_from], [query], [report_name], [sequence_no], [type]) VALUES (N'N', N'BESTILL GL07: INSERT gl07 parameter i acrparord start_tps      ''0''', N'S', N'DATABASE INSERT INTO acrparord(orderno,client,report_name,param_id,sequence_no,text_type,data_length,param_name,param_val) SELECT :gl07ordernumber,''$client'',''GL07'',''start_tps'' ,25,''b'' ,1, ''Start AGRTPS'',''0'' WHERE 1=1', N'ATSEF', 954, N'B')
INSERT [dbo].[aagbatquery] ([commit_flag], [description], [exit_from], [query], [report_name], [sequence_no], [type]) VALUES (N'N', N'BESTILL GL07: INSERT gl07 parameter i acrparord registrat      ''0''', N'S', N'DATABASE INSERT INTO acrparord(orderno,client,report_name,param_id,sequence_no,text_type,data_length,param_name,param_val) SELECT :gl07ordernumber,''$client'',''GL07'',''registration'',26,''b'' ,1, ''Registration'',''0'' WHERE 1=1', N'ATSEF', 955, N'B')
INSERT [dbo].[aagbatquery] ([commit_flag], [description], [exit_from], [query], [report_name], [sequence_no], [type]) VALUES (N'N', N'BESTILL GL07: INSERT gl07 parameter i acrparord asqlflag       ''0''', N'S', N'DATABASE INSERT INTO acrparord(orderno,client,report_name,param_id,sequence_no,text_type,data_length,param_name,param_val) SELECT :gl07ordernumber,''$client'',''GL07'',''asqlflag'',27,''b'' ,1, ''UBW SQL'' ,''0'' WHERE 1=1', N'ATSEF', 956, N'B')
INSERT [dbo].[aagbatquery] ([commit_flag], [description], [exit_from], [query], [report_name], [sequence_no], [type]) VALUES (N'N', N'BESTILL GL07: INSERT gl07 parameter i acrparord report_fi      ''GL07''', N'S', N'DATABASE INSERT INTO acrparord(orderno,client,report_name,param_id,sequence_no,text_type,data_length,param_name,param_val) SELECT :gl07ordernumber,''$client'',''GL07'',''report_file'' ,28,''A'' ,12,''Report file'' ,''GL07'' WHERE 1=1', N'ATSEF', 957, N'B')
INSERT [dbo].[aagbatquery] ([commit_flag], [description], [exit_from], [query], [report_name], [sequence_no], [type]) VALUES (N'N', N'BESTILL GL07: INSERT gl07 parameter i acrparord max_inv_d      ''1''', N'S', N'DATABASE INSERT INTO acrparord(orderno,client,report_name,param_id,sequence_no,text_type,data_length,param_name,param_val) SELECT :gl07ordernumber,''$client'',''GL07'',''max_inv_diff'',29,''b'' ,1, ''Max.trans.diff'',''1'' WHERE 1=1', N'ATSEF', 958, N'B')
INSERT [dbo].[aagbatquery] ([commit_flag], [description], [exit_from], [query], [report_name], [sequence_no], [type]) VALUES (N'N', N'BESTILL GL07: INSERT gl07 parameter i acrparord seq_no_fl      ''1''', N'S', N'DATABASE INSERT INTO acrparord(orderno,client,report_name,param_id,sequence_no,text_type,data_length,param_name,param_val) SELECT :gl07ordernumber,''$client'',''GL07'',''seq_no_flag'' ,31,''b'' ,1, ''SequenceNo assignment'' ,''1'' WHERE 1=1', N'ATSEF', 959, N'B')
INSERT [dbo].[aagbatquery] ([commit_flag], [description], [exit_from], [query], [report_name], [sequence_no], [type]) VALUES (N'N', N'BESTILL GL07: INSERT gl07 parameter i acrparord init_ag16      ''0''', N'S', N'DATABASE INSERT INTO acrparord(orderno,client,report_name,param_id,sequence_no,text_type,data_length,param_name,param_val) SELECT :gl07ordernumber,''$client'',''GL07'',''init_ag16'' ,32,''b'' ,1, ''Initial AG16'',''0'' WHERE 1=1', N'ATSEF', 960, N'B')
INSERT [dbo].[aagbatquery] ([commit_flag], [description], [exit_from], [query], [report_name], [sequence_no], [type]) VALUES (N'N', N'BESTILL GL07: INSERT gl07 parameter i acrparord chk_vou_d      ''2''', N'S', N'DATABASE INSERT INTO acrparord(orderno,client,report_name,param_id,sequence_no,text_type,data_length,param_name,param_val) SELECT :gl07ordernumber,''$client'',''GL07'',''chk_vou_date'',33,''A'' ,1, ''Check transaction date'',''2'' WHERE 1=1', N'ATSEF', 961, N'B')
INSERT [dbo].[aagbatquery] ([commit_flag], [description], [exit_from], [query], [report_name], [sequence_no], [type]) VALUES (N'N', N'BESTILL GL07: INSERT gl07 parameter i acrparord report_fi      ''GL07B''', N'S', N'DATABASE INSERT INTO acrparord(orderno,client,report_name,param_id,sequence_no,text_type,data_length,param_name,param_val) SELECT :gl07ordernumber,''$client'',''GL07'',''report_file2'',34,''A'' ,12,''Warning report'',''GL07B'' WHERE 1=1', N'ATSEF', 962, N'B')
INSERT [dbo].[aagbatquery] ([commit_flag], [description], [exit_from], [query], [report_name], [sequence_no], [type]) VALUES (N'N', N'BESTILL GL07: INSERT gl07 parameter i acrparord mult_vou_      ''0'' WH', N'S', N'DATABASE INSERT INTO acrparord(orderno,client,report_name,param_id,sequence_no,text_type,data_length,param_name,param_val) SELECT :gl07ordernumber,''$client'',''GL07'',''mult_vou_dat'',35,''b'' ,1, ''Allow multiple transactio'' ,''0'' WHERE 1=1', N'ATSEF', 963, N'B')
INSERT [dbo].[aagbatquery] ([commit_flag], [description], [exit_from], [query], [report_name], [sequence_no], [type]) VALUES (N'N', N'BESTILL GL07: INSERT gl07 parameter i acrparord orphan_ta      ''0''', N'S', N'DATABASE INSERT INTO acrparord(orderno,client,report_name,param_id,sequence_no,text_type,data_length,param_name,param_val) SELECT :gl07ordernumber,''$client'',''GL07'',''orphan_tax'',36,''b'' ,1, ''Allow orphan tax trans.'' ,''0'' WHERE 1=1', N'ATSEF', 964, N'B')
INSERT [dbo].[aagbatquery] ([commit_flag], [description], [exit_from], [query], [report_name], [sequence_no], [type]) VALUES (N'C', N'STEP: Oppdater status til 2 (fullført) i dfo_egenfinansiering for radene som detble trigget egenfinansiering på', N'S', N'DATABASE UPDATE dfo_egenfinansiering SET dfo_egenfinansiering.step=2, dfo_egenfinansiering.last_update=GETDATE() FROM $*HLPGRUNNLAG WHERE dfo_egenfinansiering.client=$*HLPGRUNNLAG.client AND dfo_egenfinansiering.sequence_no=$*HLPGRUNNLAG.sequence_no AND dfo_egenfinansiering.voucher_no=$*HLPGRUNNLAG.voucher_no', N'ATSEF', 1000, N'B')
INSERT [dbo].[aagbatquery] ([commit_flag], [description], [exit_from], [query], [report_name], [sequence_no], [type]) VALUES (N'N', N'BESTILL GL07: INSERT gl07 parameter i acrparord debugging      ''4''', N'S', N'DATABASE INSERT INTO acrparord(orderno,client,report_name,param_id,sequence_no,text_type,data_length,param_name,param_val) SELECT :gl07ordernumber,''$client'',''GL07'',''debugging'' ,140,''A'',1, ''Log Level Parameter'' ,''1'' WHERE 1=1', N'ATSEF', 965, N'B')
INSERT [dbo].[aagbatquery] ([commit_flag], [description], [exit_from], [query], [report_name], [sequence_no], [type]) VALUES (N'N', N'BESTILL GL07: INSERT gl07 parameter i acrparord tmp_save       ''1''', N'S', N'DATABASE INSERT INTO acrparord(orderno,client,report_name,param_id,sequence_no,text_type,data_length,param_name,param_val) SELECT :gl07ordernumber,''$client'',''GL07'',''tmp_save'',141,''b'',1, ''Tmp table parameter'',''0'' WHERE 1=1', N'ATSEF', 966, N'B')
INSERT [dbo].[aagbatquery] ([commit_flag], [description], [exit_from], [query], [report_name], [sequence_no], [type]) VALUES (N'C', N'BESTILL GL07: INSERT gl07 parameter i acrparord real_user      ''$user_id''', N'S', N'DATABASE INSERT INTO acrparord(orderno,client,report_name,param_id,sequence_no,text_type,data_length,param_name,param_val) SELECT :gl07ordernumber,''$client'',''GL07'',''real_user'' ,200,''A'',25,''Real User'' ,''$user_id'' WHERE 1=1', N'ATSEF', 967, N'B')
INSERT [dbo].[aagbatquery] ([commit_flag], [description], [exit_from], [query], [report_name], [sequence_no], [type]) VALUES (N'C', N'BESTILL GL07: End IF seq 80 bestilling av gl07', N'S', N'END IF', N'ATSEF', 999, N'B')
INSERT [dbo].[aagbatquery] ([commit_flag], [description], [exit_from], [query], [report_name], [sequence_no], [type]) VALUES (N'N', N'HJELPETABELL: Finn nye rader i triggertabell dfo_egenfinansiering og insert disse inn i en HLPGRUNNLAG for videre behandling', N'S', N'DATABASE SELECT * INTO $*HLPGRUNNLAG FROM dfo_egenfinansiering WHERE client=''$client'' AND step=0', N'ATSEF', 10, N'B')
INSERT [dbo].[aagbatquery] ([commit_flag], [description], [exit_from], [query], [report_name], [sequence_no], [type]) VALUES (N'C', N'STEP: Oppdater status på uthentete rader til 1 (under_arbeid) i dfo_egenfinansiering for under arbeid', N'S', N'DATABASE UPDATE dfo_egenfinansiering SET step=1,last_update=GETDATE() WHERE client=''$client'' AND step=0', N'ATSEF', 11, N'B')
INSERT [dbo].[aagbatquery] ([commit_flag], [description], [exit_from], [query], [report_name], [sequence_no], [type]) VALUES (N'N', N'FILTER: Luk ut rader fra HLPGRUNNLAG som ikke har delprosjekt i dim_5, plasserførst i hjelpetabell for å oppdatere status', N'S', N'DATABASE SELECT * INTO $*HLP01DIM5 FROM $*HLPGRUNNLAG WHERE att_5_id<>''BF''', N'ATSEF', 20, N'B')
INSERT [dbo].[aagbatquery] ([commit_flag], [description], [exit_from], [query], [report_name], [sequence_no], [type]) VALUES (N'N', N'FILTER: Luk ut rader fra HLPGRUNNLAG som ikke har delprosjekt i dim_5, slett fra HLPGRUNNLAG', N'S', N'DATABASE DELETE FROM $*HLPGRUNNLAG WHERE att_5_id<>''BF''', N'ATSEF', 21, N'B')
INSERT [dbo].[aagbatquery] ([commit_flag], [description], [exit_from], [query], [report_name], [sequence_no], [type]) VALUES (N'C', N'STEP: Oppdater status til 2 (fullført) i dfo_egenfinansiering for radene som bleluket ut grunnet feil verdi i dim_5', N'S', N'DATABASE UPDATE dfo_egenfinansiering SET dfo_egenfinansiering.step = 2, dfo_egenfinansiering.last_update=GETDATE() FROM $*HLP01DIM5 WHERE dfo_egenfinansiering.client = $*HLP01DIM5.client AND dfo_egenfinansiering.sequence_no = $*HLP01DIM5.sequence_no AND dfo_egenfinansiering.voucher_no = $*HLP01DIM5.voucher_no', N'ATSEF', 22, N'B')
INSERT [dbo].[aagbatquery] ([commit_flag], [description], [exit_from], [query], [report_name], [sequence_no], [type]) VALUES (N'N', N'FILTER: Luk ut rader fra HLPGRUNNLAG som ikke har prosjekt av typen bidrag', N'S', N'DATABASE SELECT b.account ,b.amount ,b.apar_id ,b.apar_type ,b.att_1_id ,b.att_2_id ,b.att_3_id ,b.att_4_id ,b.att_5_id ,b.att_6_id ,b.att_7_id ,b.client ,b.cur_amount ,b.currency ,b.dc_flag ,b.description ,b.dim_1 ,b.dim_2 ,b.dim_3 ,b.dim_4 ,b.dim_5 ,b.dim_6 ,b.dim_7 ,b.ext_arch_ref ,b.ext_inv_ref ,b.ext_ref ,b.number_1 ,b.order_id ,b.period ,b.sequence_no ,b.status ,b.tax_code ,b.tax_system ,b.trans_date ,b.value_1 ,b.value_2 ,b.value_3 ,b.voucher_date ,b.voucher_no ,b.voucher_type ,b.step INTO $*HLP02TYPE FROM $*HLPGRUNNLAG b LEFT OUTER JOIN atsproject c ON ( b.client = c.client AND b.dim_2 = c.project ) WHERE c.unit_id NOT LIKE ''B%''', N'ATSEF', 30, N'B')
INSERT [dbo].[aagbatquery] ([commit_flag], [description], [exit_from], [query], [report_name], [sequence_no], [type]) VALUES (N'N', N'FILTER: Luk ut rader fra HLPGRUNNLAG som ikke har prosjekt av typen bidrag, slett fra HLPGRUNNLAG', N'S', N'DATABASE DELETE b FROM $*HLPGRUNNLAG b INNER JOIN atsproject c ON(b.client=c.client AND b.dim_2=c.project) WHERE c.unit_id NOT LIKE ''B%''', N'ATSEF', 31, N'B')
INSERT [dbo].[aagbatquery] ([commit_flag], [description], [exit_from], [query], [report_name], [sequence_no], [type]) VALUES (N'C', N'STEP: Oppdater status til 2 (fullført) i dfo_egenfinansiering for radene som bleluket ut grunnet feil prosjekttype på prosjekt i dim_2', N'S', N'DATABASE UPDATE dfo_egenfinansiering SET dfo_egenfinansiering.step = 2,dfo_egenfinansiering.last_update=GETDATE() FROM $*HLP02TYPE WHERE dfo_egenfinansiering.client = $*HLP02TYPE.client AND dfo_egenfinansiering.sequence_no = $*HLP02TYPE.sequence_no AND dfo_egenfinansiering.voucher_no = $*HLP02TYPE.voucher_no', N'ATSEF', 32, N'B')
INSERT [dbo].[aagbatquery] ([commit_flag], [description], [exit_from], [query], [report_name], [sequence_no], [type]) VALUES (N'N', N'BEREGN: FLEX:ANDELSMESSIG&KOSTNADSSPESIFIKK:Oppdater beløp i $*HLPGRUNNLAG basertpå beløp i rad og andel i fleksifelt på kontert arbeidsordre', N'S', N'DATABASE UPDATE a SET a.amount=a.amount*b.own_funding_fx/100, a.cur_amount=a.cur_amount*b.own_funding_fx/100 FROM $*HLPGRUNNLAG a INNER JOIN afxaoegenfin b ON(b.client=a.client AND b.attribute_id=''BF'' AND b.dim_value = a.dim_5)', N'ATSEF', 40, N'B')
INSERT [dbo].[aagbatquery] ([commit_flag], [description], [exit_from], [query], [report_name], [sequence_no], [type]) VALUES (N'N', N'FILTER: LUK ut rader fra HLPGRUNNLAG som har beløp = 0', N'S', N'DATABASE SELECT b.account ,b.amount ,b.apar_id ,b.apar_type ,b.att_1_id ,b.att_2_id ,b.att_3_id ,b.att_4_id ,b.att_5_id ,b.att_6_id ,b.att_7_id ,b.client ,b.cur_amount ,b.currency ,b.dc_flag ,b.description ,b.dim_1 ,b.dim_2 ,b.dim_3 ,b.dim_4 ,b.dim_5 ,b.dim_6 ,b.dim_7 ,b.ext_arch_ref ,b.ext_inv_ref ,b.ext_ref ,b.number_1 ,b.order_id ,b.period ,b.sequence_no ,b.status ,b.tax_code ,b.tax_system ,b.trans_date ,b.value_1 ,b.value_2 ,b.value_3 ,b.voucher_date ,b.voucher_no ,b.voucher_type ,b.step INTO $*HLP03AMT0 FROM $*HLPGRUNNLAG b WHERE b.amount=0', N'ATSEF', 41, N'B')
INSERT [dbo].[aagbatquery] ([commit_flag], [description], [exit_from], [query], [report_name], [sequence_no], [type]) VALUES (N'N', N'FILTER: LUK ut rader fra HLPGRUNNLAG som har beløp = 0', N'S', N'DATABASE DELETE b FROM $*HLPGRUNNLAG b WHERE b.amount=0', N'ATSEF', 42, N'B')
INSERT [dbo].[aagbatquery] ([commit_flag], [description], [exit_from], [query], [report_name], [sequence_no], [type]) VALUES (N'C', N'STEP: Oppdater status til 2 for utlukede rader 0-beløp rader', N'S', N'DATABASE UPDATE dfo_egenfinansiering SET dfo_egenfinansiering.step = 2,dfo_egenfinansiering.last_update=GETDATE() FROM $*HLP03AMT0 WHERE dfo_egenfinansiering.client = $*HLP03AMT0.client AND dfo_egenfinansiering.sequence_no = $*HLP03AMT0.sequence_no AND dfo_egenfinansiering.voucher_no = $*HLP03AMT0.voucher_no', N'ATSEF', 43, N'B')
INSERT [dbo].[aagbatquery] ([commit_flag], [description], [exit_from], [query], [report_name], [sequence_no], [type]) VALUES (N'C', N'FORTABELL: Opprett HLPBATCHINPUT fra acrbatchinput, merk at sequence_no er identity kolonne', N'S', N'DATABASE CREATE TABLE $*HLPBATCHINPUT ( account NVARCHAR(25) NOT NULL, amount DECIMAL(28, 3) NOT NULL, batch_id NVARCHAR(50) NOT NULL, client NVARCHAR(25) NOT NULL, cur_amount DECIMAL(28, 3) NOT NULL, currency NVARCHAR(25) NOT NULL, description NVARCHAR(510) NOT NULL, dim_1 NVARCHAR(25) NOT NULL, dim_2 NVARCHAR(25) NOT NULL, dim_3 NVARCHAR(25) NOT NULL, dim_4 NVARCHAR(25) NOT NULL, dim_5 NVARCHAR(25) NOT NULL, dim_6 NVARCHAR(25) NOT NULL, dim_7 NVARCHAR(25) NOT NULL, ext_inv_ref NVARCHAR(100) NOT NULL, interface NVARCHAR(255) NOT NULL, period INT NOT NULL, sequence_no INT identity, tax_code NVARCHAR(50) NOT NULL DEFAULT ''0'', trans_date DATETIME NOT NULL DEFAULT(GETDATE()), trans_type NVARCHAR(4) NOT NULL, voucher_date DATETIME NOT NULL DEFAULT(GETDATE()), voucher_type NVARCHAR(50) NOT NULL )', N'ATSEF', 50, N'B')
INSERT [dbo].[aagbatquery] ([commit_flag], [description], [exit_from], [query], [report_name], [sequence_no], [type]) VALUES (N'C', N'BESTILL GL07: IF hjelpetabell har rader i seg, bestill gl07', N'S', N'IF SELECT * FROM $*HLPBATCHINPUT', N'ATSEF', 80, N'B')
INSERT [dbo].[aagbatquery] ([commit_flag], [description], [exit_from], [query], [report_name], [sequence_no], [type]) VALUES (N'N', N'BESTILL GL07: Opprett variabel for mellomlagring av batchid', N'S', N'DEFINE batchid char(50)', N'ATSEF', 85, N'B')
INSERT [dbo].[aagbatquery] ([commit_flag], [description], [exit_from], [query], [report_name], [sequence_no], [type]) VALUES (N'N', N'BESTILL GL07: Hent ut batch_id ut i variabel :batchid override batchid if not empty', N'S', N'SELECT IFNULL(batch_id,''FALSE'') INTO :batchid FROM $*HLPBATCHINPUT WHERE sequence_no=1', N'ATSEF', 86, N'B')
INSERT [dbo].[aagbatquery] ([commit_flag], [description], [exit_from], [query], [report_name], [sequence_no], [type]) VALUES (N'N', N'BATCHID: Insert aggregert fra HLPGRUNNLAG  inn i $*HLPBATCHINPUT, generer samtidigunik batchid og sett konto til $konto_ef_god egenfinansiering godskrevet, legg ogvoucher_no og sequence_no inn i ext_inv_ref. GODSKRIV DELPROSJEKTET', N'S', N'DATABASE INSERT INTO $*HLPBATCHINPUT ( account, amount, batch_id, client, cur_amount, currency, description, dim_1, dim_2, dim_3, dim_4, dim_5, dim_6, dim_7, ext_inv_ref, interface, period, tax_code, trans_date, trans_type, voucher_date, voucher_type ) SELECT ''$konto_ef_god'', amount*-1, CONCAT (''BT'',''-'',convert(VARCHAR, getdate(), 23),convert(VARCHAR, getdate(), 14)), client, cur_amount*-1, currency, description, dim_1, dim_2, dim_3, dim_4, dim_5, dim_6, dim_7, CONCAT(voucher_no,sequence_no), ''BI'', period, ''0'', trans_date, ''GL'', voucher_date, ''P1'' FROM $*HLPGRUNNLAG WHERE 1 = 1', N'ATSEF', 60, N'B')
INSERT [dbo].[aagbatquery] ([commit_flag], [description], [exit_from], [query], [report_name], [sequence_no], [type]) VALUES (N'C', N'DUPLISER: Insert inn i HLPBATCHINPUT basert på HLPBATCHINPUT inverter amount og samtidig oppdater konto til $konto_ef_bel egenfinansiering belastet BELASTBASIS AVREGNING med konteringsregel og verdiforslag.', N'S', N'DATABASE INSERT INTO $*HLPBATCHINPUT ( account, amount, batch_id, client, cur_amount, currency, description, dim_1, dim_2, dim_3, dim_4, dim_5, dim_6, dim_7, ext_inv_ref, interface, period, tax_code, trans_date, trans_type, voucher_date, voucher_type ) SELECT ''$konto_ef_bel'', a.amount, (SELECT TOP 1 batch_id FROM $*HLPBATCHINPUT WHERE 1=1), a.client, a.cur_amount, a.currency, a.description, CASE WHEN a.account IN (''$konto_ls_god'',''$konto_ls_bel'') THEN b.rel_value ELSE a.dim_1 END , a.dim_2, a.dim_3, a.dim_4, a.dim_5, a.dim_6, a.dim_7, CONCAT(a.voucher_no,a.sequence_no), ''BI'', a.period, ''0'', a.trans_date, ''GL'', a.voucher_date, ''P1'' FROM $*HLPGRUNNLAG a INNER JOIN aglrelvalue b ON (a.client=b.client AND b.attribute_id=''BF'' AND b.rel_attr_id=''C1'' AND b.att_value=a.dim_5) WHERE 1 = 1', N'ATSEF', 65, N'B')
INSERT [dbo].[aagbatquery] ([commit_flag], [description], [exit_from], [query], [report_name], [sequence_no], [type]) VALUES (N'N', N'BESTILL GL07: ACRBATCHINPUT: Insert alt fra HLPBATCHINPUT inn i acrbatchinput dadataen er massert ferdig', N'S', N'DATABASE INSERT INTO acrbatchinput ( account, amount, batch_id, client, cur_amount, currency, description, dim_1, dim_2, dim_3, dim_4, dim_5, dim_6, dim_7, ext_inv_ref, interface, period,sequence_no, tax_code, trans_date, trans_type, voucher_date, voucher_type ) SELECT account, amount, batch_id, client, cur_amount, currency, description, dim_1, '''', dim_3, dim_4, dim_5, dim_6, dim_7, ext_inv_ref, interface, period,sequence_no, tax_code, trans_date, trans_type, getdate(),voucher_type FROM $*HLPBATCHINPUT WHERE 1=1', N'ATSEF', 90, N'B')
INSERT [dbo].[aagbatquery] ([commit_flag], [description], [exit_from], [query], [report_name], [sequence_no], [type]) VALUES (N'N', N'BESTILL GL07: Opprett variabel for mellomlagring av rapportnummer', N'S', N'DEFINE gl07ordernumber int', N'ATSEF', 900, N'B')
INSERT [dbo].[aagbatquery] ([commit_flag], [description], [exit_from], [query], [report_name], [sequence_no], [type]) VALUES (N'N', N'BESTILL GL07: Hent neste rapportnummer ut i variabel :gl07ordernumber', N'S', N'SELECT orderno INTO :gl07ordernumber FROM aagreporder WHERE report_name=''GL07''', N'ATSEF', 905, N'B')
INSERT [dbo].[aagbatquery] ([commit_flag], [description], [exit_from], [query], [report_name], [sequence_no], [type]) VALUES (N'N', N'BESTILL GL07: Inkrementer orderenummer', N'S', N'DATABASE UPDATE aagreporder SET orderno=orderno+1 WHERE report_name =''GL07''', N'ATSEF', 906, N'B')
INSERT [dbo].[aagbatquery] ([commit_flag], [description], [exit_from], [query], [report_name], [sequence_no], [type]) VALUES (N'C', N'BESTILL GL07: Opprett variabel for mellomlagring av period $YYMMDD', N'S', N'DEFINE periodtopacrbatchline INT', N'ATSEF', 910, N'B')
INSERT [dbo].[aagbatquery] ([commit_flag], [description], [exit_from], [query], [report_name], [sequence_no], [type]) VALUES (N'C', N'BESTILL GL07: Hent ut periode fra oeverste linje i acrbatch hjelpetabellen', N'S', N'SELECT IFNULL(period,190001) INTO :periodtopacrbatchline FROM $*HLPBATCHINPUT WHERE sequence_no=1', N'ATSEF', 915, N'B')
INSERT [dbo].[aagbatquery] ([commit_flag], [description], [exit_from], [query], [report_name], [sequence_no], [type]) VALUES (N'N', N'BESTILL GL07: INSERT gl07 parameter i acrparord file_name      ''''', N'S', N'DATABASE INSERT INTO acrparord(orderno,client,report_name,param_id,sequence_no,text_type,data_length,param_name,param_val) SELECT :gl07ordernumber,''$client'',''GL07'',''file_name'',1,''a'' ,255, ''Filename'','''' WHERE 1=1', N'ATSEF', 930, N'B')
INSERT [dbo].[aagbatquery] ([commit_flag], [description], [exit_from], [query], [report_name], [sequence_no], [type]) VALUES (N'N', N'BESTILL GL07: INSERT gl07 parameter i acrparord interface      ''BI''', N'S', N'DATABASE INSERT INTO acrparord(orderno,client,report_name,param_id,sequence_no,text_type,data_length,param_name,param_val) SELECT :gl07ordernumber,''$client'',''GL07'',''interface'',2,''a'' ,50,''External system'' ,''BI'' WHERE 1=1', N'ATSEF', 931, N'B')
INSERT [dbo].[aagbatquery] ([commit_flag], [description], [exit_from], [query], [report_name], [sequence_no], [type]) VALUES (N'N', N'BESTILL GL07: INSERT gl07 parameter i acrparord batch_id       :batchid', N'S', N'DATABASE INSERT INTO acrparord(orderno,client,report_name,param_id,sequence_no,text_type,data_length,param_name,param_val) SELECT :gl07ordernumber,''$client'',''GL07'',''batch_id'' ,3,''A'' ,25,''BatchID'' ,:batchid WHERE 1=1', N'ATSEF', 932, N'B')
INSERT [dbo].[aagbatquery] ([commit_flag], [description], [exit_from], [query], [report_name], [sequence_no], [type]) VALUES (N'N', N'BESTILL GL07: Insert gl07 ordre i acrrepord', N'S', N'DATABASE INSERT INTO acrrepord (expire_days,user_id,invoke_time, report_name,report_id, report_type,report_cols,client,copies,order_date,server_queue,priority_no, printer,status,last_update,orderno,func_arg,description,module,func_id,mail_flag, me_mail_flag,output_id,variant) SELECT 0,''SYSTEM'',getdate(),''GL07'',''gl07'', ''B'',186,''$client'',1,getdate(),''RAPPORT'',1,''LOKAL-PRINT'',''N'',getdate(),:gl07ordernumber,''agrbibat'', ''GL07'',''BI'',88,0,0,0,2002 WHERE 1=1', N'ATSEF', 920, N'B')
INSERT [dbo].[aagbatquery] ([commit_flag], [description], [exit_from], [query], [report_name], [sequence_no], [type]) VALUES (N'N', N'BESTILL GL07: INSERT gl07 parameter i acrparord period         :periodtopacrbatchline ($YYYYMM)', N'S', N'DATABASE INSERT INTO acrparord(orderno,client,report_name,param_id,sequence_no,text_type,data_length,param_name,param_val) SELECT :gl07ordernumber,''$client'',''GL07'',''period'' ,4,''n'' ,6, ''Period'',:periodtopacrbatchline WHERE 1=1', N'ATSEF', 933, N'B')
INSERT [dbo].[aagbatquery] ([commit_flag], [description], [exit_from], [query], [report_name], [sequence_no], [type]) VALUES (N'N', N'BESTILL GL07: INSERT gl07 parameter i acrparord post           ''1''', N'S', N'DATABASE INSERT INTO acrparord(orderno,client,report_name,param_id,sequence_no,text_type,data_length,param_name,param_val) SELECT :gl07ordernumber,''$client'',''GL07'',''post'' ,5,''b'' ,1, ''Post'',''1'' WHERE 1=1', N'ATSEF', 934, N'B')
INSERT [dbo].[aagbatquery] ([commit_flag], [description], [exit_from], [query], [report_name], [sequence_no], [type]) VALUES (N'N', N'BESTILL GL07: INSERT gl07 parameter i acrparord vouch_fla      ''1''', N'S', N'DATABASE INSERT INTO acrparord(orderno,client,report_name,param_id,sequence_no,text_type,data_length,param_name,param_val) SELECT :gl07ordernumber,''$client'',''GL07'',''vouch_flag'' ,6,''b'' ,1, ''TransNo assignment'',''1'' WHERE 1=1', N'ATSEF', 935, N'B')
INSERT [dbo].[aagbatquery] ([commit_flag], [description], [exit_from], [query], [report_name], [sequence_no], [type]) VALUES (N'N', N'BESTILL GL07: INSERT gl07 parameter i acrparord trig_stop      ''0''', N'S', N'DATABASE INSERT INTO acrparord(orderno,client,report_name,param_id,sequence_no,text_type,data_length,param_name,param_val) SELECT :gl07ordernumber,''$client'',''GL07'',''trig_stop'',7,''b'' ,1, ''Trigger stop'',''0'' WHERE 1=1', N'ATSEF', 936, N'B')
INSERT [dbo].[aagbatquery] ([commit_flag], [description], [exit_from], [query], [report_name], [sequence_no], [type]) VALUES (N'N', N'BESTILL GL07: INSERT gl07 parameter i acrparord compute_t      ''0''', N'S', N'DATABASE INSERT INTO acrparord(orderno,client,report_name,param_id,sequence_no,text_type,data_length,param_name,param_val) SELECT :gl07ordernumber,''$client'',''GL07'',''compute_tax'',8,''b'' ,1, ''Compute tax'' ,''0'' WHERE 1=1', N'ATSEF', 937, N'B')
INSERT [dbo].[aagbatquery] ([commit_flag], [description], [exit_from], [query], [report_name], [sequence_no], [type]) VALUES (N'N', N'BESTILL GL07: INSERT gl07 parameter i acrparord format         ''56''', N'S', N'DATABASE INSERT INTO acrparord(orderno,client,report_name,param_id,sequence_no,text_type,data_length,param_name,param_val) SELECT :gl07ordernumber,''$client'',''GL07'',''format'' ,9,''A'' ,6, ''File format'' ,''56'' WHERE 1=1', N'ATSEF', 938, N'B')
INSERT [dbo].[aagbatquery] ([commit_flag], [description], [exit_from], [query], [report_name], [sequence_no], [type]) VALUES (N'N', N'BESTILL GL07: INSERT gl07 parameter i acrparord agg_trans      ''0''', N'S', N'DATABASE INSERT INTO acrparord(orderno,client,report_name,param_id,sequence_no,text_type,data_length,param_name,param_val) SELECT :gl07ordernumber,''$client'',''GL07'',''agg_trans'' ,10,''b'' ,1, ''Compress'',''0'' WHERE 1=1', N'ATSEF', 939, N'B')
INSERT [dbo].[aagbatquery] ([commit_flag], [description], [exit_from], [query], [report_name], [sequence_no], [type]) VALUES (N'N', N'BESTILL GL07: INSERT gl07 parameter i acrparord keep_batc      ''0''', N'S', N'DATABASE INSERT INTO acrparord(orderno,client,report_name,param_id,sequence_no,text_type,data_length,param_name,param_val) SELECT :gl07ordernumber,''$client'',''GL07'',''keep_batch'',11,''b'' ,1, ''Remove file'' ,''0'' WHERE 1=1', N'ATSEF', 940, N'B')
INSERT [dbo].[aagbatquery] ([commit_flag], [description], [exit_from], [query], [report_name], [sequence_no], [type]) VALUES (N'N', N'BESTILL GL07: INSERT gl07 parameter i acrparord agg_apar       ''0''', N'S', N'DATABASE INSERT INTO acrparord(orderno,client,report_name,param_id,sequence_no,text_type,data_length,param_name,param_val) SELECT :gl07ordernumber,''$client'',''GL07'',''agg_apar'',12,''b'' ,1, ''Compress AR/AP in GL'',''0'' WHERE 1=1', N'ATSEF', 941, N'B')
INSERT [dbo].[aagbatquery] ([commit_flag], [description], [exit_from], [query], [report_name], [sequence_no], [type]) VALUES (N'N', N'BESTILL GL07: INSERT gl07 parameter i acrparord max_error      ''0''', N'S', N'DATABASE INSERT INTO acrparord(orderno,client,report_name,param_id,sequence_no,text_type,data_length,param_name,param_val) SELECT :gl07ordernumber,''$client'',''GL07'',''max_errors'',13,''n'' ,6, ''Maximum number of errors'',''0'' WHERE 1=1', N'ATSEF', 942, N'B')
INSERT [dbo].[aagbatquery] ([commit_flag], [description], [exit_from], [query], [report_name], [sequence_no], [type]) VALUES (N'N', N'BESTILL GL07: INSERT gl07 parameter i acrparord err_acc        ''''', N'S', N'DATABASE INSERT INTO acrparord(orderno,client,report_name,param_id,sequence_no,text_type,data_length,param_name,param_val) SELECT :gl07ordernumber,''$client'',''GL07'',''err_acc'' ,14,''A'' ,25,''Feilkonto'' ,'''' WHERE 1=1', N'ATSEF', 943, N'B')
INSERT [dbo].[aagbatquery] ([commit_flag], [description], [exit_from], [query], [report_name], [sequence_no], [type]) VALUES (N'N', N'BESTILL GL07: INSERT gl07 parameter i acrparord trig_chk       ''0''', N'S', N'DATABASE INSERT INTO acrparord(orderno,client,report_name,param_id,sequence_no,text_type,data_length,param_name,param_val) SELECT :gl07ordernumber,''$client'',''GL07'',''trig_chk'',15,''b'' ,1, ''Trigger check'' ,''0'' WHERE 1=1', N'ATSEF', 944, N'B')
INSERT [dbo].[aagbatquery] ([commit_flag], [description], [exit_from], [query], [report_name], [sequence_no], [type]) VALUES (N'N', N'BESTILL GL07: INSERT gl07 parameter i acrparord query          ''''', N'S', N'DATABASE INSERT INTO acrparord(orderno,client,report_name,param_id,sequence_no,text_type,data_length,param_name,param_val) SELECT :gl07ordernumber,''$client'',''GL07'',''query'' ,16,''A'' ,8, ''Query'' ,'''' WHERE 1=1', N'ATSEF', 945, N'B')
INSERT [dbo].[aagbatquery] ([commit_flag], [description], [exit_from], [query], [report_name], [sequence_no], [type]) VALUES (N'N', N'BESTILL GL07: INSERT gl07 parameter i acrparord query_par      ''''', N'S', N'DATABASE INSERT INTO acrparord(orderno,client,report_name,param_id,sequence_no,text_type,data_length,param_name,param_val) SELECT :gl07ordernumber,''$client'',''GL07'',''query_param1'',17,''a'' ,30,''Query Parameter 1'' ,'''' WHERE 1=1', N'ATSEF', 946, N'B')
INSERT [dbo].[aagbatquery] ([commit_flag], [description], [exit_from], [query], [report_name], [sequence_no], [type]) VALUES (N'N', N'BESTILL GL07: INSERT gl07 parameter i acrparord query_par      ''''', N'S', N'DATABASE INSERT INTO acrparord(orderno,client,report_name,param_id,sequence_no,text_type,data_length,param_name,param_val) SELECT :gl07ordernumber,''$client'',''GL07'',''query_param2'',18,''a'' ,30,''Query Parameter 2'' ,'''' WHERE 1=1', N'ATSEF', 947, N'B')
INSERT [dbo].[aagbatquery] ([commit_flag], [description], [exit_from], [query], [report_name], [sequence_no], [type]) VALUES (N'N', N'BESTILL GL07: INSERT gl07 parameter i acrparord query_par      ''''', N'S', N'DATABASE INSERT INTO acrparord(orderno,client,report_name,param_id,sequence_no,text_type,data_length,param_name,param_val) SELECT :gl07ordernumber,''$client'',''GL07'',''query_param3'',19,''a'' ,30,''Query Parameter 3'' ,'''' WHERE 1=1', N'ATSEF', 948, N'B')
INSERT [dbo].[aagbatquery] ([commit_flag], [description], [exit_from], [query], [report_name], [sequence_no], [type]) VALUES (N'N', N'BESTILL GL07: INSERT gl07 parameter i acrparord recalc_v2      ''0''', N'S', N'DATABASE INSERT INTO acrparord(orderno,client,report_name,param_id,sequence_no,text_type,data_length,param_name,param_val) SELECT :gl07ordernumber,''$client'',''GL07'',''recalc_v2'' ,20,''b'' ,1, ''Compute Amount3'' ,''0'' WHERE 1=1', N'ATSEF', 949, N'B')
INSERT [dbo].[aagbatquery] ([commit_flag], [description], [exit_from], [query], [report_name], [sequence_no], [type]) VALUES (N'N', N'BESTILL GL07: INSERT gl07 parameter i acrparord recalc_v3      ''0''', N'S', N'DATABASE INSERT INTO acrparord(orderno,client,report_name,param_id,sequence_no,text_type,data_length,param_name,param_val) SELECT :gl07ordernumber,''$client'',''GL07'',''recalc_v3'' ,21,''b'' ,1, ''Compute Amount4'' ,''0'' WHERE 1=1', N'ATSEF', 950, N'B')
INSERT [dbo].[aagbatquery] ([commit_flag], [description], [exit_from], [query], [report_name], [sequence_no], [type]) VALUES (N'N', N'BESTILL GL07: INSERT gl07 parameter i acrparord recalc_am      ''0''', N'S', N'DATABASE INSERT INTO acrparord(orderno,client,report_name,param_id,sequence_no,text_type,data_length,param_name,param_val) SELECT :gl07ordernumber,''$client'',''GL07'',''recalc_amt'',22,''b'' ,1, ''Compute Amount'',''0'' WHERE 1=1', N'ATSEF', 951, N'B')
INSERT [dbo].[aagbatquery] ([commit_flag], [description], [exit_from], [query], [report_name], [sequence_no], [type]) VALUES (N'N', N'BESTILL GL07: INSERT gl07 parameter i acrparord company        ''*''', N'S', N'DATABASE INSERT INTO acrparord(orderno,client,report_name,param_id,sequence_no,text_type,data_length,param_name,param_val) SELECT :gl07ordernumber,''$client'',''GL07'',''company'' ,23,''W'' ,25,''Company'' ,''*'' WHERE 1=1', N'ATSEF', 952, N'B')
INSERT [dbo].[aagbatquery] ([commit_flag], [description], [exit_from], [query], [report_name], [sequence_no], [type]) VALUES (N'N', N'BESTILL GL07: INSERT gl07 parameter i acrparord only_erro      ''0''', N'S', N'DATABASE INSERT INTO acrparord(orderno,client,report_name,param_id,sequence_no,text_type,data_length,param_name,param_val) SELECT :gl07ordernumber,''$client'',''GL07'',''only_errors'' ,24,''b'' ,1, ''Only errors'' ,''0'' WHERE 1=1', N'ATSEF', 953, N'B')
-----------------------------------
-----------------------------------
-----------------------------------
------------------------


--Fetch menu "counters" for child menu
DECLARE @sequenceno bigint =ISNULL((SELECT ISNULL(MAX(sequence_no),0)+1 FROM ( SELECT ISNULL(MAX(sequence_no),0) as sequence_no FROM asysmenu WHERE module = @module AND parent_menu_id=@parentmenuid UNION SELECT ISNULL(MAX(sequence_no),0) as sequence_no FROM aagmenu WHERE module = @module AND parent_menu_id=@parentmenuid) t ),0)
DECLARE @funcid bigint=ISNULL((SELECT MAX(func_id)+1 FROM ( SELECT MAX(func_id) as func_id FROM asysmenu WHERE module = @module UNION SELECT MAX(func_id) as func_id FROM aagmenu WHERE module = @module) t ),0)
DECLARE @menuid nvarchar(10) = ISNULL((SELECT CONCAT(@module,CAST(@funcid as nvarchar(8)))),'')
DECLARE @functype int = 32
	--Egne menyer, opprette menypunktet.
INSERT INTO aagmenu (description, bespoke, menu_id_ref, bflag, client, cust_param, func_id, parent_menu_id, menu_id, menu_type, module, func_name, func_type , help_id, tree_type, licence_ref, argument, platforms, user_id, variant, sequence_no, icon_type) 
	VALUES ( 'Egenfinansiering ATSEF ag16', 1, '', 0, '*', '', @funcid, @parentmenuid, @menuid, 4, @module, 'ATSEF', @functype, 0, 1, 'ag16', '', 0, '*', 0, @sequenceno, 3);
INSERT INTO aagfunction (argument, assembly, attribute_id,bflag, description,func_name, func_type)
	VALUES('','ag16','',0,'','ATSEF',32)
--Tilgangsstyr bott mappa og menypunktet for atsef.
INSERT INTO aagaccess (bflag, menu_id, role_id, user_id, tree_type, user_stamp,last_update) 
	VALUES (8, @menuid, @grantroleaccess, '', 1, @userid, getdate());

--egne rapporter 
INSERT INTO aagrepdef(description,priority_no,pwd_check,report_name,report_cols,variant,bespoke,func_id,module,user_id,last_update,mail_flag) 
	VALUES ('Egenfinansiering ATSEF ag16',0,0,'ATSEF',132,0,1,@funcid,@module,@userid,getdate(),0);
INSERT INTO aagreppardef(fixed_flag,data_length,param_id,param_def,report_name,sequence_no,text_type,title,variant,func_id,module) 
	VALUES (1,1,'asqlflag','1','ATSEF',1,'b','ASQL',0,@funcid,@module);
INSERT INTO aagreppardef(fixed_flag,data_length,param_id,param_def,report_name,sequence_no,text_type,title,variant,func_id,module) 
	VALUES (1,4,'konto_ls_god','9431','ATSEF',2,'a','Leiestedskonto godskrevet',0,@funcid,@module);
INSERT INTO aagreppardef(fixed_flag,data_length,param_id,param_def,report_name,sequence_no,text_type,title,variant,func_id,module) 
	VALUES (1,4,'konto_ls_bel','9432','ATSEF',3,'a','Leiestedskonto belastet',0,@funcid,@module);
INSERT INTO aagreppardef(fixed_flag,data_length,param_id,param_def,report_name,sequence_no,text_type,title,variant,func_id,module) 
	VALUES (1,4,'konto_ef_god','9421','ATSEF',4,'a','EF konto godskrevet',0,@funcid,@module);
INSERT INTO aagreppardef(fixed_flag,data_length,param_id,param_def,report_name,sequence_no,text_type,title,variant,func_id,module) 
	VALUES (1,4,'konto_ef_bel','9422','ATSEF',5,'a','EF konto belastet',0,@funcid,@module);
INSERT INTO aagreppardef(fixed_flag,data_length,param_id,param_def,report_name,sequence_no,text_type,title,variant,func_id,module) 
	VALUES (0,1,'tmp_save','0','ATSPI',6,'b','Save temp tables dbg',0,@funcid,@module);
	
--Sett inn  fast rapport
DECLARE @jobid bigint = ISNULL( (SELECT counter from aagcounter WHERE module = 'AG' AND column_name = 'JOB_ID' ),0)
UPDATE aagcounter SET counter = @jobid + 1 WHERE module = 'AG' AND column_name = 'JOB_ID' ; 
DELETE FROM aagdistrpar WHERE module= @module	AND func_id	= @funcid AND report_variant= 0 AND job_id	= @jobid;

INSERT INTO acrrepschedule (client,copies,description,func_id,func_type,job_id,	last_update,mail_flag,menu_id,module,output_id,printer,priority_no,real_user,report_cols,report_name,server_queue,sys_setup_code,user_id,variant) 
	VALUES (@envclient,0,'ATSEF - Egenfinansiering BOTT',@funcid,@functype,@jobid,getdate(),0,@menuid,@module,0,'LOKAL-PRINT',1,'SYSTEM',132,'ATSEF','RAPPORT','',@userid,0);
---------------

DECLARE @scheduleid bigint = ISNULL((SELECT counter from aagcounter WHERE module = 'CR' AND column_name = 'SCHEDULE_ID'),0)
UPDATE aagcounter SET counter = @scheduleid + 1 WHERE module = 'CR' AND column_name = 'SCHEDULE_ID' ; 

INSERT INTO acrschedule (end_after ,end_time ,last_update ,sched_type ,schedule_id ,start_time ,user_id )VALUES ( 0,CAST('2099-12-31 00:00:00' AS datetime),CAST('2019-12-12 13:59:35' AS datetime),'agr_daily',@scheduleid, CAST('2019-12-12 00:00:00' AS datetime),@userid);
INSERT INTO acrschedjob (job_id, job_source, next_time, run_overdue_job, schedule_id, status) VALUES ( @jobid, 'RS',CAST('2019-12-12 14:00:00' AS datetime), 0, @scheduleid, 'P');

DELETE FROM acrschedparam WHERE schedule_id = @scheduleid;
INSERT INTO acrschedparam (schedule_id, sequence_no, param_name, param_value) 
	values (@scheduleid, 0, 'every', '1');
INSERT INTO acrschedparam (schedule_id, sequence_no, param_name, param_value) 
	values (@scheduleid, 1, 'start_time', '00:00:00');
INSERT INTO acrschedparam (schedule_id, sequence_no, param_name, param_value) 
	values (@scheduleid, 2, 'end_time', '23:59:00');
INSERT INTO acrschedparam (schedule_id, sequence_no, param_name, param_value) 
	values (@scheduleid, 3, 'interval', '5');
INSERT INTO acrschedparam (schedule_id, sequence_no, param_name, param_value) 
	values (@scheduleid, 4, 'interv_typ', 'minutes');
INSERT INTO acrschedparam (schedule_id, sequence_no, param_name, param_value) 
	values (@scheduleid, 5, 'start_date', '20191212 00:00:00');


--------GL07 variant 2004



DECLARE @variant int = 2004;
DECLARE @userid nvarchar(20) = '8-evla';
DECLARE @variantdescription nvarchar(255) = 'Bokføring egenfinansiering (2004)';

INSERT INTO aagrepdef(description,expire_days,priority_no,pwd_check,report_name,
report_cols,variant,bespoke,func_id,module,mail_flag,printer,output_id,copies,
user_id,last_update,server_queue) VALUES (@variantdescription,0,1,0,N'GL07',  
186,@variant,0,88,N'BI',0,N'DEFAULT',0,1,@userid,getdate(),N'DEFAULT');

INSERT INTO aagrepclients(client,func_id,module,report_name,variant)VALUES 
(N'*',88,N'BI',N'GL07',@variant);

INSERT INTO aagreppardef(fixed_flag,data_length,param_id,param_def,report_name,
sequence_no,text_type,last_update,title,variant,user_id,func_id,module) 
VALUES (0,255,N'file_name',N'',N'GL07',1,N'a',getdate(),N'Filnavn',@variant,
@userid,88,N'BI');

INSERT INTO aagreppardef(fixed_flag,data_length,param_id,param_def,report_name,
sequence_no,text_type,last_update,title,variant,user_id,func_id,module) 
VALUES (0,50,N'interface',N'BI',N'GL07',2,N'a',getdate(),N'Forsystem',@variant,
@userid,88,N'BI');

INSERT INTO aagreppardef(fixed_flag,data_length,param_id,param_def,report_name,
sequence_no,text_type,last_update,title,variant,user_id,func_id,module) 
VALUES (0,25,N'batch_id',N'',N'GL07',3,N'A',getdate(),N'Buntnummer',
@variant,@userid,88,N'BI');

INSERT INTO aagreppardef(fixed_flag,data_length,param_id,param_def,report_name,
sequence_no,text_type,last_update,title,variant,user_id,func_id,module) 
VALUES (0,6,N'period',N'',N'GL07',4,N'n',getdate(),N'Periode',@variant,
@userid,88,N'BI');

INSERT INTO aagreppardef(fixed_flag,data_length,param_id,param_def,report_name,
sequence_no,text_type,last_update,title,variant,user_id,func_id,module) 
VALUES (0,1,N'post',N'1',N'GL07',5,N'b',getdate(),N'Bokfør',@variant,@userid,
88,N'BI');

INSERT INTO aagreppardef(fixed_flag,data_length,param_id,param_def,report_name,
sequence_no,text_type,last_update,title,variant,user_id,func_id,module) 
VALUES (1,1,N'vouch_flag',N'1',N'GL07',6,N'b',getdate(),N'Bilagsnummer tildeles',
@variant,@userid,88,N'BI');

INSERT INTO aagreppardef(fixed_flag,data_length,param_id,param_def,report_name,
sequence_no,text_type,last_update,title,variant,user_id,func_id,module) 
VALUES (1,1,N'trig_stop',N'0',N'GL07',7,N'b',getdate(),N'Triggerstopp',@variant,
@userid,88,N'BI');

INSERT INTO aagreppardef(fixed_flag,data_length,param_id,param_def,report_name,
sequence_no,text_type,last_update,title,variant,user_id,func_id,module) 
VALUES (1,1,N'compute_tax',N'0',N'GL07',8,N'b',getdate(),N'Beregne avgift',
@variant,@userid,88,N'BI');

INSERT INTO aagreppardef(fixed_flag,data_length,param_id,param_def,report_name,
sequence_no,text_type,last_update,title,variant,user_id,func_id,module) 
VALUES (1,6,N'format',N'',N'GL07',9,N'A',getdate(),N'Filformat',@variant,@userid,
88,N'BI');

INSERT INTO aagreppardef(fixed_flag,data_length,param_id,param_def,report_name,
sequence_no,text_type,last_update,title,variant,user_id,func_id,module) 
VALUES (1,1,N'agg_trans',N'0',N'GL07',10,N'b',getdate(),N'Komprimer',@variant,
@userid,88,N'BI');

INSERT INTO aagreppardef(fixed_flag,data_length,param_id,param_def,report_name,
sequence_no,text_type,last_update,title,variant,user_id,func_id,module) 
VALUES (1,1,N'keep_batch',N'0',N'GL07',11,N'b',getdate(),N'Fjern fil',@variant,
@userid,88,N'BI');

INSERT INTO aagreppardef(fixed_flag,data_length,param_id,param_def,report_name,
sequence_no,text_type,last_update,title,variant,user_id,func_id,module) 
VALUES (1,1,N'agg_apar',N'0',N'GL07',12,N'b',getdate(),N'Kompr. reskontro motpost',@variant,@userid,88,N'BI');

INSERT INTO aagreppardef(fixed_flag,data_length,param_id,param_def,report_name,
sequence_no,text_type,last_update,title,variant,user_id,func_id,module) 
VALUES (1,6,N'max_errors',N'0',N'GL07',13,N'n',getdate(),N'Maks antall feil',
@variant,@userid,88,N'BI');

INSERT INTO aagreppardef(fixed_flag,data_length,param_id,param_def,report_name,
sequence_no,text_type,last_update,title,variant,user_id,func_id,module) 
VALUES (1,1,N'trig_chk',N'0',N'GL07',15,N'b',getdate(),N'Triggersjekk',@variant,
@userid,88,N'BI');

INSERT INTO aagreppardef(fixed_flag,data_length,param_id,param_def,report_name,
sequence_no,text_type,last_update,title,variant,user_id,func_id,module) 
VALUES (1,8,N'query',N'',N'GL07',16,N'A',getdate(),N'Query',@variant,@userid,
88,N'BI');

INSERT INTO aagreppardef(fixed_flag,data_length,param_id,param_def,report_name,
sequence_no,text_type,last_update,title,variant,user_id,func_id,module) 
VALUES (1,30,N'query_param1',N'',N'GL07',17,N'a',getdate(),N'Query Parameter 
1',@variant,@userid,88,N'BI');

INSERT INTO aagreppardef(fixed_flag,data_length,param_id,param_def,report_name,
sequence_no,text_type,last_update,title,variant,user_id,func_id,module) 
VALUES (1,30,N'query_param2',N'',N'GL07',18,N'a',getdate(),N'Query Parameter 
2',@variant,@userid,88,N'BI');

INSERT INTO aagreppardef(fixed_flag,data_length,param_id,param_def,report_name,
sequence_no,text_type,last_update,title,variant,user_id,func_id,module) 
VALUES (1,30,N'query_param3',N'',N'GL07',19,N'a',getdate(),N'Query Parameter 
3',@variant,@userid,88,N'BI');

INSERT INTO aagreppardef(fixed_flag,data_length,param_id,param_def,report_name,
sequence_no,text_type,last_update,title,variant,user_id,func_id,module) 
VALUES (1,1,N'recalc_v2',N'0',N'GL07',20,N'b',getdate(),N'Beregn Beløp3',
@variant,@userid,88,N'BI');

INSERT INTO aagreppardef(fixed_flag,data_length,param_id,param_def,report_name,
sequence_no,text_type,last_update,title,variant,user_id,func_id,module) 
VALUES (1,1,N'recalc_v3',N'0',N'GL07',21,N'b',getdate(),N'Beregn Beløp4',
@variant,@userid,88,N'BI');

INSERT INTO aagreppardef(fixed_flag,data_length,param_id,param_def,report_name,
sequence_no,text_type,last_update,title,variant,user_id,func_id,module) 
VALUES (1,1,N'recalc_amt',N'0',N'GL07',22,N'b',getdate(),N'Beregn beløp',
@variant,@userid,88,N'BI');

INSERT INTO aagreppardef(fixed_flag,data_length,param_id,param_def,report_name,
sequence_no,text_type,last_update,title,variant,user_id,func_id,module) 
VALUES (1,25,N'company',N'*',N'GL07',23,N'W',getdate(),N'Firma',@variant,@userid,
88,N'BI');

INSERT INTO aagreppardef(fixed_flag,data_length,param_id,param_def,report_name,
sequence_no,text_type,last_update,title,variant,user_id,func_id,module) 
VALUES (1,1,N'only_errors',N'1',N'GL07',24,N'b',getdate(),N'Kun feil',@variant,
@userid,88,N'BI');

INSERT INTO aagreppardef(fixed_flag,data_length,param_id,param_def,report_name,
sequence_no,text_type,last_update,title,variant,user_id,func_id,module) 
VALUES (1,1,N'start_tps',N'0',N'GL07',25,N'b',getdate(),N'Starte AGRTPS?',
@variant,@userid,88,N'BI');

INSERT INTO aagreppardef(fixed_flag,data_length,param_id,param_def,report_name,
sequence_no,text_type,last_update,title,variant,user_id,func_id,module) 
VALUES (0,1,N'registration',N'0',N'GL07',26,N'b',getdate(),N'Mottaksregistrering',
@variant,@userid,88,N'BI');

INSERT INTO aagreppardef(fixed_flag,data_length,param_id,param_def,report_name,
sequence_no,text_type,last_update,title,variant,user_id,func_id,module) 
VALUES (1,1,N'asqlflag',N'0',N'GL07',27,N'b',getdate(),N'Business World 
SQL',@variant,@userid,88,N'BI');

INSERT INTO aagreppardef(fixed_flag,data_length,param_id,param_def,report_name,
sequence_no,text_type,last_update,title,variant,user_id,func_id,module) 
VALUES (1,12,N'report_file',N'GL07',N'GL07',28,N'A',getdate(),N'Rapportfil',
@variant,@userid,88,N'BI');

INSERT INTO aagreppardef(fixed_flag,data_length,param_id,param_def,report_name,
sequence_no,text_type,last_update,title,variant,user_id,func_id,module) 
VALUES (1,1,N'max_inv_diff',N'0',N'GL07',29,N'b',getdate(),N'Maks.bilagsdiff',
@variant,@userid,88,N'BI');

INSERT INTO aagreppardef(fixed_flag,data_length,param_id,param_def,report_name,
sequence_no,text_type,last_update,title,variant,user_id,func_id,module) 
VALUES (1,1,N'seq_no_flag',N'1',N'GL07',31,N'b',getdate(),N'Sekvensnr-tildeling',
@variant,@userid,88,N'BI');

INSERT INTO aagreppardef(fixed_flag,data_length,param_id,param_def,report_name,
sequence_no,text_type,last_update,title,variant,user_id,func_id,module) 
VALUES (1,1,N'init_ag16',N'0',N'GL07',32,N'b',getdate(),N'Start AG16',@variant,
@userid,88,N'BI');

INSERT INTO aagreppardef(fixed_flag,data_length,param_id,param_def,report_name,
sequence_no,text_type,last_update,title,variant,user_id,func_id,module) 
VALUES (1,1,N'chk_vou_date',N'2',N'GL07',33,N'A',getdate(),N'Kontroller 
bilagsdato',@variant,@userid,88,N'BI');

INSERT INTO aagreppardef(fixed_flag,data_length,param_id,param_def,report_name,
sequence_no,text_type,last_update,title,variant,user_id,func_id,module) 
VALUES (1,12,N'report_file2',N'GL07B',N'GL07',34,N'A',getdate(),N'Varslingsrapport',
@variant,@userid,88,N'BI');

INSERT INTO aagreppardef(fixed_flag,data_length,param_id,param_def,report_name,
sequence_no,text_type,last_update,title,variant,user_id,func_id,module) 
VALUES (1,1,N'mult_vou_dat',N'0',N'GL07',35,N'b',getdate(),N'Tillat flere transaksjons',@variant,@userid,88,N'BI');

INSERT INTO aagreppardef(fixed_flag,data_length,param_id,param_def,report_name,
sequence_no,text_type,last_update,title,variant,user_id,func_id,module) 
VALUES (1,1,N'orphan_tax',N'0',N'GL07',36,N'b',getdate(),N'Tillat frittst. avg.trans',@variant,@userid,88,N'BI');

-----------------------
INSERT INTO aagreppardef(fixed_flag,data_length,param_id,param_def,report_name,
sequence_no,text_type,last_update,title,variant,user_id,func_id,module) 
VALUES (1,6,N'err_acc',N'',N'GL07',101,N'A',getdate(),N'Feilkonto',
@variant,@userid,88,N'BI');
INSERT INTO aagreppardef(fixed_flag,data_length,param_id,param_def,report_name,
sequence_no,text_type,last_update,title,variant,user_id,func_id,module) 
VALUES (1,6,N'debugging',N'1',N'GL07',102,N'A',getdate(),N'Debugging',
@variant,@userid,88,N'BI');
INSERT INTO aagreppardef(fixed_flag,data_length,param_id,param_def,report_name,
sequence_no,text_type,last_update,title,variant,user_id,func_id,module) 
VALUES (1,6,N'tmp_save',N'0',N'GL07',103,N'b',getdate(),N'Lagre tmp tabeller',
@variant,@userid,88,N'BI');
-----------------------


ROLLBACK
COMMIT


-------------------------------------
-------------------------------------
-------------------------------------
--Paste inn triggeren her: Må kjøres separat etter scriptet ovenfor
-------------------------------------
-------------------------------------
-------------------------------------

--USE agrdemoM7
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[dfo_trigger_bott_ef] 
   ON  [dbo].[agltransact] 
   AFTER INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- Insert statements for trigger here
		INSERT INTO dfo_egenfinansiering
		(    [account]
			,[amount]
			,[apar_id]
			,[apar_type]
			,[att_1_id]
			,[att_2_id]
			,[att_3_id]
			,[att_4_id]
			,[att_5_id]
			,[att_6_id]
			,[att_7_id]
			,[client]
			,[cur_amount]
			,[currency]
			,[dc_flag]
			,[description]
			,[dim_1]
			,[dim_2]
			,[dim_3]
			,[dim_4]
			,[dim_5]
			,[dim_6]
			,[dim_7]
			,[ext_arch_ref]
			,[ext_inv_ref]
			,[ext_ref]
			,[number_1]
			,[order_id]
			,[period]
			,[sequence_no]
			,[status]
			,[tax_code]
			,[tax_system]
			,[trans_date]
			,[value_1]
			,[value_2]
			,[value_3]
			,[voucher_date]
			,[voucher_no]
			,[voucher_type]
			,[step]
			,[last_update]
			,[user_id]		)
SELECT a.account
      ,a.amount
      ,a.apar_id
      ,a.apar_type
      ,a.att_1_id
      ,a.att_2_id
      ,a.att_3_id
      ,a.att_4_id
      ,a.att_5_id
      ,a.att_6_id
      ,a.att_7_id
      ,a.client
      ,a.cur_amount
      ,a.currency
      ,a.dc_flag
      ,a.description
      ,a.dim_1
      ,a.dim_2
      ,a.dim_3
      ,a.dim_4
      ,a.dim_5
      ,a.dim_6
      ,a.dim_7
      ,a.ext_arch_ref
      ,a.ext_inv_ref
      ,a.ext_ref
      ,a.number_1
      ,a.order_id
      ,a.period
      ,a.sequence_no
      ,a.status
      ,a.tax_code
      ,a.tax_system
      ,a.trans_date
      ,a.value_1
      ,a.value_2
      ,a.value_3
      ,a.voucher_date
      ,a.voucher_no
      ,a.voucher_type
      ,0
	  ,GETDATE()
	  ,'SYSTEM'
  FROM inserted a
  INNER JOIN aglrelvalue b ON(b.client=a.client AND rel_attr_id='Q30' AND b.attribute_id='A0' AND b.att_value=a.account AND rel_value='JA')
  INNER JOIN aagsysvalues c ON (c.text1=a.client AND c.name='EGENFIN_TRIGGER_CLIENT' AND c.sys_setup_code='NO')

END
GO
-------------------------------------
-------------------------------------
-------------------------------------