select firstname, lastname from employee;
select firstname from employee;
-- To renove the repetative name use distinct
select distinct firstname from employee; 
-- To selct the person with the lastname='River'
select firstname, lastname, department, salary from employee where lastname='River';

-- To exclude the lastname River the syntax can be <> or !=
select firstname, lastname, department, salary from employee where lastname<>'River';


select firstname, lastname from employee where department is null;

select lastname, firstname, department, salary from employee order by lastname asc, firstname asc;

select lastname, firstname, department, salary from employee order by lastname asc, firstname desc;

-- to arrange firstname in descending order (z-a) use desc
select firstname from employee order by firstname desc;

select distinct firstname from employee order by firstname asc;

select firstname, count(*) as count from employee group by firstname;

-- select the employees by salary, in ascending order by default

select * from employee order by salary;