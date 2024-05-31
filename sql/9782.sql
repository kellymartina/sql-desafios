/*

Calculate the total revenue from each customer in March 2019. Include only customers who were active in March 2019.
Output the revenue along with the customer id and sort the results based on the revenue in descending order.

Table: ordes

id: int
cust_id: int
order_date: datetime
order_details: varchar
total_order_cost: int

*/

SELECT 
    cust_id,
    SUM(total_order_cost) AS total_revenue
FROM
    orders
WHERE
    EXTRACT('MONTH' FROM order_date) = 3 AND
    EXTRACT('YEAR' FROM order_date) = 2019
GROUP BY
    cust_id
ORDER BY
    total_revenue ASC;
