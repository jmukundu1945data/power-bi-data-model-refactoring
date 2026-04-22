# iYouth MIS Data Model Refactor

## Overview
This project demonstrates the redesign of a poorly structured M&E dataset into a robust, analytics-ready MIS system.

The original dataset contained:
- Duplicate participant records
- Inconsistent categorical values (Commodity, Gender, etc.)
- Poorly defined grain
- Weak reporting structure

## Solution
The system was refactored using:

- SQL Server → Data cleaning, deduplication, dimensional modeling
- Power BI → Semantic model, DAX measures, dashboard

## Final Architecture

Fact Table:
- FactParticipant

Dimensions:
- DimProvince
- DimComponent
- DimCommodity
- DimGender
- DimYear

## Key Improvements

- Defined grain: ParticipantID + ComponentID + YearKey
- Removed duplicates using ROW_NUMBER()
- Standardized categorical variables
- Implemented star schema
- Built accurate DAX measures (DISTINCTCOUNT, CALCULATE)

## Outputs

- Clean analytical dataset
- Power BI dashboard (KPIs, trends, breakdowns)
- Structured MIS-ready data model

## Purpose

This project demonstrates capability to design and implement robust MIS systems aligned with M&E requirements.

## Before vs After (Visual Evidence)

### Data Model Transformation

**Before (Unstructured Model)**  
![Before Model](03_Data_Model/Model_Screenshots/model_before.png)

**After (Star Schema Design)**  
![After Model](03_Data_Model/Model_Screenshots/model_after.png)

---

### Dashboard Transformation

**Before (Inconsistent Reporting)**  
![Before Dashboard](04_PowerBI/Screenshots/dashboard_before.png)

**After (Structured MIS Dashboard)**  
![After Dashboard](04_PowerBI/Screenshots/dashboard_after.png)