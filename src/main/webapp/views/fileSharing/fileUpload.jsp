<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>文档上传</title>

<script type="text/javascript">

	$(function(){
		initTable();
		
		$("#toFileUploadBtn").on("click",function(){
			
		});
		
		$("#deleteFileBtn").on("click",function(){
			var selectRow=$('#table').bootstrapTable('getSelections');
			var selectIDs="";
			if(selectRow.length==0){
				showSelectTreeNodeDetailMessage("请先选择要删除的数据");
			}else{
				$(selectRow).each(function(index,value){
					if(index==selectRow.length-1){
						selectIDs+=value.fileId;
					}else{
						selectIDs+=value.fileId+",";
					}
				});
				
				showConfirm('【删除文档】', '是否删除所选择的文档?！', function(){
					$.ajax({
						type:"POST",
						url:"<%=path%>/knowledgebase/deleteFileByIDs.do",
						data:{
							"deleteIDs":selectIDs
						},
						success:function(result){
							initTable();
							showConfirm('【删除文档】', '删除成功！', function(){});
						}
					});
	     		});
			}
		});
	});
	function initTable(){
		$('#table').bootstrapTable('destroy');
		$('#table').bootstrapTable({
	      	url: "<%=path%>/knowledgebase/getAllUploadedFile.do",
			method : 'get',
			showRefresh:true,
			clickToSelect:true,
	   		queryParamsType : "json",
			pageList : [15,30,60,120,200],
			pageSize:"15",
			showHeader : true,
			pagination : true,
			paginationHAlign:"right",
			paginationDetailHAlign:"right",
			striped : true,
			columns : [{field : 'check_box', checkbox : true},
					   {field : 'check_box', checkbox : true,visible:false},
					   {field : 'fileId', title : '文档编号', align: 'center'},
					   {field : 'fileName', title : '文档名称', align: 'center'},
					   {field : 'fileType', title : '文档类型', align: 'center'},
					   {field : 'belongcatalogid', title : '所属目录编号', align: 'center',visible:false},
					   {field : 'belongcatalogName', title : '所属目录', align: 'center'},
					   {field : 'upTime', title : '上传时间', align: 'center',formatter: function(value,row,index){
						   if((typeof(value)!='undefined') && value != null)
						   {
						   		value = new Date(value);
								return value.format("yyyy-MM-dd");
								
						   }else{
							   return value;
						   }
					   }},
					   {field : 'upUser', title : '上传用户', align: 'center'},
					   {field : 'downNum', title : '下载次数', align: 'center'},
					   {field : 'funType', title : '？', align: 'center',visible:false},
					   {field : 'filePath', title : '操作', align: 'center',
							formatter: function(value,row,index){
								return "<a href='/"+value+"' download='' onclick='addDownloadNum("+row.fileId+");'>下载</a>";
							}
					   }
					]
		});
	};
	function addDownloadNum(data){
		$.ajax({
			url:"<%=path%>/knowledgebase/addDownloadNum.do",
			data:{
				"fileid":data
			},
			success:function(data){
				//initTable();
			}
		});
		initTable();
		$('#table').bootstrapTable('refresh');
	}
	function showSelectTreeNodeDetailMessage(msg){
		$("#selectTreeNodeDetailMessage").text(msg).fadeIn(100).fadeOut(100);
		$("#selectTreeNodeDetailMessage").text(msg).fadeIn(100).fadeOut(100);
		$("#selectTreeNodeDetailMessage").text(msg).fadeIn(100).fadeOut(2900);
	}
	
</script>
</head>
<body>
<div class="page-content-wrapper" style="width:100%;margin-left: 0;margin-right: 0">
	<ul class="breadcrumb "  style="margin-bottom:0;">  
		<li>    数据资产 </li>  
		<li>    知识库</li>  
		<li class="active">知识库文档</li>
	</ul>
	<div id="toolbar" class="btn-group">
	    <button id="toFileUploadBtn" class="btn btn-info" data-toggle="modal" data-target="#fileUploadModal">上传文档</button>
	    <button id="deleteFileBtn" class="btn btn-danger">删除文档</button>
	</div>
	<div align="center">
		<font id="selectTreeNodeDetailMessage" color="red" style="font-size: 16px"></font>
	</div>
	<table id="table" class="table table-condensed table-hover table-striped" data-toggle="table" data-striped="true" data-search="true" data-show-refresh="true" data-show-toggle="true" data-show-columns="true" data-toolbar="#toolbar">
	  <thead style="background: rgb(172, 228, 255) none repeat scroll 0% 0%;"">
	  </thead>
	</table>
	<!-- Modal fileUpload-->
	<div class="modal fade" id="fileUploadModal" tabindex="-1" role="dialog"
		aria-labelledby="fileUploadModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="addModalLabel">【文档上传】</h4>
				</div>
				<div id="fileUploadModalBody" class="modal-body">
					<jsp:include page="fileUploadForm.jsp"></jsp:include>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default"
						data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
	</div>
	<!-- Modal -->
</body>

</html>