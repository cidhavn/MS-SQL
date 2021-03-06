-- ==============================
-- 資料表或檢視之資料和索引的大小和片段資訊
-- https://docs.microsoft.com/zh-tw/sql/relational-databases/system-dynamic-management-views/sys-dm-db-index-physical-stats-transact-sql?view=sql-server-2017
-- ==============================
SELECT
    OBJECT_NAME([object_id]) AS '資料表',
    index_id AS '索引識別碼', --[0 = 堆積]
    index_type_desc AS '索引類型',
    alloc_unit_type_desc AS '配置單位類型',
    index_depth AS' 索引層級數',
    index_level AS '索引目前層級',
    page_count AS '索引或資料頁總數',
    avg_page_space_used_in_percent AS '可用空間平均',
    record_count AS '總記錄數',
    min_record_size_in_bytes AS '記錄大小下限',
    max_record_size_in_bytes As '記錄大小上限',
    forwarded_record_count          
FROM sys.dm_db_index_physical_stats (DB_ID(), OBJECT_ID('dbo.tblunitsVarN'), NULL, NULL , 'DETAILED');

-- ==============================
-- 查看碎片程度
-- https://docs.microsoft.com/zh-tw/sql/relational-databases/system-dynamic-management-views/sys-dm-db-index-physical-stats-transact-sql?view=sql-server-2017
-- ==============================
SELECT
    ps.OBJECT_ID,
    object_name(ps.OBJECT_ID) as '資料表',
    ps.index_id AS '索引 ID',
    b.name AS '索引名稱',
    ps.avg_fragmentation_in_percent AS '邏輯碎片'
FROM sys.dm_db_index_physical_stats (DB_ID(), NULL, NULL, NULL, NULL) AS ps
INNER JOIN sys.indexes AS b
    ON ps.OBJECT_ID = b.OBJECT_ID AND ps.index_id = b.index_id
WHERE ps.database_id = DB_ID()

-- 索引資訊
DBCC SHOWCONTIG ('Table Name')
-- 使用空間
EXEC sp_spaceused 'Table Name'
