/*
===============================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===============================================================================
Script Purpose:
    This stored procedure loads monthly CSV files into the four
    Bronze tables: sales, travel, boarding, and fuel.

Parameters:
    @year  - Reporting year
    @month - Reporting month

Usage Example:
    EXEC bronze.load_bronze @year = 2025, @month = 1;
===============================================================================
*/

CREATE OR ALTER PROCEDURE bronze.load_bronze
    @year INT,
    @month INT
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    -- Validate parameters
    IF @year IS NULL
       OR @month IS NULL
       OR @year NOT BETWEEN 1 AND 9999
       OR @month NOT BETWEEN 1 AND 12
        THROW 50001, 'Invalid year or month.', 1;

    -- Generate reporting period
    DECLARE @reporting_period DATE =
        DATEFROMPARTS(@year, @month, 1);

    -- Generate file name period
    DECLARE @period VARCHAR(7) =
        CAST(@year AS VARCHAR(4))
        + '_'
        + RIGHT('0' + CAST(@month AS VARCHAR(2)), 2);

    DECLARE @file_path NVARCHAR(500);
    DECLARE @sql NVARCHAR(MAX);

    BEGIN TRY
        BEGIN TRANSACTION;

        -- =================================================
        -- Load Sales
        -- =================================================

        SELECT TOP (0) *
        INTO #sales_import
        FROM bronze.sales;

        ALTER TABLE #sales_import
        DROP COLUMN reporting_period;

        SET @file_path =
            N'C:\Users\Korisnik\Desktop\Briarwake_Ferry_Data_2025 - Data Project\Sales\Sales_'
            + @period + N'.csv';

        SET @sql = N'
        BULK INSERT #sales_import
        FROM ''' + REPLACE(@file_path, '''', '''''') + N'''
        WITH (
            FORMAT = ''CSV'',
            FIRSTROW = 2,
            FIELDTERMINATOR = '','',
            FIELDQUOTE = ''"'',
            TABLOCK
        );';

        EXEC sys.sp_executesql @sql;

        IF NOT EXISTS (SELECT 1 FROM #sales_import)
            THROW 50002, 'Sales CSV is empty.', 1;

        DELETE FROM bronze.sales
        WHERE reporting_period = @reporting_period;

        INSERT INTO bronze.sales
        SELECT *, @reporting_period
        FROM #sales_import;

        PRINT 'Sales loaded successfully.';

        -- =================================================
        -- Load Travel
        -- =================================================

        SELECT TOP (0) *
        INTO #travel_import
        FROM bronze.travel;

        ALTER TABLE #travel_import
        DROP COLUMN reporting_period;

        SET @file_path =
            N'C:\Users\Korisnik\Desktop\Briarwake_Ferry_Data_2025 - Data Project\Travel\Travel_'
            + @period + N'.csv';

        SET @sql = N'
        BULK INSERT #travel_import
        FROM ''' + REPLACE(@file_path, '''', '''''') + N'''
        WITH (
            FORMAT = ''CSV'',
            FIRSTROW = 2,
            FIELDTERMINATOR = '','',
            FIELDQUOTE = ''"'',
            TABLOCK
        );';

        EXEC sys.sp_executesql @sql;

        IF NOT EXISTS (SELECT 1 FROM #travel_import)
            THROW 50003, 'Travel CSV is empty.', 1;

        DELETE FROM bronze.travel
        WHERE reporting_period = @reporting_period;

        INSERT INTO bronze.travel
        SELECT *, @reporting_period
        FROM #travel_import;

        PRINT 'Travel loaded successfully.';

        -- =================================================
        -- Load Boarding
        -- =================================================

        SELECT TOP (0) *
        INTO #boarding_import
        FROM bronze.boarding;

        ALTER TABLE #boarding_import
        DROP COLUMN reporting_period;

        SET @file_path =
            N'C:\Users\Korisnik\Desktop\Briarwake_Ferry_Data_2025 - Data Project\Boarding\Boarding_'
            + @period + N'.csv';

        SET @sql = N'
        BULK INSERT #boarding_import
        FROM ''' + REPLACE(@file_path, '''', '''''') + N'''
        WITH (
            FORMAT = ''CSV'',
            FIRSTROW = 2,
            FIELDTERMINATOR = '','',
            FIELDQUOTE = ''"'',
            TABLOCK
        );';

        EXEC sys.sp_executesql @sql;

        IF NOT EXISTS (SELECT 1 FROM #boarding_import)
            THROW 50004, 'Boarding CSV is empty.', 1;

        DELETE FROM bronze.boarding
        WHERE reporting_period = @reporting_period;

        INSERT INTO bronze.boarding
        SELECT *, @reporting_period
        FROM #boarding_import;

        PRINT 'Boarding loaded successfully.';

        -- =================================================
        -- Load Fuel
        -- =================================================

        SELECT TOP (0) *
        INTO #fuel_import
        FROM bronze.fuel;

        ALTER TABLE #fuel_import
        DROP COLUMN reporting_period;

        SET @file_path =
            N'C:\Users\Korisnik\Desktop\Briarwake_Ferry_Data_2025 - Data Project\Fuel\Fuel_'
            + @period + N'.csv';

        SET @sql = N'
        BULK INSERT #fuel_import
        FROM ''' + REPLACE(@file_path, '''', '''''') + N'''
        WITH (
            FORMAT = ''CSV'',
            FIRSTROW = 2,
            FIELDTERMINATOR = '','',
            FIELDQUOTE = ''"'',
            TABLOCK
        );';

        EXEC sys.sp_executesql @sql;

        IF NOT EXISTS (SELECT 1 FROM #fuel_import)
            THROW 50005, 'Fuel CSV is empty.', 1;

        DELETE FROM bronze.fuel
        WHERE reporting_period = @reporting_period;

        INSERT INTO bronze.fuel
        SELECT *, @reporting_period
        FROM #fuel_import;

        PRINT 'Fuel loaded successfully.';

        -- Confirm all four loads
        COMMIT TRANSACTION;

        PRINT 'Bronze Layer loaded successfully for '
            + REPLACE(@period, '_', '-');
    END TRY

    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;
        PRINT 'Error during Bronze Layer loading.';
        THROW;
    END CATCH
END;
GO
