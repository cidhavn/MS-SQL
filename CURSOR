-- 1. 用CURSOR盡量別直接對Table處理，特別是異動高的Table，使用 TempTable 可增叫效能和減少Lock
-- 2. Select異動高的Table，可適當使用WITH (NOLOCK)增加效能，但需注意資料正確性
-- 3. 用CURSOR加上 LOCAL STATIC FORWARD_ONLY READ_ONLY 可增加效能，詳細參數設定可上網查詢

SELECT ID, Name
INTO #TempData
FROM Employee WITH (NOLOCK)

-- LOACL 僅在此作用域
-- STATIC 靜態指標
-- FORWARD_ONLY 只能從第1行移動至最後1行
-- READ_ONLY 僅能讀取

DECLARE curData CURSOR LOCAL STATIC FORWARD_ONLY READ_ONLY FOR
SELECT ID, Name FROM #TempData

OPEN curData
FETCH NEXT FROM curData INTO @ID, @Name
WHILE @@FETCH_STATUS = 0
BEGIN
  
  -- 處理資料
  
  FETCH NEXT FROM curData INTO @ID, @Name
END
CLOSE curData
DEALLOCATE curData
