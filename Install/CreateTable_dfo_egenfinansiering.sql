USE [AgrBOTT_Utv02]
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
