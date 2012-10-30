drop table if exists relationship;
drop table if exists post;
drop table if exists photo;
drop table if exists role;
drop table if exists user;

create table user
(
  id int not null primary key,
  name varchar(128) not null,
  email varchar(256)
) engine=innodb;

create table post
(
  id int not null primary key,
  user_id int not null,
  status varchar(256) not null,
  posted_at datetime not null,
  latitude decimal(11, 7),
  longitude decimal(11,7),
  constraint`fk_00` foreign key (user_id) references user (id)
) engine=innodb;

create table role
(
  user_id int not null,
  role_name varchar(64) not null,
  primary key(user_id, role_name),
  constraint`fk_01` foreign key (user_id) references user (id)
) engine=innodb;

create table photo
(
  id int not null primary key,
  user_id int not null,
  state varchar(64) not null,
  date_added datetime,
  path varchar(256) not null,
  constraint`fk_02` foreign key (user_id) references user (id)
) engine=innodb;

create table relationship
(
  follower_id int not null,
  followed_id int not null,
  primary key(follower_id, followed_id),
  constraint`fk_03` foreign key (follower_id) references user (id),
  constraint`fk_04` foreign key (followed_id) references user (id)
) engine=innodb;
