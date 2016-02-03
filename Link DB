-- 需要伺服器的 ALTER ANY LINKED SERVER 權限

-- Create DB Link Server - Server1
EXEC sp_addlinkedserver
	@server = 'Server1', --連結伺服器名稱
	@srvproduct = 'MS SQL', --產品名稱
	@datasrc = '192.168.1.1', --遠端伺服器名或ip地址
	@provider = 'SQLNCLI'
EXEC sp_addlinkedsrvlogin
	@rmtsrvname = 'Server1', --連結伺服器名稱
	@useself = 'false' ,
	@locallogin = NULL ,
	@rmtuser = 'sa' , --User
	@rmtpassword = 'pwd' --Password

-- Create DB Link Server - Server2
EXEC sp_addlinkedserver
	@server = 'Server2', --連結伺服器名稱
	@srvproduct = 'MS SQL', --產品名稱
	@datasrc = '192.168.1.2', --遠端伺服器名或ip地址
	@provider = 'SQLNCLI'
EXEC sp_addlinkedsrvlogin
	@rmtsrvname = 'Server2', --連結伺服器名稱
	@useself = 'false' ,
	@locallogin = NULL ,
	@rmtuser = 'sa' , --User
	@rmtpassword = 'pwd' --Password

-- Check DB Link Server
SELECT * FROM sys.servers

SELECT * FROM [Server1].[dbProduct].[dbo].[Table1]
SELECT * FROM [Server2].[dbOrder].[dbo].[Table2]

-- Remove DB Link Server
EXEC sp_dropserver @server = 'Server1', @droplogins = 'droplogins'
EXEC sp_dropserver @server = 'Server2', @droplogins = 'droplogins'
