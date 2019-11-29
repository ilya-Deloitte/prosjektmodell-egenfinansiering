-- ================================================
-- Template generated from Template Explorer using:
-- Create Trigger (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- See additional Create Trigger templates for more
-- examples of different Trigger statements.
--
-- This block of comments will not be included in
-- the definition of the function.
-- ================================================
USE [AgrBOTT_Utv02]
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