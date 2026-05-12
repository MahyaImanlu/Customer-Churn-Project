CREATE VIEW vw_customer_churn_base AS
SELECT *
FROM customer_churn;



-- Query1 (SUPPORT_CALLS_GROUP):

CREATE VIEW Support_Calls_View AS
SELECT
	*,
    CASE
        WHEN `Support Calls` IS NULL THEN 'No Data'
        WHEN `Support Calls` <= 1 THEN '0-1 LOW'
        WHEN `Support Calls` <= 3 THEN '2-3 MEDIUM'
        WHEN `Support Calls` <= 6 THEN '4-6 HIGH'
        ELSE '7+ VERY HIGH'
    END AS SUPPORT_CALLS_GROUP

FROM vw_customer_churn_base;


-- Query2 (Usage_Frequency_Group): 

CREATE VIEW Usage_Frequency_View AS
SELECT
	*,
	CASE 
		WHEN `Usage Frequency` IS NULL THEN 'NO USAGE DATA'
        WHEN `Usage Frequency` <= 10 THEN '1-10 LOW'
        WHEN `Usage Frequency` <= 20 THEN '11-20 MEDIUM'
        WHEN `Usage Frequency` <= 30 THEN '21-30 HIGH'
        ELSE '30+ VERY HIGH'
	END AS Usage_Frequency_Group
    
FROM vw_customer_churn_base;


-- Query3 (Payment_Delay_Group):

CREATE VIEW Payment_Delay_View AS
SELECT
	*,
    CASE
        WHEN `Payment Delay` IS NULL THEN 'No Data'
        WHEN `Payment Delay` = 0 THEN 'No Delay'
        WHEN `Payment Delay` <= 5 THEN 'Low'
        WHEN `Payment Delay` <= 15 THEN 'Medium'
        ELSE 'High'
    END AS Payment_Delay_Group

FROM vw_customer_churn_base;


-- Query4 (Tenure_Group):

CREATE VIEW Tenure_Group_View AS
SELECT
	*,
	CASE 
		WHEN `Tenure` IS NULL THEN 'NO DATA'
		WHEN `Tenure` <= 6 THEN '1–6 Months (New Users)'
        WHEN `Tenure` <= 12 THEN '6–12 Months (Early Stage)'
        WHEN `Tenure` <= 24 THEN '1–2 Years (Growing Loyalty)'
        WHEN `Tenure` <= 48 THEN '2–4 Years (Established)'
        ELSE '4–5 Years (Loyal Customers)'
	END AS Tenure_Group

FROM vw_customer_churn_base;


-- Query5 (Risk Band):

CREATE VIEW Customer_Risk_view AS
SELECT *,
       CASE
           WHEN Risk_Score >= 10 THEN 'Very High Risk'
           WHEN Risk_Score >= 7 THEN 'High Risk'
           WHEN Risk_Score >= 4 THEN 'Medium Risk'
           ELSE 'Low Risk'
       END AS Risk_Band

FROM (

    SELECT *,
           (
               Support_Risk +
               Usage_Risk +
               Payment_Risk +
               Tenure_Risk
           ) AS Risk_Score

    FROM (

        SELECT
			*,
            CASE
                WHEN `Support Calls` >= 7 THEN 4
                WHEN `Support Calls` >= 4 THEN 3
                WHEN `Support Calls` >= 2 THEN 2
                ELSE 1
            END AS Support_Risk,

            CASE
                WHEN `Usage Frequency` <= 5 THEN 4
                WHEN `Usage Frequency` <= 10 THEN 3
                WHEN `Usage Frequency` <= 20 THEN 2
                ELSE 1
            END AS Usage_Risk,

            CASE
                WHEN `Payment Delay` >= 16 THEN 4
                WHEN `Payment Delay` >= 6 THEN 3
                WHEN `Payment Delay` >= 1 THEN 2
                ELSE 1
            END AS Payment_Risk,

            CASE
                WHEN `Tenure` <= 6 THEN 4
                WHEN `Tenure` <= 12 THEN 3
                WHEN `Tenure` <= 24 THEN 2
                ELSE 1
            END AS Tenure_Risk

        FROM vw_customer_churn_base

    ) AS Risk_Score

) AS Risk_Table;



-- Query6 (Customer_Segment):

CREATE VIEW Customer_Segment_View AS
SELECT
	*,
    CONCAT(
        CASE
            WHEN `Support Calls` <= 1 THEN 'CALLS: LOW'
            WHEN `Support Calls` <= 3 THEN 'CALLS: MEDIUM'
            WHEN `Support Calls` <= 6 THEN 'CALLS: HIGH'
            ELSE 'CALLS: VERY HIGH'
        END,
        ' | ',
        CASE
            WHEN `Usage Frequency` IS NULL THEN 'NO USAGE DATA'
            WHEN `Usage Frequency` <= 10 THEN 'USAGE: LOW'
            WHEN `Usage Frequency` <= 20 THEN 'USAGE: MEDIUM'
            WHEN `Usage Frequency` <= 30 THEN 'USAGE: HIGH'
            ELSE 'USAGE: VERY HIGH'
        END
    ) AS Customer_Segment
FROM vw_customer_churn_base;
    

SHOW FULL TABLES
WHERE TABLE_TYPE = 'VIEW';
 


    














    



