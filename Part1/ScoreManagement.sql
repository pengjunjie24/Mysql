create database gradesystem;

use gradesystem;

create table student (
	sid int(10) primary key auto_increment,
	sname varchar(32) not null,
	gender enum('male', 'female') not null
	);


create table course (
    cid int(10) primary key auto_increment,
    cname enum('math', 'physics', 'chemistry') not null
    );

create table mark ( 
	mid int(10) unique auto_increment, 
	sid int(10) not null, 
	cid int(10) not null, 
	score int(3) not null, 
	foreign key(sid) references student(sid), 
	foreign key(cid) references course(cid), 
	primary key(sid, cid)
	);

insert into student values
	(null, 'Tom', 'male'),
	(null, 'Jack', 'male'),
	(null, 'Rose', 'female');

insert into course values
	(null, 'math'),
	(null, 'physics'),
	(null, 'chemistry');
	
insert into mark values
	(null, 1, 1, 80),
	(null, 2, 1, 85),
	(null, 3, 1, 90),
	(null, 1, 2, 60),
	(null, 2, 2, 90),
	(null, 3, 2, 75),
	(null, 1, 3, 95),
	(null, 2, 3, 75),
	(null, 3, 3, 85);