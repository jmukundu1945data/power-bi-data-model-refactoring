# Methodology: MIS Data Refactor Approach

## Overview

The refactoring of the iYouth dataset followed a structured, multi-stage methodology aligned with best practices in Management Information Systems (MIS), data engineering, and M&E system design.

The approach focused on transforming raw, inconsistent data into a reliable, scalable, and analytics-ready system.

---

# 1. Data Assessment & Diagnostic Analysis

The first step involved a detailed review of the raw dataset to identify structural and quality issues.

Key activities included:

* Profiling the dataset to understand variable types and distributions
* Identifying duplicate records using grouping and frequency analysis
* Assessing consistency of categorical variables (e.g. Commodity, Gender, Component)
* Evaluating completeness and reliability of key indicators

**Outcome:**

* Clear identification of data quality issues
* Understanding of inconsistencies and structural weaknesses
* Baseline for redesign

---

# 2. Grain Definition

A critical step in the redesign was defining the correct level of detail (grain) for the dataset.

The following grain was established:

> **One record represents a unique ParticipantID, ComponentID, and YearKey combination**

This ensured:

* Each row represents a single analytical event
* Consistency across all measures and aggregations
* Elimination of ambiguity in reporting

**Outcome:**

* Foundation for all subsequent transformations and modeling

---

# 3. Data Cleaning & Standardization

Data transformation rules were applied to ensure consistency and usability:

### 3.1 Categorical Standardization

* Harmonization of Commodity values using transformation logic
* Standardization of Gender and Component values
* Removal of inconsistent spellings and casing

### 3.2 Binary Field Normalization

* Conversion of Yes/No/NA fields into structured formats:

  * Yes → 1
  * No → 0
  * NA → NULL

### 3.3 Data Type Enforcement

* Conversion of numeric fields to appropriate data types
* Cleaning of text fields (trimming, removing invalid characters)

**Outcome:**

* Clean, consistent dataset suitable for modeling

---

# 4. Deduplication Strategy

Duplicate records were removed using SQL window functions:

* Applied `ROW_NUMBER()` over defined grain
* Retained only the first valid record per partition
* Removed redundant entries

This ensured that:

* Each analytical unit appears only once
* Metrics are not inflated

**Outcome:**

* Accurate and reliable dataset

---

# 5. Dimensional Modeling (Star Schema Design)

A star schema was designed to support scalable reporting and analytics.

### 5.1 Fact Table

* FactParticipant: contains measurable events and foreign keys

### 5.2 Dimension Tables

* DimProvince
* DimComponent
* DimCommodity
* DimGender
* DimYear

### 5.3 Design Principles Applied

* Separation of facts and descriptive attributes
* Use of surrogate keys for relationships
* Simplification of analytical queries

**Outcome:**

* Efficient, scalable MIS architecture
* Optimized for Power BI and reporting tools

---

# 6. Data Integration & Key Mapping

Relationships between fact and dimension tables were established through:

* Mapping of cleaned categorical values to dimension tables
* Replacement of text fields with surrogate keys
* Validation of referential integrity

**Outcome:**

* Strong relational structure
* Consistent data across all tables

---

# 7. Semantic Modeling (Power BI)

The cleaned and structured dataset was imported into Power BI for analytical modeling.

Key activities included:

* Establishing relationships between fact and dimensions
* Creating a centralized measure layer
* Hiding technical fields to simplify the user experience

---

# 8. DAX Measure Development

Measures were designed to ensure accurate and reusable calculations:

* DISTINCTCOUNT used for participant-level metrics
* SUM used for additive indicators (e.g. Jobs Created)
* CALCULATE used for filtered measures (e.g. Female Participants)
* DIVIDE used for ratio calculations

**Outcome:**

* Consistent and reliable KPIs
* Reusable analytical logic

---

# 9. Dashboard Design & Reporting

A structured dashboard was developed to present key insights:

* KPI cards for high-level indicators
* Trend analysis across program years
* Disaggregation by gender, geography, and commodity
* Interactive filters for user-driven analysis

Design principles applied:

* Clarity and simplicity
* Alignment with M&E reporting needs
* Focus on decision-making

**Outcome:**

* User-friendly reporting interface
* Improved accessibility of insights

---

# 10. MIS Design Principles Applied

Throughout the process, key MIS principles were applied:

* Data quality assurance through cleaning and validation
* Structured data flows from raw to analytical layers
* Separation of storage, transformation, and reporting layers
* Scalability for future system expansion
* Alignment with M&E reporting requirements

---

# 🎯 Conclusion

The methodology ensured a systematic transformation from raw data to a fully functional MIS, capable of supporting:

* Accurate performance tracking
* Evidence-based decision making
* Scalable reporting and analytics

This structured approach can be adapted to similar M&E systems in government and development programs.
