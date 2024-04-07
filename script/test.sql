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
insert into student(name, age, gender, lv) value ('33', 22, '男', '大学');
insert into student(name, age, gender, lv) value ('ty', 55, '男', '大学');
insert into student(name, age, gender, lv) value ('hj', 45, '男', '大学');
insert into student(name, age, gender, lv) value ('mn', 23, '男', '大学');
insert into student(name, age, gender, lv) value ('qq', 32, '男', '大学');

drop table if exists profession;
create table profession
(
    id      int primary key auto_increment,
    name    varchar(255),
    teacher varchar(255)
) comment '工作表';

insert into profession(name, teacher) value ('Java', 'A');
insert into profession(name, teacher) value ('Python', 'A');
insert into profession(name, teacher) value ('Golang', 'A');
insert into profession(name, teacher) value ('MySQL', 'A');
insert into profession(name, teacher) value ('c', 'A');
insert into profession(name, teacher) value ('c++', 'A');
insert into profession(name, teacher) value ('HTML', 'A');
insert into profession(name, teacher) value ('Vue', 'A');

drop table if exists job;
create table job
(
    student_id int,
    job_id     int,
    money      float,
    primary key (student_id, job_id)
) comment '学生工作表';



insert into job(student_id, job_id, money) value (1, 1, 1500);
insert into job(student_id, job_id, money) value (2, 2, 2563);
insert into job(student_id, job_id, money) value (3, 3, 6354);
insert into job(student_id, job_id, money) value (4, 4, 8546);
insert into job(student_id, job_id, money) value (5, 5, 5546);
insert into job(student_id, job_id, money) value (6, 6, 2345);


# 单表查询
explain
select *
from student;

# type index
explain
select id, name
from student
order by id desc;

# type range
explain
select *
from student
where id > 1;

explain
select *
from student
where id <> 1;

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
# type index-merge
explain
select *
from student
where id = 1
   or age = 2;
explain
select *
from student
where (id = 1 or age = 2)
  and lv in ('中');


# alter table job add index money_key (money);
# 连接查询中
explain
select *
from student,
     job
where student.id=job.student_id;

# type ref_or_null
explain select * from student where age = 1 or age  <=> null ;
explain select * from student where  age is null ;
explain select * from student where  age <=> null ;









