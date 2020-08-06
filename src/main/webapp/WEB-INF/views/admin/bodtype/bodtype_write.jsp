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
				
				<form role="form" action="/admin/bodtype/write" method="POST">
					<!-- text input -->
					<div class="form-group">
						<label>보드타입</label>
						<input id="bod_type" name="bod_type" type="text" value="${bodTypeVO.bod_type}" class="form-control"
							placeholder="타입을 입력해 주세요." required="required">
					</div>
					<span id="msg_validation"></span>
					<div class="form-group">
						<label>보드네임</label> 
						<input name="bod_name" type="text" value="${bodTypeVO.bod_name}" class="form-control"
							placeholder="게시판 이름을 입력해 주세요.">
					</div>
					<div class="form-group">
						<label>출력순서</label> 
						<input name="bod_sun" type="text" value="0" class="form-control"
							placeholder="출력순서는 숫자로 입력해 주세요.">
					</div>
					
					<div class="form-group">
						<button id="submit_check" disabled="disabled" type="submit" class="btn btn-default"
							style="position:relative;background-color:#FFC314;">
							<strong>등록</strong>
						</button>
						<a href="/admin/bodtype/list" class="btn btn-default"
							style="position:relative;background-color:#3CA0FF;">
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
$(document).ready(function(){
	//.focus()초점<-> .blur()흐리게
	$("#bod_type").blur(function(){
		var bod_type = $("#bod_type").val();
		//Ajax => asys비동기 Javascript And Xml(Json제이슨-key:value)
		$.ajax({
			type:'get',
			url:'/admin/bodtype/bodtype_check?bod_type=' + bod_type,
			success:function(result){
				//alert(result);
				if(result == '1'){
					//alert('기존 게시판이 존재합니다.');
					$("#msg_validation").text("기존 게시판이 존재합니다.");
					$("#msg_validation").css({"color":"red", "font-size":"14px"});
					$("#submit_check").attr("disabled", true);
				}else{
					$("#msg_validation").text("사용 가능한 게시판 입니다.");
					$("#submit_check").attr("disabled", false);
				}
			},
			error:function(){
				alert("RestAPI 서버에서 에러가 발생 되었습니다.");
			}
		});
	});
});
</script>

<%@ include file="../include/footer.jsp"%>