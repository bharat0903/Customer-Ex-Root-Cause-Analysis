📊 Airlines Customer Journey — Root Cause Analysis

📌 Project Overview
This project delivers a comprehensive root cause analysis of the airline passenger experience using transactional journey data to identify key friction points and their impact on customer satisfaction. The analysis aims to help operations and service teams understand where passengers encounter problems, which touchpoints most strongly suppress NPS scores, and which specific flights require priority intervention.
The project follows an end-to-end data analytics workflow, covering data cleaning and feature engineering, exploratory analysis, SQL-based operational queries, and interactive dashboarding.

🎯 Business Objectives

Identify and quantify the most frequent passenger friction points across check-in, baggage, and in-flight touchpoints
Measure the NPS impact of each issue type to prioritise corrective actions
Detect flights with critically high check-in wait times and elevated issue counts
Rank flights by overall issue severity to guide targeted operational reviews
Assess the relationship between baggage wait times and passenger satisfaction scores
Provide data-driven recommendations to improve NPS and reduce service failures


🗂 Dataset Description
Total Records: 4,000 passenger journey records
Total Columns: 10
Unique Flights: 3,260 | Unique Customers: 4,000
Data Includes:

Operational metrics: check-in wait time, baggage wait time, in-flight service rating (1–5)
Issue flags: binary indicators for check-in, baggage, and in-flight issues
Satisfaction metric: NPS score (0–10) and total issues count per passenger


Data Quality Issues Addressed:

Duplicate records removed using df.drop_duplicates()
Missing values in wait time and rating columns imputed with column medians
Wait time columns bucketed into Fast / Moderate / Slow / Severe tiers for categorical analysis


🛠 Tools & Technologies Used

Excel: Initial dataset exploration and validation
Python: Data cleaning, feature engineering, EDA, and visualisation

Libraries: Pandas, Matplotlib


SQL (Google BigQuery): Operational KPI queries and flight-level analysis
Power BI: Interactive RCA dashboard and KPI tracking
Git & GitHub: Version control and project documentation


🔄 Project Workflow
Data Understanding & Cleaning

Loaded dataset and inspected structure using df.head() and df.info()
Removed duplicate records and imputed missing values with column medians
Engineered check-in and baggage wait time bucket features using pd.cut()

Exploratory Data Analysis (Python)

Computed average NPS by total issue count (0–3) to quantify cumulative impact
Calculated stage-level NPS averages for check-in, baggage, and in-flight issues
Visualised check-in wait time distribution and baggage wait vs NPS scatter plot

SQL-Based Operational Analysis

Per-flight KPI aggregations: avg wait times, avg in-flight rating, passenger counts
Friction area ranking across all three touchpoints using UNION ALL
Issue-to-NPS mapping to identify highest-impact service failures
High check-in wait flight identification using HAVING clause
Flight-level issue severity ranking using DENSE_RANK() window function

Dashboard Development (Power BI)

NPS and operational KPI summary cards
Issue frequency comparison across touchpoints
Flight ranking by issue severity and check-in wait time
Wait time distribution and baggage wait vs NPS visuals


📈 Key Insights

Baggage handling is the most frequent friction point with 875 issue occurrences, followed by check-in (698) and in-flight (499)
Baggage-affected passengers report the lowest average NPS (6.26), making it the highest-priority area for service improvement
107 flights record average check-in wait times exceeding 25 minutes, representing a critical operational bottleneck
The average in-flight service rating of 2.97 out of 5 indicates a systemic quality gap below the scale midpoint
44.7% of passengers (1,787) are classified as Detractors (NPS 0–6), highlighting a significant loyalty risk
307 passengers experienced two or more simultaneous issues, compounding dissatisfaction beyond individual touchpoint failures


💡 Business Recommendations

Prioritise baggage handling process improvements as the most frequent and satisfaction-damaging friction point
Escalate the 107 high-wait check-in flights for staffing review, kiosk deployment, or process redesign
Launch crew training and in-flight service standardisation to address the below-midpoint average rating
Introduce end-to-end journey monitoring to identify and assist passengers accumulating multiple issues in real time
Implement a post-flight service recovery programme for issue-affected passengers to reduce detractor churn
Conduct rolling root cause reviews for top-ranked problem flights using the SQL-derived issue severity ranking


📊 Dashboard Preview
The Power BI dashboard provides an interactive view of:

NPS and operational KPI summary across all 4,000 passenger records
Touchpoint-level issue frequency and NPS impact comparison
Flight-level severity ranking and high-wait check-in identification
Wait time distributions and baggage wait vs NPS relationship

(Dashboard file included in the repository)
