drop table if exists im_account;
create table if not exists im_account
(
    id       varchar(50) primary key,
    name     varchar(50)  not null,
    picture  varchar(200) not null default '',
    account  varchar(50)  not null,
    password varchar(100) not null,
    gender   char(2)      not null default '男',
    age      int          not null default 0,
    salt     varchar(10)  not null,
    created  timestamp(0) not null
);
create index im_account_key on im_account (account);
comment on table im_account is '系统的账号表 对应 openim 中的用户表';
comment on column im_account.account is '用户注册账号 对应 openim userID';
comment on column im_account.name is '用户昵称 对应 openim nickName';
comment on column im_account.picture is '用户头像 对应 openim faceURL';
comment on column im_account.password is '用户密码';
comment on column im_account.gender is '性别';
comment on column im_account.age is '年龄';
comment on column im_account.created is '创建时间';

drop table if exists im_group;
create table if not exists im_group
(
    id        varchar(50) primary key,
    groupName varchar(50)  not null,
    picture   varchar(200) not null default '',
    group_id  varchar(50)  not null,
    created   timestamp(0) not null
);
create index im_group_key on im_group (group_id);
comment on table im_group is '系统的群表 对应 openim 中的群';
comment on column im_group.group_id is '群号';
comment on column im_group.groupName is '群名';
comment on column im_group.picture is '群头像';
comment on column im_group.created is '创建时间';

drop table if exists im_article;
create table if not exists im_article
(
    id      varchar(50) primary key,
    user_id varchar(50)  not null,
    content text,
    mediums json,
    created timestamp(0) not null
);
create index im_article_time_key on im_article (created);
comment on table im_article is 'IM 系统朋友圈';
comment on column im_article.id is '文章ID';
comment on column im_article.user_id is '创建者';
comment on column im_article.content is '文章内容';
comment on column im_article.created is '创建时间';
comment on column im_article.mediums is '文章附件,一般是图片或者视频的json数据';


drop table if exists im_article_comment;
create table if not exists im_article_comment
(
    id         varchar(50) primary key,
    pid        varchar(50)  not null,
    article_id varchar(50)  not null,
    user_id    varchar(50),
    text       text         not null,
    Created    timestamp(0) not null
);

create index im_article_comment_time_key on im_article_comment (created);
comment on table im_article_comment is 'IM 系统朋友圈评论';
comment on column im_article_comment.id is '评论id';
comment on column im_article_comment.pid is '父级评论id';
comment on column im_article_comment.article_id is '文章id';
comment on column im_article_comment.user_id is '评论者id';
comment on column im_article_comment.text is '评论内容';
comment on column im_article_comment.created is '创建时间';

drop table if exists im_article_like;
create table if not exists im_article_like
(
    id         varchar(50) primary key,
    user_id    varchar(50)  not null,
    article_id varchar(50)  not null,
    created    timestamp(0) not null
);
comment on table im_article_like is 'IM 朋友群点赞';
comment on column im_article_like.id is '点赞id';
comment on column im_article_like.user_id is '用户id';
comment on column im_article_like.article_id is '文章id';
comment on column im_article_like.created is '点赞时间';
