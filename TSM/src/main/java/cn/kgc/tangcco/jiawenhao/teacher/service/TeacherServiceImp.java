package cn.kgc.tangcco.jiawenhao.teacher.service;

import java.util.List;



import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;

import cn.kgc.tangcco.entity.Teacher;
import cn.kgc.tangcco.jiawenhao.teacher.dao.TeacherDAOImp;
import cn.kgc.tangcco.util.PageBean;
/**
 * 
 * @author 贾文豪
 * 2019.12.18
 *
 */
public class TeacherServiceImp {
	TeacherDAOImp teacherdao=new TeacherDAOImp();
	//增加返回结果为1  失败为0
	public int addTeacher(Teacher teacher) {
		int i=0;
		String sql="insert into teacher values(teacher.Tid,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		i=teacherdao.modify(sql,teacher.getTname(),teacher.getTsex(),
				teacher.getTem(),teacher.getTbirth(),teacher.getTps(),
				teacher.getTnative(),teacher.getTtel(),teacher.getTmajor(),
				teacher.getTyear(),teacher.getTiob(),teacher.getAid(),
				teacher.getTstate(),teacher.getTdel()+"" );
		return i;
	}
	/**
	 * 条件查询
	 * @param Tdel
	 * @param Sstate
	 * @return
	 */
	public List query(PageBean pagebean,int Tdel,int Tstate,String thispage) {
		String sql="";
		if (Tdel==1&&Tstate==1) {
			sql="select * from teacher where Tdel=1 and Tstate=1";
		}else if (Tdel==1&&Tstate==0) {
			sql="select * from teacher where Tdel=1 and Tstate=0";
		}else if (Tdel==0&&Tstate==1) {
			sql="select * from teacher where Tdel=0 and Tstate=1";
		}
		List list=teacherdao.query(Teacher.class, sql);
		pagebean.setTotalsize(list.size());
		
		List listzList=teacherdao.query(Teacher.class, sql+" limit ?,?",pagebean.getRowindex(),pagebean.getPagesize());
	
		return listzList;
	}
	
	
	/**
	 * 查询所有
	 * @return
	 */
		public List<Teacher> query() {
			String sql="select * from teacher where Tdel=1";
			return teacherdao.query(Teacher.class, sql);
		}
	/**
	 * 分页查询
	 * @param pagebean
	 * @param thispage
	 * @return
	 */
	public List<Teacher> querypage(PageBean pagebean,String thispage){
		List<Teacher> list=null;
		pagebean.setTotalsize(query().size());
		pagebean.setThispage(thispage);
		list=teacherdao.queryPage(pagebean);
		
		return list;
	}
	
//	@Test
//	public void test1() {
//		//List<Teacher> list=querypage(new PageBean(),"1");
//		List<Teacher> list=query();
//		for (Teacher teacher : list) {
//			System.out.println(teacher);
//		}
//		String text=JSON.toJSONString(list);
//	
//		System.out.println(text);
//	}
	
	/**
	 * 删除业务 成功返回1  失败返回0
	 * @param Tid
	 * @return
	 */
	public int delete(int Tid) {
		String sql="update teacher set Tdel='0',Tstate=0 where Tid=?";
		return teacherdao.modify(sql, Tid);
	}
	/**
	 * 更改信息
	 */
	public int changeTeacher(Teacher teacher) {
		int i=0;
		String sql="update teacher set Tname=?,Tsex=?,Tem=?,Tbirth=?,Tps=?,Tnative=?,Ttel=?,Tmajor=?,Tyear=?,Tiob=? where Tid=?"
				;
		i=teacherdao.modify(sql,teacher.getTname(),teacher.getTsex(),
				teacher.getTem(),teacher.getTbirth(),teacher.getTps(),
				teacher.getTnative(),teacher.getTtel(),teacher.getTmajor(),
				teacher.getTyear(),teacher.getTiob(),teacher.getTid());
		return i;
	}
	/**
	 * 模糊查询根据姓名查
	 */
	public List<Teacher> findTeacher(String Tname,PageBean pagebean,String thispage) {
		List<Teacher> list=null;
		String sql="select * from teacher where Tdel=1 and Tname like '%"+Tname+"%'";
		list=teacherdao.query(Teacher.class, sql+" limit ?,?",pagebean.getRowindex(),pagebean.getPagesize());
		return list;
	}
	//根据ID返回一个对象
	public Teacher idTeacher(int Tid) {
		String sql="select * from teacher where Tid=? ";
		Teacher teacher=teacherdao.find(Teacher.class,sql, Tid);
		return teacher;
	}
	
}
