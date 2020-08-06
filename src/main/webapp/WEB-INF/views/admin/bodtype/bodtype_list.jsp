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
			<div class="card-body table-responsive p-0"
				style="text-align: center;">
				<table class="table table-hover text-nowrap">
					<thead>
						<tr>
							<th>bod_sun</th>
							<th>bod_type</th>
							<th>bod_name</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${bodTypeList}" var="boardTypeVO"
							varStatus="status">
							<tr>
								<td>${boardTypeVO.bod_sun}</td>
								<td><a
									href="/admin/bodtype/update?bod_type=${boardTypeVO.bod_type}">${boardTypeVO.bod_type}</a></td>
								<td>${boardTypeVO.bod_name}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<!-- /.card-body -->
		</div>
		<!-- /.card -->
		<div>
			<a href="/admin/bodtype/write" class="btn btn-default"
				style="background-color: #148CFF;"> <strong>게시판 생성</strong>
			</a> <br>
		</div>
	</div>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->
<%@ include file="../include/footer.jsp"%>