drop table if exists app_chat_plugin;
create table app_chat_plugin
(
    id          varchar(30) primary key,
    name        varchar(100),
    icon        varchar(100),
    model       varchar(100),
    status      boolean               default true,
    create_time timestamp(0) not null default now()
);

comment on table app_chat_plugin is 'gpt 插件表';
comment on column app_chat_plugin.name is '插件名';
comment on column app_chat_plugin.icon is '插件图标';
comment on column app_chat_plugin.model is '插件模型';

comment on column app_chat_plugin.status is '状态 0:未启用 1:启用';

insert into app_chat_plugin(id, name, icon, model)
VALUES (1, 'AI Assistant', 'jimu-ChatGPT', 'llama3:latest');

insert into app_chat_plugin(id, name, icon, model)
VALUES (2, 'AI Test', 'jimu-ChatGPT', 'llama2:latest')