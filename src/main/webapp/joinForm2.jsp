<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
String id = request.getParameter("id");
String passwd = request.getParameter("password");
%>
<html>
<head>
<title>회원관리 시스템 회원가입 페이지</title>
<style>
* {
	padding: 0;
	maring: 0;
}

form {
	width: 400px;
	padding: 30px;
	margin: 0 auto;
}

fieldset {
	width: 400px;
	padding: 18px;
}

label {
	width: 120px;
	clear: both;
	float: left;
}

fieldset input {
	width: 150px;
	float: left;
	margin-bottom: 5px;
}

fieldset input[type=button] {
	width: 60px;
	margin-left: 5px;
}

.but > button{
	width: 60px;
	margin-left: 10px;
	margin-top: 5px;
}
</style>
</head>
<body>
	<form name="joinform" action="joinProcess.jsp" method="post" onsubmit="return check1()">
		<fieldset>
			<legend>회원 가입 : 상세</legend>

			<label for="email">이메일 : </label> <input type="text" name="email" id="email" placeholder='email@email.com' /><br>
			<label for="phone">휴대번호 : </label> <input type="text" name="phone" id="phone" placeholder='010-1234-5678' /><br> 
			<label for="birth">생년월일 : </label> <input type="date" name="birth" id="birth" placeholder='yyyy. mm. dd.' /><br>

		</fieldset>
 		<div class="but">
		<button type="button" onclick="location.href='joinForm.jsp'">이전</button>
		<button type="submit">다음</button>
		<input type="hidden" value=<%=id%> name="id"> 
		<input type="hidden" value=<%=passwd%> name="passwd">
		</div>
	</form>
<script>
let email = document.querySelector('#email');
let phone = document.querySelector('#phone');
let birth = document.querySelector('#birth');

function check1() {
	
	if(email.value == ""){
		alert("이메일을 입력해 주세요.");
		return false;
	}
	
	if(phone.value ==""){
		alert("휴대번호를 입력해 주세요.");
		return false;
	}
	
	if(birth.value ==""){
		alert("생년월일을 입력해 주세요.");
		return false;
	}
}
	
</script>
</body>
</html>