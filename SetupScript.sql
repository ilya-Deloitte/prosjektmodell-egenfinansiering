--Kontorelasjoner Det er Ingen triggers på aglrelvalue i UTV02
BEGIN TRAN
INSERT [dbo].[aglrelvalue] 
([att_val_from], [att_val_to], [att_value], [attribute_id], [client], [date_from], [date_to], [last_update], [percentage], [priority], [rel_attr_id], [rel_id], [rel_value], [user_id], [value_1]) 
SELECT dim_value, dim_value, dim_value, 'A0  ','BT', CAST(N'1900-01-01 00:00:00.000' AS DateTime), CAST(N'2099-12-31 00:00:00.000' AS DateTime), GETDATE(), CAST(100.00000000 AS Decimal(28, 8)), 1, 'Q30 ', NEWID(), 'NEI', '8-evla', CAST(0.00000000 AS Decimal(28, 8))
FROM agldimvalue WHERE client='BT' AND attribute_id='A0'

UPDATE a SET a.rel_value='JA' 
FROM aglrelvalue a INNER JOIN agldimvalue b ON(b.client=a.client AND b.dim_value=a.att_value) 
WHERE a.client='BT' AND a.attribute_id='A0' AND a.rel_attr_id='Q30' and ((CAST(a.att_value AS int) BETWEEN 3910 AND 3919) OR (CAST(a.att_value AS int) BETWEEN 4000 AND 8000) OR a.att_value IN('9010','9110','9020','9120','9040','9140'))


ROLLBACK
COMMIT
