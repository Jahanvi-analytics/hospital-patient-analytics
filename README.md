# Hospital Patient Analytics

## Overview
This project analyzes hospital patient data to identify trends in patient volume, billing, and risk indicators. The analysis focuses on understanding high-cost cases, abnormal test rates, and patient distribution across conditions and demographics.

## Problem Statement
Hospitals generate large volumes of patient data, but identifying high-cost cases, risk patterns, and inefficiencies is challenging without structured analysis. This project aims to analyze patient records to uncover trends in billing, length of stay, and abnormal test rates to support better decision-making.

## Dataset
- Source: Healthcare dataset (cleaned for analysis)
- Records: 55,500 patient records
- Key columns: Age, Medical Condition, Billing Amount, Admission Date, Discharge Date, Test Results

## Tools Used
- Python (Pandas) – Data cleaning and feature engineering  
- PostgreSQL – Data storage and querying  
- Power BI – Dashboard creation and visualization  

## Process
- Cleaned and standardized raw data using Python  
- Handled missing values and converted date formats  
- Created new features such as Length of Stay and Age Group  
- Performed SQL-based analysis for KPIs and segmentation  
- Built an interactive Power BI dashboard for visualization  

## Key Insights
- Patients with abnormal test results showed significantly higher average billing and longer hospital stays, indicating resource-intensive treatment patterns  
- Certain medical conditions contributed disproportionately to overall hospital costs, highlighting potential focus areas for cost optimization  
- Patients admitted under emergency conditions had higher billing and longer stays compared to planned admissions  
- Billing patterns varied across insurance providers, suggesting inconsistencies in coverage and pricing structures   

## Files in this Repository
- `data/` – Dataset used for analysis  
- `python/` – Data cleaning script  
- `sql/` – SQL queries for analysis  
- `dashboard/` – Power BI dashboard preview  

## Dashboard Preview
(See image inside dashboard folder)
