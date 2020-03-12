<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    


<div>
	<input id="queryName" value="${queryName}"/>
	<button type="button" class="btn btn-primary" onclick="query()">
   	查询 </button>
   	
  	<button type="button" class="btn btn-primary" onclick="delBatch()">
   	批量删除</button> 
   	
   	
	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#staticBackdrop">
   	添加 </button>
   	
   	
   	
</div>

<!-- Modal添加的模态框 -->
<div class="modal fade" id="staticBackdrop" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">添加品牌</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        	
      </div>
      <div class="modal-body">
        	<form id="addbrand">
        		 <div class="form-group">
    				<label for="name">品牌名称</label>
    				<input type="text" class="form-control" name="name" id="name" aria-describedby="brandNamelHelp">
    				<small id="brandNamelHelp" class="form-text text-muted">请输入品牌名称</small>
  				</div>
  				<div class="form-group">
    				<label for="firstChar">品牌首字母</label>
    				<input type="text" class="form-control" name="firstChar" id="firstChar" aria-describedby="brandFirstNamelHelp">
    				<small id="brandFirstNamelHelp" class="form-text text-muted">请输入品牌名称</small>
  				</div>
  				
    			
        	</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" onclick="commitBrand()">提交</button>
      </div>
    </div>
  </div>
</div>


<!-- Modal修改的模态框 -->
<div class="modal fade" id="staticBackdropUpdate" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">修改品牌</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        	
      </div>
      <div class="modal-body">
        	<form id="updatebrand">
        		<input type="hidden" name="id" id="updateid">
        		 <div class="form-group">
    				<label for="name">品牌名称</label>
    				<input type="text" class="form-control" name="name" id="updatename" aria-describedby="brandNamelHelp">
    				<small id="brandNamelHelp" class="form-text text-muted">请修改品牌名称</small>
  				</div>
  				<div class="form-group">
    				<label for="firstChar">品牌首字母</label>
    				<input type="text" class="form-control" name="firstChar" id="updatefirstChar" aria-describedby="brandFirstNamelHelp">
    				<small id="brandFirstNamelHelp" class="form-text text-muted">请修改品牌名称</small>
  				</div>
  				<input type="hidden" name="deletedFlag" id="updatedeletedFlag">
    			
        	</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" onclick="commitUpdateBrand()">提交</button>
      </div>
    </div>
  </div>
</div>


<table class="table">
	
	<tr> 
		<tr> 
		<th>编号
			<button type="button" class="btn btn-info btn-sm" onclick="selAll(1)">全选</button>
			<button type="button" class="btn btn-info btn-sm" onclick="selAll(2)">全不选</button>
			<button type="button" class="btn btn-info btn-sm" onclick="selAll(3)">反选</button>
		</th>
		<th>名称</th>
		<th>首字母</th>
	</tr>
	<c:forEach items="${pageInfo.list}" var="brand">
		<tr>
			<td><input type="checkbox" name="ids" value="${brand.id}" onchange="selectedOne()"> ${brand.id}</td>
			<td>${brand.name}</td>
			<td>${brand.firstChar}</td>
			<td>
				<button type="button" class="btn btn-danger" onclick="delBrand(${brand.id})">删除</button>
				<button type="button" class="btn btn-warning" onclick="openUpdateBrand(${brand.id})">修改</button>
			</td>
			
		</tr>
	</c:forEach>
	
	<!-- pageInfo -->
	<tr>
		<td colspan="3">
			<jsp:include page="../common/page.jsp"></jsp:include>
		</td>
	</tr>
</table>    

<script type="text/javascript">


/**
点击三个按钮
*/
function selAll(flag){
	
 	 if(flag==1){
		//全选
		$("[name=ids]").each(function(){
			$(this).prop("checked",true)
		}
		)
	}
	
	if(flag==2){
		//全不选
		$("[name=ids]").each(function(){
			$(this).prop("checked",false)
		})
	}
	if(flag==3){
		//反选
		$("[name=ids]").each(function(){
			var ch = !$(this).prop("checked")
			$(this).prop("checked",ch)
		}
		)
	} 
	
	} 



	
	/**
	查询
	*/
	function query(){
		var url="/brand/list?name="+$("#queryName").val();
		$("#main").load(url);
	}
	
	/**
	* 分页 
	*/
	function goPage(pagenum){
	
		var url="/brand/list?name="+$("#queryName").val()+'&page='+pagenum;
		$("#main").load(url);
	}
	
	/**
	* 刷新 而且保持查询条件和页码
	*/
	function refresh(){
	
		var url="/brand/list?name=${queryName}"+'&page=${pageInfo.pageNum}';
		$("#main").load(url);
	}
	// 给添加规格模态框增加显示成成功后的事件  
	$('#staticBackdrop').on('shown.bs.modal', function (e) {
		  // do something...
		resetAddForm();
	})
	
	// 给添加规格模态框增加关闭以后的事件  
	$('#staticBackdrop').on('hidden.bs.modal', function (e) {
		  // do something...
		refresh();
	})
	
	// 给修改规格模态框增加关闭以后的事件  
	$('#staticBackdropUpdate').on('hidden.bs.modal', function (e) {
		  // do something...
		refresh();
	})
	
	
	/**
	  提交数据	
	*/
	function commitBrand(){
		//addbrand
		var formData = new FormData($("#addbrand")[0]);
		$.ajax({url:"/brand/add",
			 // dataType:"json",
			  data:formData,
			  // 让jQuery 不要再提交数据之前进行处理
			  processData : false,
			  // 提交的数据不能加消息头
			  contentType : false,
			  // 提交的方式 
			  type:"post",
			  // 成功后的回调函数
			  success:function(data){
				 if(data=="success"){
					 alert("数据提交成功");
					 $('#staticBackdrop').modal('hide')
				 }else{
					 alert("数据保存失败")
				 }
				 
			  }
			  })
		
	}
	
	
	
	/**
	* 删除品牌
	*/
	function delBrand(id){
		if(confirm("您确认删除id为"+id+"该条数据么？")){
			$.post("/brand/delSpec",{id:id},function(data){
				if(data="success"){
					alert("删除成功")
					refresh();
				}else{
					alert("删除失败")
				}
				
			});
		}else{
			return;
		}
	}
	
	/**
	批量删除
	*/
 	function delBatch(){
		
		if($("[name=ids]:checked").length<=0){
			alert("没有数据被选中，不能删除")
			return;
		}
		
		
		
		// 组织删除的数据
		var delIds  = new Array();
		$("[name=ids]:checked").each(function(){
			delIds.push($(this).val());
		})
		
		
		if(confirm("您确认删除id为"+delIds+"这些数据么？")){
			$.post("/brand/delBrandBatch",{ids:delIds},function(data){
				if(data="success"){
					alert("删除成功")
					refresh();
				}else{
					alert("删除失败")
				}
				
			});
		}else{
			return;
		}
	} 
	
	
	
	
	
	
	// 弹出修改的窗口
	function openUpdateBrand(id){
		
		$.post("/brand/getBrand",{id:id},function(data){
			//规格的id
			$("#updateid").val(data.id)
			$("#updatename").val(data.name)
			$("#updatefirstChar").val(data.firstChar)
			
			$("#updatedeletedFlag").val(data.deletedFlag)
			
			
		});
		
		$("#staticBackdropUpdate").modal('show');
	}
	
	// 提交修改
	function commitUpdateBrand(){
		
		//addspec
		var formData = new FormData($("#updatebrand")[0]);
		$.ajax({url:"/brand/update",
			 // dataType:"json",
			  data:formData,
			  // 让jQuery 不要再提交数据之前进行处理
			  processData : false,
			  // 提交的数据不能加消息头
			  contentType : false,
			  // 提交的方式 
			  type:"post",
			  // 成功后的回调函数
			  success:function(data){
				 if(data=="success"){
					 alert("数据提交成功");
					 $('#staticBackdropUpdate').modal('hide')
				 }else{
					 alert("数据保存失败")
				 }
				 
			  }
			  })
		
	}
	
	
	
	
</script>