<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>知识库目录</title>
<script type="text/javascript">
	var treeSelectedNodeName="知识库";
	var treeSelectedNodeID="1";
	var deleteData;
	$(function(){
		
		initTree();
		initSelectTreeNodeDetail(1);
		$("#add_belongCatalog").val(treeSelectedNodeName);
		$("#add_belongCatalogID").val(treeSelectedNodeID);

		$('#add_belongCatalog').on('click', function() {
			$("#add_selectBelongCatalog").show();
		});
		
		$('#addCatalogModal').on('show.bs.modal', function () {
			$("#add_selectBelongCatalog").hide();
			$("#add_catalogNameMessage").hide();
			$("#add_catalogDiscribeMessage").hide();
			$("#add_catalogIsRecommendMessage").hide();
			$("#add_catalogRankMessage").hide();
			$("#add_belongCatalogMessage").hide();
			$("#saveMessage").hide();
		});
		$('#deleteCatalogModal').on('show.bs.modal', function () {
			$("#toDeleteMessage").show();
			$("#deleteMessage").hide();
			$("#deleteCatelogSubmitBtn").show();
		});
		$('#updateCatalogModal').on('show.bs.modal', function () {
			$("#update_selectBelongCatalog").hide();
			$("#update_catalogNameMessage").hide();
			$("#update_catalogDiscribeMessage").hide();
			$("#update_catalogIsRecommendMessage").hide();
			$("#update_catalogRankMessage").hide();
			$("#update_belongCatalogMessage").hide();
			$("#updateSaveMessage").hide();
		});
		
		$("#addCatalogModalFromSaveBtn").on("click",function(){
			$("#saveMessage").hide();
			var catalogName = $("#add_catalogName").val();
			var belongCatalog = $("#add_belongCatalog").val();
			var belongCatalogID = $("#add_belongCatalogID").val();
			var catalogDiscribe = $("#add_catalogDiscribe").val();
			var catalogIsRecommend = $("#add_catalogIsRecommend").val();
			var catalogRank = $("#add_catalogRank").val();
			if($.trim(catalogName)==""||$.trim(belongCatalog)==""||$.trim(catalogDiscribe)==""||$.trim(catalogIsRecommend)==""||$.trim(catalogRank)==""){
				if($.trim(catalogName)==""){
					$("#add_catalogNameMessage").show();
				}else{
					$("#add_catalogNameMessage").hide();
				}
				if($.trim(belongCatalog)==""){
					$("#add_belongCatalogMessage").show();
				}else{
					$("#add_belongCatalogMessage").hide();
				}
				if($.trim(catalogDiscribe)==""){
					$("#add_catalogDiscribeMessage").show();
				}else{
					$("#add_catalogDiscribeMessage").hide();
				}
				if($.trim(catalogIsRecommend)==""){
					$("#add_catalogIsRecommendMessage").show();
				}else{
					$("#add_catalogIsRecommendMessage").hide();
				}
				if($.trim(catalogRank)==""){
					$("#add_catalogRankMessage").show();
				}else{
					$("#add_catalogRankMessage").hide();
				}
			}else{
				$("#add_catalogNameMessage").hide();
				$("#add_catalogDiscribeMessage").hide();
				$("#add_catalogIsRecommendMessage").hide();
				$("#add_catalogRankMessage").hide();
				$("#add_belongCatalogMessage").hide();
				saveCatalog();
			}
		});
		$("#updateCatalogModalSaveBtn").on("click",function(){
			$("#updateSaveMessage").hide();
			var catalogName = $("#update_catalogName").val();
			var belongCatalog = $("#update_belongCatalog").val();
			var belongCatalogID = $("#update_belongCatalogID").val();
			var catalogDiscribe = $("#update_catalogDiscribe").val();
			//var catalogIsRecommend = $("#update_catalogIsRecommend").val();
			var catalogIsRecommend = $("input[name='update_catalogIsRecommend']:checked").val();
			var catalogRank = $("#update_catalogRank").val();
			if($.trim(catalogName)==""||$.trim(belongCatalog)==""||$.trim(catalogDiscribe)==""||$.trim(catalogIsRecommend)==""||$.trim(catalogRank)==""){
				if($.trim(catalogName)==""){
					$("#update_catalogNameMessage").show();
				}else{
					$("#update_catalogNameMessage").hide();
				}
				if($.trim(belongCatalog)==""){
					$("#update_belongCatalogMessage").show();
				}else{
					$("#update_belongCatalogMessage").hide();
				}
				if($.trim(catalogDiscribe)==""){
					$("#update_catalogDiscribeMessage").show();
				}else{
					$("#update_catalogDiscribeMessage").hide();
				}
				if($.trim(catalogIsRecommend)==""){
					$("#update_catalogIsRecommendMessage").show();
				}else{
					$("#update_catalogIsRecommendMessage").hide();
				}
				if($.trim(catalogRank)==""){
					$("#update_catalogRankMessage").show();
				}else{
					$("#update_catalogRankMessage").hide();
				}
			}else{
				$("#update_catalogNameMessage").hide();
				$("#update_catalogDiscribeMessage").hide();
				$("#update_catalogIsRecommendMessage").hide();
				$("#update_catalogRankMessage").hide();
				$("#update_belongCatalogMessage").hide();
				updateCatalog(catalogName);
			}
		});
		
		$("#updateCatalogTableBtn").on("click",function(){
			var selectRow=$('#selectTreeNodeDetail').bootstrapTable('getSelections');
			if(selectRow.length!=1){
				showSelectTreeNodeDetailMessage("请只选择一条数据进行修改");
			}else{
				$('#updateCatalogModal').modal('show');
				$("#update_catalogID").val(selectRow[0].id);
				$("#update_catalogName").val(selectRow[0].text);
				$("#update_catalogDiscribe").val(selectRow[0].describe);
				if(selectRow[0].isrecommend=="0"){
					//$("#update_catalogIsRecommend2").val("否");
					$("#update_catalogIsRecommend2").prop('checked',true);
					//$("#update_catalogIsRecommend1").attr("checked",false);
				}else if(selectRow[0].isrecommend=="1"){
					$("#update_catalogIsRecommend1").prop('checked',true);
					//$("#update_catalogIsRecommend2").attr("checked",false);
					//$("#update_catalogIsRecommend1").val("是");
				}
				$("#update_catalogRank").val(selectRow[0].rank);
				$("#update_belongCatalogID").val(selectRow[0].pid);   
				$("#update_belongCatalog").val(treeSelectedNodeName);
			}
		});
		$("#deleteCatalogTableBtn").on("click",function(){
			var selectRow=$('#selectTreeNodeDetail').bootstrapTable('getSelections');
			var selectIDs="";
			if(selectRow.length==0){
				showSelectTreeNodeDetailMessage("请先选择要删除的数据");
			}else{
				$(selectRow).each(function(index,value){
					if(index==selectRow.length-1){
						selectIDs+=value.id;
					}else{
						selectIDs+=value.id+",";
					}
				});
				$.ajax({
					type:"POST",
					url:"<%=path%>/knowledgebase/searchCatalogByIDs.do",
					data:{
						"selectIDs":selectIDs
					},
					success:function(result){
						showToDeleteListNamesMessage(result);
						deleteData=result;
					}
				});
			}
		});
		$("#deleteCatelogSubmitBtn").on("click",function(){
			var deleteIDs="";
			var data = deleteData;
			$(data).each(function(index,value){
				if(index==data.length-1){
					deleteIDs+=value.id;
				}else{
					deleteIDs+=value.id+",";
				}
			});
			$.ajax({
				type:"POST",
				url:"<%=path%>/knowledgebase/deleteCatalogByIds.do",
				data:{
					"deleteIDs":deleteIDs
				},
				success:function(data){
					$("#toDeleteMessage").hide();
					$("#deleteMessage").show();
					$("#deleteCatelogSubmitBtn").hide();
					initSelectTreeNodeDetail(treeSelectedNodeID);
					initTree();
				}
			});
		});
		
	});
	function showToDeleteListNamesMessage(result){
		$("#deleteCatalogModal").modal('show');
		$('#showDeleteDetailTable').bootstrapTable('destroy');
		$('#showDeleteDetailTable').bootstrapTable({
			striped:true,
			data:result,
			columns : [
					   {field : 'id', title : '目录编号', align: 'center',visible:false},
					   {field : 'text', title : '目录名称', align: 'center'},
					   {field : 'pid', title : '上级目录编码', align: 'center',visible:false},
					   {field : 'isrecommend', title : '是否推荐', align: 'center',
						   formatter: function(value,row,index){
								if(value=='1'){
									return "是";
								}else if(value=='0'){
									return "否";
								}
							}
					   },
					   {field : 'rank', title : '排序', align: 'center'},
					   {field : 'describe', title : '目录描述', align: 'center'}
					]
		});
	}
	function showSelectTreeNodeDetailMessage(msg){
		$("#selectTreeNodeDetailMessage").text(msg).fadeIn(100).fadeOut(100);
		$("#selectTreeNodeDetailMessage").text(msg).fadeIn(100).fadeOut(100);
		$("#selectTreeNodeDetailMessage").text(msg).fadeIn(100).fadeOut(2900);
	}
	
	function saveCatalog(){
		var addcatalogName=$("#add_catalogName").val();
		$.ajax({
			type:"POST",
			url:"<%=path%>/knowledgebase/saveCatalog.do",
			data: 
				$("#addCatalogModalFrom").serialize()
			,
			success:function(result){
				$("#addCatalogModalFrom")[0].reset();
				$("#add_belongCatalog").val(treeSelectedNodeName);
				$("#add_belongCatalogID").val(treeSelectedNodeID);
				$("#saveMessage").text("目录：【"+addcatalogName+"】新增成功！").show();
				$('#selectTreeNodeDetail').bootstrapTable('destroy');
				initSelectTreeNodeDetail(treeSelectedNodeID);
				initTree();
			}
		});
	};
	function updateCatalog(updateCatalogName){
		$.ajax({
			type:"POST",
			url:"<%=path%>/knowledgebase/updateCatalog.do",
			data: 
				$("#updateCatalogModalFrom").serialize()
			,
			success:function(result){
				$("#updateSaveMessage").text("目录：【"+updateCatalogName+"】更新成功！").show();
				$('#selectTreeNodeDetail').bootstrapTable('destroy');
				initSelectTreeNodeDetail(treeSelectedNodeID);
				initTree();
			}
		});
	};

	function initTree() {
		$.ajax({
			url:"<%=path%>/knowledgebase/getTree.do",
			success:function(result){
				var data = "["+result+"]";
				$('#tree').empty();
				$('#tree').treeview({
					data: data,
					levels:2,
					backColor:"#F0F8FF",
					borderColor:"#ACE4FF",
					expandIcon:"glyphicon glyphicon-chevron-down",
					collapseIcon:"glyphicon glyphicon-chevron-up",
					onNodeSelected: function(event, data) {
						treeSelectedNodeName=data.text;
						treeSelectedNodeID=data.id;
						$("#add_belongCatalog").val(treeSelectedNodeName);
						$("#add_belongCatalogID").val(treeSelectedNodeID);
						$("#panelTitle").text("目录【"+data.text+"】的子节点信息");

						//getSelectCatalogFile(data.id,data.text,data.pid);
						//$('#viewFileTable').bootstrapTable('destroy');
						//initViewFileTable(data.id);
						initSelectTreeNodeDetail(data.id)
					}
				});
			}
		});
	};

	
	function getSelectCatalogFile(id,name,pid){
		alert(id+" "+name+" "+pid);
	};
	
	function initSelectTreeNodeDetail(id){
		$('#selectTreeNodeDetail').bootstrapTable('destroy');
		$('#selectTreeNodeDetail').bootstrapTable({
	      	url: "<%=path%>/knowledgebase/getSelectTreeNodeDetailByPID.do",
			method : 'get',
			showRefresh:true,
			clickToSelect:true,
	   		queryParamsType : "json",
		 	queryParams : function(data) {
			    data.id = id;
				return data;
			},
			pageList : [ 10, 25, 50, 100, 200 ],
			showRefresh : false,
			showHeader : true,
			height : "800px",
			pagination : true,
			striped : true,
			showColumns : false,
			columns : [
					   {field : 'check_box', checkbox : true},
					   {field : 'id', title : '节点编号', align: 'center',visible:false},
					   {field : 'text', title : '目录名称', align: 'center'},
					   {field : 'pid', title : '所属目录编码', align: 'center',visible:false},
					   {field : 'isrecommend', title : '是否推荐', align: 'center',
						   formatter: function(value,row,index){
								if(value=='1'){
									return "是";
								}else if(value=='0'){
									return "否";
								}
							}
					   },
					   {field : 'rank', title : '排序', align: 'center'},
					   {field : 'describe', title : '目录描述', align: 'center'}
					]
		});
	};
	
	function initViewFileTable(belongCatalogID){
		//页面加载时初始化dataTable
	    $('#viewFileTable').bootstrapTable({
	      	url: "<%=path%>/knowledgebase/getFileByBelongCatalogID.do",
			method : 'get',
	   		queryParamsType : "json",
		 	queryParams : function(data) {
			    data.belongCatalogID = belongCatalogID;
				return data;
			},
			
			pageSize: 10,
			pageList : [ 10, 25, 50, 100, 200 ],
			showHeader : true,
			height : "800px",
			striped : true,
			showColumns : false,
			columns : [
					   {field : 'check_box', checkbox : true},
					   {field : 'belongcatalogid',  visible : false},
					   {field : 'fileName', title : '文件名', align: 'center'},
					   {field : 'fileType', title : '文件类型', align: 'center'},
					   {field : 'upTime', title : '上传时间', align: 'center'},
					   {field : 'upUser', title : '上传用户', align: 'center'},
					   {field : 'downNum', title : '下载次数', align: 'center',visible : false},
					   {fieid : "oper", title : '操作', align:'center' ,  
							formatter: function(value,row,index){
								return "<a href='#' onclick=downFile('"+row.standardId+"'); >下载</a>";
							}},
					]
		});
	}
</script>
</head>
<body>
<div class="page-content-wrapper" style="width:100%;margin-left: 0;margin-right: 0">
	<ul class="breadcrumb "  style="margin-bottom:0;">  
		<li>    数据资产 </li>  
		<li>    知识库</li>  
		<li class="active">知识库目录</li>
	</ul><br/>
<div class="container" style="width:100%;margin-left: 0;margin-right: 0">
	<div class="row clearfix">
		<div class="col-md-4 column">
			<div id="treeMenu">
				<button class="btn btn-info" onclick="initTree()">刷新</button>
			</div>
			<div id="tree"></div>
		</div>
		<div class="col-md-8 column" style="padding-left: 0">
			<div id="nodePanel" class="panel panel-default">
			    <div class="panel-heading">
			        <h3 id="panelTitle" class="panel-title">目录【知识库目录】的子节点信息</h3>
			    </div>
			    <div class="panel-body">
			     	<div id="tableMenu">
						<button id="addCatalogTableBtn" class="btn btn-info" data-toggle="modal" data-target="#addCatalogModal">新增节点</button>
						<button id="updateCatalogTableBtn" class="btn btn-warning">修改节点</button>
						<button id="deleteCatalogTableBtn" class="btn btn-danger">删除节点</button>
					</div>
					<div align="center">
						<font id="selectTreeNodeDetailMessage" color="red" style="font-size: 16px"></font>
					</div>
					<table id="selectTreeNodeDetail" class="table table-condensed table-hover table-striped"
						data-toggle="table"
				       data-show-columns="true">
						<thead style="background: rgb(172, 228, 255)"></thead>
					</table>
			    </div>
			</div>
			
		</div>
	</div>
	<!-- 模态框（Modal） -->
	<div class="modal fade" id="addCatalogModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                <h4 class="modal-title" id="myModalLabel">新增附件目录</h4>
	            </div>
	            <div class="modal-body">
					<form id="addCatalogModalFrom" class="form-horizontal" role="form">
						<div class="form-group">
							<label for="add_belongCatalog" class="col-sm-2 control-label">上层目录</label>
								<div class="col-sm-10">
									<input style="border:none" class="form-control" id="add_belongCatalog" name="add_belongCatalog" type="text" aria-label="..." readonly/>
									<input id="add_belongCatalogID" name="add_belongCatalogID" type="hidden">
								</div>
							<div id="add_belongCatalogMessage"align="center" >
								<font color="red">上层目录不可为空</font>
							</div>
						</div>
						<div class="form-group">
							 <label for="add_catalogName" class="col-sm-2 control-label">目录名称</label>
							<div class="col-sm-10">
								<input class="form-control" id="add_catalogName"name="add_catalogName" type="text" />
							</div>
							<div id="add_catalogNameMessage"  align="center" >
								<font color="red">目录名称不可为空</font>
							</div>
						</div>
						<div class="form-group">
							<label for="add_catalogIsRecommend"class="col-sm-2 control-label">是否推荐</label>
							<div class="col-sm-3">
								<div class="radio">
								  <label>
								    <input type="radio" name="add_catalogIsRecommend" id="add_catalogIsRecommend" value="是" checked>是
								  </label>&nbsp;&nbsp;&nbsp;&nbsp;
								  <label>
								    <input type="radio" name="add_catalogIsRecommend" id="add_catalogIsRecommend" value="否">否
								  </label>
								</div>
							</div>
						</div>
						<div class="form-group">
							 <label for="add_catalogDiscribe" class="col-sm-2 control-label">目录描述</label>
							<div class="col-sm-10">
								<textarea id="add_catalogDiscribe" name="add_catalogDiscribe" class="form-control" rows="3"></textarea>
							</div>
							<div id="add_catalogDiscribeMessage" align="center" >
								<font color="red">目录描述不可为空</font>
							</div>
						</div>
						<div class="form-group" style="display: none">
						    <label for="add_catalogRank"class="col-sm-2 control-label">排序</label>
							<div class="col-sm-4">
							    <select  id="add_catalogRank" name="add_catalogRank" class="selectpicker show-tick">
							      <option>1</option>
							      <option>2</option>
							      <option>3</option>
							      <option>4</option>
							      <option>5</option>
							      <option>6</option>
							      <option>7</option>
							      <option>8</option>
							      <option>9</option>
							      <option>10</option>
							      <option>11</option>
							      <option>12</option>
							      <option>13</option>
							      <option>14</option>
							      <option>15</option>
							    </select>
						    </div>
						    <div id="add_catalogIsRecommendMessage" align="center" >
								<font color="red">是否推荐不可为空</font>
							</div>
						    <div id="add_catalogRankMessage" align="center" >
								<font color="red">排序不可为空</font>
							</div>
						</div>
						
						<div class="form-group">
							<div align="center">
								<font  id="saveMessage" color="green"></font>
							</div>
						</div>
					</form>
				</div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	                <button id="addCatalogModalFromSaveBtn" type="button" class="btn btn-primary">保存</button>
	            </div>
	        </div><!-- /.modal-content -->
	    </div><!-- /.modal -->
		</div>
	</div>
<!-- 模态框（Modal） -->
		<div class="modal fade" id="updateCatalogModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		    <div class="modal-dialog">
		        <div class="modal-content">
		            <div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		                <h4 class="modal-title" id="myModalLabel">修改目录</h4>
		            </div>
		            <div class="modal-body">
						<form id="updateCatalogModalFrom" class="form-horizontal" role="form">
							<div class="form-group">
								 <label for="update_belongCatalog" class="col-sm-2 control-label">上层目录</label>
								<div class="col-sm-10">
									<input style="border: none;" class="form-control" id="update_belongCatalog" name="update_belongCatalog" type="text" aria-label="..." readonly/>
									<input id="update_belongCatalogID" name="update_belongCatalogID" type="hidden">
								</div>
								<div id="update_belongCatalogMessage"align="center" >
									<font color="red">上层目录不可为空</font>
								</div>
							</div>
							<div class="form-group">
								 <label for="update_catalogName" class="col-sm-2 control-label">目录名称</label>
								<div class="col-sm-10">
									<input class="form-control" id="update_catalogID"name="update_catalogID" type="hidden" />
									<input class="form-control" id="update_catalogName"name="update_catalogName" type="text" />
								</div>
								<div id="update_catalogNameMessage"  align="center" >
									<font color="red">目录名称不可为空</font>
								</div>
							</div>
							<div class="form-group">
								<label for="update_catalogIsRecommend"class="col-sm-2 control-label">是否推荐</label>
							    <div class="col-sm-3">
								<div class="radio">
								  <label>
								    <input type="radio" name="update_catalogIsRecommend" id="update_catalogIsRecommend1" value="是">是
								  </label>&nbsp;&nbsp;&nbsp;&nbsp;
								  <label>
								    <input type="radio" name="update_catalogIsRecommend" id="update_catalogIsRecommend2" value="否">否
								  </label>
								</div>
							</div>
							</div>
							<div class="form-group">
								 <label for="update_catalogDiscribe" class="col-sm-2 control-label">目录描述</label>
								<div class="col-sm-10">
									<textarea id="update_catalogDiscribe" name="update_catalogDiscribe" class="form-control" rows="3"></textarea>
								</div>
								<div id="update_catalogDiscribeMessage" align="center" >
									<font color="red">目录描述不可为空</font>
								</div>
							</div>
							<div class="form-group" style="display: none">
							    <label for="update_catalogRank"class="col-sm-2 control-label">排序</label>
								<div class="col-sm-4">
								    <select  id="update_catalogRank" name="update_catalogRank" class="selectpicker show-tick">
								      <option>1</option>
								      <option>2</option>
								      <option>3</option>
								      <option>4</option>
								      <option>5</option>
								      <option>6</option>
								      <option>7</option>
								      <option>8</option>
								      <option>9</option>
								      <option>10</option>
								      <option>11</option>
								      <option>12</option>
								      <option>13</option>
								      <option>14</option>
								      <option>15</option>
								    </select>
							    </div>
							    <div id="update_catalogIsRecommendMessage" align="center" >
									<font color="red">是否推荐不可为空</font>
								</div>
							    <div id="update_catalogRankMessage" align="center" >
									<font color="red">排序不可为空</font>
								</div>
							</div>
							<div class="form-group">
								<div align="center">
									<font  id="updateSaveMessage" color="green"></font>
								</div>
							</div>
						</form>
					</div>
		            <div class="modal-footer">
		                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		                <button id="updateCatalogModalSaveBtn" type="button" class="btn btn-primary">提交更改</button>
		            </div>
		        </div><!-- /.modal-content -->
		    </div><!-- /.modal -->
		   </div>
		   <!-- 模态框（Modal） -->
			<div class="modal fade" id="deleteCatalogModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			    <div class="modal-dialog">
			        <div class="modal-content">
			            <div class="modal-header">
			                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			                <h4 class="modal-title" id="myModalLabel">目录删除</h4>
			            </div>
			            <div class="modal-body">
			            	<div id="toDeleteMessage">
								即将删除所选择的目录(含其子目录)：<font color="red">(注意：目录下的文件也将被删除！)</font>
								<table id="showDeleteDetailTable" class="table table-condensed table-hover table-striped">
									<thead style="background: rgb(172, 228, 255)"></thead>
								</table>
								<div align="center"><font color="red" style="font-size: 20px">是否确认删除上述内容？</font></div>
							</div>
							<div align="center"><font id="deleteMessage" color="green"style="font-size: 20px">删除成功！</font></div>
						</div>
			            <div class="modal-footer">
			                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			                <button id="deleteCatelogSubmitBtn" type="button" class="btn btn-primary">确认删除</button>
			            </div>
			        </div><!-- /.modal-content -->
			    </div><!-- /.modal -->
			</div>
		   </div>
</body>
</html>