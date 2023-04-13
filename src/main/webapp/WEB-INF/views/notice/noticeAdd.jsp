<!--작성자 : 권두현  -->
<!--작성일시 : 2023. 4. 5. 13:55  -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%> 
 
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 등록</title>
<%@include file="../include/header.jsp"%>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<body>
<%@include file="../include/navbar.jsp"%>

	<div class="col-lg-8 mx-auto p-4 py-md-5">
		<form:form modelAttribute="notice" action="./add" method="post">
			<fieldset>
			<main>
				<div class="pb-3 mb-5">
					<div class="postRegister_postContentWrapper__3BXZ6">
						<span class="postRegister_sequence__nC1Px">1</span>
						<h2 class="postRegister_text__17jg3">공지사항</h2>
					</div>
					<div>

					<div class="mb-3">
						<label for="ntitle" class="form-label">제목</label> 
						<form:input type="text" class="form-control" path="ntitle" />
							<form:errors path="ntitle"/>
					</div>
					<div class="mb-3">
						<label for="ncontent" class="form-label">내용</label>
						<form:textarea class="form-control" id="summernote" path="ncontent"	rows="5" />
						<form:errors path="ncontent"/>
					</div>
					<form:input type="hidden" path="nwriter" value="${user.username}" />
				</div>
				<div style="text-align: right;">
							<!-- 토큰 전송 -->
							<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
						<button type="button"
							class="btn btn-warning btn-lg px-4 text text-white"
							onclick="history.back()">뒤로가기</button>
						<button class="btn btn-primary btn-lg px-4 text text-white addBtn"
							type="submit">글 등록</button>
					</div>
				</div>
			</main>
			</fieldset>
		</form:form>
	</div>

	<%@include file="../include/footer.jsp"%>
<script>
      $('#summernote').summernote({
        tabsize: 2,
        height: 400,
        toolbar: [
          ['style', ['style']],
          ['font', ['bold', 'underline', 'clear']],
          ['color', ['color']],
          ['para', ['ul', 'ol', 'paragraph']],
          ['table', ['table']],
          ['insert', ['link', 'picture', 'video']],
          ['view', ['fullscreen', 'codeview', 'help']]
        ]
      });
</script>
    
</body>
</html>