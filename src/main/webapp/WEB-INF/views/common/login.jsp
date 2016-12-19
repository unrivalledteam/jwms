<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<<html>
<head>
<meta charset="utf-8">
<title>登录(Login)</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<!-- CSS -->
<link rel="stylesheet" href="<%=path %>/css/reset.css">
<link rel="stylesheet" href="<%=path %>/css/supersized.css">
<link rel="stylesheet" href="<%=path %>/css/style.css">
<script src="<%=path %>/js/jquery-1.8.2.min.js"></script>
<script src="<%=path %>/js/supersized.3.2.7.min.js"></script>
<script src="<%=path %>/js/supersized-init.js"></script>
<script src="<%=path %>/js/loginScripts.js"></script>
<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
            <script src="assets/js/html5.js"></script>
        <![endif]-->
<script type="text/javascript">
jQuery(function($){

    $.supersized({

        // 功能
        slide_interval     : 4000,    // 转换之间的长度
        transition         : 1,    // 0 - 无，1 - 淡入淡出，2 - 滑动顶，3 - 滑动向右，4 - 滑底，5 - 滑块向左，6 - 旋转木马右键，7 - 左旋转木马
        transition_speed   : 1000,    // 转型速度
        performance        : 1,    // 0 - 正常，1 - 混合速度/质量，2 - 更优的图像质量，三优的转换速度//（仅适用于火狐/ IE浏览器，而不是Webkit的）

        // 大小和位置
        min_width          : 0,    // 最小允许宽度（以像素为单位）
        min_height         : 0,    // 最小允许高度（以像素为单位）
        vertical_center    : 1,    // 垂直居中背景
        horizontal_center  : 1,    // 水平中心的背景
        fit_always         : 0,    // 图像绝不会超过浏览器的宽度或高度（忽略分钟。尺寸）
        fit_portrait       : 1,    // 纵向图像将不超过浏览器高度
        fit_landscape      : 0,    // 景观的图像将不超过宽度的浏览器

        // 组件
        slide_links        : 'blank',    // 个别环节为每张幻灯片（选项：假的，'民'，'名'，'空'）
        slides             : [    // 幻灯片影像
                                 {image : '<%=path%>/img/4.jpg'},
                                 {image : '<%=path%>/img/5.jpg'},
                                 {image : '<%=path%>/img/6.jpg'}
                       ]

    });

});
</script>
</head>
<body>
	<div class="page-container">
		<h1>欢迎登陆教务系统</h1>
		<form action="welcome/index.html" method="post">
			<input type="text" name="username" class="username"
				placeholder="请输入您的用户名！"> <input type="password"
				name="password" class="password" placeholder="请输入您的用户密码！"> <input
				type="Captcha" class="Captcha" name="Captcha" placeholder="请输入验证码！">
			<button type="submit" class="submit_button">登录</button>
			<div class="error">
				<span>+</span>
			</div>
		</form>
	</div>
</body>