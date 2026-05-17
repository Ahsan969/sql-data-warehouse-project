
EXECUTE  bronze.load_bronze

CREATE OR ALTER PROCEDURE bronze.load_bronze
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @StartTime DATETIME = GETDATE();
    DECLARE @TableStart DATETIME, @TableEnd DATETIME;

    PRINT '=================================================';
    PRINT ' BRONZE LAYER EXECUTION STARTED';
    PRINT 'START TIME: ' + CONVERT(VARCHAR, @StartTime, 120);
    PRINT '=================================================';

    BEGIN TRY

    -------------------------------------------------
    -- CRM CUSTOMER INFO
    -------------------------------------------------
    PRINT 'Processing crm_cust_info...';
    SET @TableStart = GETDATE();

    PRINT 'Truncating crm_cust_info';
    TRUNCATE TABLE bronze.crm_cust_info;

    PRINT 'Inserting crm_cust_info';
    BULK INSERT bronze.crm_cust_info
    FROM 'D:\sql\sql warehouse project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
    WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK);

    SET @TableEnd = GETDATE();

    PRINT 'crm_cust_info completed in '
          + CAST(DATEDIFF(SECOND, @TableStart, @TableEnd) AS VARCHAR)
          + ' seconds';

    PRINT '-------------------------------------------------';

    -------------------------------------------------
    -- CRM PRODUCT INFO
    -------------------------------------------------
    PRINT 'Processing crm_prd_info...';
    SET @TableStart = GETDATE();

    PRINT 'Truncating crm_prd_info';
    TRUNCATE TABLE bronze.crm_prd_info;

    PRINT 'Inserting crm_prd_info';
    BULK INSERT bronze.crm_prd_info
    FROM 'D:\sql\sql warehouse project\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
    WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK);

    SET @TableEnd = GETDATE();

    PRINT 'crm_prd_info completed in '
          + CAST(DATEDIFF(SECOND, @TableStart, @TableEnd) AS VARCHAR)
          + ' seconds';

    PRINT '-------------------------------------------------';

    -------------------------------------------------
    -- CRM SALES DETAILS
    -------------------------------------------------
    PRINT 'Processing crm_sales_details...';
    SET @TableStart = GETDATE();

    PRINT 'Truncating crm_sales_details';
    TRUNCATE TABLE bronze.crm_sales_details;

    PRINT 'Inserting crm_sales_details';
    BULK INSERT bronze.crm_sales_details
    FROM 'D:\sql\sql warehouse project\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
    WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK);

    SET @TableEnd = GETDATE();

    PRINT 'crm_sales_details completed in '
          + CAST(DATEDIFF(SECOND, @TableStart, @TableEnd) AS VARCHAR)
          + ' seconds';

    PRINT '-------------------------------------------------';

    -------------------------------------------------
    -- ERP CUSTOMER INFO
    -------------------------------------------------
    PRINT 'Processing erp_customer_info...';
    SET @TableStart = GETDATE();

    PRINT 'Truncating erp_customer_info';
    TRUNCATE TABLE bronze.erp_customer_info;

    PRINT 'Inserting erp_customer_info';
    BULK INSERT bronze.erp_customer_info
    FROM 'D:\sql\sql warehouse project\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
    WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK);

    SET @TableEnd = GETDATE();

    PRINT 'erp_customer_info completed in '
          + CAST(DATEDIFF(SECOND, @TableStart, @TableEnd) AS VARCHAR)
          + ' seconds';

    PRINT '-------------------------------------------------';

    -------------------------------------------------
    -- ERP CUSTOMER LOCATION
    -------------------------------------------------
    PRINT 'Processing erp_customer_location...';
    SET @TableStart = GETDATE();

    PRINT 'Truncating erp_customer_location';
    TRUNCATE TABLE bronze.erp_customer_location;

    PRINT 'Inserting erp_customer_location';
    BULK INSERT bronze.erp_customer_location
    FROM 'D:\sql\sql warehouse project\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
    WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK);

    SET @TableEnd = GETDATE();

    PRINT 'erp_customer_location completed in '
          + CAST(DATEDIFF(SECOND, @TableStart, @TableEnd) AS VARCHAR)
          + ' seconds';

    PRINT '-------------------------------------------------';

    -------------------------------------------------
    -- ERP PRODUCT CATEGORIES
    -------------------------------------------------
    PRINT 'Processing erp_product_categories...';
    SET @TableStart = GETDATE();

    PRINT 'Truncating erp_product_categories';
    TRUNCATE TABLE bronze.erp_product_categories;

    PRINT 'Inserting erp_product_categories';
    BULK INSERT bronze.erp_product_categories
    FROM 'D:\sql\sql warehouse project\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
    WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK);

    SET @TableEnd = GETDATE();

    PRINT 'erp_product_categories completed in '
          + CAST(DATEDIFF(SECOND, @TableStart, @TableEnd) AS VARCHAR)
          + ' seconds';

    -------------------------------------------------
    -- TOTAL TIME
    -------------------------------------------------
    PRINT '=================================================';
    PRINT ' BRONZE LAYER SUCCESSFULLY COMPLETED';
    PRINT 'TOTAL TIME (SECONDS): '
          + CAST(DATEDIFF(SECOND, @StartTime, GETDATE()) AS VARCHAR);
    PRINT '=================================================';

    END TRY

    BEGIN CATCH
        PRINT '=================================================';
        PRINT ' ERROR OCCURRED';
        PRINT ERROR_MESSAGE();
        PRINT '=================================================';
    END CATCH
END;
