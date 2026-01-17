select * from bank_loan_data

select COUNT(id) AS Total_Loan_Applications  from bank_loan_data

select COUNT(id) AS PMTD_Total_Loan_Applications  from bank_loan_data
where MONTH(issue_date) = 11 and YEAR(issue_date)=2021

--(MTD-PMTD)/PMTD

select SUM(loan_amount) as MTD_Total_Funded_Amount from bank_loan_data
where month(issue_date)= 12 and YEAR(issue_date)=2021

select sum(total_payment) as MTD_Total_Amount_received from bank_loan_data
where month(issue_date)=12 and YEAR(issue_date)=2021

select sum(total_payment) as PMTD_Total_Amount_received from bank_loan_data
where month(issue_date)=11 and YEAR(issue_date)=2021

select round(avg(int_rate),4)*100 as PMTD_Avg_Interest_rate from bank_loan_data
where month(issue_date)=11 and Year(issue_date)=2021

select round(avg(dti),4)*100 as PMTD_Avg_DTI from bank_loan_data
where MONTH(issue_date)=11 and year(issue_date)=2021


select loan_status from bank_loan_data
select 
(COUNT(case when loan_status ='Fully Paid' or loan_status ='Current' then id End)*100)
/
count(id) as Good_Loan_percentage from bank_loan_data

select count(id)  as Good_Loan_Applications from bank_loan_data
where loan_status ='Fully Paid' or loan_status ='Current'

select SUM(loan_amount)  as Good_Loan_Funded_Amount from bank_loan_data
where loan_status ='Fully Paid' or loan_status ='Current'

select SUM(total_payment)  as Good_Loan_Receive_Amount from bank_loan_data
where loan_status ='Fully Paid' or loan_status ='Current'

select 
(COUNT(case when loan_status ='Charged Off' then id End)*100)
/
count(id) as Bad_Loan_percentage from bank_loan_data


select count(id) as Bad_Loan_Applications from bank_loan_data
where loan_status ='Charged Off'

select SUM(loan_amount)  as Bad_Loan_Funded_Amount from bank_loan_data
where loan_status ='Charged Off'

select SUM(total_payment) as Bad_Loan_Receive_Amount from bank_loan_data
where loan_status ='Charged Off'

select
        loan_status,
        COUNT(id) AS Total_Loan_applications,
        SUM(total_payment) AS Total_Amount_Received,
        SUM(loan_amount) AS Total_Funded_Amount,
        round( AVG (int_rate * 100),2) AS Interest_Rate,
        round(AVG (dti * 100),2) AS DTI
    FROM
        bank_loan_data
    GROUP BY
        loan_status


SELECT 
	loan_status, 
	SUM(total_payment) AS MTD_Total_Amount_Received, 
	SUM(loan_amount) AS MTD_Total_Funded_Amount 
FROM bank_loan_data
WHERE MONTH(issue_date) = 12 
GROUP BY loan_status

select
month(issue_date) as Month_Number,
DATENAME(month , issue_date) as Month_Name,
count(id) as Total_Loan_Applications,
sum(loan_amount) as Total_Funded_Amount,
Sum(total_payment) as Total_Received_Amount
from bank_loan_data
group by month(issue_date), DATENAME(month , issue_date)
order by Month(issue_date)




select 
term,
count(id) as Total_Loan_Applications,
sum(loan_amount) as Total_Funded_Amount,
sum(total_payment) as Total_Received_Amount
from bank_loan_data
group by term
order by term

select emp_length,
count(id) as Total_Loan_Applications,
SUM(loan_amount) as Total_Funded_Amount,
SUM(total_payment) as Total_Received_Amount
from bank_loan_data
group by emp_length
order by count(id) DESC

select purpose,
count(id) as Total_Loan_Applications,
SUM(loan_amount) as Total_Funded_Amount,
sum(total_payment) as Total_Received_Amount
from bank_loan_data
group by purpose
order by count(id) DESC

Select home_ownership,
count(id) as Total_Loan_Applications, 
sum(loan_amount) as Total_Funded_Amount,
sum(total_payment) as Total_Received_Amount
from bank_loan_data
where grade ='A'and address_state='CA'
group by home_ownership
order by count(id) DESC


SELECT
    DATEFROMPARTS(
        YEAR(issue_date),
        MONTH(issue_date),
        1
    ) AS month,

    SUM(total_payment) AS Total_Received_Amount,

    SUM(
        CASE 
            WHEN loan_status IN ('Charged Off', 'Default')
            THEN total_payment
            ELSE 0
        END
    ) AS bad_loan_amount,

    ROUND(
        100.0 * 
        SUM(
            CASE 
                WHEN loan_status IN ('Charged Off', 'Default')
                THEN total_payment
                ELSE 0
            END
        ) / NULLIF(SUM(total_payment), 0),
        2
    ) AS bad_loan_percentage

FROM bank_loan_data
GROUP BY
    YEAR(issue_date),
    MONTH(issue_date)
ORDER BY month;

