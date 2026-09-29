# 2026 AI Job Market & Salary Benchmarking (SQL Analysis)

## 📌 Project Overview
This project analyzes global AI job market trends, compensation structures, and demand metrics across industries, experience levels, company sizes, and work arrangements. Using Advanced MySQL queries, this analysis provides actionable data on high-growth AI roles and compensation premiums.

---

## 🛠️ Data Architecture & Technologies Used
* **Database Management System:** MySQL Workbench
* **Dataset:** 2026 AI Jobs Market Dataset
* **Key SQL Techniques:**
  * CTEs (`WITH` clauses)
  * Window Functions (`DENSE_RANK() OVER (PARTITION BY ...)`)
  * Aggregations & Grouping (`GROUP BY`, `HAVING`)
  * Conditional Aggregations (`SUM(CASE WHEN ... THEN 1 ELSE 0 END)`)
  * Data Filtering & Rounding Functions

---

## 🔍 Key Queries & Findings

### 1. High-Growth & In-Demand AI Roles
* **MLOps Engineers** achieved the highest YoY demand growth (**60.62%**) with an average salary of **$215,423**.
* **LLM Engineers** showed the highest volume of postings (52) with an average salary of **$237,057**.

### 2. Specialized LLM Premium vs. Standard Roles
* Specialized LLM roles command demand scores above **92** across all company sizes.
* **Big Tech (FAANG+)** leads compensation for specialized LLM roles at **$252,358/yr**.

### 3. Remote Work Compensation Matrix
* **Fully Remote** roles yield the highest average annual compensation (**$197,967**) and highest AI premium (**11.25%**).

### 4. Industry Salary Rankings
* **Retail** and **Technology** yield the highest individual average salaries for Lead AI Solutions Architects (**$384,000**).

### 5. Experience & Education Benchmark vs. Elite Tier Roles ($300k+)
* Experience is the primary driver for $300k+ compensation: **32.35%** of Lead PhD roles reach the Elite Tier, compared to **0%** for entry-level candidates across all education backgrounds.

---

## 🚀 How to Run
1. Import `ai_jobs_market_2025_2026.csv` into MySQL Workbench.
2. Run `ai_market_analysis.sql` script to execute queries 1 through 5.
