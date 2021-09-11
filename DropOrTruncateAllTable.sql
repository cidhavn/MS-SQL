--==============================
-- Drop Foreign Key
--==============================
DECLARE @SQL varchar(MAX) = '',
        @NewLineChar char(2) = char(13) + char(10)

--SELECT K_Table = FK.TABLE_NAME, FK_Column = CU.COLUMN_NAME, PK_Table = PK.TABLE_NAME, PK_Column = PT.COLUMN_NAME, Constraint_Name = C.CONSTRAINT_NAME
SELECT @SQL = @SQL + 'ALTER TABLE ' + QUOTENAME(FK.TABLE_SCHEMA) + '.' + QUOTENAME(FK.TABLE_NAME) + ' DROP CONSTRAINT [' + RTRIM(C.CONSTRAINT_NAME) +']' + @NewLineChar + 'GO' + @NewLineChar
FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS C
INNER JOIN INFORMATION_SCHEMA.TABLE_CONSTRAINTS FK ON C.CONSTRAINT_NAME = FK.CONSTRAINT_NAME
INNER JOIN INFORMATION_SCHEMA.TABLE_CONSTRAINTS PK ON C.UNIQUE_CONSTRAINT_NAME = PK.CONSTRAINT_NAME
INNER JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE CU ON C.CONSTRAINT_NAME = CU.CONSTRAINT_NAME
INNER JOIN (
    SELECT i1.TABLE_NAME, i2.COLUMN_NAME
    FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS i1
    INNER JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE i2 ON i1.CONSTRAINT_NAME = i2.CONSTRAINT_NAME
    WHERE i1.CONSTRAINT_TYPE = 'PRIMARY KEY'
) PT ON PT.TABLE_NAME = PK.TABLE_NAME

PRINT CAST(@SQL AS NTEXT)

--==============================
-- Drop Table
--==============================
DECLARE @SQL varchar(MAX) = '',
        @NewLineChar char(2) = char(13) + char(10)

SELECT @SQL =  @SQL + 'DROP TABLE ' + QUOTENAME(s.NAME) + '.' + QUOTENAME(t.NAME) + @NewLineChar + 'GO' + @NewLineChar
FROM sys.tables t
INNER JOIN sys.schemas s ON t.[schema_id] = s.[schema_id]
WHERE t.type = 'U'

PRINT CAST(@SQL AS NTEXT)

--==============================
-- TRUNCATE Table
--==============================
DECLARE @SQL varchar(MAX) = '',
        @NewLineChar char(2) = char(13) + char(10)

SELECT @SQL =  @SQL + 'TRUNCATE TABLE ' + QUOTENAME(s.NAME) + '.' + QUOTENAME(t.NAME) + @NewLineChar + 'GO' + @NewLineChar
FROM sys.tables t
INNER JOIN sys.schemas s ON t.[schema_id] = s.[schema_id]
WHERE t.type = 'U'

PRINT CAST(@SQL AS NTEXT)
