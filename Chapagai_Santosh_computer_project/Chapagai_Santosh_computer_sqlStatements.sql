drop database if exists computerdb;
create database computerdb;
use computerdb;

create table computer(
id integer not null primary key,
computerName varchar(16) not null,
computerType varchar(26) not null,
amount integer not null,
price integer not null
);

drop user if exists 'mia' @'localhost';
create user 'mia' @'localhost' identified by 'SYKf4yyX';
grant all privileges on computerdb.* to 'mia' @'localhost';

-- insert data
insert into computer values(6, 'MaxEffect 2000', 'tabletop', 100, 1500);
insert into computer values(4, 'Cera 2400', 'laptop', 30, 300);
insert into computer values(3, 'King 3000', 'server', 150, 499);
insert into computer values(2, 'Beast II', 'embedded', 25, 200);
insert into computer values(7, 'Xunil 4.7', 'gameover', 5, 100);
insert into computer values(5, 'GameDelux', 'pocket computer', 7, 2000);
insert into computer values(1, 'BigFlop Mark II', 'supercomputer', 15, 700);


-- Getting data
select * from computer;
select computerName, id, price from computer;
select * from computer where amount = 1;
select * from computer where price = 200;
select * from computer where price = 1500;

--update data
update computer set computerType='pocket computer', amount=15 where id = 5;
update computer set amount = 25, computerName='GameDelux' where id = 4;
update computer set price = 700, amount = 15, computerName='King 3000' where id = 6;
update computer set computerType = 'pocket computer', amount = 15, price = 1500 where id = 7;

--Delete data
delete from computer where id = 2;
delete from computer where id = 5;
delete from computer where computerType='embedded';
delete from computer where amount = 15 or computerName='GameDelux';
delete from computer where computerType='tabletop' or computerType ='laptop' or computerName= 'Beast II';