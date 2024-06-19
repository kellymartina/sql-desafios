/*

Escreva uma consulta que identifique cidades com preços residenciais superiores à média em comparação com a média nacional. 
Output: os nomes das cidades.

Table: zillow_transactions

id: int
state: varchar
city: varchar
street_address: varchar
mkt_price: int

*/

SELECT
    city
FROM
    zillow_transactions
GROUP BY
    city
HAVING
    AVG(mkt_price) > (SELECT AVG(mkt_price) FROM zillow_transactions);
