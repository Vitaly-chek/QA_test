-- Создание таблицы salary
create table salary(
-- Создание столбца id
	id serial primary key,
-- Создание столбца monthly_salary
	monthly_salary int not null 
);

-- Вывод таблицы salary
select * from salary;

-- Создание таблицы roles
create table roles(
	id serial primary key,
	role_title varchar (30) unique not null
);

-- Вывод таблицы roles
select * from roles;

-- Создание таблицы salary_roles
create table salary_roles(
	id serial primary key,
	id_role int unique not null,
	id_salary int not null,
-- Привязка к id_role из таблицы salary_roles столбец id из таблицы roles
	foreign key (id_role)
		references roles(id),
-- Привязка к id_salary из таблицы salary_roles столбец id из таблицы salary		
	foreign key (id_salary)
		references salary(id)
);

-- вести таблицу salary_roles
select * from salary_roles
-- отсортировать id по возростанию
order by(id);

-- заполнить таблицу salary в столбец monthly_salary
insert into salary(monthly_salary)
values(1200),
	  (1300),
	  (1400),
	  (1500),
	  (1600),
	  (1700),
	  (1800),
	  (1900),
	  (5000);
	  
-- заполнить таблицу roles в столбец role_title
insert into roles(role_title)
values('QA_manual_junior'),
	  ('QA_manual_middle'),
	  ('QA_manual_senior'),
	  ('QA_automation_junior'),
	  ('QA_automation_middle'),
	  ('QA_automation_senior'),
	  ('Developer_Java_junior'),
	  ('Developer_Java_middle'),
	  ('Developer_Java_senior'),
	  ('Developer_Python_junior'),
	  ('Developer_Python_middle'),
	  ('Developer_Python_senior'),
	  ('HR'),
	  ('Designer'),
	  ('Manager');
	 
-- заполнить таблицу salary_roles в столбцы id_role и id_salary
insert into salary_roles(id_role, id_salary)
values(1, 1),
	  (2, 4),
	  (3, 2),
	  (4, 6),
	  (5, 8),
	  (6, 3),
	  (7, 8),
	  (8, 5),
	  (9, 9);

-- заполнить (добавить) таблицу salary_roles в столбцы id_role и id_salary
insert into salary_roles(id_role, id_salary)
values(12, 3);
	
--Добавить столбец devices в таблицу salary_roles
alter table salary_roles
add column devices varchar(50);

-- Удалить столбец devices из таблицы salary_roles
alter table salary_roles
drop column  devices;

-- Удалить id=5 из таблицы salary_roles
delete from salary_roles
where  id=5;

-- Заменить id=7 на id=5
update salary_roles
set id=5
where id = 7;

-- Добавить столбец parking в таблицу roles
alter table roles
add column parking int;

-- Изменение названия столбика
alter table roles 
rename column parking to taxi;

-- Изменение типа данных столбца 
alter table roles 
alter column taxi type int using taxi::integer;

-- Изменение типа данных столбца 
alter table roles 
alter column taxi type varchar(40) using taxi::varchar(30);

-- Вывод таблицы roles
select * from roles;


-- Удалить таблицу
--drop table salary_roles;


