# flipkart-sales-dashboard

# Flipkart Product Analytics Dashboard

## Business Problem
Flipkart lists thousands of products across dozens of categories. Without 
structured analysis, pricing and discount strategy decisions are made without 
visibility into where discounting is most aggressive, how prices are distributed, 
and which categories face the most competition.

## What I Built
An end-to-end analytics pipeline that analyses 19,922 Flipkart product listings 
to surface pricing, discount, and competitive insights.

**Live Dashboard:** https://lookerstudio.google.com/reporting/ea320aed-8924-4f9a-86ce-1c4dbd3dcb6f

## Pipeline
Python (pandas) → Google Cloud Storage → BigQuery → Looker Studio

## Key Findings
- Average discount across all categories is 40.5%, indicating that Flipkart is heavily discount-driven
- Clothing has the highest listing volume (6,171 products) with aggressive discounting
- 47% of all products are in the Budget segment (under ₹500)
- Furniture and Electronics show the widest price variance, making it the most fragmented markets

## Tech Stack
- Python (pandas, numpy) for data cleaning
- Google Cloud Storage for raw data staging
- BigQuery for 5 SQL views for KPI computation
- Looker Studio for interactive dashboard
- Google Colab for development environment

## Files
- `flipkart_cleaning.ipynb` — data cleaning notebook
- `sql_views.sql` — all 5 BigQuery SQL views
- `flipkart_cleaned.csv` — cleaned dataset
