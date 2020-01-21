BEGIN TRAN

DECLARE @envclient nvarchar(2) = 'NO';--'72'; --;
DECLARE @parentparentmenuid nvarchar(10)='01531';--'0135';--
--Remove account relations Q30
DELETE FROM agldimension WHERE client=@envclient AND attribute_id='Q30'
DELETE FROM agldescription WHERE client=@envclient AND attribute_id='Q30'
DELETE FROM agldimvalue WHERE client=@envclient AND attribute_id='Q30'
DELETE FROM aglrelation WHERE client=@envclient AND attribute_id='A0' AND rel_attr_id='Q30'
DELETE FROM aglrelvalue WHERE client=@envclient AND attribute_id='A0' AND rel_attr_id='Q30'

--Remove Voucher type P1 for egenfinansiering
DELETE FROM acrvouchtype WHERE client=@envclient AND  voucher_type='P1'
DELETE FROM agldescription WHERE client=@envclient AND attribute_id='AX' AND dim_value='P1'
DELETE FROM agldimvalue WHERE client=@envclient AND attribute_id='AX' AND dim_value='P1'

--Drop table dfo_egenfinansiering
DROP TABLE dfo_egenfinansiering

--Delete client constraint in "oppsett verdier"
DELETE FROM aagsysvalues WHERE name='EGENFIN_TRIGGER_CLIENT'

--Drop trigger 
DROP TRIGGER dfo_trigger_bott_ef --ON agltransact

--Delete from aagbatquery
DELETE FROM aagbatquery WHERE report_name='ATSEF'

--Delete menu items without header folder specified in the top
DECLARE @menuid nvarchar(10) 
SET @menuid=(SELECT menu_id FROM aagmenu WHERE client=@envclient AND description='Egenfinansiering ATSEF ag16') -- legge på teller?
DECLARE @parentmenuid nvarchar(10)
SET @parentmenuid=(SELECT menu_id FROM aagmenu WHERE client=@envclient AND description='BOTT')
--Delete menu access
DELETE FROM aagaccess WHERE menu_id=@menuid 
DELETE FROM aagaccess WHERE menu_id=@parentmenuid 
--Delete menu items
DELETE FROM aagmenu WHERE client=@envclient AND menu_id=@menuid
DELETE FROM aagmenu WHERE client=@envclient AND  menu_id=@parentmenuid

--DELETE user defined report and parameters 
DELETE FROM aagrepdef WHERE report_name='ATSEF'
DELETE FROM aagreppardef WHERE report_name='ATSEF'

--Delete scheduled report
DECLARE @jobid bigint = (SELECT TOP 1 job_id FROM acrrepschedule WHERE report_name='ATSEF')
DELETE FROM  acrschedule  WHERE schedule_id IN (SELECT  schedule_id FROM acrschedjob WHERE job_id=@jobid)
DELETE FROM acrschedjob WHERE schedule_id IN (SELECT schedule_id FROM acrschedjob WHERE job_id=@jobid)
DELETE FROM acrschedparam WHERE schedule_id IN (SELECT schedule_id FROM acrschedjob WHERE job_id=@jobid)
DELETE FROM  acrrepschedule  WHERE client=@envclient AND report_name='ATSEF'

ROLLBACK
COMMIT
