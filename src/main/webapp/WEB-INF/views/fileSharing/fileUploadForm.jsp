<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%String path = request.getContextPath(); %>
<head>
<link rel="stylesheet" type="text/css" href="<%=path %>/drm/css/fileinput.min.css"/>
<script src="<%=path %>/drm/js/fileinput.min.js"></script>
<title>附件上传</title>
<script type="text/javascript">

$(document).ready(function() {
	
	$("#input-file").fileinput({
		language : 'zh', //
		showUpload : false,
		maxFileCount : 1
	});
	
	$("#selectCatalogTreeName").on("click",function(){
		$("#selectCatalogTree").show();
	});
	
	$("#fileUploadModal").on("show.bs.modal",function(){
		$("#fileUploadForm")[0].reset();
		$("#successMessage").hide();
		$("#errorMessage").hide();
		initSelectCatalogTree();
	});

	$("#toUploadSubmitBtn").on("click",function(){
		var filenamee = $("#input-file").val();
		var point = filenamee.lastIndexOf("."); 
	    var type = filenamee.substr(point);
		$("#successMessage").hide();
		var filestr = $("#input-file").val();
		var catalogstr = $("#selectCatalogTreeName").val();
		if(filestr==null||filestr==""||catalogstr==null||catalogstr==""){
			if(filestr==null||filestr==""){
				$("#selectFileMessage").show();
			}
			if(catalogstr==null||catalogstr==""){
				$("#selectcatalogMessage").show();
			}
			//return false;
		}else{
			$("#selectcatalogMessage").hide();
			$("#selectFileMessage").hide();
			if(type==".exe"||type==".jsp"||type==".js"||type==".bat"||type==".mht"||type.indexOf(".")==-1){
				$("#selectFileTypeMessage").show();
			}else{
				$("#fileUploadForm").submit();
			}
		}
	});
});
function initSelectCatalogTree(){
	$.ajax({
		url:"<%=path%>/knowledgebase/getTree.do",
		success:function(result){
			var data = "["+result+"]";
			$('#selectCatalogTree').empty();
			$('#selectCatalogTree').treeview({
				data: data,
				levels:2,
				backColor:"#F0F8FF",
				borderColor:"#ACE4FF",
				expandIcon:"glyphicon glyphicon-chevron-down",
				collapseIcon:"glyphicon glyphicon-chevron-up",
				onNodeSelected: function(event, data) {
					$("#selectCatalogTreeName").val(data.text);
					$("#selectCatalogTreeID").val(data.id);
					$(this).hide();
				}
			});
		}
	});
}
$(function(){
	$("#hiddenIFrame").load(function(){
		$("#successMessage").hide();
		$("#errorMessage").hide();
	    //var wnd = this.contentWindow;
	    //var str = $(wnd.document.body).text();
		//if(str.indexOf("success")==1){
			$("#fileUploadForm")[0].reset();
			$("#successMessage").hide();
			$("#errorMessage").hide();
			
			$("#selectcatalogMessage").hide();
			$("#selectFileMessage").hide();
			$("#selectFileTypeMessage").hide();
			
			$("#successMessage").show();
			initSelectCatalogTree();
			initTable();
		//}else if(str.indexOf("error")==1){
			//$("#errorMessage").show();
		//}
	});
});

</script>
</head>
<body>
	<div class="row clearfix">
			<div>
				<div id="indexPanel">
					<div class="panel panel-default">
						<div class="panel-heading">
						</div>
						<div class="panel-body" align="center">
							<iframe name="hiddenIFrame" id="hiddenIFrame" style="display:none"></iframe>
							<form name="fileUploadForm" id="fileUploadForm" method="post" action="<%=path%>/knowledgebase/fileUpload.do"  enctype="multipart/form-data" target="hiddenIFrame">
								<div class="form-group">
								    <label for="file">选择上传的文件</label>
								    <input id="input-file" type="file" id="file" name="file" data-show-preview="false"/>
								    <div align="center" id="selectFileMessage" style="display: none"><font color="red">请选择要上传的文件！</font> </div>
								    <div align="center" id="selectFileTypeMessage" style="display: none"><font color="red">该文件类型不允许上传，请重新选择！</font> </div>
								</div>
								<div class="form-group">
									 <label for="selectCatalogTreeName">选择上传文件的目录</label>
									 <input id="selectCatalogTreeName" class="form-control" name="selectCatalogTreeName" type="text" aria-label="..." readonly>
								    <div align="center" id="selectcatalogMessage" style="display: none"><font color="red">请选择文件上传的目录！</font> </div>
									 <div id="selectCatalogTree" style="display: none" align="left"/>
								</div>
								<div class="form-group">
									<input id="selectCatalogTreeID" class="form-control" type="hidden" name="selectCatalogTreeID" aria-label="..." readonly>
								</div>
								<div class="form-group">
									<font id="successMessage" color="green">上传成功！</font>
									<font id="errorMessage" color="red">上传失败，请重试！</font>
								</div>
								<br/><br/>
								<div class="form-group">
									<button type="reset" class="btn btn-default">重置</button>
									<button id="toUploadSubmitBtn" type="button" class="btn btn-primary">上传</button>
								</div>
							</form>
						</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>