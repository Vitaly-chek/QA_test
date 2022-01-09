-- Вывод таблиц
select * from employees;
select * from salary_1;
select * from employee_salary;
select * from roles_1;
select * from roles_employee;

-- 1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.

 select employee_name, monthly_salary from employees E
	join employee_salary ES on E.id = ES.employee_id
	join salary_1 S on  S.id = ES.salary_1_id;
	
-- 2. Вывести всех работников у которых ЗП меньше 2000.
	
select employee_name, monthly_salary from employees E
	join employee_salary ES on E.id = ES.employee_id
	join salary_1 S on  S.id = ES.salary_1_id
	where monthly_salary < 2000
	order by S.id;
	
-- 3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)

select employee_id, monthly_salary from salary_1 S
	left join employee_salary ES on S.id = ES.salary_1_id
	where ES.employee_id is null;

-- 4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)

select employee_id, monthly_salary from salary_1 S
	left join employee_salary ES on S.id = ES.salary_1_id
	where ES.employee_id is null and monthly_salary < 2000;

-- 5. Найти всех работников кому не начислена ЗП.

select employee_name, salary_1_id from employees E
	left join employee_salary ES on E.id = ES.employee_id
	where ES.salary_1_id is null
	order by E.id;

-- 6. Вывести всех работников с названиями их должности.

select employee_name, role_name from employees E
	join roles_employee RE on E.id = RE.employee_id 
	join roles_1 R on R.id = RE.role_id
	order by E.id;
	
-- 7. Вывести имена и должность только Java разработчиков.

select employee_name, role_name from employees E	
	join roles_employee RE on E.id = RE.employee_id
	join roles_1 R on R.id = RE.role_id
	where role_name like '%Java%'
	order by E.id;

-- 8. Вывести имена и должность только Python разработчиков.

select employee_name, role_name from employees E	
	join roles_employee RE on E.id = RE.employee_id
	join roles_1 R on R.id = RE.role_id
	where role_name like '%Python%'
	order by E.id;

-- 9. Вывести имена и должность всех QA инженеров.

select employee_name, role_name from employees E
	join roles_employee RE on E.id = RE.employee_id 
	join roles_1 R on R.id = RE.role_id
	where role_name like '%QA%'
	order by E.id;

-- 10. Вывести имена и должность ручных QA инженеров.

select employee_name, role_name from employees E
	join roles_employee RE on E.id = RE.employee_id
	join roles_1 R on R.id = RE.role_id
	where role_name like '%Manual%QA%'
	order by E.id;

-- 11. Вывести имена и должность автоматизаторов QA

select employee_name, role_name from employees E
	join roles_employee RE on E.id = RE.employee_id
	join roles_1 R on R.id = RE.role_id
	where role_name like '%Automation%QA%'
	order by E.id;

-- 12. Вывести имена и зарплаты Junior специалистов

select employee_name, monthly_salary as salary_junior_qa from employees E
	join roles_employee RE on E.id = RE.employee_id
	join roles_1 R on R.id = RE.role_id
	join employee_salary ES on E.id = ES.id
	join salary_1 S on S.id = ES.salary_1_id
	where role_name like '%Junior%'
	order by S.monthly_salary;

-- 13. Вывести имена и зарплаты Middle специалистов

select employee_name, monthly_salary as salary_middle_qa from employees E
	join roles_employee RE on E.id = RE.employee_id
	join roles_1 R on R.id = RE.role_id
	join employee_salary ES on E.id = ES.id
	join salary_1 S on S.id = ES.salary_1_id
	where role_name like '%Middle%'
	order by S.monthly_salary;

-- 14. Вывести имена и зарплаты Senior специалистов

select employee_name, monthly_salary as salary_senior_QA from employees E
	join roles_employee RE on E.id = RE.employee_id
	join roles_1 R on R.id = RE.role_id
	join employee_salary ES on E.id = ES.id
	join salary_1 S on S.id = ES.salary_1_id
	where role_name like '%Senior%'
	order by S.monthly_salary;

-- 15. Вывести зарплаты Java разработчиков

select monthly_salary as Salary_Java_dev from employees E
	join roles_employee RE on E.id = RE.employee_id 
	join roles_1 R on R.id = RE.role_id
	join employee_salary ES on E.id = ES.id
	join salary_1 S on ES.salary_1_id = S.id 
	where role_name like '%ava%eveloper%'
	order by S.monthly_salary;

-- 16. Вывести зарплаты Python разработчиков

select  monthly_salary as Salary_Python_dev from employees E
	join employee_salary ES on E.id = ES.employee_id
	join salary_1 S on S.id = ES.salary_1_id 
	join roles_employee RE on E.id  = RE.employee_id 
	join roles_1 R on R.id = RE.role_id 
	where role_name like '%Python%'
	order by monthly_salary;
	
-- 17. Вывести имена и зарплаты Junior Python разработчиков
	
select employee_name, monthly_salary from employees E
	join roles_employee RE on E.id = RE.employee_id 
	join roles_1 R on R.id = RE.role_id
	join employee_salary ES on E.id = ES.employee_id 
	join salary_1 S on S.id = ES.salary_1_id 
	where role_name like '%unior%ython%'
	order by monthly_salary;
	
-- 18. Вывести имена и зарплаты Middle JS разработчиков

select employee_name, monthly_salary from employees E
	join roles_employee RE on E.id = RE.employee_id 
	join roles_1 R on R.id = RE.role_id
	join employee_salary ES on E.id = ES.employee_id 
	join salary_1 S on S.id = ES.salary_1_id 
	where role_name like '%iddle%ava%cript'
	order by monthly_salary;

-- 19. Вывести имена и зарплаты Senior Java разработчиков

select employee_name, monthly_salary from employees E
	join roles_employee RE on E.id = RE.employee_id 
	join roles_1 R on R.id = RE.role_id
	join employee_salary ES on E.id = ES.employee_id 
	join salary_1 S on S.id = ES.salary_1_id 
	where role_name like '%enior%ava%'
	order by monthly_salary;

-- 20. Вывести зарплаты Junior QA инженеров

select employee_name, monthly_salary, role_name from employees E
	join roles_employee RE on E.id = RE.employee_id 
	join roles_1 R on R.id = RE.role_id
	join employee_salary ES on E.id = ES.employee_id 
	join salary_1 S on S.id = ES.salary_1_id 
	where role_name like '%unior%QA%'
	order by monthly_salary;

-- 21. Вывести среднюю зарплату всех Junior специалистов

select avg(monthly_salary) as srednyaya_ZP from employees E
	join roles_employee RE on E.id = RE.employee_id 
	join roles_1 R on R.id = RE.role_id 
	join employee_salary ES on E.id = ES.employee_id 
	join salary_1 S on S.id = ES.salary_1_id
	where role_name like '%Junior%';
	

-- 22. Вывести сумму зарплат JS разработчиков
	
select sum(monthly_salary) as summa_zp from employees E
	join roles_employee RE on E.id = RE.employee_id 
	join roles_1 R on R.id = RE.role_id 
	join employee_salary ES on E.id = ES.employee_id 
	join salary_1 S on S.id = ES.salary_1_id
	where role_name like '%ava%cript%';
	
-- 23. Вывести минимальную ЗП QA инженеров
	
select min(monthly_salary) as min_zp from employees E
	join roles_employee RE on E.id = RE.employee_id 
	join roles_1 R on R.id = RE.role_id 
	join employee_salary ES on E.id = ES.employee_id 
	join salary_1 S on S.id = ES.salary_1_id
	where role_name like '%QA%';
	
-- 24. Вывести максимальную ЗП QA инженеров
	
select max(monthly_salary) as max_zp from employees E
	join roles_employee RE on E.id = RE.employee_id 
	join roles_1 R on R.id = RE.role_id 
	join employee_salary ES on E.id = ES.employee_id 
	join salary_1 S on S.id = ES.salary_1_id
	where role_name like '%QA%';	
	
-- 25. Вывести количество QA инженеров
	
select count(role_name) as kolvo_QA from employees E
	join roles_employee RE on E.id = RE.employee_id 
	join roles_1 R on R.id = RE.role_id 
	join employee_salary ES on E.id = ES.employee_id 
	join salary_1 S on S.id = ES.salary_1_id
	where role_name like '%QA%';	
	
-- 26. Вывести количество Middle специалистов.
	
select count(role_name) as kolvo_QA from employees E
	join roles_employee RE on E.id = RE.employee_id 
	join roles_1 R on R.id = RE.role_id 
	join employee_salary ES on E.id = ES.employee_id 
	join salary_1 S on S.id = ES.salary_1_id
	where role_name like '%iddle%';	


select count(role_name) as kolvo_QA from roles_employee RE
	join roles_1 R on RE.role_id = R.id 
	join employee_salary es on es.employee_id = RE.employee_id 
	where role_name like '%iddle%';

-- 27. Вывести количество разработчиков
	
select count(role_name) as kolvo_QA from employees E
	join roles_employee RE on E.id = RE.employee_id 
	join roles_1 R on R.id = RE.role_id 
	join employee_salary ES on E.id = ES.employee_id 
	join salary_1 S on S.id = ES.salary_1_id
	where role_name like '%eveloper%';		
	
-- 28. Вывести фонд (сумму) зарплаты разработчиков.
	
select sum(monthly_salary) as summa_zp_dev from employees E
	join roles_employee RE on E.id = RE.employee_id 
	join roles_1 R on R.id = RE.role_id 
	join employee_salary ES on E.id = ES.employee_id 
	join salary_1 S on S.id = ES.salary_1_id
	where role_name like '%eveloper%';	
	
-- 29. Вывести имена, должности и ЗП всех специалистов по возрастанию
	
select employee_name, monthly_salary from employees E
	join roles_employee RE on E.id = RE.employee_id
	join roles_1 R on R.id = RE.role_id
	join employee_salary ES on E.id = ES.employee_id 
	join salary_1 S on S.id = ES.salary_1_id
	order by monthly_salary;
	
-- 30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300
	
select employee_name, role_name, monthly_salary from employees E
	join roles_employee RE on E.id = RE.employee_id
	join roles_1 R on R.id = RE.role_id
	join employee_salary ES on E.id = ES.employee_id 
	join salary_1 S on S.id = ES.salary_1_id
	where monthly_salary > 1700 and monthly_salary < 2300
	order by monthly_salary	;
	
-- 31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300
	
select employee_name, role_name, monthly_salary from employees E
	join roles_employee RE on E.id = RE.employee_id
	join roles_1 R on R.id = RE.role_id
	join employee_salary ES on E.id = ES.employee_id 
	join salary_1 S on S.id = ES.salary_1_id
	where  monthly_salary < 2300
	order by monthly_salary	;
	
-- 32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000
	
select employee_name, role_name, monthly_salary from employees E
	join roles_employee RE on E.id = RE.employee_id
	join roles_1 R on R.id = RE.role_id
	join employee_salary ES on E.id = ES.employee_id 
	join salary_1 S on S.id = ES.salary_1_id
	where  monthly_salary = 1100 or monthly_salary = 1500 or monthly_salary = 2000
	order by monthly_salary;	
	
