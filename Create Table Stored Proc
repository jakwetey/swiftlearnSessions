---CREATING PROCEDURE TO CREATE A NEW TABLE
CREATE OR ALTER PROCEDURE CreateService 
        @TableName VARCHAR(100),
        @Column1Name VARCHAR(50),
        @Column1DataType VARCHAR(50),
        @Column1Nullable VARCHAR(50),
		@Column2Name VARCHAR(50),
		@Column2DataType VARCHAR(50),
		@Column2Nullable VARCHAR(50),
		@Column3Name VARCHAR(50),
		@Column3DataType VARCHAR(30),
		@Column3Nullable VARCHAR(30),
		@Column4Name VARCHAR(30),
		@Column4DataType VARCHAR(50),
		@Column4Nullable VARCHAR(50),
		@Column5Name VARCHAR(50),
		@Column5DataType VARCHAR(50),
		@Column5Nullable VARCHAR(50),
		@Column6Name VARCHAR(50),
		@Column6DataType VARCHAR(50),
		@Column6Nullable VARCHAR(50),
		@Column7Name VARCHAR(50),
		@Column7DataType VARCHAR(50),
		@Column7Nullable VARCHAR(50),
		@Column8Name VARCHAR(50),
		@Column8DataType VARCHAR(50),
		@Column8Nullable VARCHAR(50),
		@Column9Name VARCHAR(50),
		@Column9DataType  VARCHAR(50),
		@Column9Nullable VARCHAR(50),
		@Column10Name VARCHAR(50),
		@Column10DataType VARCHAR(50),
		@Column10Nullable VARCHAR(50)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE @SQLString NVARCHAR(MAX)

   SET @SQLString = 'CREATE TABLE '+@TableName +
    '( '
	+@Column1Name+' '+@Column1DataType +' '+@Column1Nullable
	+', '+@Column2Name+' '+@Column2DataType +' '+@Column2Nullable
	+', '+@Column3Name+' '+@Column3DataType +' '+@Column3Nullable
	+','+@Column4Name+' '+@Column4DataType +' '+@Column4Nullable
	+', '+@Column5Name+' '+@Column5DataType +' '+@Column5Nullable
	+', '+@Column6Name+' '+@Column6DataType +' '+@Column6Nullable
	+', '+@Column7Name+' '+@Column7DataType +' '+@Column7Nullable
	+', '+@Column8Name+' '+@Column8DataType +' '+@Column8Nullable
	+', '+@Column9Name+' '+@Column9DataType +' '+@Column9Nullable
	+', '+@Column10Name+' '+@Column10DataType +' '+@Column10Nullable
	+')' 

   EXEC(@SQLString)
END
GO

--can execute procedure like   
EXEC CreateService 
'NewService01', 
'RUID', 'VARCHAR(10)', 'NOT NULL',
'DeYnOSPhIN', 'VARCHAR(20)', 'NULL',
'DeLiAp' , 'VARCHAR(20)', 'NULL',	
'DeLiDe'	, 'VARCHAR(20)', 'NULL',	
'DeYnOSPhON' , 'VARCHAR(20)', 'NULL',	
'CoYnOSPhIN'	, 'VARCHAR(20)', 'NULL',	
'CoAmtOSPhIN'	, 'VARCHAR(20)', 'NULL',
'CoYnOSPhON'	, 'VARCHAR(20)', 'NULL',
'CoAmtOSPhON'	, 'VARCHAR(20)', 'NULL',	
'CopYnOSPhIN'	, 'VARCHAR(20)', 'NULL';

SELECT * FROM NEWSERVICE01
