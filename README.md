# olympic-Data-EDA-project.sql
The data contains 120 years of olympics history. There are 2 daatsets  1- athletes : it has information about all the players participated in olympics 2- athlete_events : it has information about all the events happened over the year.(athlete id refers to the id column in athlete table)


# Olympic Medal Analysis

## 📊 Dataset Description

This project uses a dataset containing historical Olympic medal records. The dataset includes the following key fields:

- **Team**: Name of the participating country or club.
- **Medals Won**: Number of gold medals earned.
- **Year**: Year in which the medals were won.
- **Athlete Name (if applicable)**: Name of the individual athlete.
- **Medal Type**: (Gold, Silver, Bronze) — used in some queries.

The dataset spans multiple decades and includes both modern and early Olympic data.

## 🧑‍💻 Language and Tools

- **Language**: SQL (Structured Query Language)
- **Platform**: Microsoft SQL Server
- **Features Used**:
  - Common Table Expressions (CTEs)
  - Aggregation functions like `COUNT()`, `MAX()`
  - String functions like `STRING_AGG()` for formatting comma-separated lists

## 🔍 Key Insights Generated

- Identifying the **team with the highest total gold medals** over all years.
- Finding the **player(s) with the most gold medals each year**.
-  In case of ties, multiple names are displayed as comma-separated values.
- Extracting top-performing athletes like **Michael Phelps** based on medal count.

## ✅ Purpose

This project demonstrates how SQL can be used for:
- Exploratory data analysis (EDA)
- Text formatting and aggregation
- Insightful reporting for historical sports data

