-- Drop database if it's already there
drop database attendance;

--CRUD for the database

--Create
create database attendance; 
use attendance;

create table students(
    id int not null auto_increment,
    name varchar(120) not null,
    email varchar(120) not null,
    phone varchar(10),
    github varchar(120),
    slack_name varchar(120),
    created_at timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
    deleted_at timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
    primary key(id)
);

create table attendance_logs(
    id int not null auto_increment,
    student_id int not null,
    attendance_date timestamp,
    created_at timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
    deleted_at timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
    primary key(id),
    foreign key(student_id) references students(id)
);

-- READ

show tables;
desc students;
desc attendance_logs;

--update
alter table attendance_logs
add lat float after attendance_date;

alter table attendance_logs
add lng float after lat;

desc attendance_logs;

--delete
drop table attendance_logs;
drop table students;
show tables;