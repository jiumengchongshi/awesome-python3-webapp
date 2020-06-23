-- schema.sql

drop database if exists awesome;
drop user if exists 'www-data'@'localhost';

create database awesome;

use awesome;

-- Create a new user named 'www-data' with a password of 'www-data'.Only local login is allowed.
create user 'www-data'@'localhost' identified by 'www-data';
-- The following sentence can not understand.There is a lot more to learn about SQL and mysql.
alter user 'www-data'@'localhost' identified with mysql_native_password by 'www-data';
grant select, insert, update, delete on awesome.* to 'www-data'@'localhost';

create table users (
    `id` varchar(50) not null,
    `email` varchar(50) not null,
    `passwd` varchar(50) not null,
    `admin` bool not null,
    `name` varchar(50) not null,
    `image` varchar(500) not null,
    `created_at` real not null,
    unique key `idx_email` (`email`),
    key `idx_created_at` (`created_at`),
    primary key (`id`)
)engine=innodb default charset=utf8;

CREATE TABLE blogs (
    `id` varchar(50) not null,
    `user_id` varchar(50) not null,
    `user_name` varchar(50) not null,
    `user_image` varchar(500) not null,
    `name` varchar(50) not null,
    `summary` varchar(200) not null,
    `content` mediumtext not null,
    `created_at` real not null,
    KEY `idx_created_at` (`created_at`),
    PRIMARY KEY (`id`)
) engine=innodb default charset=utf8;

CREATE TABLE comments (
    `id` varchar(50) NOT NULL,
    `blog_id` varchar(50) NOT NULL,
    `user_id` varchar(50) NOT NULL,
    `user_name` varchar(50) NOT NULL,
    `user_image` varchar(500) NOT NULL,
    `content` mediumtext NOT NULL,
    `created_at` real NOT NULL,
    KEY `idx_created_at` (`created_at`),
    PRIMARY KEY (`id`)
)engine=innodb default charset=utf8;