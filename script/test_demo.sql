create database test;
drop table if exists student;
create table student
(
    id     int primary key auto_increment,
    name   varchar(255),
    age    int,
    gender varchar(255),
    lv     varchar(255),
    job    varchar(255),
    index gender_age_lv(gender,age,lv)
) comment '学生表';
insert into student(name, age, gender, lv,job) value ('aa', 11, '女', '小学','a');
insert into student(name, age, gender, lv,job) value ('bb', 22, '男', '小学','b');
insert into student(name, age, gender, lv,job) value ('cc', 11, '女', '小学','c');
insert into student(name, age, gender, lv,job) value ('dd', 23, '男', '小学','d');
insert into student(name, age, gender, lv,job) value ('sa', 24, '女', '高中','ea');
insert into student(name, age, gender, lv,job) value ('sd', 34, '男', '高中','e');
insert into student(name, age, gender, lv,job) value ('vv', 45, '女', '高中','f');
insert into student(name, age, gender, lv,job) value ('ff', 8, '男', '高中','ag');
insert into student(name, age, gender, lv,job) value ('aa', 9, '女', '高中','t');
insert into student(name, age, gender, lv,job) value ('tt', 22, '男', '大学','f');
insert into student(name, age, gender, lv,job) value ('aa', 23, '女', '大学','a');
insert into student(name, age, gender, lv,job) value ('33', 23, '男', '大学','i');
insert into student(name, age, gender, lv,job) value ('ty', 24, '女', '大学','o');
insert into student(name, age, gender, lv,job) value ('hj', 24, '男', '大学','y');
insert into student(name, age, gender, lv,job) value ('mn', 25, '女', '大学','x');
insert into student(name, age, gender, lv,job) value ('qq', 26, '男', '大学','a');


drop table if exists profession;
create table profession
(
    id   int primary key auto_increment,
    name varchar(255)
) comment '工作表';

insert into profession(name) value ('Java');
insert into profession(name) value ('Python');
insert into profession(name) value ('Golang');
insert into profession(name) value ('MySQL');
insert into profession(name) value ('c');
insert into profession(name) value ('c++');
insert into profession(name) value ('HTML');
insert into profession(name) value ('Vue');

drop table if exists job;
create table job
(
    id            int primary key auto_increment,
    student_id    int,
    profession_id int,
    money         float
) comment '学生工作表';



insert into job(student_id, profession_id, money) value (10, 1, 1500);
insert into job(student_id, profession_id, money) value (11, 2, 2563);
insert into job(student_id, profession_id, money) value (12, 3, 6354);
insert into job(student_id, profession_id, money) value (13, 4, 8546);
insert into job(student_id, profession_id, money) value (14, 5, 5546);
insert into job(student_id, profession_id, money) value (15, 6, 2345);

insert into job(student_id, profession_id, money) value (10, 6, 1500);
insert into job(student_id, profession_id, money) value (11, 5, 2563);
insert into job(student_id, profession_id, money) value (12, 4, 6354);
insert into job(student_id, profession_id, money) value (13, 3, 8546);
insert into job(student_id, profession_id, money) value (14, 2, 5546);
insert into job(student_id, profession_id, money) value (15, 1, 2345);


# 查询有工作的学生
explain
select *
from student
         left join job on student.id = job.student_id
where job.id is not null;


# 查询没有工作的学生
explain
select *
from student
         left join job on job.student_id = student.id
         left join profession on job.profession_id = profession.id
where job.id is null;

explain
select *
from student
         left join job on job.student_id = student.id
         left join profession on job.profession_id = profession.id;




explain
select *
from student
where id in (select job.student_id from job where student_id > 12);

explain select *
from student where id=1;

