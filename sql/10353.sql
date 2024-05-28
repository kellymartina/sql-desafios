/*

You have been asked to find the job titles of the highest-paid employees.
Your output should include the highest-paid title or multiple titles with the same salary.

Tables: worker, title

WORKER 
worker_id: int
first_name: varchar
last_name: varchar
salary: int
joining_date: datetime
department: varchar

TITLE 
worker_ref_id: int
worker_title: varchar
affected_from: datetime

*/

SELECT
    t.worker_title AS best_paid_title
FROM
    worker w
JOIN
    title t
ON
    w.worker_id = t.worker_ref_id
ORDER BY
    w.salary DESC,
    t.worker_title 
LIMIT 2
