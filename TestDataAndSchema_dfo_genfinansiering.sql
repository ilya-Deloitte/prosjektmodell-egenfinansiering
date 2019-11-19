DROP TABLE dfo_egenfinansiering

USE [agrdemoM7]
GO
/****** Object:  Table [dbo].[dfo_egenfinansiering]    Script Date: 11/15/2019 10:15:51 AM ******/
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
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[dfo_egenfinansiering] ON 

GO
INSERT [dbo].[dfo_egenfinansiering] ([account], [amount], [apar_id], [apar_type], [att_1_id], [att_2_id], [att_3_id], [att_4_id], [att_5_id], [att_6_id], [att_7_id], [client], [cur_amount], [currency], [dc_flag], [description], [dim_1], [dim_2], [dim_3], [dim_4], [dim_5], [dim_6], [dim_7], [ext_arch_ref], [ext_inv_ref], [ext_ref], [number_1], [order_id], [period], [sequence_no], [status], [tax_code], [tax_system], [trans_date], [value_1], [value_2], [value_3], [voucher_date], [voucher_no], [voucher_type], [agrtid], [step], [last_update], [user_id]) VALUES (N'6000', CAST(0.000 AS Decimal(28, 3)), N'', N' ', N'C1  ', N'B0  ', N'    ', N'    ', N'BF  ', N'C0  ', N'C1  ', N'NO', CAST(1000.000 AS Decimal(28, 3)), N'NOK', -1, N'Test row 0, 0 kr, kostnad på bidragsprosjekt med ressurs og aktivitet', N'11223344', N'654321', N'', N'', N'654321100', N'1061', N'1', N'                                                  ', N'', N'', 0, 0, 201911, 0, N' ', N'0', N'', CAST(N'2019-11-15 10:02:53.880' AS DateTime), CAST(0.00000000 AS Decimal(28, 8)), CAST(0.000 AS Decimal(28, 3)), CAST(0.000 AS Decimal(28, 3)), CAST(N'2019-11-15 10:02:53.880' AS DateTime), 10000000, N'HB', 1, 0, CAST(N'2019-11-15 10:02:53.880' AS DateTime), N'8-EVLA')
GO
INSERT [dbo].[dfo_egenfinansiering] ([account], [amount], [apar_id], [apar_type], [att_1_id], [att_2_id], [att_3_id], [att_4_id], [att_5_id], [att_6_id], [att_7_id], [client], [cur_amount], [currency], [dc_flag], [description], [dim_1], [dim_2], [dim_3], [dim_4], [dim_5], [dim_6], [dim_7], [ext_arch_ref], [ext_inv_ref], [ext_ref], [number_1], [order_id], [period], [sequence_no], [status], [tax_code], [tax_system], [trans_date], [value_1], [value_2], [value_3], [voucher_date], [voucher_no], [voucher_type], [agrtid], [step], [last_update], [user_id]) VALUES (N'6000', CAST(1000.000 AS Decimal(28, 3)), N'', N' ', N'C1  ', N'B0  ', N'    ', N'    ', N'BF  ', N'C0  ', N'B1  ', N'NO', CAST(1000.000 AS Decimal(28, 3)), N'NOK', 1, N'Test row 1, kostnad på bidragsprosjekt med ressurs og aktivitet', N'11223344', N'654321', N'', N'', N'654321100', N'1061', N'1', N'                                                  ', N'', N'', 0, 0, 201911, 0, N' ', N'0', N'', CAST(N'2019-11-15 09:12:57.927' AS DateTime), CAST(0.00000000 AS Decimal(28, 8)), CAST(0.000 AS Decimal(28, 3)), CAST(0.000 AS Decimal(28, 3)), CAST(N'2019-11-15 09:12:57.927' AS DateTime), 10000001, N'HB', 2, 0, CAST(N'2019-11-15 09:12:57.927' AS DateTime), N'8-EVLA')
GO
INSERT [dbo].[dfo_egenfinansiering] ([account], [amount], [apar_id], [apar_type], [att_1_id], [att_2_id], [att_3_id], [att_4_id], [att_5_id], [att_6_id], [att_7_id], [client], [cur_amount], [currency], [dc_flag], [description], [dim_1], [dim_2], [dim_3], [dim_4], [dim_5], [dim_6], [dim_7], [ext_arch_ref], [ext_inv_ref], [ext_ref], [number_1], [order_id], [period], [sequence_no], [status], [tax_code], [tax_system], [trans_date], [value_1], [value_2], [value_3], [voucher_date], [voucher_no], [voucher_type], [agrtid], [step], [last_update], [user_id]) VALUES (N'6000', CAST(-1000.000 AS Decimal(28, 3)), N'', N' ', N'C1  ', N'B0  ', N'    ', N'    ', N'BF  ', N'C0  ', N'B1  ', N'NO', CAST(-1000.000 AS Decimal(28, 3)), N'NOK', -1, N'Test row 2, negativ kostnad på bidragsprosjekt med ressurs og aktivitet', N'11223344', N'654321', N'', N'', N'654321100', N'1061', N'1', N'                                                  ', N'', N'', 0, 0, 201911, 0, N' ', N'0', N'', CAST(N'2019-11-15 09:12:57.927' AS DateTime), CAST(0.00000000 AS Decimal(28, 8)), CAST(0.000 AS Decimal(28, 3)), CAST(0.000 AS Decimal(28, 3)), CAST(N'2019-11-15 09:12:57.927' AS DateTime), 10000002, N'HB', 3, 0, CAST(N'2019-11-15 09:12:57.927' AS DateTime), N'8-EVLA')
GO
INSERT [dbo].[dfo_egenfinansiering] ([account], [amount], [apar_id], [apar_type], [att_1_id], [att_2_id], [att_3_id], [att_4_id], [att_5_id], [att_6_id], [att_7_id], [client], [cur_amount], [currency], [dc_flag], [description], [dim_1], [dim_2], [dim_3], [dim_4], [dim_5], [dim_6], [dim_7], [ext_arch_ref], [ext_inv_ref], [ext_ref], [number_1], [order_id], [period], [sequence_no], [status], [tax_code], [tax_system], [trans_date], [value_1], [value_2], [value_3], [voucher_date], [voucher_no], [voucher_type], [agrtid], [step], [last_update], [user_id]) VALUES (N'6000', CAST(1000.000 AS Decimal(28, 3)), N'', N' ', N'C1  ', N'B0  ', N'    ', N'    ', N'BF  ', N'C0  ', N'B1  ', N'NO', CAST(1000.000 AS Decimal(28, 3)), N'NOK', 1, N'Test row 3, kostnad på bidragssprosjekt på delprosjekt != egenfinansieringsdelprosjekt med ressurs og aktivitet', N'11223344', N'654321', N'', N'', N'654321101', N'1061', N'1', N'                                                  ', N'', N'', 0, 0, 201911, 0, N' ', N'0', N'', CAST(N'2019-11-15 09:25:53.000' AS DateTime), CAST(0.00000000 AS Decimal(28, 8)), CAST(0.000 AS Decimal(28, 3)), CAST(0.000 AS Decimal(28, 3)), CAST(N'2019-11-15 09:25:53.000' AS DateTime), 10000003, N'HB', 5, 0, CAST(N'2019-11-15 09:25:53.000' AS DateTime), N'8-EVLA')
GO
INSERT [dbo].[dfo_egenfinansiering] ([account], [amount], [apar_id], [apar_type], [att_1_id], [att_2_id], [att_3_id], [att_4_id], [att_5_id], [att_6_id], [att_7_id], [client], [cur_amount], [currency], [dc_flag], [description], [dim_1], [dim_2], [dim_3], [dim_4], [dim_5], [dim_6], [dim_7], [ext_arch_ref], [ext_inv_ref], [ext_ref], [number_1], [order_id], [period], [sequence_no], [status], [tax_code], [tax_system], [trans_date], [value_1], [value_2], [value_3], [voucher_date], [voucher_no], [voucher_type], [agrtid], [step], [last_update], [user_id]) VALUES (N'6000', CAST(1000.000 AS Decimal(28, 3)), N'', N' ', N'C1  ', N'B0  ', N'    ', N'    ', N'BF  ', N'C0  ', N'B1  ', N'NO', CAST(1000.000 AS Decimal(28, 3)), N'NOK', 1, N'Test row 4, kostnad på oppdragsprosjekt med ressurs og aktivitet', N'11223344', N'987654', N'', N'', N'987654100', N'1061', N'1', N'                                                  ', N'', N'', 0, 0, 201911, 0, N' ', N'0', N'', CAST(N'2019-11-15 09:24:11.177' AS DateTime), CAST(0.00000000 AS Decimal(28, 8)), CAST(0.000 AS Decimal(28, 3)), CAST(0.000 AS Decimal(28, 3)), CAST(N'2019-11-15 09:24:11.177' AS DateTime), 10000004, N'HB', 4, 0, CAST(N'2019-11-15 09:24:11.177' AS DateTime), N'8-EVLA')
GO
INSERT [dbo].[dfo_egenfinansiering] ([account], [amount], [apar_id], [apar_type], [att_1_id], [att_2_id], [att_3_id], [att_4_id], [att_5_id], [att_6_id], [att_7_id], [client], [cur_amount], [currency], [dc_flag], [description], [dim_1], [dim_2], [dim_3], [dim_4], [dim_5], [dim_6], [dim_7], [ext_arch_ref], [ext_inv_ref], [ext_ref], [number_1], [order_id], [period], [sequence_no], [status], [tax_code], [tax_system], [trans_date], [value_1], [value_2], [value_3], [voucher_date], [voucher_no], [voucher_type], [agrtid], [step], [last_update], [user_id]) VALUES (N'6000', CAST(1000.000 AS Decimal(28, 3)), N'', N' ', N'C1  ', N'B0  ', N'    ', N'    ', N'BF  ', N'C0  ', N'B1  ', N'NO', CAST(1000.000 AS Decimal(28, 3)), N'NOK', 1, N'Test row 5, kostnad på interntprosjekt med ressurs og aktivitet', N'11223344', N'444222', N'', N'', N'444222100', N'1061', N'1', N'                                                  ', N'', N'', 0, 0, 201911, 0, N' ', N'0', N'', CAST(N'2019-11-15 09:29:14.497' AS DateTime), CAST(0.00000000 AS Decimal(28, 8)), CAST(0.000 AS Decimal(28, 3)), CAST(0.000 AS Decimal(28, 3)), CAST(N'2019-11-15 09:29:14.497' AS DateTime), 10000005, N'HB', 6, 0, CAST(N'2019-11-15 09:29:14.497' AS DateTime), N'8-EVLA')
GO
INSERT [dbo].[dfo_egenfinansiering] ([account], [amount], [apar_id], [apar_type], [att_1_id], [att_2_id], [att_3_id], [att_4_id], [att_5_id], [att_6_id], [att_7_id], [client], [cur_amount], [currency], [dc_flag], [description], [dim_1], [dim_2], [dim_3], [dim_4], [dim_5], [dim_6], [dim_7], [ext_arch_ref], [ext_inv_ref], [ext_ref], [number_1], [order_id], [period], [sequence_no], [status], [tax_code], [tax_system], [trans_date], [value_1], [value_2], [value_3], [voucher_date], [voucher_no], [voucher_type], [agrtid], [step], [last_update], [user_id]) VALUES (N'9421', CAST(1000.000 AS Decimal(28, 3)), N'', N' ', N'C1  ', N'B0  ', N'    ', N'    ', N'BF  ', N'C0  ', N'C1  ', N'NO', CAST(1000.000 AS Decimal(28, 3)), N'NOK', -1, N'Test row 6 leiested, kostnad på bidragsprosjekt med ressurs og aktivitet', N'11223344', N'654321', N'', N'', N'654321100', N'1061', N'1', N'                                                  ', N'', N'', 0, 0, 201911, 0, N' ', N'0', N'', CAST(N'2019-11-15 09:54:58.460' AS DateTime), CAST(0.00000000 AS Decimal(28, 8)), CAST(0.000 AS Decimal(28, 3)), CAST(0.000 AS Decimal(28, 3)), CAST(N'2019-11-15 09:54:58.460' AS DateTime), 10000006, N'HB', 7, 0, CAST(N'2019-11-15 09:54:58.460' AS DateTime), N'8-EVLA')
GO
INSERT [dbo].[dfo_egenfinansiering] ([account], [amount], [apar_id], [apar_type], [att_1_id], [att_2_id], [att_3_id], [att_4_id], [att_5_id], [att_6_id], [att_7_id], [client], [cur_amount], [currency], [dc_flag], [description], [dim_1], [dim_2], [dim_3], [dim_4], [dim_5], [dim_6], [dim_7], [ext_arch_ref], [ext_inv_ref], [ext_ref], [number_1], [order_id], [period], [sequence_no], [status], [tax_code], [tax_system], [trans_date], [value_1], [value_2], [value_3], [voucher_date], [voucher_no], [voucher_type], [agrtid], [step], [last_update], [user_id]) VALUES (N'6000', CAST(1000.000 AS Decimal(28, 3)), N'', N' ', N'C1  ', N'B0  ', N'    ', N'    ', N'    ', N'C0  ', N'C1  ', N'NO', CAST(1000.000 AS Decimal(28, 3)), N'NOK', -1, N'Test row 7, kostnad på bidragsprosjekt uten delprosjekt med ressurs og aktivitet', N'11223344', N'654321', N'', N'', N'', N'1061', N'1', N'                                                  ', N'', N'', 0, 0, 201911, 0, N' ', N'0', N'', CAST(N'2019-11-15 09:57:30.110' AS DateTime), CAST(0.00000000 AS Decimal(28, 8)), CAST(0.000 AS Decimal(28, 3)), CAST(0.000 AS Decimal(28, 3)), CAST(N'2019-11-15 09:57:30.110' AS DateTime), 10000007, N'HB', 8, 0, CAST(N'2019-11-15 09:57:30.110' AS DateTime), N'8-EVLA')
GO
INSERT [dbo].[dfo_egenfinansiering] ([account], [amount], [apar_id], [apar_type], [att_1_id], [att_2_id], [att_3_id], [att_4_id], [att_5_id], [att_6_id], [att_7_id], [client], [cur_amount], [currency], [dc_flag], [description], [dim_1], [dim_2], [dim_3], [dim_4], [dim_5], [dim_6], [dim_7], [ext_arch_ref], [ext_inv_ref], [ext_ref], [number_1], [order_id], [period], [sequence_no], [status], [tax_code], [tax_system], [trans_date], [value_1], [value_2], [value_3], [voucher_date], [voucher_no], [voucher_type], [agrtid], [step], [last_update], [user_id]) VALUES (N'6000', CAST(1000.000 AS Decimal(28, 3)), N'', N' ', N'C1  ', N'B0  ', N'    ', N'    ', N'BF  ', N'C0  ', N'C1  ', N'NO', CAST(1000.000 AS Decimal(28, 3)), N'NOK', -1, N'Test row 8 annen periode, kostnad på bidragsprosjekt med ressurs og aktivitet', N'11223344', N'654321', N'', N'', N'654321100', N'1061', N'1', N'                                                  ', N'', N'', 0, 0, 201912, 0, N' ', N'0', N'', CAST(N'2019-12-15 10:02:53.880' AS DateTime), CAST(0.00000000 AS Decimal(28, 8)), CAST(0.000 AS Decimal(28, 3)), CAST(0.000 AS Decimal(28, 3)), CAST(N'2019-12-15 10:02:53.880' AS DateTime), 10000008, N'HB', 9, 0, CAST(N'2019-11-15 10:08:12.157' AS DateTime), N'8-EVLA')
GO
INSERT [dbo].[dfo_egenfinansiering] ([account], [amount], [apar_id], [apar_type], [att_1_id], [att_2_id], [att_3_id], [att_4_id], [att_5_id], [att_6_id], [att_7_id], [client], [cur_amount], [currency], [dc_flag], [description], [dim_1], [dim_2], [dim_3], [dim_4], [dim_5], [dim_6], [dim_7], [ext_arch_ref], [ext_inv_ref], [ext_ref], [number_1], [order_id], [period], [sequence_no], [status], [tax_code], [tax_system], [trans_date], [value_1], [value_2], [value_3], [voucher_date], [voucher_no], [voucher_type], [agrtid], [step], [last_update], [user_id]) VALUES (N'6000', CAST(1000.000 AS Decimal(28, 3)), N'', N' ', N'C1  ', N'B0  ', N'    ', N'    ', N'BF  ', N'C0  ', N'C1  ', N'NO', CAST(1000.000 AS Decimal(28, 3)), N'NOK', -1, N'Test row 9 step 2 ferdig, kostnad på bidragsprosjekt med ressurs og aktivitet', N'11223344', N'654321', N'', N'', N'654321100', N'1061', N'1', N'                                                  ', N'', N'', 0, 0, 201911, 0, N' ', N'0', N'', CAST(N'2019-11-15 10:02:53.880' AS DateTime), CAST(0.00000000 AS Decimal(28, 8)), CAST(0.000 AS Decimal(28, 3)), CAST(0.000 AS Decimal(28, 3)), CAST(N'2019-11-15 10:02:53.880' AS DateTime), 10000009, N'HB', 10, 2, CAST(N'2019-11-15 10:11:14.143' AS DateTime), N'8-EVLA')
GO
SET IDENTITY_INSERT [dbo].[dfo_egenfinansiering] OFF
GO

UPDATE dfo_egenfinansiering SET voucher_date='2019-11-15 10:02:53.880' WHERE voucher_date='2019-12-15 10:02:53.880'
UPDATE dfo_egenfinansiering SET dim_1='11221100' WHERE 1=1

SELECT * FROM dfo_egenfinansiering