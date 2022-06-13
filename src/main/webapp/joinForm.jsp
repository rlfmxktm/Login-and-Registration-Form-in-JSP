<%@ page language="java" contentType="text/html; charset=UTF-8"%>
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
	margin-left: 10px;
}

.but > button{
	width: 60px;
	margin-left: 10px;
	margin-top: 5px;
}
</style>
</head>
<body>
	<form action="joinForm2.jsp" method="post" onsubmit="return idCheck()">
	<!-- action속성은 폼 데이터(form data)를 서버로 보낼 때 해당 데이터가 도착할 URL을 명시.-->
	<!-- method 속성은 폼 데이터(form data)가 서버로 제출될 때 사용되는 HTTP 메소드를 명시. -->
	<!-- POST 방식은 폼 데이터를 별도로 첨부하여 서버로 전달하는 방식. -->
		<fieldset>
			<legend>회원 가입 : 기본</legend>
			<label for="id">아이디 : </label> 
			<input type="text" name="id" id="id"/>
			<input type="button" onclick="Check();" value="중복확인"><br>
			<input type="hidden" value="0" id="con">
			<label for="pass">비밀번호 : </label> 
			<input type="password"name="password" id="pass1" /><br> 
			<label for="pass">비밀번호 확인 : </label> 
			<input type="password" id="pass2" /> <br>
		</fieldset>
		<div class="but">
			<button type="button" onclick="location.href='loginForm.jsp'">이전</button>
			<button type="submit" >다음</button>
		</div>
	</form>
	<script>

		function Check() {
		//아이디 중복확인
		window.open("idCheckForm.jsp", "idwin", "width=700 height=200")
		//중복체크 버튼을 눌렀을때 윈도우창 생성.
		}
		
		let id = document.querySelector('#id');
		let pass1 = document.querySelector('#pass1');
		let pass2 = document.querySelector('#pass2');
		let join = document.querySelector('#con');
		
		function idCheck() {
			
			if(id.value == ""){
				alert("아이디를 입력해주세요..");			
				return false;
			}
			
			if(pass1.value != pass2.value){
				alert("비밀번호가 다릅니다.");
				return false;
			}
			
			if(pass1.value ==""){ // 비밀번호칸에 빈공간이 들어가면 하단 alert창 생성
				alert("비밀번호를 입력해주세요.");
				return false;
			}
			
			if(pass2.value ==""){// 비밀번호 확인 칸에 빈공간이 들어가면 하단 alert창 생성
				alert("비밀번호를 입력해주세요.");
				return false;
			}
			
			if(join.value =="0"){// 아이디, 비밀번호, 비밀번호 확인에 빈공간이 들어가면 다음화면으로 넘어가지않고 하단 alert창 생성
				alert("중복체크를 해주세요.");
				return false;
			}
		}

	</script>
</body>
</html>