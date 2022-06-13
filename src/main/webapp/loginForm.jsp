<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>회원관리 시스템 로그인 페이지</title>
<style>
	table{
		margin : auto;
		width : 400px;
		border : 1px solid gray;
		text-align: center;
	}
	.td_title{
		font-weight: bold;
		font-size: x-large;
	}
	a{
	text-decoration:none;
	}
</style>
</head>
<body>
<form name="loginform" action="loginProcess.jsp" method="get" onsubmit="return loginCheck()">
<!-- 폼(form) 영역에 있는 데이터가 전송(submit) 되는 요청 URL을 "loginProcess.jsp" 페이지로 지정한 부분이다. -->
<table>
	<tr>
		<td colspan="2" class = "td_title">
			로그인 페이지
		</td>
	</tr>
	<tr>
		<td><label for = "id">아이디 : </label></td>
		
		<td><input type="text" name="id" id = "id"/></td><!-- 로그인에 사용될 아이디를 입력하는 입력 양식 -->
	</tr>
	<tr>
		<td><label for = "pass">비밀번호 : </label></td>
		<td><input type="password" name="password" id = "pass"/></td><!-- 로그인에 사용될 비밀번호를 입력하는 입력 양식 -->
	</tr>
	<tr>
		<td colspan="2">
			<a href="javascript:loginform.submit()">로그인</a>&nbsp;&nbsp;
			<!-- 로그인 링크를 클릭하면 javascript를 사용하여 loginform 객체(form객체)의 sumbit() 메소드를 호출하여 loginProcess.jsp 페이지로 요청하는 부분 -->
			<a href="joinForm.jsp">회원가입</a>
			<!-- 회원 가입 텍스트를 클릭하면 "loginForm.jsp"로 요청을 전송하는 링크를 지정한 부분이다. -->
		</td>
	</tr>
</table>
</form>
<script src="js/script.js"></script>
</body>
</html>
