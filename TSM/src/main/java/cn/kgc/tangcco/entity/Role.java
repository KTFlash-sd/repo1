package cn.kgc.tangcco.entity;

import java.util.ArrayList;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data

/**
 * 角色实体类
 * @author 张宇
 *2019/12/17
 */
public class Role {
private int Rid;//角色id
private String Rname; //角色名称
private int Rstate;//角色状态
private int Rdel;//是否删除
private List<Menu> rolemenu=new ArrayList<Menu>();//一个角色对应一组菜单

public Role(int Rid,String Rname) {
	this.Rid=Rid;
	this.Rname=Rname;
}
}
