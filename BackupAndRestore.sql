-- ==================================================
-- 查看備份檔的備份組
-- ==================================================
RESTORE HEADERONLY FROM DISK = 'D:\Backup_SQL\gogs.BAK'


-- ==================================================
-- 壓縮 Log
-- ==================================================
USE [Database];
GO
-- 將資料庫復原模式切換為簡單模式
ALTER DATABASE [Database]
SET RECOVERY SIMPLE;
GO
-- 進行記錄檔壓縮作業，[20 = 壓縮後檔案大小為 20M]
DBCC SHRINKFILE ([Database]_log, 20);
GO
-- 將資料庫復原模式切換回完整模式
ALTER DATABASE [Database]
SET RECOVERY FULL;
GO
