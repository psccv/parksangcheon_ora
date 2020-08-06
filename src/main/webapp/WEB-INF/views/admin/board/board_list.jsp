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
					<strong>게시판 검색</strong>
				</h3>
				<br>
				<div class="card-tools">
					<form action="/admin/board/list">
						<div class="input-group"
							style="width: 500px; positon: relative; padding: 5px; right: 98%;">
							<select name="searchBoard" class="form-control" 
								style="text-align-last: center; direction:inherit;">
								<option value="">게시판 선택</option>
									<c:forEach items="${boardTypeMenu}" var="boardTypeMenu">
										<option value="${boardTypeMenu.bod_type}" <c:out value="${session_bod_type eq boardTypeMenu.bod_type ? 'selected' : ''}"></c:out>>${boardTypeMenu.bod_name}</option>
									</c:forEach>
								<%-- <option value="notice" <c:out value="${session_bod_type eq 'notice'?'selected':''}"></c:out>>공지사항</option>
								<option value="gallery" <c:out value="${session_bod_type eq 'gallery'?'selected':''}"></c:out>>갤러리</option> --%>
							</select>
							<select class="form-control" name="searchType"
								style="text-align-last: center; direction:inherit;">
								<option selected>전체</option>
								<option>제목</option>
								<option>내용</option>
								<option>작성자</option>
								<option>게시물 번호</option>
							</select><input type="text" name="searchKeyword"
								class="form-control float-right" placeholder="Search">
							<div class="input-group-append">
								<button type="submit" class="btn btn-default">검색</button>
							</div>
						</div>
					</form>
				</div>
			</div>
			<!-- /.card-header -->
			<div class="card-body table-responsive p-0"
				style="text-align: center;">
				<table class="table table-hover text-nowrap">
					<thead>
						<tr>
							<th>RNUM</th>
							<th>제목</th>
							<th>작성자</th>
							<th>등록일</th>
							<th>조회수</th>
							<th>게시판타입</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${boardList}" var="boardVO" varStatus="status">
							<tr>
								<td>
								<a href="/admin/board/view?bno=${boardVO.bno}&page=${pageVO.page}">${boardVO.rnum}</a></td>
								<td>
								<a href="/admin/board/view?bno=${boardVO.bno}&page=${pageVO.page}">${boardVO.title}</a></td>
								<td>${boardVO.writer}</td>
								<td>
								<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${boardVO.regdate}"/>
								</td>
								<td>${boardVO.view_count}</td>
								<td>${boardVO.bod_type}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<!-- /.card-body -->
		</div>
		<!-- /.card -->
		<div>

			<a href="/admin/board/write" class="btn btn-default"
				style="background-color: #148CFF;"> <strong>글쓰기</strong>
			</a>
			<nav aria-label="Contacts Page Navigation">
				<ul class="pagination" style="position: relative; left: 30%;">
					<c:if test="${pageVO.prev}">
						<li class="page-item"><a class="page-link"
							href="/admin/board/list?page=${pageVO.startPage-1}&searchType=${pageVO.searchType}&searchKeyword=${pageVO.searchKeyword}">이전</a></li>
					</c:if>
					<c:forEach begin="${pageVO.startPage}" end="${pageVO.endPage}"
						var="idx">
						<li
							class='page-item <c:out value="${idx==pageVO.page?'active':''}"/>'>
							<a href="/admin/board/list?page=${idx}&searchType=${pageVO.searchType}&searchKeyword=${pageVO.searchKeyword}"
							class="page-link">${idx} </a>
						</li>
					</c:forEach>
					<c:if test="${pageVO.next}">
						<li class="page-item"><a class="page-link"
							href="/admin/board/list?page=${pageVO.endPage+1}&searchType=${pageVO.searchType}&searchKeyword=${pageVO.searchKeyword}">다음</a></li>
					</c:if>
				</ul>
			</nav>
			<br>
		</div>
	</div>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->
<%@ include file="../include/footer.jsp"%>