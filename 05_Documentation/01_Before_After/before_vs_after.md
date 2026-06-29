# Before vs After: MIS Data Model Refactor

## Overview

This project demonstrates the transformation of a Monitoring & Evaluation (M&E) dataset with data quality and modelling limitations into a robust, analytics-ready Management Information System (MIS).

The original dataset exhibited multiple data quality and structural issues that limited its usefulness for reporting, decision-making, and performance tracking. A complete redesign was undertaken to establish a reliable data model aligned with best practices in MIS and analytics engineering.

---

# 🔴 BEFORE: Legacy Data & Model Issues

## 1. Undefined Data Grain

The dataset lacked a clearly defined unit of analysis.

* A single participant appeared multiple times
* Multiple records existed for the same participant within the same year and component
* Attributes such as age varied across records for the same individual

**Impact:**

* Inconsistent and unreliable reporting
* Inability to produce accurate participant counts

---

## 2. Duplicate Records

Significant duplication was observed:

* Repeated entries for identical ParticipantID, Component, and Year combinations
* No constraints or validation rules to prevent duplicate capture

**Impact:**

* Inflated metrics (e.g. participant counts, outcomes)
* Loss of data credibility

---

## 3. Inconsistent Categorical Data

Key variables contained inconsistent and unstandardized values:

Examples:

* Poulry / Poultry
* HORTCULTURE / Horticulture
* Soybeans / SOYBEAN
* Aqualculture / Aquaculture

**Impact:**

* Fragmented reporting categories
* Incorrect aggregations in analysis

---

## 4. Absence of Data Validation Rules

Fields were captured as free text instead of controlled values:

* Commodity
* Component
* Gender

Binary fields were stored as:

* Yes / No / NA (text)

**Impact:**

* No enforcement of data quality at entry point
* Difficult downstream transformation and analysis

---

## 5. Flat Table Structure (No Data Model)

The system relied on a single wide table:

* No separation between facts and dimensions
* No relationships or normalization
* No reusable structure for analytics

**Impact:**

* Limited reporting readiness
* Limited scalability
* Complex and error-prone reporting logic

---

## 6. Non-Standardized Reporting Layer

Due to the issues above:

* Measures relied on simple counts instead of distinct counts
* Metrics were inflated and inconsistent
* No standardized calculation layer (DAX)

**Impact:**

* Misleading dashboards
* Lack of trust in outputs

---

# 🟢 AFTER: Refactored MIS & Analytical Model

## 1. Defined Data Grain

A clear grain was established:

> **One row = ParticipantID + ComponentID + YearKey**

**Outcome:**

* Consistent and reliable unit of analysis
* Accurate aggregation across all reports

---

## 2. Deduplication Logic Implemented

Duplicates were removed using SQL window functions:

* `ROW_NUMBER()` used to isolate and retain valid records
* Redundant entries eliminated

**Outcome:**

* Clean, non-redundant dataset
* Accurate participant-level reporting

---

## 3. Standardized Data Values

Categorical variables were cleaned and standardized:

* Commodity values harmonized using transformation logic
* Consistent naming conventions applied
* Case and spelling inconsistencies resolved

**Outcome:**

* Reliable grouping and aggregation
* Improved analytical consistency

---

## 4. Structured Data Types & Flags

Binary fields were converted to structured formats:

* Yes → 1
* No → 0
* NA → NULL

**Outcome:**

* Improved analytical flexibility
* Simplified filtering and calculations

---

## 5. Star Schema Data Model

A proper dimensional model was implemented:

### Fact Table

* FactParticipant

### Dimension Tables

* DimProvince
* DimComponent
* DimCommodity
* DimGender
* DimYear

**Outcome:**

* Scalable MIS architecture
* Clear separation of facts and attributes
* Optimized for reporting and analytics

---

## 6. Use of Surrogate Keys

Text-based fields were replaced with numeric keys:

* Improved performance
* Enforced relationships between tables

**Outcome:**

* Efficient joins
* Strong referential structure

---

## 7. Localized and Contextualized Design

The model was adapted to the Zambian context:

* State → Province transformation
* Geographic mapping aligned to realistic distributions

**Outcome:**

* Context-relevant reporting
* Improved stakeholder alignment

---

## 8. Robust Analytical Layer (DAX)

A proper measure layer was introduced in Power BI:

* DISTINCTCOUNT for participant metrics
* SUM for additive measures
* CALCULATE for filtered indicators

**Outcome:**

* Accurate KPIs
* Reusable and standardized calculations

---

## 9. Professional Dashboard Output

A structured Power BI dashboard was developed:

* KPI indicators (Participants, Jobs, Impact)
* Trend analysis (Year-based)
* Disaggregation (Gender, Province, Commodity)
* Interactive filtering

**Outcome:**

* Decision-ready reporting
* Clear and intuitive data visualization

---

# 🎯 Conclusion

The refactoring transformed an unreliable dataset into a structured, scalable MIS aligned with best practices in:

* Data quality management
* Dimensional modeling
* Analytical reporting

This approach ensures that the system can support:

* Evidence-based decision making
* Performance tracking
* Future system integration and scalability

---

# 🔑 Key Value Demonstrated

This project showcases the ability to:

* Diagnose data quality and structural issues
* Redesign datasets into robust MIS architectures
* Implement analytics-ready data models
* Deliver reliable reporting systems aligned with M&E requirements
