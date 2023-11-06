-- Expenses Table Creation
CREATE TABLE expenses
(	date DATE,
	description VARCHAR(50),
    category VARCHAR(15),
    amount INT
);

-- Inseting records to Expenses
INSERT INTO expenses (date,description,category,amount)
VALUES ('2022-01-01','Saravana bhavan','Food',2700),
('2022-04-02','Amazon','Shopping',3000),
('2022-07-02','Croma store','Shopping',13000),
('2022-01-02','Macdonalds','Food',2700),
('2022-04-05','PSEG electricity bill','Utilities',7000),
('2022-07-10','Pani puri on street','Food',400),
('2022-01-10','Reliance geo phone bill','Utilities',800),
('2022-01-17','Verizon wireless','Utilities',2300),
('2022-04-18','Banglore muni water bill','Utilities',600),
('2022-07-18','D Mart grocery bill','Shopping',4300),
('2022-01-18','Thakur saris','Shopping',23000),
('2022-04-25','A2B restaurant','Food',6000),
('2022-09-06', 'PSEG electricity bill', 'Utilities', '5000'),
('2022-08-02', 'Saravana bhavan', 'Food', '1500'),
('2022-07-11', 'Reliance geo phone bill', 'Utilities', '1000'),
('2022-10-03', 'Amazon', 'Shopping', '2000'),
('2022-12-19', 'D Mart grocery bill', 'Shopping', '5000'),
('2022-11-11', 'Pani puri on street', 'Food', '200'),
('2022-12-26', 'A2B restaurant', 'Food', '4000'),
('2022-10-18', 'Verizon wireless', 'Utilities', '3000'),
('2022-11-19', 'Banglore muni water bill', 'Utilities', '400');


with pivot as (

with quarter_expenses as (
	SELECT *,
        CASE
			when month(date) in (1,2,3) then "Q1"
            when month(date) in (4,5,6) then "Q2"
            when month(date) in (7,8,9) then "Q3"
            else "Q4"
        END as quarter
	FROM expenses	)
    
select quarter, category, sum(amount) as amount from quarter_expenses
GROUP BY quarter, category	)

select 
		category,
        Max(CASE WHEN quarter="Q1" Then amount	END) as Q1,
        Max(CASE WHEN quarter="Q2" Then amount END) as Q2,
        Max(CASE WHEN quarter="Q3" Then amount END) as Q3,
        Max(CASE WHEN quarter="Q4" Then amount END) as Q4
from pivot
group by category;