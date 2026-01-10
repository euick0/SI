Drop database if exists projetoSI;
create database projetoSI;
use projetoSi;

create table user(
    id int unsigned primary key AUTO_INCREMENT not null ,
    username varchar(225) not null unique ,
    name varchar(225) not null ,
    email varchar(225) not null unique ,
    password varchar(225) not null ,
    roleID int not null
);

create table roles(
    roleID int primary key,
    roleName varchar(255)
);

create table permissions(
    permissionID int primary key,
    permission varchar(255),
    tablePermission varchar(255)
);

create table role_permissions(
    roleID int,
    permissionID int ,
    PRIMARY KEY(roleID, permissionID),
    FOREIGN KEY (roleID) references roles(roleID),
    FOREIGN KEY (permissionID) references permissions(permissionID)
);

create table courses(
    courseID int primary key,
    courseName varchar(255)
);

create table lessons(
    lessonID int primary key,
    lessonContent varchar(50000),
    courseID int,
    FOREIGN KEY (courseID) references courses(courseID)
);

create table user_courses(
    id int unsigned,
    courseID int,
    PRIMARY KEY(id, courseID),
    FOREIGN KEY (courseID) references courses(courseID),
    FOREIGN KEY (id) references user(id)
);

insert into user(username, name, email, password, roleID) values
    ('admin', 'admin', '', 'admin12345', 1);

insert into roles values
    (1, 'Admin'),
    (3, 'User');

insert into permissions values
    (1, 'all', '*'),
    (3, 'select', '*');

insert into role_permissions values
    (1, 1),
    (3, 3);

insert into courses values
    (1, 'Russian'),
    (2, 'English'),
    (3, 'French')
