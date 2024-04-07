select *
from app_user;

-- 查询 指定用户的指定角色的菜单权限
select m.*
from app_org_user_role_menu_auth ourma
         left join app_menu m on (ourma.menu_id = m.id)
where ourma.user_id = '1'
  and ourma.role_id = '1'
order by sort;

select m.*
from app_org_user_role_tool_auth ourma
         left join app_tool m on (ourma.tool_id = m.id)
where ourma.user_id = '1'
  and ourma.role_id = '1'
  and org_id = '1'
order by create_time;


select *
from app_org_user
         left join app_org on app_org_user.org_id = app_org.id
where id = '1';

select r.*
from app_org_user ou
         left join app_org_user_role our on (ou.org_id = our.org_id and ou.user_id = our.user_id)
         left join app_role r on our.role_id = r.id
where ou.user_id = '1'
  and ou.org_id = '1'

select app_org.*
from app_org_user
         left join app_org on app_org_user.org_id = app_org.id
where app_org_user.id = '1';


select u.*
from app_org_user ou
         left join app_user u on ou.user_id = user_id
where org_id = '1'
limit 5 offset 0;

select ou.user_id, u.id
from app_org_user ou
         left join app_user u on ou.user_id = user_id
where org_id = '1';

select ou.user_id
from app_org_user ou
         left join app_user u on ou.user_id = u.id

where org_id = '1';

select r.*
from app_role r
         left join app_org_role aor on aor.role_id = r.id
where org_id = '1';

select r.*
from app_org_user ou
         left join app_org_user_role our on (ou.org_id = our.org_id and ou.user_id = our.user_id)
         left join app_role r on our.role_id = r.id
where ou.user_id = '2'
  and ou.org_id = '1';


select arra.router_id
from app_org_role aor
         left join app_role_router_auth arra on aor.role_id = arra.role_id
where org_id = '1'
  and aor.role_id = '1';


select arra.tool_id
from app_org_role aor
         left join app_org_role_tool_auth arra on aor.role_id = arra.role_id
where org_id = '1'
  and aor.role_id = '1';


select r.*
from app_org_user_role_router_auth ourma
         left join app_router r on (ourma.router_id = r.id)
where ourma.org_id = '1'
  and ourma.user_id = '2'
  and ourma.role_id = '2'
  and ourma.tool_id = '1'
order by sort;


select at.*
from app_org_role aor
         left join app_org_role_tool_auth aorta on (aor.role_id = aorta.role_id)
         left join app_tool at on at.id = aorta.tool_id
where aor.org_id = '1'
  and aor.role_id = '2'
  and aorta.id is not null;


select ar.*
from app_org_role aor
         left join app_org_role_router_auth aorra on (aor.role_id = aorra.role_id)
         left join app_router ar on ar.id = aorra.router_id
where org_id = '1'
  and aor.role_id = '1'
  and aorra.tool_id = '1';

select ar.*
from app_tool at
         left join app_router ar on at.id = ar.tool_id
where tool_id='1' and pid='';

select ar.*
from app_tool at
         left join app_router ar on at.id = ar.tool_id
where tool_id='1' and pid='' limit 10 offset 0;
