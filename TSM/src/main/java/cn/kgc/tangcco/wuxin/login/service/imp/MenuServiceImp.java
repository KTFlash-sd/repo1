package cn.kgc.tangcco.wuxin.login.service.imp;

import java.util.ArrayList;
import java.util.List;

import cn.kgc.tangcco.entity.Account;
import cn.kgc.tangcco.entity.Menu;
import cn.kgc.tangcco.entity.Role;
import cn.kgc.tangcco.util.PageBean;
import cn.kgc.tangcco.wuxin.login.dao.imp.MenuDaoImp;

public class MenuServiceImp {
	MenuDaoImp menudao=new MenuDaoImp();
	
			//查询所有菜单
			public List<Menu> queryMenu(){
				String sql="select * from menu ";
				List<Menu> list=menudao.query(Menu.class, sql);
				return list;
			}
			
			//分页查询菜单
			public List<Menu> pageMenu(PageBean pagebean, String thispage){
				List<Menu> list=new ArrayList<Menu>();
				List<Menu> lists=queryMenu();
				String sql="select * from menu where Mdel='1' limit ?,?";
				pagebean.setTotalsize(lists.size());
				pagebean.setThispage(thispage);
				int index=pagebean.getRowindex();
				list=menudao.query(Menu.class, sql, index,pagebean.getPagesize());
				return list;
			}
			
			
			//添加请求
			public String addMenu(Menu menu) {
				String message=" ";
				Menu a=find(menu.getMid());
				if (a!=null) {
					message="添加失败，菜单已存在";
				}else {
						String sql="insert into menu values(menu.Mid,?,?,?,?,1,1)";
						int n=menudao.modify(sql, menu.getMname(),menu.getMurl(),menu.getMfid(),menu.getMrank());
						message=n>0?"添加成功":"添加失败";
					}
				return message;
			}
			/**
			 * 找到一个菜单对象
			 * @param aid
			 * @return
			 */
			public Menu find(int rid) {
				String sql="select * from menu where Mid=?";
				Menu menu=(Menu) menudao.find(Menu.class, sql, rid);
				if (menu!=null) ;
				return menu;
			}
			/**
			 * 假删除业务
			 * @param aid
			 * @return
			 */
			public String fakeDelMenu(int mid) {
				String message="";
				String sql="update menu set Mdel='0' where Mid=?";
				int n=menudao.modify(sql,mid);
				message=n>0?"删除成功":"删除失败"; 
				return message;
				
			}
			/**
			 * 
			 * @param mid
			 * @return 真删除业务
			 */
			public String delMenu(int mid) {
				String message="";
				String sql="delete from menu where Mid=?";
				int n=menudao.modify(sql, mid);
				message=n>0?"删除成功":"删除失败";	
				return message;
			}
			/**
			 * 
			 * @param menu
			 * @return 修改菜单业务
			 */
			public String updateMenu(Menu menu) {
				String message="";
				String sql="update menu set Mname=?,Murl=?,Mfid=?,Mrank=?,Mstate=?,Mdel=? where Mid=?";
				int n=menudao.modify(sql, menu.getMname(),menu.getMurl(),menu.getMfid(),menu.getMrank(),menu.getMstate(),menu.getMdel(),menu.getMid());
				message=n>0?"修改成功":"修改失败";
				return message;
				
			}
			
			 //根据角色id查询所有菜单
		     public List<Menu> selectbyrid(String rid){
		    	 String sql="select * from menu where Mstate!=0 and Mid in(select Mid from role_menu where Rid=?)";
		    	 List<Menu> menulist=menudao.query(Menu.class,sql,rid);
		    	 return menulist;
		     }
}
