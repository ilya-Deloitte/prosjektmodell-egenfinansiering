USE [AgrBOTT_Utv02]
GO
/****** Object:  Trigger [dbo].[dfo_trigger_bott_ef]    Script Date: 19.11.2019 10.58.49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		8-evla
-- Create date: 20.05.2019
-- Description:	Trigging av egenfinansiering
-- =============================================
ALTER TRIGGER [dbo].[dfo_trigger_bott_ef] 
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
SELECT [account]
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
      ,0
	  ,GETDATE()
	  ,'SYSTEM'
  FROM inserted
  WHERE client='BT' AND ( (account LIKE '4%') OR (account LIKE '5%') OR (account LIKE '6%') OR (account LIKE '7%') OR (account LIKE '8%') OR (account IN ('9010', '9020', '9030','9040')))

END