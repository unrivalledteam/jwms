<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>登录(Login)</title>
<link rel="stylesheet" href="<%=path %>/css/supersized.css">
<script src="<%=path %>/js/supersized.3.2.7.min.js"></script>
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
                                 {image : '<%=path%>/img/33.jpg'},
                                 {image : '<%=path%>/img/11.jpg'},
                                 {image : '<%=path%>/img/22.jpg'},
                                 {image : '<%=path%>/img/55.jpg'}
                             ]
    });

});
</script>
<style type="text/css">
span.error{
	color:#FF7F24;
	font-weight: bold;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	 var loginMessage = '<%=request.getAttribute("loginMessage")%>';
	 if(!(loginMessage==null||loginMessage=="null")){
		 $("#loginMessageFont").text(loginMessage);
	 }
	 $('#loginForm').validate({  
         errorElement : 'span',  
         focusInvalid : true,
         rules : {  
        	 userName : {required : true},
        	 password : {required : true},  
         },  
         
         messages : {  
        	 userName : {required : "用户名不可为空"},  
        	 password : {required : "密码不可为空"},  
         },  
         highlight : function(element) {  
             $(element).closest('.data-validate').addClass('has-error');  
         },  

         success : function(label) {  
             label.closest('.data-validate').removeClass('has-error');  
             label.remove();  
         },  

         errorPlacement : function(error, element) {  
      	   element.parent('div').append(error);  
         }  
   }); 
	 $("#btnSubmit").on("click",function(){
		 $("#loginMessageFont").hide();
	 });
});
</script>
<style type="text/css">
.logininput{
    height: 42px;
    background: rgba(45,45,45,.15);
    border: 1px solid #3d3d3d; /* browsers that don't support rgba */
    border: 1px solid rgba(255,255,255,.15);
    font-family: 'PT Sans', Helvetica, Arial, sans-serif;
    font-size: 14px;
    color: white;
    text-shadow: 0 1px 2px rgba(255,255,255,.1);
}

</style>
</head>
<body>

<div class="jumbotron" style="width: 30%;margin-left: 65%;margin-top: 15%;background: rgba(45,45,45,.5);">
	<div class="container">
		<div class="row">
			<div align="center"><font style="color: white;font-size: x-large;font-weight: bolder;">成绩管理系统</font></div>
			<div align="center"><font id="loginMessageFont" style="color:#FF7F24 ;font-size:small;font-weight: bolder;"></font></div>
		</div>
		<div class="row" style="margin-top: 18px">
			<div class="col-md-1 col-xs-1 col-sm-1 col-lg-1"></div>
			<div class="col-md-10 col-xs-10 col-sm-10 col-lg-10">
				<form id="loginForm" class="form-horizontal" role="form" action="<%=path%>/GradeManagementSystem" method="post">
				    <div class="form-group">
				        <input type="text" class="form-control logininput" id="username" name="userName" placeholder="请输入用户名" value="sysadmin"/>
				    </div>
				    <div class="form-group">
				        <input type="password" class="form-control logininput" id="password" name="password" placeholder="请输入密码" value="sysadmin" />
				    </div>
				    <div class="form-group">
				        <button id="btnSubmit" type="submit" class="btn btn-success btn-block" style="height: 42px;">登录</button>
				    </div>
				    <div class="form-group">
				        <button class="btn btn-info btn-block" style="height: 42px;">重置</button>
				    </div>
				</form>
			</div>
			<div class="col-md-1 col-xs-1 col-sm-1 col-lg-1"> </div>
		</div>
	</div>
</div>

	

		
				
</body>