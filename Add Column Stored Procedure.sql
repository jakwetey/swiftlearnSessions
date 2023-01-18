--CREATING A STORED PROCEDURE TO ADD A NEW COLUMN TO A TABLE
CREATE OR ALTER PROCEDURE SP_AddNewColumn 
    @TableName VARCHAR(100),
    @Column1Name VARCHAR(50),
    @Column1DataType VARCHAR(50),
    @Column1Nullable VARCHAR(50)

AS
  BEGIN

     SET NOCOUNT ON;

	 DECLARE @SQLString NVARCHAR(MAX)

	 SET @SQLString = 'ALTER TABLE' +' '+@TableName + ' ' + 
	 'ADD' +' '+ @Column1Name+' '+@Column1DataType +' '+@Column1Nullable

	EXEC(@SQLString)
  END

--- can execute stored procedure like this 
Exec SP_AddNewColumn  'NewService01', 'NewColumn1', 'VARCHAR(100)', 'NULL'
