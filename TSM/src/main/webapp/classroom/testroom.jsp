<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
	String contextpath = request.getContextPath();
	String url = path + contextpath + "/";
%>

<!DOCTYPE html>
<html>
<head>
<base href="<%=url%>">
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-3.4.1.js"></script>
</head>
<body>
<body leftmargin="8" topmargin="8"
	background='${pageContext.request.contextPath }'>

	<!--  快速转换位置按钮  -->
	<table width="98%" border="0" cellpadding="0" cellspacing="1"
		bgcolor="#CCDDFF"  align="center">
		<tr>
			<td height="26"
				background="${pageContext.request.contextPath }/skin/images/newlinebg3.gif">
				<table width="58%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td>当前位置:权限管理>>教室列表</td>
						<td>
    <input type='button' class="coolbg np" onClick="location='${pageContext.request.contextPath }/classroom/addclassroom.jsp';" value='添加教室' />
 </td>
					</tr>
				</table>
			</td>
		</tr>
	</table>

	
	<!--  内容列表   -->
	<form name="form2">
		<table id="t" width="98%" border="0" cellpadding="2" cellspacing="1"
			bgcolor="#FFFFFF"align="center" style="margin-top: 8px">
			<tr bgcolor="#E7E7E7" align="center">
				<td height="24" colspan="12"
					background="${pageContext.request.contextPath }/skin/images/tbg.gif">&nbsp;学生列表&nbsp;</td>
			</tr>
			<tr id="top1" align="center" bgcolor="#FAFAF1" height="22">
				<th width="5%">选择</th>
				<th width="18%">教室名</th>
				<th width="18%">教室地址</th>
				<th width="18%">教室状态</th>
				<th width="18%">功能选择</th>
			</tr>
		</table><br>
		<input type="button" onclick="quanxuan1('true')" value="全选"> <input
			type="button" id="fanxuan" onclick="quanxuan()" value="反选"> <input
			type="button" id="delete" value="删除" onclick="del1()">
		<span style="float: right;">
			<!-- 分页 -->
			第<span id="p"></span>页 <span id="s"></span> <span id="head"><input
				type="button" value="首页"> </span> <span id="up"><input
				type="button" value="上一页"> </span> <span id="down"><input
				type="button" value="下一页"> </span> <span id="body"></span>
		</span>
	</form>

	<script type="text/javascript">
$(function(){
	/* 全局变量 */
	 ajaxmethod(1);
	 	$("#head").click(function(){
		 ajaxmethod(1);
		
		
	    });
	    $("#up").click(function(){
	    	ajaxmethod($("#p").val()-1);
	    	 
	    });
	    
	    $("#down").click(function(){
	    	ajaxmethod($("#p").val()+1);
	    	
	    });
	    
});

//全选
function quanxuan1(value){
	var lis=$("[name=xx]")
	for (i=0;i<lis.length;i++) {
		lis[i].checked=value;
	}
}
//反选
function quanxuan(){
	var lis=$("[name=xx]")
	for (i=0;i<lis.length;i++) {
		lis[i].checked=!lis[i].checked;
	}
}
function del1(){
	var lis=$("[name=xx]")
	var a=new Array()
	for (i=0;i<lis.length;i++) {
		if(lis[i].checked==true){
			a=a.concat(lis[i].value);
		}
	}
	$.ajax({
		 url:"student",
		 data:"method=approve&Sid="+a,
		 success:function(data){
			 if(data>0){
				 alert("提交成功");
				 ajaxmethod($("#p").val());
			 }
			 else{
				 alert("提交失败");
			 }
		 }
	 });
}

function ajaxmethod(value){
    	$("#t tr:not(#top1)").remove(); //首先移除表格中除第一行之外的其他行 
    	  $.ajax({
    		  url:"classroom",
    		  data:"method=querypage1&thispage="+value,
    		  success:function(data){
    			 var pagebean=data.pagebean;
    			 var rows=data.rows;
    			 $.each(rows,function(index,classroom){
    				 $("#t").append("<tr align="+"center"+"><td ><input  name="+"xx"+" type="+"'checkbox'"+"  value="+classroom.cid+" ></td><td>"+classroom.cname+"</td><td>"+classroom.cplace+"</td><td>"+classroom.cstate+
    						 "</td><td><a name='select'  href='${pageContext.request.contextPath }/student?method=student&Sid="+classroom.cdel+"'>详情</a>"+"<span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span>"+
    						 "<a  name='update' href='${pageContext.request.contextPath }/student?method=update1&Sid="+classroom.cid+"'>编辑</a><span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span><span id='del' onclick='del("+classroom.cid+")'>删除</span></td></tr>");
    				
    			 });
    			 $("#s").html("共"+pagebean.totalpage+"页   共"+pagebean.totalsize+"条/每页"+pagebean.pagesize+"条");
    		     $("#p").html(pagebean.thispage);
    		  },
    		  dataType:"json"
    	  });
      }

	
	function del(Sid){
		$.ajax({
			 url:"classroom",
			 data:"method=approve&Sid="+Sid,
			 success:function(data){
				 if(data>0){
					 ajaxmethod($("#p").val());
				 }
				 else{
					 alert("提交失败");
				 }
			 }
		 });
	}
	

</script>
</body>
</html>