drop database if exists cardb;
create database cardb;
use cardb;
create table car (
  cardId integer not null primary key,
  model varchar(20) not null,
  licence varchar(10) not null,
  imagepath varchar(255)
);

insert into car values(1, 'Model T', 'ABC-1', 'tmodel.png');
insert into car (carId,model,licence) values(2, 'Mbw', 'XYZ-123');
insert into car (model, imagepath, carId, licence) values('GTY','gtx.png', 3, 'A-5');


create user 'admin'@'localhost' identified by 'Santosh123';
grant all privileges on *.* to 'admin'@'localhost' with grant option;