drop table if exists app_chat_conversation;
create table app_chat_conversation
(
    id          varchar(30) primary key,
    picture     varchar(500) not null default '',
    user_id     varchar(30)  not null,
    title       varchar(100) not null,
    last_model  varchar(30)           default '',
    last_msg    text                  default '',
    last_time   timestamp(0) not null default now(),
    is_delete      int          not null default 0,
    create_time timestamp(0) not null default now()
);

comment on table app_chat_conversation is 'gpt 会话表';
comment on column app_chat_conversation.picture is '会话头像';
comment on column app_chat_conversation.user_id is '接收者id:一般是用户id';
comment on column app_chat_conversation.last_model is '最后一次消息的模型id';
comment on column app_chat_conversation.last_msg is '最后一次消息的内容';
comment on column app_chat_conversation.last_time is '最后一次消息的时间';
comment on column app_chat_conversation.title is '会话标题';


drop table if exists app_chat_message;
create table app_chat_message
(
    id              varchar(30) primary key,
    conversation_id varchar(30)  not null,
    message_id      varchar(30)  not null,
    user_id         varchar(30)  not null,
    model_id        varchar(30)  not null,
    picture         varchar(100) not null,
    role            varchar(30)  not null,
    content         text,
    is_delete          int          not null default 0,
    create_time     timestamp(0) not null default now()
);

comment on table app_chat_message is 'gpt 会话消息表';
comment on column app_chat_message.user_id is '所属用户';
comment on column app_chat_message.message_id is '标识当前消息相关回复的消息id,对于用户发送的消息,回复的消息应该是gpt的消息id,若是首次消息则为消息主键本身';
comment on column app_chat_message.model_id is '模型id,当前消息产生于那个模型';
comment on column app_chat_message.picture is '消息头像,消息角色所属头像';
comment on column app_chat_message.conversation_id is '消息所属会话';
comment on column app_chat_message.role is '消息角色 :user[用户] or assistant[助手]';
comment on column app_chat_message.content is '消息内容';
comment on column app_chat_message.create_time is '消息时间';


drop table if exists app_chat_model;
create table app_chat_model
(
    id            varchar(30) primary key,
    pid           varchar(30)  not null,
    user_id       varchar(30)  not null,
    name          varchar(100) not null,
    model         varchar(100) not null,
    picture       varchar(100) not null,
    size          varchar(50)  not null,
    digest        varchar(100)          default '',
    model_details json                  default '{}',
    is_download   boolean               default false,
    create_time   timestamp(0) not null default now()
);
create index model_key on app_chat_model (model);
comment on table app_chat_model is 'ollama 内置模型';
comment on column app_chat_model.user_id is '所属用户';
comment on column app_chat_model.pid is '父模型,内置模型的 pid==id';
comment on column app_chat_model.name is '名称,显示名称';
comment on column app_chat_model.model is '模型名,一版是调用模型传参';
comment on column app_chat_model.picture is '图标';
comment on column app_chat_model.size is '模型大小';
comment on column app_chat_model.is_download is '是否下载';

drop table if exists app_chat_knowledge_file;
create table app_chat_knowledge_file
(
    id          varchar(30) primary key,
    pid         varchar(30)  not null,
    user_id     varchar(30)  not null,
    file_name   varchar(100) not null,
    file_path   varchar(100) not null,
    file_type   int          not null,
    create_time timestamp(0) not null default now()
);
comment on table app_chat_knowledge_file is '知识库文件';
comment on column app_chat_knowledge_file.id is '知识库id';
comment on column app_chat_knowledge_file.pid is '上级';
comment on column app_chat_knowledge_file.file_name is '文件名';
comment on column app_chat_knowledge_file.file_path is '文件路径';
comment on column app_chat_knowledge_file.file_type is '文件类型';
comment on column app_chat_knowledge_file.create_time is '创建时间';

drop table if exists app_chat_knowledge_instance;
create table app_chat_knowledge_instance
(
    id                    varchar(30) primary key,
    user_id               varchar(30)  not null,
    knowledge_name        varchar(500) not null default '[]',
    knowledge_files       json         not null default '[]',
    knowledge_description varchar(500) not null default '',
    knowledge_type        int          not null default 0,
    create_time           timestamp(0) not null default now()
);
comment on table app_chat_knowledge_instance is '知识库实例';
comment on column app_chat_knowledge_instance.user_id is '所属用户';
comment on column app_chat_knowledge_instance.knowledge_name is '知识库名称';
comment on column app_chat_knowledge_instance.knowledge_description is '知识库描述';
comment on column app_chat_knowledge_instance.knowledge_files is '知识库文件列表';
comment on column app_chat_knowledge_instance.create_time is '创建时间';
comment on column app_chat_knowledge_instance.knowledge_type is '知识库类型;区分系统预置,和用户创建';