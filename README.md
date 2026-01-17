## Bank Loan Analysis – Credit Risk & Performance Dashboard
## Project Overview

Banks generate massive volumes of loan data, but decision-making often focuses on growth metrics while risk signals get buried.
This project analyzes loan applications, funding, collections, tenure, purpose, and loan status to answer a core business question:
Is loan growth happening safely, or is credit risk increasing alongside volume?
Using SQL Server + Power BI, the project converts raw transactional data into executive-ready MIS dashboards designed for management decisions, not just reporting.

## Business Problem Statement

Traditional MIS reports answer what happened (applications, funded amount), but fail to answer:

Where is risk increasing?
Is the bad loan percentage stabilising or rising over time?
Which loan characteristics contribute most to bad loans?
Are growth targets aligned with credit quality?
This project addresses these gaps by connecting volume, risk, and trends in one analytical flow.

## Dashboards Structure

The dashboard is intentionally designed into three layers:

1️⃣ Summary :

High-level KPIs for leadership:

Total Loan Applications

Total Funded Amount

Total Amount Received

Average Interest Rate

Average DTI

Good vs Bad Loan split

📌 Purpose: Instant business health check


2️⃣ Overview :

Trend & distribution insights:

Loan Applications trend by month

Bad Loan % trend by month (early warning signal)

Loan distribution by:

Term (36 vs 60 months)

Employee length

Loan purpose

📌 Purpose: Understand momentum and risk direction


3️⃣ Details

Granular, drill-down analysis:

Loan-level data (purpose, grade, tenure, interest, received amount)

Status-wise performance (Fully Paid, Charged Off, Current)

📌 Purpose: Operational and analyst-level investigation


## Key Insights Derived

📈 Loan applications show consistent MoM growth, but
⚠️ Bad Loan % remains elevated (~14–15%) in the second half of the year

🎯 Risk is concentrated, following a Pareto-like pattern
→ A small subset of loans contributes disproportionately to bad loan exposure

⏳ Longer tenure loans (60 months) dominate volume and exposure
→ Higher monitoring and pricing sensitivity required

🧾 Debt consolidation & credit card loans drive application volume
→ High volume does not automatically mean low risk

##  Future Enhancements

State-wise Pareto analysis for bad loans

Risk vs exposure scatter analysis

Predictive risk scoring

Automated alerts for risk threshold breaches

## Connect

If you’re interested in Banking Analytics, Credit Risk, MIS, or Business Intelligence, feel free to connect or provide feedback.
