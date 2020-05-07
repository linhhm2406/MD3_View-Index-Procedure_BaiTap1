create database demo;

use demo;

create table test(
    id int auto_increment primary key
);

create table test2(
    id int auto_increment primary key
);

create table Products
(
    id                 int,
    productCode        varchar(10)   not null,
    productName        nvarchar(50)  not null,
    productPrice       float         not null,
    productAmount      int           not null,
    productDescription nvarchar(100) not null,
    productStatus      bit           not null
);

drop table Products;

insert into Products
values (1, 'A1', 'Name1', 10, 10, 'Des1', 1),
       (2, 'B1', 'Name2', 180, 11, 'Des2', 1),
       (3, 'C1', 'Name3', 32, 546, 'Des3', 0),
       (4, 'A2', 'Name4', 564, 87, 'Des4', 1),
       (5, 'B2', 'Name5', 5, 49, 'Des5', 0),
       (6, 'C2', 'Name6', 68, 34, 'Des6', 1),
       (7, 'A3', 'Name7', 9, 89, 'Des7', 0),
       (8, 'B3', 'Name8', 78, 543, 'Des8', 1);

select *
from products;

-- 3
alter table products
    add constraint proCode_Index unique (productCode);

alter table products
    add constraint proCode_proPrice_Index unique (productName, productPrice);

-- 4
create view demoView as
select productCode, productName, productPrice
from products;

select *
from demoView;

update demoView
set productName = 'test'
where productCode = 'A3';

select *
from products;

-- 5
delimiter //
create procedure demoProcedure()
begin
    select * from products;
end //
delimiter //;

delimiter //
create procedure insertNewProduct(IN value1 int,
                                  value3 varchar(10),
                                  value4 nvarchar(50),
                                  value5 float,
                                  value6 int,
                                  value7 nvarchar(100),
                                  value8 bit)
begin
    insert into products
        value (value1, value3, value4, value5, value6, value7, value8);
end //
delimiter //;

call demoProcedure();
call insertNewProduct(9, 'A4', 'insertProcedure', 32, 32, 'Des9', 1);

delimiter //
create procedure changeById(in value1 int, value2 varchar(10))
begin
    update products
        set productName = value2
    where id = value1;
end //
delimiter //;

call changeById(5,'E1');

delimiter //
create procedure deleteById(in value1 int)
begin
    delete from products
        where id = value1;
end //
delimiter //;

call deleteById(9);

select * from products