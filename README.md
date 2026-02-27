# VIDEO-GAME-SALES-ANALYSIS-EXCEL-SQL-POWER-BI

# Video Game Sales – Excel + SQL + Power BI Case Study

[![Excel](https://img.shields.io/badge/Excel-Pivot%20Tables%20%26%20Charts-green)](https://www.microsoft.com/en-us/microsoft-365/excel)
[![SQL](https://img.shields.io/badge/SQL-Aggregations%20%26%20Rankings-blue)](https://www.microsoft.com/en-us/sql-server)
[![Power BI](https://img.shields.io/badge/Power%20BI-DAX%20%26%20Dashboards-yellow)](https://powerbi.microsoft.com/)
[![AnalytixLabs](https://img.shields.io/badge/Assessment-AnalytixLabs-orange)](https://www.analytixlabs.co.in/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

End-to-end case study analysis of **global video game sales** (1980–2016) using **Excel**, **SQL**, and **Power BI**.
https://github.com/amaan20002023-sketch/VIDEO-GAME-SALES-ANALYSIS-EXCEL-SQL-POWER-BI/blob/main/README.md

Demonstrates:
- Data understanding & cleaning in Excel
- Business-oriented SQL querying & ranking
- Advanced DAX modeling, category/product-level analysis, bulk orders, high-ticket logic, weekend/weekday patterns, and interactive dashboards in Power BI

Perfect portfolio piece for Data Analyst / BI roles.

## Project Overview

Analyzed **~16,500 video games** across platforms, genres, publishers, and regions (NA, EU, JP, Other).  
Key focus areas:

- Top-performing platforms, genres, publishers
- Sales trends over time & by quarter/year
- Publisher contribution & best-seller rankings
- Category-level deep dive: revenue, returns (if applicable), bulk orders, high-ticket orders, weekend vs weekday buying behavior

Built as part of **AnalytixLabs Data Visualization & Analytics Case Study** (180-minute assessment).

## Key Deliverables

| Tool       | Tasks Completed                                                                 | Output Location                     |
|------------|----------------------------------------------------------------------------------|-------------------------------------|
| **Excel**  | Pivot tables, top platforms, quarterly sales, platform-by-year trends, top-3 platforms | `video_excel_file.xlsx` (sheets: Q3, Q4, Q5, top 5) |
| **SQL**    | Publisher total sales ranking, most best-sellers (>10M), % contribution to industry | `sql_queries.sql` + results in Notepad/Excel |
| **Power BI** | Category & Product analysis with 10+ DAX measures (revenue, return rate, bulk %, high-ticket, weekend/weekday) | `Video_Game_Analysis.pbix` |

## Category & Product Analysis (Power BI – Core Showcase)

Implemented the following advanced DAX logic (as shown in your screenshot):

### CATEGORY ANALYSIS
1. Total revenue at category level  
   `Total Revenue = SUMX(Sales, [OrderQuantity] * RELATED(Products[Price]))`

2. Total quantity sold at category level

3. Return rate at category level  
   `Return Rate = DIVIDE([Total Qty Returned], [Total Qty Sold], 0)`

4. Identify category / subcategory / product with highest return rate

5. Total returns & total qty sold per category

6. Number of bulk orders per category (any product qty > 1)  
   `Bulk Orders = CALCULATE(COUNTROWS(Sales), Sales[OrderQuantity] > 1)`

7. % of bulk orders per category

8. High-ticket orders at category level (price > overall average price)

9. Orders placed on weekend vs weekday at category level  
   (Using `WEEKDAY()` + `CALCULATE` filters)

10. Total high-ticket orders at category level

### PRODUCT ANALYSIS
- Drill-down from category → product
- Top products by revenue / quantity / return rate
- Bulk & high-value product identification

## Dataset

- `video_game_sales.csv` → 16,598 rows (Game, Year, Platform, Genre, Publisher, Regional Sales)
- Lookup tables: platforms (31), genres (12), publishers (679)
- Processed Excel file: `video_excel_file.xlsx` with pivots & solutions
- Power BI file: `Video_Game_Analysis.pbix`

**Total global sales in dataset:** ~8,118 million units  
**Top platforms:** PS2, X360, Wii  
**Top genres:** Action, Sports

## How to Explore

1. **Clone the repo**
   ```bash
   

   Excel
Open video_excel_file.xlsx
Check sheets: "Questions", "top 5", "Q3", "Q4", "Q5"

SQL
Import CSVs into any SQL tool
Run sql_queries.sql
See ranked publisher sales, best-sellers (>10M), % contribution

Power BI
Open Video_Game_Analysis.pbix in Power BI Desktop
Refresh data if paths changed
Use slicers: Year, Platform, Genre, Publisher
Explore Category Analysis & Product Analysis pages


Screenshots (Add these to /screenshots folder)

Excel pivot – Top platforms & quarterly sales
SQL output – Publisher ranking & percentage contribution
Power BI – Category Analysis dashboard (the screenshot you shared)
Power BI – Product drill-down matrix
Power BI – Weekend vs Weekday bar chart

Repository Structure
textvideo-game-sales-case-study/
├── video_excel_file.xlsx               # Excel solutions (Q3, Q4, Q5, top 5)
├── sql_queries.sql                     # SQL answers for publisher analysis
├── Video_Game_Analysis.pbix            # Power BI dashboard
├── data/                               # Raw CSVs (sales, platforms, genres, publishers)
├── screenshots/                        # Dashboard & pivot visuals
└── README.md
Learning Outcomes

Excel pivots & time intelligence (quarterly, year-over-year)
SQL aggregations, joins, window functions / ranking
Power BI star schema modeling
Advanced DAX: CALCULATE modifiers, DIVIDE, RELATED, WEEKDAY logic, bulk/high-ticket filtering
Business storytelling: identifying top performers, return risks, behavioral patterns

Future Ideas

Add forecast line (Power BI AI visuals)
Territory / regional contribution map
What-if parameter for target sales
Publish to Power BI Service & embed live report

About
MOHDAMMAD AMAAN
Delhi, India
Aspiring Data Analyst / Power BI Developer
Feel free to fork, star ⭐ or open issues!
Happy gaming & analyzing! 🎮📊
