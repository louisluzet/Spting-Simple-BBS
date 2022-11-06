<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js" ></script>
</head>
<style>
header {
	margin-top: 50px;
	margin-bottom: 30px;
}
.new {
	display: flex;
	justify-content: flex-end;
}
</style>
<script>
	$(function(){
		$('#new').on('click', function() {
			swal({
				text: "글을 작성하시겠습니까?",
				buttons: ["취소", "확인"],
				closeOnClickOutside: true
			}).then((YES) => {
				if(YES) {
					location.href = 'writeForm';
				}
			});
			
		});
		$('#del').on('click', function(e) {
			swal({
				text: "글을 삭제하시겠습니까?",
				buttons: ["취소", "확인"],
				closeOnClickOutside: true
			}).then((YES) => {
				if(YES) {
					location.href = 'delete?id='+e.target.value;
				}
			});
		});
	});
	
</script>
<body>
<div class="container">
  <header>
  	<h1>Simple BBS</h1>
  </header>
  <div class="table-responsive">
  <table width="500" class="table table-bordered">
	<thead>
		<tr>
			<td scope="col">번호</td>
			<td scope="col">작성자</td>
			<td scope="col">제목</td>
			<td scope="col">삭제</td>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${list}" var="dto">
		<tr>
			<td scope="row">${dto.id }</td>
			<td>${dto.writer }</td>
			<td><a href="view?id=${dto.id}">${dto.title}</a></td>
			<td>
				<button id="del" value="${dto.id}" class="btn btn-dark">X</button>
			</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
</div>
<p class="new">
	<input id="new" class="btn btn-dark" type="button" value="글작성"/>
</p>
</div>


</body>
</html>