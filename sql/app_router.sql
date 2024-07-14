-- 系统路由
drop table if exists app_router;
create table app_router
(
    id          varchar(30) primary key,
    pid         varchar(30)           default '0',
    title       varchar(100)          default '',
    name        varchar(100)          default '',
    icon        varchar(100)          default '',
    component   varchar(200)          default '',
    path        varchar(100)          default '',
    remark      varchar(500)          default '',
    router_type int                   default 0,
    status      bool                  default true,
    sort        int                   default 0,
    tool_id     varchar(30)           default 0,
    create_time timestamp(0) not null default now()
);
comment on table app_router is '系统路由表';
comment on column app_router.pid is '父节点';
comment on column app_router.name is '菜单标题 ';
comment on column app_router.icon is '组件图标';
comment on column app_router.component is '组件名称,组件基于前端根路径的路径信息';
comment on column app_router.path is '路由路径(注册路由时候的注册路径)';
comment on column app_router.remark is '备注信息';
comment on column app_router.router_type is '路由类型 0:菜单树 1:按钮路由';
comment on column app_router.status is '菜单启用状态 0:未启用 1:启用';
comment on column app_router.sort is '排序字段';
comment on column app_router.tool_id is '菜单所属工具栏';
comment on column app_router.create_time is '创建时间';

-- 路由菜单
insert into app_router(id, pid, title, icon, name, component, path, status, tool_id, sort)
values (1, '', '系统管理', 'jimu-bijibendiannao_laptop-computer-01', '', '', '', true, 1, 1);

insert into app_router(id, pid, title, icon, name, component, path, status, tool_id, sort)
values (3, 1, '组织管理', 'jimu-zuzhiqunzu', 'org', 'components/system-tool/manageTool/page/OrgManagePage',
        '/app/manage/org', true, 1, 3);

insert into app_router(id, pid, title, icon, name, component, path, status, tool_id, sort)
values (4, 1, '角色管理', 'jimu-jiaoseguanli', 'org', 'components/system-tool/manageTool/page/RoleManagePage',
        '/app/manage/org', true, 1, 3);

insert into app_router(id, pid, title, icon, name, component, path, status, tool_id, sort)
values (5, '', '系统配置', 'jimu-xitongpeizhi', '', '', '', true, 1, 4);

insert into app_router(id, pid, title, icon, name, component, path, status, tool_id, sort)
values (6, 5, '路由配置', 'jimu-caidan', 'menu', 'components/system-tool/manageTool/page/RouterManagePage',
        '/app/manage/router', true, 1, 5);

insert into app_router(id, pid, title, icon, name, component, path, status, tool_id, sort)
values (7, 5, '功能配置', 'jimu-gongnengdingyi', 'fun',
        'components/system-tool/manageTool/page/FunManagePage', '/app/manage/fun', true, 1, 7);

insert into app_router(id, pid, title, icon, name, component, path, status, tool_id, sort)
values (8, 5, '工具配置', 'jimu-tools', 'tool', 'components/system-tool/manageTool/page/ToolManagePage',
        '/app/manage/tool', true, 1, 6);

-- 组织 角色路由授权
drop table if exists app_org_role_router_auth;
create table app_org_role_router_auth
(
    id          varchar(30) primary key,
    org_id      varchar(30)  not null,
    role_id     varchar(30)  not null,
    tool_id     varchar(30)  not null,
    router_id   varchar(30)  not null,
    status      boolean      not null default true,
    create_time timestamp(0) not null default now()
);
comment on table app_org_role_router_auth is '角色对应工具栏授权的路由表';
comment on column app_org_role_router_auth.org_id is '组织id';
comment on column app_org_role_router_auth.role_id is '角色id';
comment on column app_org_role_router_auth.tool_id is '工具栏id';
comment on column app_org_role_router_auth.router_id is '路由id';

-- 初始化 根组织 超级管理员的角色的菜单权限
insert into app_org_role_router_auth(id, router_id, role_id, tool_id, org_id)
values (1, 1, 1, 1, 1);


insert into app_org_role_router_auth(id, router_id, role_id, tool_id, org_id)
values (3, 3, 1, 1, 1);

insert into app_org_role_router_auth(id, router_id, role_id, tool_id, org_id)
values (4, 4, 1, 1, 1);

insert into app_org_role_router_auth(id, router_id, role_id, tool_id, org_id)
values (5, 5, 1, 1, 1);

insert into app_org_role_router_auth(id, router_id, role_id, tool_id, org_id)
values (6, 6, 1, 1, 1);

insert into app_org_role_router_auth(id, router_id, role_id, tool_id, org_id)
values (7, 7, 1, 1, 1);

insert into app_org_role_router_auth(id, router_id, role_id, tool_id, org_id)
values (8, 8, 1, 1, 1);


-- 组织用户角色授权
drop table if exists app_org_user_role_router_auth;
create table app_org_user_role_router_auth
(
    id          varchar(30) primary key,
    org_id      varchar(30)  not null,
    user_id     varchar(30)  not null,
    role_id     varchar(30)  not null,
    tool_id     varchar(30)  not null,
    router_id   varchar(30)  not null,
    status      boolean      not null default true,
    create_time timestamp(0) not null default now()
);
comment on table app_org_user_role_router_auth is '组织-用户-角色-工具栏-路由授权表';
comment on column app_org_user_role_router_auth.org_id is '组织id';
comment on column app_org_user_role_router_auth.user_id is '用户id';
comment on column app_org_user_role_router_auth.role_id is '角色id';
comment on column app_org_user_role_router_auth.tool_id is '工具栏id';
comment on column app_org_user_role_router_auth.router_id is '路由id';

-- 初始化 根组织 root 用户 的菜单权限授权
insert into app_org_user_role_router_auth(id, user_id, role_id, org_id, tool_id, router_id)
values (1, 1, 1, 1, 1, 1);


insert into app_org_user_role_router_auth(id, user_id, role_id, org_id, tool_id, router_id)
values (3, 1, 1, 1, 1, 3);

insert into app_org_user_role_router_auth(id, user_id, role_id, org_id, tool_id, router_id)
values (4, 1, 1, 1, 1, 4);

insert into app_org_user_role_router_auth(id, user_id, role_id, org_id, tool_id, router_id)
values (5, 1, 1, 1, 1, 5);

insert into app_org_user_role_router_auth(id, user_id, role_id, org_id, tool_id, router_id)
values (6, 1, 1, 1, 1, 6);

insert into app_org_user_role_router_auth(id, user_id, role_id, org_id, tool_id, router_id)
values (7, 1, 1, 1, 1, 7);

insert into app_org_user_role_router_auth(id, user_id, role_id, org_id, tool_id, router_id)
values (8, 1, 1, 1, 1, 8);

