/*
===============================================================================
DDL Script: Create Silver Tables
===============================================================================
Script Purpose:
    This script creates tables in the 'silver' schema, dropping existing tables
    if they already exist.
      Run this script to re-define the DDL structure of 'silver' Tables
===============================================================================
*/

IF OBJECT_ID('silver.sales', 'U') IS NOT NULL
    DROP TABLE silver.sales;
GO

CREATE TABLE silver.sales (
    sale_date           DATE,
    invoice_id          VARCHAR(50),
    customer            VARCHAR(50),
    invoice_timestamp   DATETIME2,
    ticket_id           VARCHAR(50),
    payment_method      VARCHAR(50),
    travel_date         DATE,
    departure_time      TIME,
    ferry_route         VARCHAR(50),
    departure_port      VARCHAR(50),
    destination_port    VARCHAR(50),
    booking_reference   VARCHAR(50),
    order_id            VARCHAR(50),
    line_code           VARCHAR(50),
    ship_name           VARCHAR(50),
    ticket_category     VARCHAR(50),
    invoice_note        VARCHAR(50),
    ticket_note         VARCHAR(50),
    sales_partner       VARCHAR(50),
    quantity            INT,
    ticket_price        DECIMAL(18,2),
    revenue             DECIMAL(18,2),
    vat                 DECIMAL(18,2),
    port_fee            DECIMAL(18,2),
    transaction_id      VARCHAR(50),
    transaction_type    VARCHAR(50),
    reporting_period    DATE
);
GO


IF OBJECT_ID('silver.travel', 'U') IS NOT NULL
    DROP TABLE silver.travel;
GO

CREATE TABLE silver.travel (
    sale_date           DATE,
    invoice_id          VARCHAR(50),
    customer            VARCHAR(50),
    invoice_timestamp   DATETIME2,
    ticket_id           VARCHAR(50),
    payment_method      VARCHAR(50),
    travel_date         DATE,
    departure_time      TIME,
    ferry_route         VARCHAR(50),
    departure_port      VARCHAR(50),
    destination_port    VARCHAR(50),
    booking_reference   VARCHAR(50),
    order_id            VARCHAR(50),
    line_code           VARCHAR(50),
    ship_name           VARCHAR(50),
    ticket_category     VARCHAR(50),
    invoice_note        VARCHAR(50),
    ticket_note         VARCHAR(50),
    sales_partner       VARCHAR(50),
    quantity            INT,
    ticket_price        DECIMAL(18,2),
    revenue             DECIMAL(18,2),
    vat                 DECIMAL(18,2),
    port_fee            DECIMAL(18,2),
    transaction_id      VARCHAR(50),
    transaction_type    VARCHAR(50),
    reporting_period    DATE
);
GO


IF OBJECT_ID('silver.boarding', 'U') IS NOT NULL
    DROP TABLE silver.boarding;
GO

CREATE TABLE silver.boarding (
    ferry_route             VARCHAR(50),
    accessibility_discount  INT,
    agency_adult            INT,
    assisted_travel         INT,
    bicycle                 INT,
    child                   INT,
    companion               INT,
    complimentary           INT,
    complimentary_extra     INT,
    concession              INT,
    infant_pass             INT,
    onboard_pet             INT,
    parent_and_infant       INT,
    pet                     INT,
    promotional_adult       INT,
    promotional_child_a     INT,
    promotional_child_b     INT,
    promotional_fare         INT,
    public_service          INT,
    resident_concession     INT,
    resident_pass           INT,
    standard_adult          INT,
    student                 INT,
    toddler                 INT,
    passengers              INT,
    ancillary_units         INT,
    total_units             INT,
    vat                     DECIMAL(18,2),
    port_fee                DECIMAL(18,2),
    revenue                 DECIMAL(18,2),
    reporting_period        DATE
);
GO


IF OBJECT_ID('silver.fuel', 'U') IS NOT NULL
    DROP TABLE silver.fuel;
GO

CREATE TABLE silver.fuel (
    invoice_id              VARCHAR(50),
    invoice_status          VARCHAR(50),
    customer                VARCHAR(50),
    invoice_amount          DECIMAL(18,2),
    currency                VARCHAR(50),
    invoice_date            DATE,
    due_date                DATE,
    payment_terms_days      INT,
    web_order_id            VARCHAR(50),
    purchase_order_id       VARCHAR(50),
    delivery_id             VARCHAR(50),
    delivered_litres        INT,
    delivered_litres_15c    INT,
    delivered_kilograms     INT,
    delivered_pieces        INT,
    ship_name               VARCHAR(50),
    delivery_port           VARCHAR(50),
    loading_date            DATE,
    product_type            VARCHAR(50),
    unit_price_incl_vat     DECIMAL(18,7),
    unit_price_excl_vat     DECIMAL(18,7),
    reporting_period        DATE
);
GO
