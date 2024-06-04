/*
Identifique projetos que correm o risco de ultrapassar o orçamento. Um projeto é considerado acima do orçamento se o custo de todos os funcionários atribuídos ao projeto for maior que o orçamento do projeto.
Você precisará ratear o custo dos funcionários de acordo com a duração do projeto. Por exemplo, se o orçamento para um projeto que leva meio ano para ser concluído for de US$ 10 mil, o salário total semestral de todos os funcionários designados para o projeto não deverá exceder US$ 10 mil. 
O salário é definido anualmente, por isso tome cuidado ao calcular os salários dos projetos que duram menos ou mais de um ano.
Produza uma lista de projetos que estão acima do orçamento com o nome do projeto, o orçamento do projeto e as despesas totais com funcionários rateadas (arredondadas para o próximo valor em dólares).
DICA: para simplificar, considere que todos os anos têm 365 dias. Você não precisa pensar nos anos bissextos.

Table: linkedin_projects
id: int
title: varchar
budget: int
start_date: datetime
end_date: datetime

Table: linkedin_emp_projects
emp_id: int
project_id: int

Table: linkedin_employees
id: int
first_name: varchar
last_name: varchar
salary: int
*/

SELECT 
    title,
    budget,
    CEILING((end_date - start_date)/365::float * project_yearly_salary) AS prorated_employee_expense
FROM
    linkedin_projects

JOIN
    (SELECT 
         project_id, 
         SUM(salary) AS project_yearly_salary
     FROM 
         linkedin_emp_projects ep
     JOIN 
         linkedin_employees e ON ep.emp_id = e.id
    GROUP BY 
         project_id) yearly_salary
ON 
    linkedin_projects.id = yearly_salary.project_id
WHERE
    (end_date - start_date)/365::float * project_yearly_salary > budget
