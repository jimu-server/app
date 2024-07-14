-- 工具栏
drop table if exists app_tool;
create table app_tool
(
    id          varchar(30) primary key,
    name        varchar(100) not null,
    router_name varchar(50)  not null,
    icon        varchar(100) not null,
    component   varchar(100) not null,
    btn         varchar(100) not null,
    type        int          not null,
    ws          varchar(200) not null,
    pull        varchar(100) not null,
    path        varchar(200) not null,
    tip         varchar(100) not null,
    status      boolean      not null default true,
    position    int          not null
);
comment on table app_tool is '周边工具栏表';
comment on column app_tool.name is '工具名';
comment on column app_tool.router_name is '路由名称,并且不能重复';
comment on column app_tool.icon is '图标';
comment on column app_tool.component is '工具对应窗口组件';
comment on column app_tool.btn is '工具对应按钮';
comment on column app_tool.type is '工具类型,1路由工具,2工具窗口工具(对应没有 path路径,component对应则是工具展示的窗口组件)';
comment on column app_tool.ws is '消息推送接口';
comment on column app_tool.pull is '消息拉取接口';
comment on column app_tool.path is '工具基础路径 工具栏下的所有路由都应该基于此 /{name}';
comment on column app_tool.tip is '提示语,一般填写工具名称';
comment on column app_tool.status is '是否禁用，禁用将不能分配给角色';
comment on column app_tool.position is '工具按钮位置信息 1:左侧 2:右侧';

-- 初始化工具
insert into app_tool(id, name, router_name, icon, type, component, btn, ws, pull, path, tip, position)
VALUES (1, '后台管理', 'manage', 'jimu-a-xitong3', 2, 'ManageTool', 'DefaultBtn', '', '', '', '后台管理', 1);

insert into app_tool(id, name, router_name, icon, type, component, btn, ws, pull, path, tip, position)
VALUES (2, 'Ai聊天', 'gpt', 'jimu-icon_zhinengzhushou', 1, 'components/tool-components/chatGptTool/ChatGPT',
        'GptBtn',
        '', '', '/app/gpt', 'Ai聊天', 1);

insert into app_tool(id, name, router_name, icon, type, component, btn, ws, pull, path, tip, position)
VALUES (3, '开发', 'debug', 'jimu-debug-', 1, 'components/system-components/pages/DevPage', 'DefaultBtn', '', '',
        '/app/dev', '开发调试', 1);

insert into app_tool(id, name, router_name, icon, type, component, btn, ws, pull, path, tip, position)
VALUES (4, '通知', 'notify', 'jimu-notify-on', 2, 'NotifyTool', 'NotifyBtn', 'ws://localhost:8080/api/notify',
        '/api/notify/pull', '', '通知', 2);


-- 组织角色授权
drop table if exists app_org_role_tool_auth;
create table app_org_role_tool_auth
(
    id          varchar(30) primary key,
    org_id      varchar(30)  not null,
    role_id     varchar(30)  not null,
    tool_id     varchar(30)  not null,
    status      boolean      not null default true,
    create_time timestamp(0) not null default now()
);
comment on table app_org_role_tool_auth is '角色对应的工具栏授权';
comment on column app_org_role_tool_auth.org_id is '组织id';
comment on column app_org_role_tool_auth.role_id is '角色id';
comment on column app_org_role_tool_auth.tool_id is '工具栏id';
comment on column app_org_role_tool_auth.status is '角色工具权限是否启用，禁用情况下将无法在给用户授权时候展示';

-- 初始化 根组织的 超级管理员角色 权限工具
insert into app_org_role_tool_auth(id, tool_id, role_id, org_id)
values (1, 1, 1, 1);

insert into app_org_role_tool_auth(id, tool_id, role_id, org_id)
values (2, 2, 1, 1);

insert into app_org_role_tool_auth(id, tool_id, role_id, org_id)
values (3, 3, 1, 1);

insert into app_org_role_tool_auth(id, tool_id, role_id, org_id)
values (4, 4, 1, 1);


-- 临时添加(根据业务情况可删除) 添加普通用户的 GPT 权限
insert into app_org_role_tool_auth(id, tool_id, role_id, org_id)
values (7, 2, 3, 1);


-- 组织用户角色授权
drop table if exists app_org_user_role_tool_auth;
create table app_org_user_role_tool_auth
(
    id          varchar(30) primary key,
    user_id     varchar(30)  not null,
    role_id     varchar(30)  not null,
    org_id      varchar(30)  not null,
    tool_id     varchar(30)  not null,
    status      boolean      not null default true,
    create_time timestamp(0) not null default now()
);
comment on table app_org_user_role_tool_auth is '组织-用户-角色-工具栏授权表';
comment on column app_org_user_role_tool_auth.org_id is '组织id';
comment on column app_org_user_role_tool_auth.user_id is '用户id';
comment on column app_org_user_role_tool_auth.role_id is '角色id';
comment on column app_org_user_role_tool_auth.tool_id is '工具栏id';
comment on column app_org_user_role_tool_auth.status is '是否禁用，禁用角色资源将无法加载';

-- 给 根组织 root 用户进行授权 所有工具权限
insert into app_org_user_role_tool_auth(id, user_id, role_id, org_id, tool_id)
values (1, 1, 1, 1, 1);

insert into app_org_user_role_tool_auth(id, user_id, role_id, org_id, tool_id)
values (2, 1, 1, 1, 2);

insert into app_org_user_role_tool_auth(id, user_id, role_id, org_id, tool_id)
values (3, 1, 1, 1, 3);

insert into app_org_user_role_tool_auth(id, user_id, role_id, org_id, tool_id)
values (4, 1, 1, 1, 4);


