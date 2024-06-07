-- 功能表
drop table if exists app_fun;
create table app_fun
(
    id          varchar(30) primary key,
    method      varchar(10),
    name        varchar(100),
    path        varchar(100),
    status      boolean               default true,
    create_time timestamp(0) not null default now()
);

comment on table app_fun is '功能路由表';
comment on column app_fun.method is '接口类型';
comment on column app_fun.name is '功能名称';
comment on column app_fun.path is '功能路径';
comment on column app_fun.status is '菜单启用状态 0:未启用 1:启用';



drop table if exists app_org_role_fun_auth;
create table app_org_role_fun_auth
(
    id          varchar(30) primary key,
    role_id     varchar(30)  not null,
    fun_id      varchar(30)  not null,
    status      boolean      not null default true,
    create_time timestamp(0) not null default now()
);
comment on table app_org_role_fun_auth is '角色对应的功能授权';
comment on column app_org_role_fun_auth.role_id is '角色id';
comment on column app_org_role_fun_auth.fun_id is '功能id';



drop table if exists app_org_user_role_fun_auth;
create table app_org_user_role_fun_auth
(
    id          varchar(30) primary key,
    user_id     varchar(30)  not null,
    role_id     varchar(30)  not null,
    org_id      varchar(30)  not null,
    fun_id      varchar(30)  not null,
    status      boolean      not null default true,
    create_time timestamp(0) not null default now()
);