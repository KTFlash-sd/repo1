<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*,cn.kgc.tangcco.entity.*" %>
<% Account account=(Account)session.getAttribute("account");
       Role role=account.getRole();
       List<Menu> menulist=role.getRolemenu();
    %>
<<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>教学信息管理系统后台</title>
	<link rel="stylesheet" type="text/css" href="themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="themes/icon.css">
	<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
	<style>
		#top{
			background:url(image/教学logo.png);
				background-size:cover;
				background-repeat:no-repeat;
				background-position:left;
		}
	</style>
	<script>
		$(function(){
			$('#tt2').datagrid({
				title:'My Title',
				iconCls:'icon-save',
				width:600,
				height:350,
				nowrap: false,
				striped: true,
				fit: true,
				url:'datagrid_data.json',
				sortName: 'code',
				sortOrder: 'desc',
				idField:'code',
				frozenColumns:[[
	                {field:'ck',checkbox:true},
	                {title:'code',field:'code',width:80,sortable:true}
				]],
				columns:[[
			        {title:'Base Information',colspan:3},
					{field:'opt',title:'Operation',width:100,align:'center', rowspan:2,
						formatter:function(value,rec){
							return '<span style="color:red">Edit Delete</span>';
						}
					}
				],[
					{field:'name',title:'Name',width:120},
					{field:'addr',title:'Address',width:120,rowspan:2,sortable:true},
					{field:'col4',title:'Col41',width:150,rowspan:2}
				]],
				pagination:true,
				rownumbers:true
			});
		});
	</script>
</head>
<body class="easyui-layout" target="main">
	<div id="top"region="north" title="教学信息管理系统" split="true" style="height:100px;padding:10px;">
		<p align="right"  style="color: brown;">
               欢迎，${sessionScope.account.username}登录，<a href="index.jsp?exit=true"  target="_top" onclick="return confirm('确认注销吗？')">点击注销</a>
    	</p>
	</div>
	
	
	<div region="west" split="true" title="菜单列表" style="width:200px;padding1:1px;overflow:hidden;">
		<div class="easyui-accordion" fit="true" border="false">
			<div title="权限管理" style="padding:20px;overflow:auto;">
			<ul class="easyui-tree">
            <%for(Menu menu:menulist){
            for(Menu menu2:menulist){
                if(menu2.getMstate()==1&&menu2.getMfid()==6&&menu.getMid()==6){
               %>
                 <li><a  href='${pageContext.request.contextPath}<%=menu2.getMurl() %>' target='right'> <%=menu2.getMname() %></a> </li>
            <% 
                	}
                }
            }%>
          </ul>
			</div>
			<div title="学生管理" style="padding:10px;">
				<ul class="easyui-tree">
            <%for(Menu menu:menulist){
            for(Menu menu2:menulist){
                if(menu2.getMstate()==1&&menu2.getMfid()==17&&menu.getMid()==17){
               %>
            <li><a  href='${pageContext.request.contextPath}<%=menu2.getMurl() %>' target='right'><%=menu2.getMname() %></a> </li>
            <% 
                	}
                }
            }%>
          </ul>
			</div>
			<div title="教师管理" style="padding:10px">
				<ul class="easyui-tree">
            <%for(Menu menu:menulist){
            for(Menu menu2:menulist){
                if(menu2.getMstate()==1&&menu2.getMfid()==20&&menu.getMid()==20){
              %>
            <li><a  href='${pageContext.request.contextPath}<%=menu2.getMurl() %>' target='right'><%=menu2.getMname() %></a> </li>
            <% 
                	}
                }
            }%>
          </ul>
			</div>
			<div title="教室管理" style="padding:10px">
				<ul class="easyui-tree">
            <%for(Menu menu:menulist){
           	 for(Menu menu2:menulist){
                if(menu2.getMstate()==1&&menu2.getMfid()==31&&menu.getMid()==31){
               %>
            <li><a  href='${pageContext.request.contextPath}<%=menu2.getMurl() %>' target='right'><%=menu2.getMname() %></a> </li>
            <% 
                	}
                }
            }%>
          </ul>
			</div>
			<div title="成绩管理" style="padding:10px">
				<ul class="easyui-tree">
            <%for(Menu menu:menulist){
           	 for(Menu menu2:menulist){
                if(menu2.getMstate()==1&&menu2.getMfid()==28&&menu.getMid()==28){
               %>
            <li><a  href='${pageContext.request.contextPath}<%=menu2.getMurl() %>' target='right'><%=menu2.getMname() %></a> </li>
            <% 
                	}
                }
            }%>
          </ul>
			</div>
			<div title="课程管理" style="padding:10px">
				<ul class="easyui-tree">
            <%for(Menu menu:menulist){
           	 for(Menu menu2:menulist){
                if(menu2.getMstate()==1&&menu2.getMfid()==29&&menu.getMid()==30){
               %>
            <li><a  href='${pageContext.request.contextPath}<%=menu2.getMurl() %>' target='right'><%=menu2.getMname() %></a> </li>
            <% 
                	}
                }
            }%>
          </ul>
			</div>
			<div title="审核管理" style="padding:10px">
			<ul class="easyui-tree">
				<li><a  href='${pageContext.request.contextPath}/student/shenhe.jsp ' target='right'>信息审核</a> </li>
			</ul>
			</div>
		</div>
	</div>
	<div region="center" title="主页面"  id="madin"  name="main" style="overflow:hidden;">
		<div class="easyui-tabs" fit="true" border="false">
			<div id="main">
      	<iframe name="right" id="rightMain" src="introduce.html" frameborder="no" scrolling="auto" width="100%" height="100%" allowtransparency="true">
		</iframe>
		</div>
		</div>
	</div>
</body>
</html>