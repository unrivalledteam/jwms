<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	String path = request.getContextPath();
	request.setCharacterEncoding("UTF-8");
%>
<title>登陆</title>
<link rel="stylesheet"
	href="<%=path%>/staticResource/css/bootstrap.min.css">
<script src="<%=path%>/staticResource/js/jquery.min.js"></script>
<script src="<%=path%>/staticResource/js/bootstrap.min.js"></script>
</head>
<script type="text/javascript">
$(document).ready(function(){
		$("#loginMessage").hide();
		$("#loginName").val("");
		$("#password").val("")
		$("#loginButton").click(function(){
			var loginName = $.trim($("#loginName").val());
			var password = $.trim($("#password").val());
			$.post(
					"<%=path%>/login/checkLogin", 
			{
				'loginName' : loginName,
				'password' : password
			}, function(data) {
				if(data==true){
					window.location.href="<%=path%>/login/doLogin?loginName="+$.trim($("#loginName").val());
				}else{
					$("#loginMessage").show();
				}
			})
		});
		
	});
function hideLoginMessage(){
	$("#loginMessage").hide();
}
</script>
<body>
	<div class="container">
		<br /> <br />
		<div class="jumbotron">
			<h1>欢迎登录采购系统！</h1>
			<p>Welcome to the procurement system！</p>
			<br /> <br /> <br />
			<div class="well well-lg">
				<form class="form-horizontal" role="form">
					<div class="form-group">
						<label for="loginName" class="col-sm-4 control-label">用户名</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="loginName"
								placeholder="请输入登录用户名" onkeypress="hideLoginMessage()">
						</div>
					</div>
					<div class="form-group">
						<label for="password" class="col-sm-4 control-label">密&nbsp;&nbsp;&nbsp;&nbsp;码</label>
						<div class="col-sm-4">
							<input type="password" class="form-control" id="password"
								placeholder="请输入登录密码" onkeypress="hideLoginMessage()">
						</div>
					</div>
					<div  class="form-group" align="center">
						<label id="loginMessage" class="control-label" style="color: red">用户名或密码错误，请重新输入</label>
					</div>
				</form>
				<div align="center">
					<button id="loginButton" type="button"
						class="btn btn-success btn-lg ">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						登&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;录
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</button>
				</div>
			</div>
		</div>

	</div>
</body>
</html>