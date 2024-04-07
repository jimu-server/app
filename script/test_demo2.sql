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
insert into student(name, age, gender, lv) value ('aa', 11, '女', '小学');
insert into student(name, age, gender, lv) value ('bb', 22, '男', '小学');
insert into student(name, age, gender, lv) value ('cc', 11, '女', '小学');
insert into student(name, age, gender, lv) value ('dd', 23, '男', '小学');
insert into student(name, age, gender, lv) value ('sa', 24, '女', '高中');
insert into student(name, age, gender, lv) value ('sd', 34, '男', '高中');
insert into student(name, age, gender, lv) value ('vv', 45, '女', '高中');
insert into student(name, age, gender, lv) value ('ff', 8, '男', '高中');
insert into student(name, age, gender, lv) value ('aa', 9, '女', '高中');
insert into student(name, age, gender, lv) value ('tt', 22, '男', '大学');
insert into student(name, age, gender, lv) value ('aa', 23, '女', '大学');
insert into student(name, age, gender, lv) value ('33', 23, '男', '大学');
insert into student(name, age, gender, lv) value ('ty', 24, '女', '大学');
insert into student(name, age, gender, lv) value ('hj', 24, '男', '大学');
insert into student(name, age, gender, lv) value ('mn', 25, '女', '大学');
insert into student(name, age, gender, lv) value ('qq', 26, '男', '大学');

alter table student
    add index gender_age_lv_key (gender, age, lv);

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
    student_id    int,
    profession_id int,
    money         float,
    primary key (student_id, profession_id)
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


explain
select *
from student where id = 10;

explain
select *
from student where gender='男' and age=22 and  lv in ('小学');

explain
select *
from student where gender='男' and age=22 and  lv in ('小学', '大学');


# 查询有工作的学生
explain
select *
from job
         left join student on student.id = job.student_id
         left join profession on profession.id = job.profession_id;


# 查询有工作的学生
explain
select *
from job
         left join student on student.id = job.student_id
         left join profession on profession.id = job.profession_id
where job.student_id in (10, 11);

explain
select *
from job,
     student,
     profession
where student.id = job.student_id
  and job.profession_id = profession.id;


explain
select job.student_id
from job,
     student,
     profession
where student.id = job.student_id
  and job.profession_id = profession.id;

explain
select job.student_id
from job,
     student,
     profession
where student.id = job.student_id
  and job.profession_id = profession.id
  and job.student_id > 1;


# 查询没有工作的学生
explain
select *
from student
         left join job on student.id = job.student_id
         left join profession on job.profession_id = profession.id
where job.profession_id is null;

# 避免在链接查询中 使用 null 判断 通过其他判断条件实现反向查找
explain
select *
from student
         left join job on student.id = job.student_id
         left join profession on job.profession_id = profession.id
where job.student_id in (1);



explain
select *
from job,
     student,
     profession
where student.id = job.student_id
  and job.profession_id = profession.id
  and job.student_id = 1;






