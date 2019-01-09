-- ====================
-- 欄位資訊
-- Reference: http://chuanitai.pixnet.net/blog/post/37036281-%E5%8F%96%E5%BE%97-sql-server-table-%E5%92%8C-column-%E7%9A%84%E8%A8%BB%E8%A7%A3
-- ====================
SELECT
    a.TABLE_NAME as 表格名稱,
    b.COLUMN_NAME as 欄位名稱,
    b.DATA_TYPE as 資料型別,
    b.CHARACTER_MAXIMUM_LENGTH as 最大長度,
    b.COLUMN_DEFAULT as 預設值,
    b.IS_NULLABLE as 允許空值,
    (SELECT value
     FROM fn_listextendedproperty (NULL, 'schema', 'dbo', 'table', a.TABLE_NAME, 'column', default)
     WHERE name = 'MS_Description'
       AND objtype = 'COLUMN'
       AND objname Collate Chinese_Taiwan_Stroke_CI_AS = b.COLUMN_NAME
    ) as 欄位備註
FROM INFORMATION_SCHEMA.TABLES  a
LEFT JOIN INFORMATION_SCHEMA.COLUMNS b ON (a.TABLE_NAME = b.TABLE_NAME)
WHERE TABLE_TYPE = 'BASE TABLE'
ORDER BY a.TABLE_NAME, ordinal_position
