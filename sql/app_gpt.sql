drop table if exists app_chat_plugin;
create table app_chat_plugin
(
    id          varchar(30) primary key,
    name        varchar(100) not null,
    code        varchar(100) not null,
    icon        varchar(100)          default '',
    model       varchar(100)          default '',
    float_view  varchar(100)          default '',
    props       json                  default '{}',
    status      boolean               default true,
    create_time timestamp(0) not null default now()
);

comment on table app_chat_plugin is 'gpt 插件表';
comment on column app_chat_plugin.name is '插件名';
comment on column app_chat_plugin.code is '插件代码';
comment on column app_chat_plugin.icon is '插件图标';
comment on column app_chat_plugin.model is '插件模型';
comment on column app_chat_plugin.float_view is '插件悬浮菜单面板组件';
comment on column app_chat_plugin.props is '插件悬浮菜单面板组件属性';

comment on column app_chat_plugin.status is '状态 0:未启用 1:启用';

insert into app_chat_plugin(id, name, code, icon, model)
VALUES (1, 'AI 助手', 'default', 'jimu-ChatGPT', 'qwen2:7b');

insert into app_chat_plugin(id, name, code, icon, model, float_view)
VALUES (2, '编程助手', 'programming', 'jimu-code', 'llama3:latest', 'ProgrammingAssistantPanelView');

insert into app_chat_plugin(id, name, code, icon, model, float_view)
VALUES (3, '知识库', 'knowledge', 'jimu-zhishi', 'qwen2:7b', 'KnowledgePanelView');