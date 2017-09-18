DECLARE @splitString varchar(1000) = 'A,B,C'
DECLARE @splitChar varchar(5) = ','
DECLARE @splitCharSize int = LEN(@splitChar)
DECLARE @i int

SET @i = CHARINDEX(@splitChar, @splitString)
WHILE @i >= 1 
BEGIN
	SELECT LEFT(@splitString, @i - @splitCharSize)

	SET @splitString = SUBSTRING(@splitString, @i + @splitCharSize, LEN(@splitString) - @i) 
	SET @i = charindex(@splitChar, @splitString) 
END

-- last result
SELECT @splitString
