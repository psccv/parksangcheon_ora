<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../include/header.jsp"%>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<div class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1 class="m-0 text-dark">DashBoard Management</h1>
				</div>
				<!-- /.col -->
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="#">Home</a></li>
						<li class="breadcrumb-item active">Starter Page</li>
					</ol>
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container-fluid -->
	</div>
	<!-- /.content-header -->

	<!-- Main content -->
	<div class="content">

		<div class="card">
			<div class="card-header">
				<h3 class="card-title">
					<strong>게시판 생성 리스트</strong>
				</h3>
				<br>
			</div>
			<!-- /.card-header -->
			<div class="card-body table-responsive p-0">
				<form id="form_bodtype" role="form" action="/admin/bodtype/update" method="POST">
					<!-- text input -->
					<div class="form-group">
						<label>보드타입</label> 
						${bodTypeVO.bod_type}
						<input name="bod_type" type="hidden" value="${bodTypeVO.bod_type}" class="form-control"
							placeholder="타입...">
					</div>
					<div class="form-group">
						<label>보드네임</label> 
						<input name="bod_name" type="text" value="${bodTypeVO.bod_name}" class="form-control"
							placeholder="게시판 이름을 입력해 주세요.">
					</div>
					<div class="form-group">
						<label>출력순서</label> 
						<input name="bod_sun" type="text" value="${bodTypeVO.bod_sun}" class="form-control"
							placeholder="출력순서는 숫자로 입력해 주세요.">
					</div>
					
					<div class="form-group">
						<button type="submit" class="btn bg-navy">
							<strong>등록</strong>
						</button>
						<a id="btn_delete" href="#" class="btn bg-maroon">
							<strong>삭제</strong>
						</a>
						<a href="/admin/bodtype/list" class="btn bg-orange">
							<strong>돌아가기</strong>
						</a>
					</div>
				</form>
			
				
				
				
			</div>
			<!-- /.card-body -->
		</div>
		<!-- /.card -->
	</div>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->

<script>
$(document).ready(function(){//call back함수
	$("#btn_delete").click(function(){
	 	if(confirm("삭제 하시겠습니까?")){
	 		$("#form_bodtype").attr("action","/admin/bodtype/delete");
			$("#form_bodtype").submit();
	 	}
	});
});

</script>

<%@ include file="../include/footer.jsp"%>