<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>教学信息管理系统登录界面</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link rel="stylesheet" href="css/style.css" />
<style>
    body{margin: 10px;}
    .demo-carousel{height: 200px; line-height: 200px; text-align: center;}
    .code {
        width: 400px;
        margin: 0 auto;
    }
    
    #canvas {
    	margin: 10px;
        float:initial;
        display: inline-block;
        border: 1px solid #ccc;
        border-radius: 5px;
        cursor: pointer;
    }
    .btn {  line-height: 42px; 
    		margin: 15px auto 0px;
     		padding: 0 15px; 
     		border: 1px solid rgba(255, 255, 255, 0.38);
      		background: rgba(45, 45, 45, 0.33); 
      		border-radius: 6px;
      		}
    
		 
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }
  </style>
  
  <script src="js/jquery.min.js"></script>
<body>

<div class="login-container">
	<h1>教学信息管理系统</h1>
	
	<div class="connect">
		<p>每天遇到更好的自己</p>
	</div>
	
	<form action="account.do" method="post" id="loginForm">
	<input type="hidden" name="method" value="login">
		<div>
			<input type="text" name="username" class="username" placeholder="用户名" autocomplete="off"/>
		</div>
		<div>
			<input type="password" name="psd" class="password" placeholder="密码" oncontextmenu="return false" onpaste="return false" />
		</div>
		<div class="layui-layer-move">
         	<input type="text" value="" placeholder="请输入验证码（不区分大小写）" return false" onpaste="return false" class="input-val"/>
            <canvas id="canvas" width="110" height="45" ></canvas>
         	<input  type="button"  class="btn"  value="登 录" >
        </div>
		
	</form>

	<a href="reg.jsp">
		<button type="button" class="register-tis">注 册</button>
	</a>

</div>
<script>

    $(function(){
        var show_num = [];
        draw(show_num);

        $("#canvas").on('click',function(){
            draw(show_num);
        })
        $(".btn").on('click',function(){
            var val = $(".input-val").val().toLowerCase();
            var num = show_num.join("");
            if(val==''){
                alert('请输入验证码！');
            }else if(val == num){
                $(".input-val").val('');
                draw(show_num);
                $("#loginForm").submit();
            }else{
                    alert('验证码错误！请重新输入！');
                    $(".input-val").val('');
                    draw(show_num);
            }
        })
    })

    function draw(show_num) {
        var canvas_width=$('#canvas').width();
        var canvas_height=$('#canvas').height();
        var canvas = document.getElementById("canvas");//获取到canvas的对象，演员
        var context = canvas.getContext("2d");//获取到canvas画图的环境，演员表演的舞台
        canvas.width = canvas_width;
        canvas.height = canvas_height;
        var sCode = "A,B,C,E,F,G,H,J,K,L,M,N,P,Q,R,S,T,W,X,Y,Z,1,2,3,4,5,6,7,8,9,0";
        var aCode = sCode.split(",");
        var aLength = aCode.length;//获取到数组的长度
        
        for (var i = 0; i <= 3; i++) {
            var j = Math.floor(Math.random() * aLength);//获取到随机的索引值
            var deg = Math.random() * 30 * Math.PI / 180;//产生0~30
            var txt = aCode[j];//得到随机的一个内容
            show_num[i] = txt.toLowerCase();
            var x = 10 + i * 20;//文字在canvas上的x坐标
            var y = 20 + Math.random() * 8;//文字在canvas上的y坐标
            context.font = "bold 23px 微软雅黑";

            context.translate(x, y);
            context.rotate(deg);

            context.fillStyle = randomColor();
            context.fillText(txt, 0, 0);

            context.rotate(-deg);
            context.translate(-x, -y);
        }
        for (var i = 0; i <= 5; i++) { //验证码上显示线条
            context.strokeStyle = randomColor();
            context.beginPath();
            context.moveTo(Math.random() * canvas_width, Math.random() * canvas_height);
            context.lineTo(Math.random() * canvas_width, Math.random() * canvas_height);
            context.stroke();
        }
        for (var i = 0; i <= 30; i++) { //验证码上显示小点
            context.strokeStyle = randomColor();
            context.beginPath();
            var x = Math.random() * canvas_width;
            var y = Math.random() * canvas_height;
            context.moveTo(x, y);
            context.lineTo(x + 1, y + 1);
            context.stroke();
        }
    }

    function randomColor() {//得到随机的颜色值
        var r = Math.floor(Math.random() * 256);
        var g = Math.floor(Math.random() * 256);
        var b = Math.floor(Math.random() * 256);
        return "rgb(" + r + "," + g + "," + b + ")";
    }
</script>

<script src="js/jquery.min.js"></script>
<script src="js/common.js"></script>
<!--背景图片自动更换-->
<script src="js/supersized.3.2.7.min.js"></script>
<script src="js/supersized-init.js"></script>
<!--表单验证-->
<script src="js/jquery.validate.min.js?var1.14.0"></script>

</body>
</html>