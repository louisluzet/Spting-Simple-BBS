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
.btnSet {
	display: flex;
	justify-content: flex-end;
}
.btnSet input {
	width: 100px;
}

</style>
<script>
$(function(){
	$('#goToList').on('click', function() {
		swal({
			text: "목록으로 가시겠습니까?",
			buttons: ["취소", "확인"],
			closeOnClickOutside: true
		}).then((YES) => {
			if(YES) {
				location.href = 'list';
			}
		});
	});
	$('#submit').on('click', function() {
		swal({
			text: "글을 등록하시겠습니까?",
			buttons: ["취소", "확인"],
			closeOnClickOutside: true
		}).then((YES) => {
			if(YES) {
				$('#add').click();
			}
		});
	})
});

</script>
<body>
<div class="container">
  <header>
  	<h1>Write a new post!</h1>
  </header>
<table width="500" class="table table-bordered">
	<form id="form-data" action="write" method="post">
		<tr>
			<td scope="col">작성자</td>
			<td><input class="form-control" type="text" name="writer" size="100"/></td>
		</tr>
		<tr>
			<td scope="col">제목</td>
			<td><input class="form-control" type="text" name="title" size="100"/></td>
		</tr>
		<tr>
			<td scope="col">내용</td>
			<td><textarea class="form-control" type="text" name="content"></textarea></td>
		</tr>
		<tr>
			<td colspan="2">
				<div class="btnSet">
				<input id="add" type="submit" value="입력" style="display:none"/>
				<input id="submit" class="btn btn-dark" value="입력"/>&nbsp;&nbsp; 
				<input class="btn btn-light" id="goToList" type="button" value="목록보기"/>
				</div>
			</td>
		</tr>
	</form>
</table>
</div>

</body>
</html>