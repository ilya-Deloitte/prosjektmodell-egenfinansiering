BEGIN TRAN
--Prosjekter
INSERT INTO atsproject (work_order_flag, period_from, customer_id, invoice_code, expired_date, STATUS, client, inv_status, unit_id, activity_flag, resource_id, description, confirm_type, inv_attr_id, stop_entry_date, user_id, date_from, control_yn, last_update, department, created_date, wbs_flag, dim4, confirm_flag, date_to, wbs, dim3, ext_ord_txt, project, message_text, inv_flag, dim2, bflag, period_to, dim1, reference_1, acc_code, org_date_to, currency, cur_type, head_project) VALUES(1,201901,'17931', 'FP', CONVERT(DATETIME, '19000101', 112),'N','BT', 'N','B1',0,'99999','EF-test: Bidrag - NFR', 'N', 'BG', CONVERT(DATETIME, '19000101', 112), '8-evla',CONVERT(DATETIME,'20190101', 112),0, getdate(),'13601010',getdate(),0, '',0,CONVERT(DATETIME,'20291201', 112), '', '', '','110003', '',1, '',0,202912, '', '',1, CONVERT(DATETIME, '19000101', 112), 'NOK', '1','110003')
INSERT INTO agldimvalue (attribute_id,client,description,dim_value,period_from,period_to,rel_value,STATUS,value_1,user_id,last_update) VALUES( 'B0','BT','EF-test: Bidrag - NFR','110003',201901,202901, '', 'N',0, '8-evla', getdate())
INSERT INTO agldescription (client, attribute_id, dim_value, description, LANGUAGE) VALUES('BT', 'B0','110003','EF-test: Bidrag - NFR', 'NO')
INSERT INTO aglrelvalue (att_val_from,att_val_to,att_value,date_from,date_to,percentage,value_1,attribute_id,client,last_update,rel_attr_id,rel_value,user_id) VALUES('110003','110003','110003', CONVERT(DATETIME, '19000101', 112), CONVERT(DATETIME, '20991231', 112),100,0, 'B0','BT', getdate(), 'B0','110003', '8-evla')
INSERT INTO aglrelvalue (att_val_from,att_val_to,att_value,date_from,date_to,percentage,value_1,attribute_id,client,last_update,rel_attr_id,rel_value,user_id) VALUES('110003','110003','110003', CONVERT(DATETIME, '19000101', 112), CONVERT(DATETIME, '20991231', 112),100,0, 'B0','BT', getdate(), 'B4','B1', '8-evla')
INSERT INTO aglrelvalue (att_val_from,att_val_to,att_value,date_from,date_to,percentage,value_1,attribute_id,client,last_update,rel_attr_id,rel_value,user_id) VALUES('110003','110003','110003', CONVERT(DATETIME, '19000101', 112), CONVERT(DATETIME, '20991231', 112),100,0, 'B0','BT', getdate(), 'C1','13601010', '8-evla')
INSERT INTO aglrelvalue (att_val_from,att_val_to,att_value,date_from,date_to,percentage,value_1,attribute_id,client,last_update,rel_attr_id,rel_value,user_id) VALUES('110003','110003','110003', CONVERT(DATETIME, '19000101', 112), CONVERT(DATETIME, '20991231', 112),100,0, 'B0','BT', getdate(), 'C0','99999', '8-evla')
INSERT INTO aglrelvalue (att_val_from,att_val_to,att_value,date_from,date_to,percentage,value_1,attribute_id,client,last_update,rel_attr_id,rel_value,user_id) VALUES('110003','110003','110003', CONVERT(DATETIME, '19000101', 112), CONVERT(DATETIME, '20991231', 112),100,0, 'B0','BT', getdate(), 'A4','17931', '8-evla')
INSERT INTO aglrelvalue (att_val_from,att_val_to,att_value,date_from,date_to,percentage,value_1,attribute_id,client,last_update,rel_attr_id,rel_value,user_id) VALUES('110003','110003','110003', CONVERT(DATETIME, '19000101', 112), CONVERT(DATETIME, '20991231', 112),100,0, 'B0','BT', getdate(), 'S11', 'IA', '8-evla')
INSERT INTO aglrelvalue (att_val_from,att_val_to,att_value,date_from,date_to,percentage,value_1,attribute_id,client,last_update,rel_attr_id,rel_value,user_id) VALUES('110003','110003','110003', CONVERT(DATETIME, '19000101', 112), CONVERT(DATETIME, '20991231', 112),100,0, 'B0','BT', getdate(), 'S12', 'IA', '8-evla')
INSERT INTO aglrelvalue (att_val_from,att_val_to,att_value,date_from,date_to,percentage,value_1,attribute_id,client,last_update,rel_attr_id,rel_value,user_id) VALUES('110003','110003','110003', CONVERT(DATETIME, '19000101', 112), CONVERT(DATETIME, '20991231', 112),100,0, 'B0','BT', getdate(), 'S13', 'IA', '8-evla')
INSERT INTO afxprostyring (attribute_id,dim_value,line_no, client,date_from,date_to,principle_fx,last_update,user_id) VALUES( 'B0','110003',0,'BT',CAST('1900-01-01 00:00:00.000' AS DateTime),CAST('1900-01-01 00:00:00.000' AS DateTime),'0',getdate(), '8-evla')
INSERT INTO afxproadmin (attribute_id,dim_value,line_no,client,date_from,date_to,pro_role_fx,resource_id_fx,responsible_fx,last_update,user_id) VALUES( 'B0','110003', '0','BT',CAST('1900-01-01 00:00:00.000' AS DateTime),CAST('1900-01-01 00:00:00.000' AS DateTime), 'PROOK','99999',1,getdate(), '8-evla')
INSERT INTO atsinvinfo (attribute_id, client,dim_value,invoice_type,last_update,long_info1,long_info2,tax_code,tax_system,terms_id,user_id,work_order_flag) VALUES( 'B0'  ,'BT','110003', 'F',getdate(), '', '', '', '',30, '8-evla',0)
INSERT INTO atsproject (work_order_flag, period_from, customer_id, invoice_code, expired_date, STATUS, client, inv_status, unit_id, activity_flag, resource_id, description, confirm_type, inv_attr_id, stop_entry_date, user_id, date_from, control_yn, last_update, department, created_date, wbs_flag, dim4, confirm_flag, date_to, wbs, dim3, ext_ord_txt, project, message_text, inv_flag, dim2, bflag, period_to, dim1, reference_1, acc_code, org_date_to, currency, cur_type, head_project) VALUES(1,201901,'80013', 'FP', CONVERT(DATETIME, '19000101', 112),'N','BT', 'N','O1',0,'99999','EF-test: Oppdrag', 'N', 'BG', CONVERT(DATETIME, '19000101', 112), '8-evla',CONVERT(DATETIME,'20190101', 112),0, getdate(),'12600000',getdate(),0, '',0,CONVERT(DATETIME,'20291201', 112), '', '', '','110011', '',1, '',0,202912, '', '',1, CONVERT(DATETIME, '19000101', 112), 'NOK', '1','110011')
INSERT INTO agldimvalue (attribute_id,client,description,dim_value,period_from,period_to,rel_value,STATUS,value_1,user_id,last_update) VALUES( 'B0','BT','EF-test: Oppdrag','110011',201901,202901, '', 'N',0, '8-evla', getdate())
INSERT INTO agldescription (client, attribute_id, dim_value, description, LANGUAGE) VALUES('BT', 'B0','110011','EF-test: Oppdrag', 'NO')
INSERT INTO aglrelvalue (att_val_from,att_val_to,att_value,date_from,date_to,percentage,value_1,attribute_id,client,last_update,rel_attr_id,rel_value,user_id) VALUES('110011','110011','110011', CONVERT(DATETIME, '19000101', 112), CONVERT(DATETIME, '20991231', 112),100,0, 'B0','BT', getdate(), 'B0','110011', '8-evla')
INSERT INTO aglrelvalue (att_val_from,att_val_to,att_value,date_from,date_to,percentage,value_1,attribute_id,client,last_update,rel_attr_id,rel_value,user_id) VALUES('110011','110011','110011', CONVERT(DATETIME, '19000101', 112), CONVERT(DATETIME, '20991231', 112),100,0, 'B0','BT', getdate(), 'B4','O1', '8-evla')
INSERT INTO aglrelvalue (att_val_from,att_val_to,att_value,date_from,date_to,percentage,value_1,attribute_id,client,last_update,rel_attr_id,rel_value,user_id) VALUES('110011','110011','110011', CONVERT(DATETIME, '19000101', 112), CONVERT(DATETIME, '20991231', 112),100,0, 'B0','BT', getdate(), 'C1','12600000', '8-evla')
INSERT INTO aglrelvalue (att_val_from,att_val_to,att_value,date_from,date_to,percentage,value_1,attribute_id,client,last_update,rel_attr_id,rel_value,user_id) VALUES('110011','110011','110011', CONVERT(DATETIME, '19000101', 112), CONVERT(DATETIME, '20991231', 112),100,0, 'B0','BT', getdate(), 'C0','99999', '8-evla')
INSERT INTO aglrelvalue (att_val_from,att_val_to,att_value,date_from,date_to,percentage,value_1,attribute_id,client,last_update,rel_attr_id,rel_value,user_id) VALUES('110011','110011','110011', CONVERT(DATETIME, '19000101', 112), CONVERT(DATETIME, '20991231', 112),100,0, 'B0','BT', getdate(), 'A4','80013', '8-evla')
INSERT INTO aglrelvalue (att_val_from,att_val_to,att_value,date_from,date_to,percentage,value_1,attribute_id,client,last_update,rel_attr_id,rel_value,user_id) VALUES('110011','110011','110011', CONVERT(DATETIME, '19000101', 112), CONVERT(DATETIME, '20991231', 112),100,0, 'B0','BT', getdate(), 'S11', 'IA', '8-evla')
INSERT INTO aglrelvalue (att_val_from,att_val_to,att_value,date_from,date_to,percentage,value_1,attribute_id,client,last_update,rel_attr_id,rel_value,user_id) VALUES('110011','110011','110011', CONVERT(DATETIME, '19000101', 112), CONVERT(DATETIME, '20991231', 112),100,0, 'B0','BT', getdate(), 'S12', 'IA', '8-evla')
INSERT INTO aglrelvalue (att_val_from,att_val_to,att_value,date_from,date_to,percentage,value_1,attribute_id,client,last_update,rel_attr_id,rel_value,user_id) VALUES('110011','110011','110011', CONVERT(DATETIME, '19000101', 112), CONVERT(DATETIME, '20991231', 112),100,0, 'B0','BT', getdate(), 'S13', 'IA', '8-evla')
INSERT INTO afxprostyring (attribute_id,dim_value,line_no, client,date_from,date_to,principle_fx,last_update,user_id) VALUES( 'B0','110011',0,'BT',CAST('1900-01-01 00:00:00.000' AS DateTime),CAST('1900-01-01 00:00:00.000' AS DateTime),'0',getdate(), '8-evla')
INSERT INTO afxproadmin (attribute_id,dim_value,line_no,client,date_from,date_to,pro_role_fx,resource_id_fx,responsible_fx,last_update,user_id) VALUES( 'B0','110011', '0','BT',CAST('1900-01-01 00:00:00.000' AS DateTime),CAST('1900-01-01 00:00:00.000' AS DateTime), 'PROOK','99999',1,getdate(), '8-evla')
INSERT INTO atsinvinfo (attribute_id, client,dim_value,invoice_type,last_update,long_info1,long_info2,tax_code,tax_system,terms_id,user_id,work_order_flag) VALUES( 'B0'  ,'BT','110011', 'F',getdate(), '', '', '', '',30, '8-evla',0)
INSERT INTO atsproject (work_order_flag, period_from, customer_id, invoice_code, expired_date, STATUS, client, inv_status, unit_id, activity_flag, resource_id, description, confirm_type, inv_attr_id, stop_entry_date, user_id, date_from, control_yn, last_update, department, created_date, wbs_flag, dim4, confirm_flag, date_to, wbs, dim3, ext_ord_txt, project, message_text, inv_flag, dim2, bflag, period_to, dim1, reference_1, acc_code, org_date_to, currency, cur_type, head_project) VALUES(1,201901,'', '', CONVERT(DATETIME, '19000101', 112),'N','BT', 'T','I1',0,'99999','EF-test: Internt - Eiendom', 'N', '', CONVERT(DATETIME, '19000101', 112), '8-evla',CONVERT(DATETIME,'20190101', 112),0, getdate(),'20100000',getdate(),0, '',0,CONVERT(DATETIME,'20291201', 112), '', '', '','120002', '',0, '',0,202912, '', '',1, CONVERT(DATETIME, '19000101', 112), 'NOK', '1','120002')
INSERT INTO agldimvalue (attribute_id,client,description,dim_value,period_from,period_to,rel_value,STATUS,value_1,user_id,last_update) VALUES( 'B0','BT','EF-test: Internt - Eiendom','120002',201901,202901, '', 'N',0, '8-evla', getdate())
INSERT INTO agldescription (client, attribute_id, dim_value, description, LANGUAGE) VALUES('BT', 'B0','120002','EF-test: Internt - Eiendom', 'NO')
INSERT INTO aglrelvalue (att_val_from,att_val_to,att_value,date_from,date_to,percentage,value_1,attribute_id,client,last_update,rel_attr_id,rel_value,user_id) VALUES('120002','120002','120002', CONVERT(DATETIME, '19000101', 112), CONVERT(DATETIME, '20991231', 112),100,0, 'B0','BT', getdate(), 'B0','120002', '8-evla')
INSERT INTO aglrelvalue (att_val_from,att_val_to,att_value,date_from,date_to,percentage,value_1,attribute_id,client,last_update,rel_attr_id,rel_value,user_id) VALUES('120002','120002','120002', CONVERT(DATETIME, '19000101', 112), CONVERT(DATETIME, '20991231', 112),100,0, 'B0','BT', getdate(), 'B4','I1', '8-evla')
INSERT INTO aglrelvalue (att_val_from,att_val_to,att_value,date_from,date_to,percentage,value_1,attribute_id,client,last_update,rel_attr_id,rel_value,user_id) VALUES('120002','120002','120002', CONVERT(DATETIME, '19000101', 112), CONVERT(DATETIME, '20991231', 112),100,0, 'B0','BT', getdate(), 'C1','20100000', '8-evla')
INSERT INTO aglrelvalue (att_val_from,att_val_to,att_value,date_from,date_to,percentage,value_1,attribute_id,client,last_update,rel_attr_id,rel_value,user_id) VALUES('120002','120002','120002', CONVERT(DATETIME, '19000101', 112), CONVERT(DATETIME, '20991231', 112),100,0, 'B0','BT', getdate(), 'C0','99999', '8-evla')
INSERT INTO aglrelvalue (att_val_from,att_val_to,att_value,date_from,date_to,percentage,value_1,attribute_id,client,last_update,rel_attr_id,rel_value,user_id) VALUES('120002','120002','120002', CONVERT(DATETIME, '19000101', 112), CONVERT(DATETIME, '20991231', 112),100,0, 'B0','BT', getdate(), 'A4','', '8-evla')
INSERT INTO aglrelvalue (att_val_from,att_val_to,att_value,date_from,date_to,percentage,value_1,attribute_id,client,last_update,rel_attr_id,rel_value,user_id) VALUES('120002','120002','120002', CONVERT(DATETIME, '19000101', 112), CONVERT(DATETIME, '20991231', 112),100,0, 'B0','BT', getdate(), 'S11', 'IA', '8-evla')
INSERT INTO aglrelvalue (att_val_from,att_val_to,att_value,date_from,date_to,percentage,value_1,attribute_id,client,last_update,rel_attr_id,rel_value,user_id) VALUES('120002','120002','120002', CONVERT(DATETIME, '19000101', 112), CONVERT(DATETIME, '20991231', 112),100,0, 'B0','BT', getdate(), 'S12', 'IA', '8-evla')
INSERT INTO aglrelvalue (att_val_from,att_val_to,att_value,date_from,date_to,percentage,value_1,attribute_id,client,last_update,rel_attr_id,rel_value,user_id) VALUES('120002','120002','120002', CONVERT(DATETIME, '19000101', 112), CONVERT(DATETIME, '20991231', 112),100,0, 'B0','BT', getdate(), 'S13', 'IA', '8-evla')
INSERT INTO afxprostyring (attribute_id,dim_value,line_no, client,date_from,date_to,principle_fx,last_update,user_id) VALUES( 'B0','120002',0,'BT',CAST('1900-01-01 00:00:00.000' AS DateTime),CAST('1900-01-01 00:00:00.000' AS DateTime),'0',getdate(), '8-evla')
INSERT INTO afxproadmin (attribute_id,dim_value,line_no,client,date_from,date_to,pro_role_fx,resource_id_fx,responsible_fx,last_update,user_id) VALUES( 'B0','120002', '0','BT',CAST('1900-01-01 00:00:00.000' AS DateTime),CAST('1900-01-01 00:00:00.000' AS DateTime), 'PROOK','99999',1,getdate(), '8-evla')
INSERT INTO atsinvinfo (attribute_id, client,dim_value,invoice_type,last_update,long_info1,long_info2,tax_code,tax_system,terms_id,user_id,work_order_flag) VALUES( 'B0'  ,'BT','120002', 'F',getdate(), '', '', '', '',30, '8-evla',0)


--Aktiviteter

--Delprosjekter
INSERT INTO atsworkorder (period_from,customer_id,invoice_code,STATUS,client,inv_status,resource_id,description,inv_attr_id,stop_entry_date,user_id,date_from,last_update,department,work_order,dim4,dim3,date_to,ext_ord_txt,project,inv_flag,dim2,dim1,period_to,reference_1,currency) VALUES(201901,'17931', 'FP','N','BT', 'N','99999','EF-test: Bidrag 1 NFR', 'BG',CONVERT(DATETIME, '19000101', 112), '8-evla',CONVERT(DATETIME,'20190101', 112),getdate(),'13601010','110003100', 'IA', 'IA',CONVERT(DATETIME,'20290101', 112), '','110003',1, 'IA','NFR',202901, '', 'NOK')
INSERT INTO agldimvalue (attribute_id,client,description,dim_value,period_from,period_to,rel_value,STATUS,value_1,user_id,last_update) VALUES( 'BF','BT','EF-test: Bidrag 1 NFR','110003100',201901,202901, '110003', 'N',0, '8-evla', getdate())
INSERT INTO agldescription (client, attribute_id, dim_value, description, LANGUAGE) VALUES('BT', 'BF','110003100','EF-test: Bidrag 1 NFR', 'NO')
INSERT INTO aglrelvalue (att_val_from,att_val_to,att_value,date_from,date_to,percentage,value_1,attribute_id,client,last_update,rel_attr_id,rel_value,user_id) VALUES('110003100','110003100','110003100', CONVERT(DATETIME, '19000101', 112), CONVERT(DATETIME, '20991231', 112),100,0, 'BF','BT', getdate(), 'C0','99999', '8-evla')
INSERT INTO aglrelvalue (att_val_from,att_val_to,att_value,date_from,date_to,percentage,value_1,attribute_id,client,last_update,rel_attr_id,rel_value,user_id) VALUES('110003100','110003100','110003100', CONVERT(DATETIME, '19000101', 112), CONVERT(DATETIME, '20991231', 112),100,0, 'BF','BT', getdate(), 'C1','13601010', '8-evla')
INSERT INTO aglrelvalue (att_val_from,att_val_to,att_value,date_from,date_to,percentage,value_1,attribute_id,client,last_update,rel_attr_id,rel_value,user_id) VALUES('110003100','110003100','110003100', CONVERT(DATETIME, '19000101', 112), CONVERT(DATETIME, '20991231', 112),100,0, 'BF','BT', getdate(), 'B0','110003', '8-evla')
INSERT INTO aglrelvalue (att_val_from,att_val_to,att_value,date_from,date_to,percentage,value_1,attribute_id,client,last_update,rel_attr_id,rel_value,user_id) VALUES('110003100','110003100','110003100', CONVERT(DATETIME, '19000101', 112), CONVERT(DATETIME, '20991231', 112),100,0, 'BF','BT', getdate(), 'V21','NFR', '8-evla')
INSERT INTO aglrelvalue (att_val_from,att_val_to,att_value,date_from,date_to,percentage,value_1,attribute_id,client,last_update,rel_attr_id,rel_value,user_id) VALUES('110003100','110003100','110003100', CONVERT(DATETIME, '19000101', 112), CONVERT(DATETIME, '20991231', 112),100,0, 'BF','BT', getdate(), 'A4','17931', '8-evla')
INSERT INTO aglrelvalue (att_val_from,att_val_to,att_value,date_from,date_to,percentage,value_1,attribute_id,client,last_update,rel_attr_id,rel_value,user_id) VALUES('110003100','110003100','110003100', CONVERT(DATETIME, '19000101', 112), CONVERT(DATETIME, '20991231', 112),100,0, 'BF','BT', getdate(), 'V22', 'IA', '8-evla')
INSERT INTO aglrelvalue (att_val_from,att_val_to,att_value,date_from,date_to,percentage,value_1,attribute_id,client,last_update,rel_attr_id,rel_value,user_id) VALUES('110003100','110003100','110003100', CONVERT(DATETIME, '19000101', 112), CONVERT(DATETIME, '20991231', 112),100,0, 'BF','BT', getdate(), 'V23', 'IA', '8-evla')
INSERT INTO aglrelvalue (att_val_from,att_val_to,att_value,date_from,date_to,percentage,value_1,attribute_id,client,last_update,rel_attr_id,rel_value,user_id) VALUES('110003100','110003100','110003100', CONVERT(DATETIME, '19000101', 112), CONVERT(DATETIME, '20991231', 112),100,0, 'BF','BT', getdate(), 'V24', 'IA', '8-evla')
INSERT INTO aglrelvalue (att_val_from,att_val_to,att_value,date_from,date_to,percentage,value_1,attribute_id,client,last_update,rel_attr_id,rel_value,user_id) VALUES('110003100','110003100','110003100', CONVERT(DATETIME, '19000101', 112), CONVERT(DATETIME, '20991231', 112),100,0, 'BF','BT', getdate(), 'V25', 'IA', '8-evla')
INSERT INTO afxaofin (attribute_id,dim_value,line_no,client,date_from,date_to,amount_fx,last_update,user_id) VALUES( 'BF'  ,'110003100',0,'BT',CAST('1900-01-01 00:00:00.000' AS DateTime),CAST('1900-01-01 00:00:00.000' AS DateTime),2000000,getdate(), '8-evla'                  )
INSERT INTO afxaoegenfin (attribute_id,dim_value,line_no,client,date_from,date_to,own_funding_fx,last_update,user_id) VALUES( 'BF'  ,'110003100',0,'BT',CAST('1900-01-01 00:00:00.000' AS DateTime),CAST('1900-01-01 00:00:00.000' AS DateTime),0,getdate(), '8-evla'                  )
INSERT INTO afxaoindirekte (attribute_id,dim_value,line_no,client,date_from,date_to,indirect_cost_fx,last_update,user_id) VALUES( 'BF'  ,'110003100',0,'BT',CAST('1900-01-01 00:00:00.000' AS DateTime),CAST('1900-01-01 00:00:00.000' AS DateTime),0,getdate(), '8-evla'                  )
INSERT INTO atsinvinfo (attribute_id, client,dim_value,invoice_type,last_update,long_info1,long_info2,tax_code,tax_system,terms_id,user_id,work_order_flag) VALUES( 'BF'  ,'BT','110003100', 'F',getdate(), '', '', '', '',30, '8-evla',0)
INSERT INTO atsworkorder (period_from,customer_id,invoice_code,STATUS,client,inv_status,resource_id,description,inv_attr_id,stop_entry_date,user_id,date_from,last_update,department,work_order,dim4,dim3,date_to,ext_ord_txt,project,inv_flag,dim2,dim1,period_to,reference_1,currency) VALUES(201901,'', '','N','BT', 'T','99999','EF-test: Bidrag 1 Egenfinansiering', '',CONVERT(DATETIME, '19000101', 112), '8-evla',CONVERT(DATETIME,'20190101', 112),getdate(),'13601010','110003101', 'IA', 'IA',CONVERT(DATETIME,'20290101', 112), '','110003',0, 'IA','EGEN',202901, '', 'NOK')
INSERT INTO agldimvalue (attribute_id,client,description,dim_value,period_from,period_to,rel_value,STATUS,value_1,user_id,last_update) VALUES( 'BF','BT','EF-test: Bidrag 1 Egenfinansiering','110003101',201901,202901, '110003', 'N',0, '8-evla', getdate())
INSERT INTO agldescription (client, attribute_id, dim_value, description, LANGUAGE) VALUES('BT', 'BF','110003101','EF-test: Bidrag 1 Egenfinansiering', 'NO')
INSERT INTO aglrelvalue (att_val_from,att_val_to,att_value,date_from,date_to,percentage,value_1,attribute_id,client,last_update,rel_attr_id,rel_value,user_id) VALUES('110003101','110003101','110003101', CONVERT(DATETIME, '19000101', 112), CONVERT(DATETIME, '20991231', 112),100,0, 'BF','BT', getdate(), 'C0','99999', '8-evla')
INSERT INTO aglrelvalue (att_val_from,att_val_to,att_value,date_from,date_to,percentage,value_1,attribute_id,client,last_update,rel_attr_id,rel_value,user_id) VALUES('110003101','110003101','110003101', CONVERT(DATETIME, '19000101', 112), CONVERT(DATETIME, '20991231', 112),100,0, 'BF','BT', getdate(), 'C1','13601010', '8-evla')
INSERT INTO aglrelvalue (att_val_from,att_val_to,att_value,date_from,date_to,percentage,value_1,attribute_id,client,last_update,rel_attr_id,rel_value,user_id) VALUES('110003101','110003101','110003101', CONVERT(DATETIME, '19000101', 112), CONVERT(DATETIME, '20991231', 112),100,0, 'BF','BT', getdate(), 'B0','110003', '8-evla')
INSERT INTO aglrelvalue (att_val_from,att_val_to,att_value,date_from,date_to,percentage,value_1,attribute_id,client,last_update,rel_attr_id,rel_value,user_id) VALUES('110003101','110003101','110003101', CONVERT(DATETIME, '19000101', 112), CONVERT(DATETIME, '20991231', 112),100,0, 'BF','BT', getdate(), 'V21','EGEN', '8-evla')
INSERT INTO aglrelvalue (att_val_from,att_val_to,att_value,date_from,date_to,percentage,value_1,attribute_id,client,last_update,rel_attr_id,rel_value,user_id) VALUES('110003101','110003101','110003101', CONVERT(DATETIME, '19000101', 112), CONVERT(DATETIME, '20991231', 112),100,0, 'BF','BT', getdate(), 'A4','', '8-evla')
INSERT INTO aglrelvalue (att_val_from,att_val_to,att_value,date_from,date_to,percentage,value_1,attribute_id,client,last_update,rel_attr_id,rel_value,user_id) VALUES('110003101','110003101','110003101', CONVERT(DATETIME, '19000101', 112), CONVERT(DATETIME, '20991231', 112),100,0, 'BF','BT', getdate(), 'V22', 'IA', '8-evla')
INSERT INTO aglrelvalue (att_val_from,att_val_to,att_value,date_from,date_to,percentage,value_1,attribute_id,client,last_update,rel_attr_id,rel_value,user_id) VALUES('110003101','110003101','110003101', CONVERT(DATETIME, '19000101', 112), CONVERT(DATETIME, '20991231', 112),100,0, 'BF','BT', getdate(), 'V23', 'IA', '8-evla')
INSERT INTO aglrelvalue (att_val_from,att_val_to,att_value,date_from,date_to,percentage,value_1,attribute_id,client,last_update,rel_attr_id,rel_value,user_id) VALUES('110003101','110003101','110003101', CONVERT(DATETIME, '19000101', 112), CONVERT(DATETIME, '20991231', 112),100,0, 'BF','BT', getdate(), 'V24', 'IA', '8-evla')
INSERT INTO aglrelvalue (att_val_from,att_val_to,att_value,date_from,date_to,percentage,value_1,attribute_id,client,last_update,rel_attr_id,rel_value,user_id) VALUES('110003101','110003101','110003101', CONVERT(DATETIME, '19000101', 112), CONVERT(DATETIME, '20991231', 112),100,0, 'BF','BT', getdate(), 'V25', 'IA', '8-evla')
INSERT INTO afxaofin (attribute_id,dim_value,line_no,client,date_from,date_to,amount_fx,last_update,user_id) VALUES( 'BF'  ,'110003101',0,'BT',CAST('1900-01-01 00:00:00.000' AS DateTime),CAST('1900-01-01 00:00:00.000' AS DateTime),500000,getdate(), '8-evla'                  )
INSERT INTO afxaoegenfin (attribute_id,dim_value,line_no,client,date_from,date_to,own_funding_fx,last_update,user_id) VALUES( 'BF'  ,'110003101',0,'BT',CAST('1900-01-01 00:00:00.000' AS DateTime),CAST('1900-01-01 00:00:00.000' AS DateTime),100,getdate(), '8-evla'                  )
INSERT INTO afxaoindirekte (attribute_id,dim_value,line_no,client,date_from,date_to,indirect_cost_fx,last_update,user_id) VALUES( 'BF'  ,'110003101',0,'BT',CAST('1900-01-01 00:00:00.000' AS DateTime),CAST('1900-01-01 00:00:00.000' AS DateTime),0,getdate(), '8-evla'                  )
INSERT INTO atsinvinfo (attribute_id, client,dim_value,invoice_type,last_update,long_info1,long_info2,tax_code,tax_system,terms_id,user_id,work_order_flag) VALUES( 'BF'  ,'BT','110003101', 'F',getdate(), '', '', '', '',30, '8-evla',0)
INSERT INTO atsworkorder (period_from,customer_id,invoice_code,STATUS,client,inv_status,resource_id,description,inv_attr_id,stop_entry_date,user_id,date_from,last_update,department,work_order,dim4,dim3,date_to,ext_ord_txt,project,inv_flag,dim2,dim1,period_to,reference_1,currency) VALUES(201901,'18581', 'FP','N','BT', 'N','99999','EF-test: Oppdrag 1 Equinor', 'BG',CONVERT(DATETIME, '19000101', 112), '8-evla',CONVERT(DATETIME,'20190101', 112),getdate(),'12600000','110011100', 'IA', 'IA',CONVERT(DATETIME,'20290101', 112), '','110011',1, 'IA','NOG',202901, '', 'NOK')
INSERT INTO agldimvalue (attribute_id,client,description,dim_value,period_from,period_to,rel_value,STATUS,value_1,user_id,last_update) VALUES( 'BF','BT','EF-test: Oppdrag 1 Equinor','110011100',201901,202901, '110011', 'N',0, '8-evla', getdate())
INSERT INTO agldescription (client, attribute_id, dim_value, description, LANGUAGE) VALUES('BT', 'BF','110011100','EF-test: Oppdrag 1 Equinor', 'NO')
INSERT INTO aglrelvalue (att_val_from,att_val_to,att_value,date_from,date_to,percentage,value_1,attribute_id,client,last_update,rel_attr_id,rel_value,user_id) VALUES('110011100','110011100','110011100', CONVERT(DATETIME, '19000101', 112), CONVERT(DATETIME, '20991231', 112),100,0, 'BF','BT', getdate(), 'C0','99999', '8-evla')
INSERT INTO aglrelvalue (att_val_from,att_val_to,att_value,date_from,date_to,percentage,value_1,attribute_id,client,last_update,rel_attr_id,rel_value,user_id) VALUES('110011100','110011100','110011100', CONVERT(DATETIME, '19000101', 112), CONVERT(DATETIME, '20991231', 112),100,0, 'BF','BT', getdate(), 'C1','12600000', '8-evla')
INSERT INTO aglrelvalue (att_val_from,att_val_to,att_value,date_from,date_to,percentage,value_1,attribute_id,client,last_update,rel_attr_id,rel_value,user_id) VALUES('110011100','110011100','110011100', CONVERT(DATETIME, '19000101', 112), CONVERT(DATETIME, '20991231', 112),100,0, 'BF','BT', getdate(), 'B0','110011', '8-evla')
INSERT INTO aglrelvalue (att_val_from,att_val_to,att_value,date_from,date_to,percentage,value_1,attribute_id,client,last_update,rel_attr_id,rel_value,user_id) VALUES('110011100','110011100','110011100', CONVERT(DATETIME, '19000101', 112), CONVERT(DATETIME, '20991231', 112),100,0, 'BF','BT', getdate(), 'V21','NOG', '8-evla')
INSERT INTO aglrelvalue (att_val_from,att_val_to,att_value,date_from,date_to,percentage,value_1,attribute_id,client,last_update,rel_attr_id,rel_value,user_id) VALUES('110011100','110011100','110011100', CONVERT(DATETIME, '19000101', 112), CONVERT(DATETIME, '20991231', 112),100,0, 'BF','BT', getdate(), 'A4','18581', '8-evla')
INSERT INTO aglrelvalue (att_val_from,att_val_to,att_value,date_from,date_to,percentage,value_1,attribute_id,client,last_update,rel_attr_id,rel_value,user_id) VALUES('110011100','110011100','110011100', CONVERT(DATETIME, '19000101', 112), CONVERT(DATETIME, '20991231', 112),100,0, 'BF','BT', getdate(), 'V22', 'IA', '8-evla')
INSERT INTO aglrelvalue (att_val_from,att_val_to,att_value,date_from,date_to,percentage,value_1,attribute_id,client,last_update,rel_attr_id,rel_value,user_id) VALUES('110011100','110011100','110011100', CONVERT(DATETIME, '19000101', 112), CONVERT(DATETIME, '20991231', 112),100,0, 'BF','BT', getdate(), 'V23', 'IA', '8-evla')
INSERT INTO aglrelvalue (att_val_from,att_val_to,att_value,date_from,date_to,percentage,value_1,attribute_id,client,last_update,rel_attr_id,rel_value,user_id) VALUES('110011100','110011100','110011100', CONVERT(DATETIME, '19000101', 112), CONVERT(DATETIME, '20991231', 112),100,0, 'BF','BT', getdate(), 'V24', 'IA', '8-evla')
INSERT INTO aglrelvalue (att_val_from,att_val_to,att_value,date_from,date_to,percentage,value_1,attribute_id,client,last_update,rel_attr_id,rel_value,user_id) VALUES('110011100','110011100','110011100', CONVERT(DATETIME, '19000101', 112), CONVERT(DATETIME, '20991231', 112),100,0, 'BF','BT', getdate(), 'V25', 'IA', '8-evla')
INSERT INTO afxaofin (attribute_id,dim_value,line_no,client,date_from,date_to,amount_fx,last_update,user_id) VALUES( 'BF'  ,'110011100',0,'BT',CAST('1900-01-01 00:00:00.000' AS DateTime),CAST('1900-01-01 00:00:00.000' AS DateTime),1000000,getdate(), '8-evla'                  )
INSERT INTO afxaoegenfin (attribute_id,dim_value,line_no,client,date_from,date_to,own_funding_fx,last_update,user_id) VALUES( 'BF'  ,'110011100',0,'BT',CAST('1900-01-01 00:00:00.000' AS DateTime),CAST('1900-01-01 00:00:00.000' AS DateTime),0,getdate(), '8-evla'                  )
INSERT INTO afxaoindirekte (attribute_id,dim_value,line_no,client,date_from,date_to,indirect_cost_fx,last_update,user_id) VALUES( 'BF'  ,'110011100',0,'BT',CAST('1900-01-01 00:00:00.000' AS DateTime),CAST('1900-01-01 00:00:00.000' AS DateTime),0,getdate(), '8-evla'                  )
INSERT INTO atsinvinfo (attribute_id, client,dim_value,invoice_type,last_update,long_info1,long_info2,tax_code,tax_system,terms_id,user_id,work_order_flag) VALUES( 'BF'  ,'BT','110011100', 'F',getdate(), '', '', '', '',30, '8-evla',0)
INSERT INTO atsworkorder (period_from,customer_id,invoice_code,STATUS,client,inv_status,resource_id,description,inv_attr_id,stop_entry_date,user_id,date_from,last_update,department,work_order,dim4,dim3,date_to,ext_ord_txt,project,inv_flag,dim2,dim1,period_to,reference_1,currency) VALUES(201901,'', '','N','BT', 'T','99999','EF-test: Bidrag 1 Bergen kommune', '',CONVERT(DATETIME, '19000101', 112), '8-evla',CONVERT(DATETIME,'20190101', 112),getdate(),'20100000','120002100', 'IA', 'IA',CONVERT(DATETIME,'20290101', 112), '','120002',0, 'IA','NA',202901, '', 'NOK')
INSERT INTO agldimvalue (attribute_id,client,description,dim_value,period_from,period_to,rel_value,STATUS,value_1,user_id,last_update) VALUES( 'BF','BT','EF-test: Bidrag 1 Bergen kommune','120002100',201901,202901, '120002', 'N',0, '8-evla', getdate())
INSERT INTO agldescription (client, attribute_id, dim_value, description, LANGUAGE) VALUES('BT', 'BF','120002100','EF-test: Bidrag 1 Bergen kommune', 'NO')
INSERT INTO aglrelvalue (att_val_from,att_val_to,att_value,date_from,date_to,percentage,value_1,attribute_id,client,last_update,rel_attr_id,rel_value,user_id) VALUES('120002100','120002100','120002100', CONVERT(DATETIME, '19000101', 112), CONVERT(DATETIME, '20991231', 112),100,0, 'BF','BT', getdate(), 'C0','99999', '8-evla')
INSERT INTO aglrelvalue (att_val_from,att_val_to,att_value,date_from,date_to,percentage,value_1,attribute_id,client,last_update,rel_attr_id,rel_value,user_id) VALUES('120002100','120002100','120002100', CONVERT(DATETIME, '19000101', 112), CONVERT(DATETIME, '20991231', 112),100,0, 'BF','BT', getdate(), 'C1','20100000', '8-evla')
INSERT INTO aglrelvalue (att_val_from,att_val_to,att_value,date_from,date_to,percentage,value_1,attribute_id,client,last_update,rel_attr_id,rel_value,user_id) VALUES('120002100','120002100','120002100', CONVERT(DATETIME, '19000101', 112), CONVERT(DATETIME, '20991231', 112),100,0, 'BF','BT', getdate(), 'B0','120002', '8-evla')
INSERT INTO aglrelvalue (att_val_from,att_val_to,att_value,date_from,date_to,percentage,value_1,attribute_id,client,last_update,rel_attr_id,rel_value,user_id) VALUES('120002100','120002100','120002100', CONVERT(DATETIME, '19000101', 112), CONVERT(DATETIME, '20991231', 112),100,0, 'BF','BT', getdate(), 'V21','NA', '8-evla')
INSERT INTO aglrelvalue (att_val_from,att_val_to,att_value,date_from,date_to,percentage,value_1,attribute_id,client,last_update,rel_attr_id,rel_value,user_id) VALUES('120002100','120002100','120002100', CONVERT(DATETIME, '19000101', 112), CONVERT(DATETIME, '20991231', 112),100,0, 'BF','BT', getdate(), 'A4','', '8-evla')
INSERT INTO aglrelvalue (att_val_from,att_val_to,att_value,date_from,date_to,percentage,value_1,attribute_id,client,last_update,rel_attr_id,rel_value,user_id) VALUES('120002100','120002100','120002100', CONVERT(DATETIME, '19000101', 112), CONVERT(DATETIME, '20991231', 112),100,0, 'BF','BT', getdate(), 'V22', 'IA', '8-evla')
INSERT INTO aglrelvalue (att_val_from,att_val_to,att_value,date_from,date_to,percentage,value_1,attribute_id,client,last_update,rel_attr_id,rel_value,user_id) VALUES('120002100','120002100','120002100', CONVERT(DATETIME, '19000101', 112), CONVERT(DATETIME, '20991231', 112),100,0, 'BF','BT', getdate(), 'V23', 'IA', '8-evla')
INSERT INTO aglrelvalue (att_val_from,att_val_to,att_value,date_from,date_to,percentage,value_1,attribute_id,client,last_update,rel_attr_id,rel_value,user_id) VALUES('120002100','120002100','120002100', CONVERT(DATETIME, '19000101', 112), CONVERT(DATETIME, '20991231', 112),100,0, 'BF','BT', getdate(), 'V24', 'IA', '8-evla')
INSERT INTO aglrelvalue (att_val_from,att_val_to,att_value,date_from,date_to,percentage,value_1,attribute_id,client,last_update,rel_attr_id,rel_value,user_id) VALUES('120002100','120002100','120002100', CONVERT(DATETIME, '19000101', 112), CONVERT(DATETIME, '20991231', 112),100,0, 'BF','BT', getdate(), 'V25', 'IA', '8-evla')
INSERT INTO afxaofin (attribute_id,dim_value,line_no,client,date_from,date_to,amount_fx,last_update,user_id) VALUES( 'BF'  ,'120002100',0,'BT',CAST('1900-01-01 00:00:00.000' AS DateTime),CAST('1900-01-01 00:00:00.000' AS DateTime),600000,getdate(), '8-evla'                  )
INSERT INTO afxaoegenfin (attribute_id,dim_value,line_no,client,date_from,date_to,own_funding_fx,last_update,user_id) VALUES( 'BF'  ,'120002100',0,'BT',CAST('1900-01-01 00:00:00.000' AS DateTime),CAST('1900-01-01 00:00:00.000' AS DateTime),0,getdate(), '8-evla'                  )
INSERT INTO afxaoindirekte (attribute_id,dim_value,line_no,client,date_from,date_to,indirect_cost_fx,last_update,user_id) VALUES( 'BF'  ,'120002100',0,'BT',CAST('1900-01-01 00:00:00.000' AS DateTime),CAST('1900-01-01 00:00:00.000' AS DateTime),0,getdate(), '8-evla'                  )
INSERT INTO atsinvinfo (attribute_id, client,dim_value,invoice_type,last_update,long_info1,long_info2,tax_code,tax_system,terms_id,user_id,work_order_flag) VALUES( 'BF'  ,'BT','120002100', 'F',getdate(), '', '', '', '',30, '8-evla',0)


ROLLBACK
COMMIT