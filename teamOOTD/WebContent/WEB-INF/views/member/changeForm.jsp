<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>

  <!-- 부트스트랩 라이브러리와 마우스가 올라 갔을 때의 CSS는 default_decorator.jsp 에서 전체적으로 잡음. -->
<script type="text/javascript">
$(function(){
	$("#cancelBtn").click(function(){
		history.back();
	});
});
</script>
<style>
html{background-color:#f5f6f7;}#wrap{background-color:#f5f6f7;}
#container{width:500px;height:100%;margin:0 auto;text-align:left;padding:20px 20px 0 20px;padding-top:200px;}
input[type=password]{
  width: 100%;
  padding: 0px 20px;
  height: 51px;
  margin: 4px 0;
  border: 1px solid #ccc;
  border-radius: 4px;
}
.updateBtn {
  width: 49.5%;
  background-color: #03C75A;
  color: #ffffff;
  padding: 0px 20px;
  height: 51px;
  margin: 4px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  font-size:18px;
  font-weight:700;
}
.cancelBtn {
  width: 49.5%;
  background-color: #8E8E8E;
  color: #ffffff;
  padding: 0px 20px;
  height: 51px;
  margin: 4px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  font-size:18px;
  font-weight:700;
}
</style>
</head>
<body>
<div id="wrap">
	<div id="container">
		<form action="changePw.do" method="post">
			<div class="form-group">
				<label for="pw">현재 비밀번호</label>
				<input name="pw" id="pw" type="password" class="form-control" />
			</div>
			<div class="form-group">
				<label for="newPw">새로운 비밀번호</label>
				<input name="newPw" id="newPw" type="password" class="form-control" />
			</div>
			<div class="form-group">
				<label for="newPw2">새로운 비밀번호 확인</label>
				<input id="newPw2" type="password" class="form-control" />
			</div>
			<button type="submit" class="updateBtn">변경</button>
			<button type="button" id="cancelBtn" class="cancelBtn">취소</button>
		</form>
	</div>
</div>
</body>
</html>