/*

Escreva uma consulta que identifique usuários ativos recorrentes. 
Um usuário ativo recorrente é aquele que fez uma segunda compra no prazo de 7 dias após qualquer outra compra. 
Output: Lista de user_ids desses usuários ativos que retornam.

Table: amazon_transactions

id: int
user_id: int
item: varchar
created_at: datetime
revenue: int

*/

SELECT
    DISTINCT a.user_id
FROM 
    amazon_transactions a
JOIN 
    amazon_transactions b ON a.user_id = b.user_id 
    AND a.id != b.id 
    AND a.created_at::date-b.created_at::date BETWEEN 0 AND 7
ORDER BY
    a.user_id;
