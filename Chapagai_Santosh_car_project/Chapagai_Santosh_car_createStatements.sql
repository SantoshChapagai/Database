drop database if exists cardb;
create database cardb;

use cardb;

create table car(
  productNumber integer not null primary key,
  model varchar(8) not null,
  licenceplate varchar(8) not null,
  rating varchar(6) not null,
  maxspeed integer not null
);

drop user if exists 'jacob' @'localhost';
create user 'jacob' @'localhost' identified by 'pjrkfLgD';
grant all privileges on cardb.* to 'jacob' @'localhost';

-- insert data into database table

insert into car values(1, 'FauWee', 'PEL-1', '**', 130);
insert into car values(2, 'Moustin', 'ABC-987', '*', 30);
insert into car values(3, 'Drof', 'EKO-1', '****', 150);
insert into car values(4, 'Racer', 'AAS-1', '**', 350);
insert into car values(5, 'Ovlov', 'XYZ-1', '***', 50);
insert into car values(6, 'Electro', 'LAK-1', '*', 100);
insert into car values(7, 'Min IEco', 'ABC-12', '****', 100);

--Getting data
select * from car;
select * from car where rating='*';
select * from car where model = 'FauWee';
select * from car where licenceplate = 'EKO-1';

-- Update data
update car set model = 'FauWee', rating = '*' where productNumber=2;
update car set maxspeed = 100, rating = '**' where productNumber=1;
update car set maxspeed = 70, licenceplate='PEL-1', model='Electro' where productNumber=4;
update car set maxspeed= 150, model='Moustin', licenceplate='PEL-1' where productNumber=1;

--Delete data
delete from car where productNumber = 2;
delete from car where productNumber = 5;
delete from car where maxspeed = 70;
delete from car where maxspeed = 350 or licenceplate='LAK-1';
delete from car where rating='**' or maxspeed = 350 or model = 'Electro';


