<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../include/header.jsp"%>

<!-- container -->
<div id="container">
	<%@ include file="../include/container_header.jsp"%>
	<!-- bodytext_area -->
	<div class="bodytext_area box_inner">
		<!-- appForm -->
		<form action="/board/write" method="POST" enctype="multipart/form-data" class="appForm" >
			<fieldset>
				<legend>입력 양식</legend>
				<p class="info_pilsoo pilsoo_item">필수입력</p>
				<div class="form-group">
					<label>게시판 선택</label>
					<div class="app_content">
						<select name="bod_type" class="select_common" 
						style="text-align-last: center; direction:inherit;" required="required">
								<option value="${session_bod_type}">${session_bod_type}</option>
								<option value="notice" <c:out value="${session_bod_type eq 'notice'?'selected':''}"></c:out>>공지사항</option>
								<option value="gallery" <c:out value="${session_bod_type eq 'gallery'?'selected':''}"></c:out>>갤러리</option>
						</select>
					</div>
				<ul class="app_list">
					<li class="clear">
						<label for="title_lbl" class="tit_lbl pilsoo_item">제목</label>
						<div class="app_content"><input name="title" type="text" class="w100p" id="title" name="title" placeholder="제목을 입력해주세요" required="required"></div>
					</li>
					<li class="clear">
						<label for="content_lbl" class="tit_lbl pilsoo_item">내용</label>
						<div class="app_content"><textarea id="content" name="content" class="w100p" placeholder="내용을 남겨주세요." required="required"></textarea></div>
					</li>
					<li class="clear">
						<label for="writer_lbl" class="tit_lbl pilsoo_item">작성자명</label>
						<div class="app_content"><input name="writer" type="text" class="w100p" id="writer" name="writer" placeholder="이름을 입력해주세요" required="required"></div>
					</li>
					<li class="clear">
						<label for="file_lbl" class="tit_lbl">첨부파일</label>
						<div class="app_content"><input name="file" id="file_lbl" value="파일선택" type="file"></div>
					</li>
				</ul>
				<p class="btn_line">
					<button type="submit" class="btn_bbs">등록</button>
					<button onclick="location.href='/board/list'; return false;" class="btn_bbs">목록</button>
				</p>
			</fieldset>
		</form>
		<!-- //appForm -->
		
	</div>
	<!-- //bodytext_area -->

</div>
<!-- //container -->

<%@ include file="../include/footer.jsp"%>