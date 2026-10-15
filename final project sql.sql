create database if not exists university_course_management;
use university_course_management;
create table departments (
    departmentid int primary key,
    departmentname varchar(100) not null
);
create table students (
    studentid int primary key,
    firstname varchar(50) not null,
    lastname varchar(50) not null,
    email varchar(100) unique not null,
    birthdate date,
    enrollmentdate date
);
create table courses (
    courseid int primary key,
    coursename varchar(100) not null,
    departmentid int,
    credits int,
    foreign key (departmentid)
        references departments(departmentid)
);
create table instructors (
    instructorid int primary key,
    firstname varchar(50) not null,
    lastname varchar(50) not null,
    email varchar(100) unique not null,
    departmentid int,
    salary decimal(10,2),
    foreign key (departmentid)
        references departments(departmentid)
);
create table enrollments (
    enrollmentid int primary key,
    studentid int not null,
    courseid int not null,
    enrollmentdate date,
    foreign key (studentid)
        references students(studentid),
    foreign key (courseid)
        references courses(courseid)
);
insert into departments values
(1, 'computer science'),
(2, 'mathematics');
insert into students values
(1, 'john', 'doe', 'john.doe@email.com', '2000-01-15', '2022-08-01'),
(2, 'jane', 'smith', 'jane.smith@email.com', '1999-05-25', '2021-08-01'),
(3, 'alex', 'patel', 'alex.patel@email.com', '2002-03-12', '2023-07-15'),
(4, 'sara', 'shah', 'sara.shah@email.com', '2001-11-20', '2022-09-01'),
(5, 'david', 'kumar', 'david.kumar@email.com', '2000-06-05', '2024-01-10'),
(6, 'mia', 'brown', 'mia.brown@email.com', '2003-02-18', '2025-06-20');
select*from students;
insert into courses values
(101, 'introduction to sql', 1, 3),
(102, 'data structures', 2, 4),
(103, 'database systems', 1, 3),
(104, 'statistics', 2, 4),
(105, 'python programming', 1, 3),
(106, 'calculus', 2, 4);
insert into instructors values
(1, 'alice', 'johnson', 'alice.johnson@univ.com', 1, 65000),
(2, 'bob', 'lee', 'bob.lee@univ.com', 2, 62000),
(3, 'maria', 'garcia', 'maria.garcia@univ.com', 1, 71000),
(4, 'sam', 'wilson', 'sam.wilson@univ.com', 2, 68000);
insert into enrollments values
(1, 1, 101, '2022-08-01'),
(2, 2, 102, '2021-08-01'),
(3, 1, 102, '2022-08-03'),
(4, 3, 101, '2023-07-15'),
(5, 3, 105, '2023-07-16'),
(6, 4, 102, '2022-09-01'),
(7, 4, 104, '2022-09-02'),
(8, 5, 103, '2024-01-10'),
(9, 5, 101, '2024-01-11'),
(10, 6, 106, '2025-06-20');
select * from departments;
select * from students;
select * from courses;
select * from instructors;
select * from enrollments;
insert into students values
(7, 'riya', 'mehta', 'riya.mehta@email.com', '2002-04-10', '2024-08-01');
select * from students;
update students
set email = 'riya.updated@email.com'
where studentid = 7;
select * from students
where studentid = 7;
delete from students
where studentid = 7;
select * from students;
select *
from students
where enrollmentdate >= '2023-01-01';
select c.courseid, c.coursename, c.credits
from courses c
inner join departments d
on c.departmentid = d.departmentid
where d.departmentname = 'mathematics'
limit 5;
select c.courseid, c.coursename,
       count(distinct e.studentid) as studentcount
from courses c
inner join enrollments e
on c.courseid = e.courseid
group by c.courseid, c.coursename
having count(distinct e.studentid) > 5;
select s.studentid, s.firstname, s.lastname
from students s
inner join enrollments e
on s.studentid = e.studentid
inner join courses c
on e.courseid = c.courseid
where c.coursename in ('introduction to sql', 'data structures')
group by s.studentid, s.firstname, s.lastname
having count(distinct c.coursename) = 2;
select distinct s.studentid, s.firstname, s.lastname
from students s
inner join enrollments e
on s.studentid = e.studentid
inner join courses c
on e.courseid = c.courseid
where c.coursename in ('introduction to sql', 'data structures');
select avg(credits) as averagecredits
from courses;
select max(i.salary) as maximumsalary
from instructors i
inner join departments d
on i.departmentid = d.departmentid
where d.departmentname = 'computer science';
select d.departmentid, d.departmentname,
       count(distinct e.studentid) as studentcount
from departments d
left join courses c
on d.departmentid = c.departmentid
left join enrollments e
on c.courseid = e.courseid
group by d.departmentid, d.departmentname;
select s.studentid, s.firstname, s.lastname, c.coursename
from students s
inner join enrollments e
on s.studentid = e.studentid
inner join courses c
on e.courseid = c.courseid;
select s.studentid, s.firstname, s.lastname, c.coursename
from students s
left join enrollments e
on s.studentid = e.studentid
left join courses c
on e.courseid = c.courseid
order by s.studentid;
select distinct s.studentid, s.firstname, s.lastname
from students s
inner join enrollments e
on s.studentid = e.studentid
where e.courseid in (
    select courseid
    from enrollments
    group by courseid
    having count(distinct studentid) > 10
);
select studentid, firstname, lastname,
       year(enrollmentdate) as enrollmentyear
from students;
select instructorid,
       concat(firstname, ' ', lastname) as instructorname
from instructors;
select enrollmentid, studentid, courseid, enrollmentdate,
       count(*) over (
           order by enrollmentdate, enrollmentid
           rows between unbounded preceding and current row
       ) as runningtotal
from enrollments;
select studentid, firstname, lastname, enrollmentdate,
       case
           when enrollmentdate < date_sub(curdate(), interval 4 year)
           then 'senior'
           else 'junior'
       end as studentlevel
from students;