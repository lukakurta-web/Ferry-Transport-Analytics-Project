/*
===============================================================================
Stored Procedure: Load Bronze Sales (Source -> Bronze)
===============================================================================
Script Purpose:
    This stored procedure loads monthly sales data from CSV files
    into the 'bronze.sales' table.

Parameters:
    @year  - Reporting year
    @month - Reporting month

Usage Example:
    EXEC bronze.load_sales @year = 2025, @month = 1;
===============================================================================
*/

CREATE OR ALTER PROCEDURE bronze.load_sales
    @year INT,
    @month INT
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    IF @year NOT BETWEEN 1 AND 9999
       OR @month NOT BETWEEN 1 AND 12
        THROW 50001, 'Invalid year or month.', 1;

    DECLARE @month_start DATE = DATEFROMPARTS(@year, @month, 1);
    DECLARE @month_end DATE = DATEADD(MONTH, 1, @month_start);

    DECLARE @file_path NVARCHAR(500) =
        N'C:\Users\Korisnik\Desktop\Briarwake_Ferry_Data_2025 - Data Project\Sales\Sales_'
        + CAST(@year AS NVARCHAR(4))
        + N'_'
        + RIGHT(N'0' + CAST(@month AS NVARCHAR(2)), 2)
        + N'.csv';

    DECLARE @sql NVARCHAR(MAX) = N'
        BULK INSERT bronze.sales
        FROM ''' + REPLACE(@file_path, '''', '''''') + N'''
        WITH (
            FORMAT = ''CSV'',
            FIRSTROW = 2,
            FIELDTERMINATOR = '','',
            FIELDQUOTE = ''"'',
            TABLOCK
        );';

    BEGIN TRY
        BEGIN TRANSACTION;
        DELETE FROM bronze.sales
        WHERE sale_date >= @month_start
          AND sale_date < @month_end;

        EXEC sys.sp_executesql @sql;

        COMMIT TRANSACTION;

        PRINT 'Data loaded successfully for '
            + CAST(@year AS VARCHAR(4))
            + '-'
            + RIGHT('0' + CAST(@month AS VARCHAR(2)), 2);

    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;
        PRINT 'Error during data loading.';
        THROW;
    END CATCH
END;
GO
