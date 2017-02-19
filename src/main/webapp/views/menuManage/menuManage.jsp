<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>菜单管理</title>
<script type="text/javascript">
	var tableSelectMenuName;
	var tableSelectMenuID;
	
	$(function(){
		initMenuTable();
		addMenuModalFormValidator();
		editMenuModalFormValidator();
		
		$("#btnAddMenu").on("click",function(){
			$("#addMenuModal").modal("show");
		});
		
		$("#btnEditMenu").on("click",function(){
			
			var tableSelected = $("#menuTable").bootstrapTable('getSelections');
			if(tableSelected.length!=1){
				showAlarmMessage("请只选择一条数据进行操作！","alert-warning");
			}else{
				tableSelectMenuName = tableSelected[0].menuName;
				tableSelectMenuID = tableSelected[0].menuID;
				$("#editMenuModalTitle").text(tableSelectMenuName);
				$("#editMenuModal").modal("show");
			}
		});
		
		$("#btnDeleteMenu").on("click",function(){
			var tableSelectedMenuIDs='';
			var tableSelected = $("#menuTable").bootstrapTable('getSelections');
			if(tableSelected.length==0){
				showAlarmMessage("请先选择要进行删除的菜单！","alert-warning");
			}else{
				$(tableSelected).each(function(index,value){
					if(index==tableSelected.length-1){
						tableSelectedMenuIDs+=value.menuID;
					}else{
						tableSelectedMenuIDs+=value.menuID+',';
					}
				});
				var dialogInstance = BootstrapDialog.show({
					title:'删除菜单',
					type:'type-danger',
					closable:false,
					message:'您即将删除所选择的菜单及其子菜单，是否确认删除？！',
					buttons:[
						{
							label:'取消',
							action:function(dialog){
								dialog.close();
							}
						},
						{
							 icon: 'glyphicon glyphicon-trash',
							 label:'确认删除',
							 cssClass:'btn-danger',
							 autospan:true,
							 action:function(dialog){
								 dialog.enableButtons(false);
								 dialog.setClosable(false);
								 $.ajax({
									url:'<%=path%>/menuController/deleteMenuByIDs',
									data:{
										'menuIDs':tableSelectedMenuIDs
									},
									success:function(data){
										initMenuTable();
										dialogInstance.close();
										BootstrapDialog.alert({
											title:'删除菜单',
											message:'删除菜单成功！',
											type:'type-success',
											size:'size-small'
										});
									}
								 });
							 }
						}
						
					]
				});
			}
		});
		
		$("#addMenuModal").on("show.bs.modal",function(){
			$("#addMenuModalForm")[0].reset();
			resetValidator();
			initSelectBelongMenuID();
		});
		
		$("#editMenuModal").on("show.bs.modal",function(){
			$("#editMenuModalForm")[0].reset();
			resetValidator();
			initSelectBelongMenuID();
			initEditForm();
			$("#editMenuModalForm").bootstrapValidator('validate');
		});
		
		$("#addMenuModal").on("hidden.bs.modal",function(){
			resetValidator();
		});
		
		$("#editMenuModal").on("hidden.bs.modal",function(){
			resetValidator();
		});
		
		$("#addMenuModalBtnSave").on("click",function(){
			$("#addMenuModalForm").bootstrapValidator('validate');
			var isValid = $("#addMenuModalForm").data("bootstrapValidator").isValid();
			if(isValid==true){
				$.ajax({
					url:'<%=path%>/menuController/saveNewMenu',
					method:'post',
					data:$("#addMenuModalForm").serialize(),
					success:function(data){
						$("#addMenuModal").modal('hide');
						 BootstrapDialog.alert({
				            title: '新增菜单',
				            message: '添加菜单成功!',
				            size:'size-small',
				            type:'type-success', // <-- Default value is BootstrapDialog.TYPE_PRIMARY
				            closable: true, // <-- Default value is false
				            draggable: true, // <-- Default value is false
				            buttonLabel: '确定', // <-- Default value is 'OK',
				            callback: function(result) {
				                // result will be true if button was click, while it will be false if users close the dialog directly.
				            }
				        });
						resetValidator();
						initMenuTable();
					}
				});
			}
		});
		$("#editMenuModalBtnSave").on("click",function(){
			$("#editMenuModalForm").bootstrapValidator('validate');
			var isValid = $("#editMenuModalForm").data("bootstrapValidator").isValid();
			if(isValid==true){
				var dialogInstance = BootstrapDialog.confirm({
		            title: '修改菜单',
		            message: '您即将修改菜单信息，是否继续？',
		            type: BootstrapDialog.TYPE_WARNING, // <-- Default value is BootstrapDialog.TYPE_PRIMARY
		            closable: false, // <-- Default value is false
		            draggable: false, // <-- Default value is false
		            btnCancelLabel: '取消', // <-- Default value is 'Cancel',
		            btnOKLabel: '确定修改', // <-- Default value is 'OK',
		            btnOKClass: 'btn-warning', // <-- If you didn't specify it, dialog type will be used,
		            callback: function(result) {
		                // result will be true if button was click, while it will be false if users close the dialog directly.
		                if(result) {
		                	$.ajax({
		    					url:'<%=path%>/menuController/updateNewMenu',
		    					method:'post',
		    					data:$("#editMenuModalForm").serialize(),
		    					success:function(data){
		    						$("#editMenuModal").modal('hide');
		    						BootstrapDialog.alert({
		    				            title: '修改菜单',
		    				            message: '修改菜单成功!',
		    				            size:'size-small',
		    				            type:'type-success', // <-- Default value is BootstrapDialog.TYPE_PRIMARY
		    				            closable: true, // <-- Default value is false
		    				            buttonLabel: '确定', // <-- Default value is 'OK',
		    				            callback: function(result) {
		    				                // result will be true if button was click, while it will be false if users close the dialog directly.
		    				            }
		    				        });
		    						resetValidator();
		    						initMenuTable();
		    					}
		    				});
		                }else {
		                	dialogInstance.close();
		                }
		            }
		        });
				
			}
		});
		
		$("#addMenuModalBtnReset").on("click",function(){
			$("#addMenuModalForm")[0].reset();
			resetValidator();
		});
		
		$("#addMenuModalFormSelect").on("click",function(){
			
		});
		
	});
	function initEditForm(){
		$.ajax({
			url:'<%=path%>/menuController/getMenuByMenuID',
			data:{
				'menuID':tableSelectMenuID
			},
			success:function(data){
				$("#editMenuModalFormMenuID").val(tableSelectMenuID);
				$("#editMenuModalFormMenuName").val(data.menuName);
				$("#editMenuModalFormMenuTargetPage").val(data.targetPage);
				$("#editMenuModalFormSelect").val(data.belongMenuID);
			}
		});
	}
	
	
	function showAlarmMessage(message,classType){
		$("#alertMessageFont").text(message);
		$("#alertDIV").addClass(classType).show().delay("3000").fadeOut();;
	}
	
	function resetValidator(){
		$("#addMenuModalForm").bootstrapValidator('resetForm');
		$("#editMenuModalForm").bootstrapValidator('resetForm');
	}
	
	function addMenuModalFormValidator(){
		$('#addMenuModalForm').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {/*输入框不同状态，显示图片的样式*/
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {/*验证*/
                menuName: {/*键名username和input name值对应*/
                    message: '菜单名称无效',
                    validators: {
                        notEmpty: {/*非空提示*/
                            message: '菜单名称不能为空'
                        },
                        stringLength: {/*长度提示*/
                            max: 30,
                            message: '菜单名称长度必须小于30'
                        },
                        threshold :  1 , //有1字符以上才发送ajax请求，（input中输入一个字符，插件会向服务器发送一次，设置限制，1字符以上才开始）
                        remote: {//ajax验证。server result:{"valid",true or false} 向服务发送当前input name值，获得一个json数据。例表示正确：{"valid",true}  
                            url: '<%=path%>/menuController/checkMenuNameExist',//验证地址
                            message: '该菜单名称已存在，请输入其他名称',//提示消息
                            delay :  1000,//每输入一个字符，就发ajax请求，服务器压力还是太大，设置2秒发送一次ajax（默认输入一个字符，提交一次，服务器压力太大）
                            type: 'POST'//请求方式
                            /**自定义提交数据，默认值提交当前input value
                             *  data: function(validator) {
                                  return {
                                      password: $('[name="passwordNameAttributeInYourForm"]').val(),
                                      whatever: $('[name="whateverNameAttributeInYourForm"]').val()
                                  };
                               }
                             */
                        }
                    }
                },
                targetPage: {
                    message:'目标页面路径无效',
                    validators: {
                        notEmpty: {
                            message: '目标页面路径不能为空'
                        },
                        stringLength: {
                            max: 512,
                            message: '目标页面路径必须小于512'
                        }
                    }
                }
            }
        });
	}
	function editMenuModalFormValidator(){
		$('#editMenuModalForm').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {/*输入框不同状态，显示图片的样式*/
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {/*验证*/
                menuName: {/*键名username和input name值对应*/
                    message: '菜单名称无效',
                    validators: {
                        notEmpty: {/*非空提示*/
                            message: '菜单名称不能为空'
                        },
                        stringLength: {/*长度提示*/
                            max: 30,
                            message: '菜单名称长度必须小于30'
                        },
                        threshold :  1 , //有1字符以上才发送ajax请求，（input中输入一个字符，插件会向服务器发送一次，设置限制，1字符以上才开始）
                        remote: {//ajax验证。server result:{"valid",true or false} 向服务发送当前input name值，获得一个json数据。例表示正确：{"valid",true}  
                            url: '<%=path%>/menuController/checkEditMenuNameExist',//验证地址
                            message: '该菜单名称已存在，请输入其他名称',//提示消息
                            delay :  1000,//每输入一个字符，就发ajax请求，服务器压力还是太大，设置2秒发送一次ajax（默认输入一个字符，提交一次，服务器压力太大）
                            type: 'POST'//请求方式
                            /**自定义提交数据，默认值提交当前input value
                             *  data: function(validator) {
                                  return {
                                      password: $('[name="passwordNameAttributeInYourForm"]').val(),
                                      whatever: $('[name="whateverNameAttributeInYourForm"]').val()
                                  };
                               }
                             */
                             ,data: function(validator) {
                                 return {
                                     oldName: tableSelectMenuName,
                                     newName: $("#editMenuModalFormMenuName").val()
                                 };
                              }
                        }
                    }
                },
                targetPage: {
                    message:'目标页面路径无效',
                    validators: {
                        notEmpty: {
                            message: '目标页面路径不能为空'
                        },
                        stringLength: {
                            max: 512,
                            message: '目标页面路径必须小于512'
                        }
                    }
                }
            }
        });
	}
	
	function initSelectBelongMenuID(){
		$.ajax({
			url: '<%=path%>/menuController/getRootLevelMenu',
			success:function(data){
				$("#addMenuModalFormSelect").empty();
				$("#addMenuModalFormSelect").append("<option value='root'>顶层菜单</option>");
				$(data).each(function(index,value){
					$("#addMenuModalFormSelect").append("<option value='"+value.menuID+"'>"+value.menuName+"</option>");
				});
				$("#editMenuModalFormSelect").append("<option value='root'>顶层菜单</option>");
				$(data).each(function(index,value){
					$("#editMenuModalFormSelect").append("<option value='"+value.menuID+"'>"+value.menuName+"</option>");
				});
			}
		});
	}
	
	function initMenuTable(){
		$("#menuTable").bootstrapTable("destroy");
		$("#menuTable").bootstrapTable({
			url: '<%=path%>/menuController/getAllMenu',
	 		method: 'get',
           //toolbar: '#toolbar',    //工具按钮用哪个容器
           striped: true,      //是否显示行间隔色
           cache: false,      //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
           pagination: true,     //是否显示分页（*）
           maintainSelected:true,//设置为 true 在点击分页按钮或搜索按钮时，将记住checkbox的选择项
           //sortable: false,      //是否启用排序
           //sortOrder: "asc",     //排序方式
           //pageNumber:1,      //初始化加载第一页，默认第一页
           pageSize: 10,      //每页的记录行数（*）
           pageList: [10, 25, 50, 100],  //可供选择的每页的行数（*）
           queryParamsType:'', //默认值为 'limit' ,在默认情况下 传给服务端的参数为：offset,limit,sort
                               // 设置为 ''  在这种情况下传给服务器的参数为：pageSize,pageNumber
           //queryParams: queryParams,//前端调用服务时，会默认传递上边提到的参数，如果需要添加自定义参数，可以自定义一个函数返回请求参数
           sidePagination: "client",   //分页方式：client客户端分页，server服务端分页（*）
           //search: true,      //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
           strictSearch: true,
           //showColumns: true,     //是否显示所有的列
           //showRefresh: true,     //是否显示刷新按钮
           minimumCountColumns: 2,    //最少允许的列数
           clickToSelect: true,    //是否启用点击选中行
			//queryParams : function(data) {
			  //  data.roleName=encodeURI($('#formRoleName').val());
				//return data;
			//},
			onDblClickRow : function(row,$element,field) {
				
			},
			columns : [
					{field : 'check_box', checkbox : true},
				    {field : 'menuID', title : '菜单编号', visible : true},
				    {field : 'menuName', title : '菜单名称', visible : true},
				    {field : 'targetPage', title : '目标页面路径', visible : true},
				    {field : 'belongMenuID', title : '上层菜单编号', visible : true}
			]
		});
	}
</script>
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
		<div id="alertDIV" class="alert" style="display: none">
			<a href="#" class="close" data-dismiss="alert">&times;</a> 
			<strong><font id="alertMessageFont"></font></strong>
		</div>
		<div>
			<button id="btnAddMenu" class="btn btn-success">添加菜单</button>
			<button id="btnEditMenu" class="btn btn-warning">修改菜单</button>
			<button id="btnDeleteMenu" class="btn btn-danger">删除菜单</button>
			<table id="menuTable" class="table table-condensed">
				<thead style="background-color : #87CEFF"></thead>
			</table>
		</div>
	</div>
	<!-- 新增菜单模态框（Modal） -->
	<div class="modal fade" id="addMenuModal" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                <h4 class="modal-title" id="myModalLabel">【新增菜单】</h4>
	            </div>
	            <div class="modal-body">
					<form id="addMenuModalForm" method="post" class="form form-horizontal">
		                <div class="form-group">
		                    <label for="menuName" class="col-sm-3 control-label">菜单名称</label>
		                    <div class="col-sm-9">
		                        <input type="text" class="form-control" name="menuName" />
		                    </div>
		                </div>
		                
		                <div class="form-group">
		                    <label class="col-sm-3 control-label">目标页面路径</label>
		                    <div class="col-sm-9">
		                        <input type="text" class="form-control" name="targetPage" />
		                    </div>
		                </div>
		
		                <div class="form-group">
		                    <label class="col-sm-3 control-label">上层菜单</label>
		                    <div class="col-sm-9">
		                       <select id="addMenuModalFormSelect" class="form-control" name="belongMenuID">
							   </select>
		                    </div>
		                </div>
		
		                <div class="form-group">
		                    <div class="col-sm-9 col-sm-offset-3">
		                        <button id="addMenuModalBtnReset" type="button" class="btn btn-primary">重置</button>
		                        <button id="addMenuModalBtnSave" type="button" class="btn btn-primary">保存</button>
		                    </div>
		                </div>
		            </form>
	            </div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	            </div>
	        </div><!-- /.modal-content -->
	    </div><!-- /.modal -->
	</div>
	
	<!-- 修改菜单模态框（Modal） -->
	<div class="modal fade" id="editMenuModal" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                <h4 class="modal-title" id="myModalLabel">【修改菜单：<font id="editMenuModalTitle"></font>】</h4>
	            </div>
	            <div class="modal-body">
					<form id="editMenuModalForm" method="post" class="form form-horizontal">
		                <div class="form-group">
		                    <label for="menuName" class="col-sm-3 control-label">菜单名称</label>
		                    <div class="col-sm-9">
		                        <input type="text" id="editMenuModalFormMenuID" class="form-control" name="menuID" style="display: none"/>
		                        <input type="text" id="editMenuModalFormMenuName" class="form-control" name="menuName" />
		                    </div>
		                </div>
		                
		                <div class="form-group">
		                    <label class="col-sm-3 control-label">目标页面路径</label>
		                    <div class="col-sm-9">
		                        <input type="text" id="editMenuModalFormMenuTargetPage" class="form-control" name="targetPage" />
		                    </div>
		                </div>
		
		                <div class="form-group">
		                    <label class="col-sm-3 control-label">上层菜单</label>
		                    <div class="col-sm-9">
		                       <select id="editMenuModalFormSelect" class="form-control" name="belongMenuID">
							   </select>
		                    </div>
		                </div>
		
		                <div class="form-group">
		                    <div class="col-sm-9 col-sm-offset-3">
		                        <button id="editMenuModalBtnReset" type="button" class="btn btn-primary">重置</button>
		                        <button id="editMenuModalBtnSave" type="button" class="btn btn-primary">保存</button>
		                    </div>
		                </div>
		            </form>
	            </div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	            </div>
	        </div><!-- /.modal-content -->
	    </div><!-- /.modal -->
	</div>
	
</body>
</html>