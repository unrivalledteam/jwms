<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="<%=path%>/css/mainPage.css">
<script type="text/javascript">
	var userID = '<%=request.getSession().getAttribute("userID")%>';
	$(function(){
		$("#mainPage").height($(document).height()-$("#mainTitle").height()-20);
		initMenuItem(userID);
	});
	function initMenuItem(userID){
		if(userID==null||userID==''){
			window.location.href='<%=path%>/GradeManagementSystem';
		}else{
			$.ajax({
				url:'<%=path%>/menuController/getMenuByUserID',
				method : 'post',
				data : {
					'userID' : userID
				},
				success : function(data) {
					console.log(data);
					var appendText='';
					$(data).each(function(index, value) {
						if (value.belongMenuID == 'root') {
							appendText+='<li><a href="#menu'+value.menuID+'m" class="nav-header collapsed" data-toggle="collapse"><i class="glyphicon glyphicon-th-large"></i>'+value.menuName+' <span class="pull-right glyphicon glyphicon-chevron-down"></span></a><ul id="menu'+value.menuID+'m" class="nav nav-list collapse secondmenu" style="height: 0px;">';
						} else if (index == data.length - 1|| data[index + 1].belongMenuID == 'root') {
							appendText+='<li><a href="'+value.targetPage+'" target="fname"><i class="glyphicon glyphicon-th-list"></i>'+value.menuName+'</a></li></ul></li>';
						} else {
							appendText+='<li><a href="'+value.targetPage+'" target="fname"><i class="glyphicon glyphicon-th-list"></i>'+value.menuName+'</a></li>';
						}
					});
					$("#main-nav").append(appendText);
				},
				error : function() {
					alert('获取菜单失败，请重新登录');
				}
			});
		}
	}
</script>
</head>

<body>
	<div id="mainTitle" class="navbar navbar-duomi navbar-static-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">成绩管理系统 </a>
			</div>
		</div>
	</div>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-2 col-xs-2 col-sm-2 col-lg-2" style="padding-left:1px;padding-right: 0;">
				<ul id="main-nav" class="nav nav-tabs nav-stacked">
					<li><a href="<%=path %>/views/myworkbench/workbench.jsp" target="fname"> <i
							class="glyphicon glyphicon-th-large"></i> 我的工作台
					</a></li>
				</ul>
			</div>
			<div id="mainPage" class="col-md-10 col-xs-10 col-sm-10 col-lg-10" style="padding: 0">
				<iframe name="fname" style="width:100%;height:100%;border:none;border-left-style: solid;border-color: #4F94CD"></iframe>
			</div>
		</div>
	</div>
</body>
</html>