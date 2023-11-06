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

-- Problem Statement Solution
WITH pivot AS (

WITH quarter_expenses AS (
	SELECT *,
        CASE
	    WHEN MONTH(date) IN (1,2,3) THEN "Q1"
            WHEN MONTH(date) IN (4,5,6) THEN "Q2"
            WHEN MONTH(date) IN (7,8,9) THEN "Q3"
            ELSE "Q4"
        END AS quarter
	FROM expenses	)
    
SELECT quarter, category, sum(amount) AS amount FROM quarter_expenses
GROUP BY quarter, category	)

SELECT 
	category,
        Max(CASE WHEN quarter="Q1" Then amount	END) AS Q1,
        Max(CASE WHEN quarter="Q2" Then amount END) AS Q2,
        Max(CASE WHEN quarter="Q3" Then amount END) AS Q3,
        Max(CASE WHEN quarter="Q4" Then amount END) AS Q4
FROM pivot
GROUP BY category;
