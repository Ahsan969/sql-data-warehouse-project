/*
-- stucture of bronze schema
-- run this script to redefine structure

*/

-- CRM CUSTOMER INFO
DROP TABLE IF EXISTS bronze.crm_cust_info;
CREATE TABLE bronze.crm_cust_info
(
    cst_id INT,
    cst_key NVARCHAR(50),
    cst_firstname NVARCHAR(50),
    cst_lastname NVARCHAR(50),
    cst_material_status NVARCHAR(50),
    cst_gndr NVARCHAR(50),
    cst_create_date DATE
);

-- CRM PRODUCT INFO
DROP TABLE IF EXISTS bronze.crm_prd_info;
CREATE TABLE bronze.crm_prd_info
(
    prd_id INT,
    prd_key NVARCHAR(50),
    prd_num VARCHAR(50),   -- FIX HERE
    prd_cost INT,
    prd_line NVARCHAR(50),
    prd_start_dt DATE,
    prd_end_dt DATE
);

-- CRM SALES DETAILS
DROP TABLE IF EXISTS bronze.crm_sales_details;
CREATE TABLE bronze.crm_sales_details
(
    sls_ord_num    VARCHAR(50),
    sls_prd_key    VARCHAR(50),
    sls_cust_id    VARCHAR(50),
    sls_order_dt   VARCHAR(50),  -- FIX
    sls_ship_dt    VARCHAR(50),  -- FIX
    sls_due_dt     VARCHAR(50),  -- FIX
    sls_sales      VARCHAR(50),
    sls_quantity   VARCHAR(50),
    sls_price      VARCHAR(50)
);

-- ERP CUSTOMER INFO
DROP TABLE IF EXISTS bronze.erp_customer_info;
CREATE TABLE bronze.erp_customer_info
(
    CID   NVARCHAR(50),
    BDATE DATE,
    GEN   VARCHAR(10)
);

-- ERP CUSTOMER LOCATION
DROP TABLE IF EXISTS bronze.erp_customer_location;
CREATE TABLE bronze.erp_customer_location
(
    CID   NVARCHAR(50),
    CNTRY VARCHAR(50)
);

-- ERP PRODUCT CATEGORIES
DROP TABLE IF EXISTS bronze.erp_product_categories;
CREATE TABLE bronze.erp_product_categories
(
    ID           NVARCHAR(50),
    CAT          VARCHAR(100),
    SUBCAT       VARCHAR(100),
    MAINTENANCE  VARCHAR(50)
);

