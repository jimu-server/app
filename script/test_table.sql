# create database test;
drop table if exists student;
create table student
(
    id     int primary key auto_increment,
    name   varchar(255),
    age    int,
    gender varchar(255),
    lv     varchar(255)
) comment '学生表';
insert into student(name, age, gender, lv) value ('aa', 11, '男', '小学');
insert into student(name, age, gender, lv) value ('bb', 22, '男', '小学');
insert into student(name, age, gender, lv) value ('cc', 11, '男', '小学');
insert into student(name, age, gender, lv) value ('dd', 23, '男', '小学');
insert into student(name, age, gender, lv) value ('sa', 24, '男', '高中');
insert into student(name, age, gender, lv) value ('sd', 34, '男', '高中');
insert into student(name, age, gender, lv) value ('vv', 45, '男', '高中');
insert into student(name, age, gender, lv) value ('ff', 8, '男', '高中');
insert into student(name, age, gender, lv) value ('aa', 9, '男', '高中');
insert into student(name, age, gender, lv) value ('tt', 23, '男', '大学');
insert into student(name, age, gender, lv) value ('aa', 43, '男', '大学');
insert into student(name, age, gender, lv) value ('3a3', 22, '男', '大学');
insert into student(name, age, gender, lv) value ('tay', 55, '男', '大学');
insert into student(name, age, gender, lv) value ('haj', 45, '男', '大学');
insert into student(name, age, gender, lv) value ('maan', 23, '男', '大学');
insert into student(name, age, gender, lv) value ('qaaq', 32, '男', '大学');


# 单表查询
explain
select *
from student;

# type index
explain
select id
from student;

# type range
explain
select *
from student
where age > 10 and name like 'a%';

explain
select *
from student
where id <> 5;

explain
select *
from student
where id in (1, 2);

explain
select *
from student
where id > 5
  and lv in ('中学', '大学');



alter table student
    add index age_key (age);

# type index_merge
explain
select *
from student
where id > 6
   or age < 50;

explain
select *
from student
where id = 6
   or age = 50;

explain
select *
from student
where (id = 1 or age = 2)
  and lv in ('中');


# type ref_or_null
explain
select *
from student
where age = 1
   or age <=> null;
explain
select *
from student
where age is null;

explain
select *
from student
where age <=> null;









