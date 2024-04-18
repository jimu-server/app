-- 初始化字典表
insert into app_dictionary(type, status, name)
values ('notify', 1, 'info');

insert into app_dictionary(type, status, name)
values ('notify', 2, 'success');

insert into app_dictionary(type, status, name)
values ('notify', 3, 'warning');

insert into app_dictionary(type, status, name)
values ('notify', 4, 'error');

insert into app_dictionary(type, status, name)
values ('notify', 5, '已处理');

insert into app_dictionary(type, status, name)
values ('notify', 6, '未处理');

insert into app_dictionary(type, status, name)
values ('user', 0, '男');

insert into app_dictionary(type, status, name)
values ('user', 1, '女');

insert into app_dictionary(type, status, name)
values ('tool', 1, '路由工具');

insert into app_dictionary(type, status, name)
values ('tool', 2, '窗口工具');

insert into app_dictionary(type, status, name)
values ('tool_position', 1, '左侧');

insert into app_dictionary(type, status, name)
values ('tool_position', 2, '右侧');


-- 初始化用户
insert into app_user(id, name, picture, account, password, gender, age, phone, email)
values (1, 'root', 'https://im-1252940994.cos.ap-nanjing.myqcloud.com/go.jpg', 'root',
        'PXeFkSq39sRSVXsSaxLWUUWDt45I8tw9mgcY8GE3B/r3VylOko0q727qPChy+uibqcFuCy6w67ruaQ3AyHHeDg==', 0, 12,
        '15527574117', '1219449282@qq.com');

-- 初始化组织

insert into app_org(id, pid, name)
values (1, '', '根组织');

-- 初始化角色
insert into app_role(id, name, role_key)
values (1, '超级管理员', 'root');
insert into app_role(id, name, role_key)
values (2, '管理员', 'admin');

-- 初始化组织角色
insert into app_org_role(id, org_id, role_id)
values (1, 1, 1);

insert into app_org_role(id, org_id, role_id)
values (2, 1, 2);


-- 初始化组织用户
insert into app_org_user(id, org_id, user_id, first_choice)
values (1, 1, 1, true);


-- 初始化 root 角色分配
insert into app_org_user_role(id, org_id, user_id, role_id, first_choice)
values (1, 1, 1, 1, true);

insert into app_org_user_role(id, org_id, user_id, role_id, first_choice)
values (2, 1, 1, 2, false);


-- 初始化路由菜单
insert into app_router(id, pid, title, icon, name, component, path, status, tool_id, sort)
values (1, '', '系统管理', 'jimu-bijibendiannao_laptop-computer-01', '', '', '', true, 1, 1);

insert into app_router(id, pid, title, icon, name, component, path, status, tool_id, sort)
values (2, 1, '账号管理', 'jimu-yonghuguanli1', 'user',
        'components/system-components/tool/manageTool/page/UserManagePage', '/app/manage/user', true, 1, 2);

insert into app_router(id, pid, title, icon, name, component, path, status, tool_id, sort)
values (3, 1, '组织管理', 'jimu-zuzhiqunzu', 'org', 'components/system-components/tool/manageTool/page/OrgManagePage',
        '/app/manage/org', true, 1, 3);

insert into app_router(id, pid, title, icon, name, component, path, status, tool_id, sort)
values (4, '', '系统配置', 'jimu-xitongpeizhi', '', '', '', true, 1, 4);

insert into app_router(id, pid, title, icon, name, component, path, status, tool_id, sort)
values (5, 4, '路由配置', 'jimu-caidan', 'menu', 'components/system-components/tool/manageTool/page/RouterManagePage',
        '/app/manage/router', true, 1, 5);

insert into app_router(id, pid, title, icon, name, component, path, status, tool_id, sort)
values (6, 4, '功能配置', 'jimu-gongnengdingyi', 'fun',
        'components/system-components/tool/manageTool/page/FunManagePage', '/app/manage/fun', true, 1, 6);

insert into app_router(id, pid, title, icon, name, component, path, status, tool_id, sort)
values (7, 4, '工具配置', 'jimu-tools', 'tool', 'components/system-components/tool/manageTool/page/ToolManagePage',
        '/app/manage/tool', true, 1, 7);

-- 初始化 root 角色的菜单权限
insert into app_org_role_router_auth(id, router_id, role_id, tool_id, org_id)
values (1, 1, 1, 1, 1);

insert into app_org_role_router_auth(id, router_id, role_id, tool_id, org_id)
values (2, 2, 1, 1, 1);

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


-- 初始化 root 用户的 root 角色的菜单权限授权
insert into app_org_user_role_router_auth(id, user_id, role_id, org_id, tool_id, router_id)
values (1, 1, 1, 1, 1, 1);

insert into app_org_user_role_router_auth(id, user_id, role_id, org_id, tool_id, router_id)
values (2, 1, 1, 1, 1, 2);

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


-- 初始化工具
insert into app_tool(id, name, router_name, icon, type, component, btn, ws, pull, path, tip, position)
VALUES (1, '管理', 'manage', 'jimu-a-xitong3', 2, 'ManageTool', 'DefaultBtn', '', '', '', '管理系统', 1);

insert into app_tool(id, name, router_name, icon, type, component, btn, ws, pull, path, tip, position)
VALUES (2, 'GPT聊天', 'gpt', 'jimu-ChatGPT', 1, 'components/system-components/tool/chatGptTool/ChatGPT', 'DefaultBtn',
        '', '', '/app/gpt', 'AI聊天', 1);

insert into app_tool(id, name, router_name, icon, type, component, btn, ws, pull, path, tip, position)
VALUES (3, '开发', 'debug', 'jimu-debug-', 1, 'components/system-components/pages/DevPage', 'DefaultBtn', '', '',
        '/app/dev', '开发调试', 1)
;

insert into app_tool(id, name, router_name, icon, type, component, btn, ws, pull, path, tip, position)
VALUES (4, '通知', 'notify', 'jimu-notify-on', 2, 'NotifyTool', 'NotifyBtn', 'ws://localhost:8080/api/notify',
        '/api/notify/pull', '', '通知', 2);

insert into app_tool(id, name, router_name, icon, type, component, btn, ws, pull, path, tip, position)
VALUES (5, '流程图', 'flow', 'jimu-flow', 1, 'components/system-components/tool/flowTool/FlowChart', 'DefaultBtn', '',
        '', '/app/flow', '流程图', 1);

insert into app_org_role_tool_auth(id, tool_id, role_id, org_id)
values (1, 1, 1, 1);

insert into app_org_role_tool_auth(id, tool_id, role_id, org_id)
values (2, 2, 1, 1);

insert into app_org_role_tool_auth(id, tool_id, role_id, org_id)
values (3, 3, 1, 1);

insert into app_org_role_tool_auth(id, tool_id, role_id, org_id)
values (4, 4, 1, 1);
insert into app_org_role_tool_auth(id, tool_id, role_id, org_id)
values (5, 5, 1, 1);


insert into app_org_user_role_tool_auth(id, user_id, role_id, org_id, tool_id)
values (1, 1, 1, 1, 1);

insert into app_org_user_role_tool_auth(id, user_id, role_id, org_id, tool_id)
values (2, 1, 1, 1, 2);

insert into app_org_user_role_tool_auth(id, user_id, role_id, org_id, tool_id)
values (3, 1, 1, 1, 3);

insert into app_org_user_role_tool_auth(id, user_id, role_id, org_id, tool_id)
values (4, 1, 1, 2, 2);

insert into app_org_user_role_tool_auth(id, user_id, role_id, org_id, tool_id)
values (5, 1, 1, 1, 4);

insert into app_org_user_role_tool_auth(id, user_id, role_id, org_id, tool_id)
values (6, 1, 1, 1, 5);


-- 初始化模型数据
insert into app_chat_model(id, name, model,picture, parameters, size, download)
values (1, 'Llama:7B', 'llama2', 'https://jimuos-1252940994.cos.ap-nanjing.myqcloud.com/llm%2Fiocn%2Fllama.png','7B', '3.8GB', 'ollama run llama2');

insert into app_chat_model(id, name, model,picture, parameters, size, download)
values (2, 'Gemma', 'gemma:2b','https://jimuos-1252940994.cos.ap-nanjing.myqcloud.com/llm%2Fiocn%2Fgemma.png' ,'2B', '1.7GB', 'ollama run gemma:2b');

insert into app_chat_model(id, name, model,picture, parameters, size, download)
values (3, 'Mistral:7B', 'mistral','https://jimuos-1252940994.cos.ap-nanjing.myqcloud.com/llm%2Fiocn%2Fmaistral.png' ,'2B', '1.7GB', 'ollama run gemma:2b');
