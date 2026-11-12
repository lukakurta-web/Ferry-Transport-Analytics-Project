# Ferry Operations Data Warehouse & Analytics
**End-to-End Data Warehouse, Data Analytics & Business Intelligence Project**
This project demonstrates the design and implementation of a comprehensive data warehouse and business intelligence solution for ferry transportation operations.


## 📖 Project Overview

The project covers the complete data analytics lifecycle:

- **Data Architecture:** Design a scalable SQL Server data warehouse using Bronze, Silver, and Gold layers.
- **Data Integration:** Consolidate monthly Excel reports from multiple operational and financial data sources across 2025, 2026, and future periods.
- **ETL Development:** Develop SQL-based processes for data ingestion, cleansing, standardization, transformation, and validation.
- **Data Modeling:** Implement a Star Schema consisting of fact and dimension tables optimized for analytical reporting.
- **SQL Analytics:** Perform exploratory and advanced SQL analysis to identify revenue trends, passenger patterns, and operational performance.
- **Business Intelligence:** Develop interactive Power BI dashboards using Power Query, DAX, and dimensional data models.

## 🎯 Project Objectives

The main goal is to transform fragmented operational and financial data into a structured, reliable, and reusable analytical environment.

The project focuses on four key analytical areas:

1. **Ticket Sales Analysis:** Evaluate sales revenue, ticket volumes, average ticket prices, and sales performance based on transaction dates.
2. **Travel Revenue Analysis:** Analyze revenue according to travel dates, routes, and transportation lines, independently of ticket purchase dates.
3. **Passenger Analysis:** Monitor passenger boarding volumes, passenger categories, and transportation demand across routes and periods.
4. **Fuel Cost Analysis:** Analyze fuel purchases, quantities, unit prices, and costs across vessels and reporting periods.

The final solution will support integrated reporting and operational performance evaluation, including revenue per passenger and fuel-related efficiency indicators where sufficient data is available.

## 🏗️ Data Warehouse Architecture

The data warehouse follows a three-layer Medallion Architecture:

### 🥉 Bronze Layer — Raw Data

Stores source data imported from Excel files while preserving its original structure and traceability.

- Ingest historical and newly available monthly reports.
- Maintain separate source tables for ticket sales, travel revenue, passenger boarding, and fuel records.
- Preserve source information, reporting periods, and ingestion metadata.
- Establish a reliable foundation for subsequent transformations.

### 🥈 Silver Layer — Cleaned & Standardized Data

Transforms raw data into consistent, validated datasets suitable for integration.

- Clean missing, invalid, and inconsistent values.
- Standardize data types, date formats, identifiers, and naming conventions.
- Identify and handle duplicate records.
- Validate revenue totals and reconcile overlapping reporting sources.
- Apply business rules to improve data consistency and reliability.

### 🥇 Gold Layer — Business-Ready Data

Provides structured analytical datasets optimized for SQL queries and Power BI reporting.

- Develop fact tables for ticket transactions, passenger boarding, and fuel records.
- Create shared dimension tables for dates, routes, transportation lines, vessels, and ticket categories.
- Implement a Star Schema with clearly defined relationships.
- Support separate sales-date and travel-date revenue perspectives without double-counting.
- Deliver reusable analytical datasets for business intelligence and performance monitoring.

## 📊 Analytics & Business Intelligence

Data Analytics using SQL:

**Exploratory Data Analysis**
- Data exploration
- Measures
- Magnitude
- Ranking

**Advanced Analytics**
- Trends
- Cumulative analysis
- Performance analysis
- Part-to-whole
- Data segmentation
- Final reporting

The final Power BI solution will provide interactive reporting across three main areas:

**Sales Performance Dashboard**
- Revenue and ticket sales trends
- Monthly and yearly sales comparisons
- Average revenue per ticket
- Sales distribution across routes and lines

**Travel & Passenger Performance Dashboard**
- Revenue based on travel dates
- Passenger boarding trends
- Revenue per passenger
- Route and transportation line performance

**Fuel & Operational Performance Dashboard**
- Fuel purchase volumes and costs
- Average fuel purchase price per liter
- Fuel costs by vessel and period
- Operational efficiency indicators and cost allocation analysis where supported by the available data

## 🛠️ Technologies & Tools

| Technology | Purpose |
|---|---|
| SQL Server | Data warehouse storage and management |
| SQL Server Management Studio (SSMS) | SQL development, ETL processes, and data analysis |
| T-SQL | Data transformation, validation, and analytical queries |
| Power BI | Data visualization and business intelligence |
| Power Query | Data preparation and transformation |
| DAX | Financial and operational KPI calculations |
| Microsoft Excel | Source data files |
| Git & GitHub | Version control, documentation, and project management |

## 🚀 Project Requirements

### Data Engineering

**Objective:** Build a centralized, scalable SQL Server data warehouse that consolidates historical ferry transportation data.

**Specifications:**

- **Data Sources:** Monthly Excel reports containing ticket sales, travel revenue, passenger boarding records, and fuel purchases.
- **Historical Data:** Support multiple reporting years, beginning with 2025 and 2026, with the ability to incorporate additional periods.
- **Data Quality:** Implement cleansing, standardization, duplicate detection, and validation procedures.
- **Data Integration:** Reconcile different reporting perspectives and establish consistent business definitions.
- **Data Modeling:** Design fact and dimension tables using Star Schema principles.
- **Automation:** Develop repeatable data ingestion and transformation processes.
- **Documentation:** Maintain clear documentation of the architecture, SQL scripts, transformation logic, and analytical model.

### Data Analytics & Business Intelligence

**Objective:** Deliver actionable insights into financial and operational performance.

**Specifications:**

- Analyze sales and travel revenue using separate date dimensions.
- Compare revenue, passenger volumes, and operational activity across periods.
- Identify trends in fuel purchases and costs.
- Develop reusable DAX measures and interactive Power BI dashboards.
- Support year-over-year comparisons and management reporting.
- Ensure consistency between source reports, SQL data, and Power BI results.

## 🎯 Expected Outcome

The completed project will deliver an end-to-end data warehouse and analytics solution that transforms disconnected Excel reports into a centralized, structured, and scalable analytical system.
