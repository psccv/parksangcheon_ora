<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
		<div class="card card-warning">
			<div class="card-header">
				<h3 class="card-title">
					<strong>회원등록</strong>
				</h3>
			</div>
			<!-- /.card-header -->
			<div class="card-body">
				<form role="form" action="/admin/member/write" method="POST">
					<dr>
					<div class="form-group">
						<label>아이디</label> <input required="required" id="user_id" name="user_id" type="text" class="form-control"
							placeholder="아이디">
					</div>
					<span id="msg_validation"></span>
					<dr>
					<div class="form-group">
						<label>패스워드</label> <input required="required" name="user_pw" type="text" class="form-control"
							placeholder="패스워드">
					</div>
					<dr>
					<div class="form-group">
						<label>이름</label> <input required="required" name="user_name" type="text" class="form-control"
							placeholder="이름">
					</div>
					<dr>
					<div class="form-group">
						<label>이메일</label> <input required="required" name="email" type="text" class="form-control"
							placeholder="이메일">
					</div>
					<dr>
					<div class="form-group">
						<label>포인트</label> <input name="point" type="text" class="form-control"
							value="0">
						<dr>
						<div class="form-group">
						<label>상태</label> 
							<select name="enabled" class="form-control" style="width:90px;">
								<option value="1" selected="">True</option>
								<option value="0">False</option>
							</select>
						</div>
						<dr>
						<div class="form-group">
							<label>등급</label> <select name="levels" class="form-control"
								style="width:140px;">
								<option value="ROLE_USER">ROLE_USER</option>
								<option value="ROLE_ADMIN">ROLE_ADMIN</option>
							</select>
						</div>
						<dr>
						<button disabled="disabled" id="btn_submit" type="submit" class="btn btn-default" 
							style="background-color:yellow;">
							<strong>등록</strong>
						</button>
						<a href="/admin/member/list?psge=${pageVO.page}" class="btn btn-default"
							style="background-color:skyblue;">
							<strong>돌아가기</strong>
						</a>
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
	$("#user_id").blur(function(){
		var user_id = $("#user_id").val();
		$.ajax({
			type:'get',
			url:'/admin/member/idcheck?user_id=' + user_id,
			success:function(result){
				if(result=='1'){ //중복 아이디가 존재할 때
					$("#msg_validation").text("기존 사용자 아이디가 존개 합니다. 다른 아이디를 입력해 주세요!");
					$("#msg_validation").css({"color":"red", "font-size":"14px"});
					$("#btn_submit").attr("disabled", true);
				}else{ // 중복 아이디가 존재하지 않을 때
					$("#msg_validation").text("사용가능한 아이디 입니다.");
					$("#msg_validation").css({"color":"red", "font-size":"14px"});
					$("#btn_submit").attr("disabled", false);
				}
			},
			error:function(){
				alert("중복 아이디 체크 RestAPI 서버가 정상 작동하지 않습니다.")
			}
		});
	});
});
</script>
<%@ include file="../include/footer.jsp"%>


