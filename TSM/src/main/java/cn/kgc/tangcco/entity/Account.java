package cn.kgc.tangcco.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Account {
private int Aid;
private String username;
private String password;
private int Astate;
private int Rid;
private int Adel;//判断是否显示
private Role role=new Role();//每个用户对应一个角色对象

public Account(String username, String password, int Rid, int Astate) {
	super();
	this.username = username;
	this.password = password;
	this.Rid = Rid;
	this.Astate = Astate;
}

public Account(int Aid,String username, int Rid,int Astate,int Adel) {
	super();
	this.Aid = Aid;
	this.username=username;
	this.Rid =Rid;
	this.Astate = Astate;
	this.Adel=Adel;
}

public Account(int Aid,String username, String password, int Rid, int Astate,int Adel) {
	super();
	this.Aid=Aid;
	this.username = username;
	this.password = password;
	this.Rid = Rid;
	this.Astate = Astate;
	this.Adel=Adel;
}
}
