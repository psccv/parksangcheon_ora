<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../include/header.jsp"%>

<!-- container -->
<div id="container">
	<!-- location_area -->
	<div class="location_area member">
		<div class="box_inner">
			<h2 class="tit_page">
				스프링 <span class="in">in</span> 자바
			</h2>
			<p class="location">
				회원 <span class="path">/</span> 회원등록
			</p>
			<ul class="page_menu clear">
				<li><a href="javascript:;" class="on">회원등록</a></li>
			</ul>
		</div>
	</div>
	<!-- //location_area -->
	<!-- bodytext_area -->
	<div class="bodytext_area box_inner">
		<!-- appForm -->
		<form action="/mypage/insert" class="regForm" method="POST">
			<fieldset>
				<legend>내정보 입력 양식</legend>
				<ul class="reg_list">
					<li class="clear"><span class="tit_lbl user_id">아이디</span>
						<div class="reg_content" style="padding-top: 8px;">
							<input required="required" value="${memberVO.user_id}"
								type="text" class="w100p" id="user_id" name="user_id"
								placeholder="아이디를 입력해주세요"> <span id="validation_idcheck"></span>
						</div></li>
					<li class="clear"><label class="tit_lbl">패스워드</label>
						<div class="reg_content" style="padding-top: 8px;">
							<input required="required" value="" type="password" class="w100p"
								name="user_pw" placeholder="암호를 입력해주세요" />
						</div></li>
					<li class="clear"><label class="tit_lbl">이름</label>
						<div class="reg_content" style="padding-top: 8px;">
							<input required="required" value="${memberVO.user_name}"
								type="text" class="w100p" name="user_name"
								placeholder="이름를 입력해주세요" />
						</div></li>
					<li class="clear"><label class="tit_lbl">이메일</label>
						<div class="reg_content" style="padding-top: 8px;">
							<input value="${memberVO.email}" type="text" class="w100p"
								name="email" placeholder="이메일를 입력해주세요" />
						</div></li>
					<input value="0" type="hidden" class="w100p" name="point">
					<input value="1" type="hidden" class="w100p" name="enabled">
					<input value="ROLE_USER" type="hidden" class="w100p" name="levels">
				</ul>
				<p class="btn_line">
					<button id="btn_submit" disabled="disabled" class="btn_baseColor"
						style="cursor: cursor; opacity: 0.5;">회원가입</button>
				</p>
			</fieldset>
		</form>
		<!-- //appForm -->
	</div>
	<!-- //bodytext_area -->
</div>
<!-- //container -->
<script>
$(document).ready(function(){
	$("#user_id").blur(function(){
		var user_id = $(this).val();
		$.ajax({
			type:'get',
			url='/admin/member/idcheck?user_id=' + user_id,
			success:function(result){
				if(result=='1'){//중복아이디가 존재할 때
					$("#btn_submit").attr("disabled", true);
					$("#btn_submit").css({"cursor":"cursor","opacity":"0.5"});
					$("#validation_idcheck").text("중복 아이디가 존재 합니다.");
					$("#validation_idcheck").css({"color":"red","font-size":"14px"});
				}else{//중복아이디가 존재하지 않을 때
					$("#btn_submit").attr("disabled", false);
					$("#btn_submit").css({"cursor":"pointer","opacity":"1"});
					$("#validation_idcheck").text("사용할 수 있는 아이디 입니다.");
					$("#validation_idcheck").css({"color":"red","font-size":"14px"});
				}
			},
			error:function(){
				alert("아이디 체크 RestAPI서버가 작동하지 않습니다.");
			}
		});
	});
});
</script>
<%@ include file="../include/footer.jsp"%>
