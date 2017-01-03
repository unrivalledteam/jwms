<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>菜单管理</title>
<link rel="stylesheet" type="text/css" href="<%=path%>/css/dataselect.css"/>
</head>
<body>
	<div class="content">
		<div class="page-content-wrapper">
			<div id="title_query">
				<ul class="breadcrumb" style="font-size: 13px;margin: 0">  
					<li>成绩管理系统</li>  
					<li>权限管理</li>  
					<li class="active">菜单管理</li>
				</ul>
			</div>
		</div>
		<div class="page-content">
			<div class="tjsx_title" style="">条件筛选：</div>
			<form id="queryForm" class="form-horizontal" role="form">
				<div id="filter">
					 <div id="queryDIV" class="filtrate_box clearfix" >
					 	<ul class="filtrate_list">
					 		<li class="child_li first_sort">
						        <div class="list_left">用户类型：</div>
						        <div class="list_right">
						          <div class="list_content fix_list">
						            <div class="clearfix">
						             <span tagcode="userType_student" tagname="学生"><a class="btn">学生</a></span>
									 <span tagcode="userType_teacher" tagname="教师"><a class="btn" >教师</a></span>
						            </div>
						          </div>
								</div>
						   </li>
					 		<li id="student_level" class="child_li first_sort bac_bl">
						        <div class="list_left">所在年级：</div>
						        <div class="list_right">
						          <div class="list_content fix_list">
						            <div class="clearfix">
						             <span tagcode="student_level_c1" tagname="初一"><a class="btn">初一</a></span>
									 <span tagcode="student_level_c2" tagname="初二"><a class="btn" >初二</a></span>
									 <span tagcode="student_level_c3" tagname="初三"><a class="btn" >初三</a></span>
									 <span tagcode="student_level_g1" tagname="高三"><a class="btn" >高三</a></span>
									 <span tagcode="student_level_g2" tagname="高三"><a class="btn" >高三</a></span>
									 <span tagcode="student_level_g3" tagname="高三"><a class="btn" >高三</a></span>
						            </div>
						          </div>
								</div>
						   </li>
					 		<li id="teacher_type" class="child_li first_sort bac_bl">
						        <div class="list_left">教师类型：</div>
						        <div class="list_right">
						          <div class="list_content fix_list">
						            <div class="clearfix">
						             <span tagcode="teacher_type_bzr" tagname="班主任"><a class="btn">班主任</a></span>
									 <span tagcode="teacher_type_ptjs" tagname="普通教师"><a class="btn" >普通教师</a></span>
						            </div>
						          </div>
								</div>
						   </li>
					 		<li id="teacher_type" class="child_li first_sort">
						        <div class="list_left">所在班级：</div>
						        <div class="list_right">
						          <div class="list_content fix_list">
						            <div class="clearfix">
						             <span tagcode="teacher_type_bzr" tagname="班主任"><a class="btn">班主任</a></span>
									 <span tagcode="teacher_type_ptjs" tagname="普通教师"><a class="btn" >普通教师</a></span>
						            </div>
						          </div>
								</div>
						   </li>
					 	</ul>
					 </div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>