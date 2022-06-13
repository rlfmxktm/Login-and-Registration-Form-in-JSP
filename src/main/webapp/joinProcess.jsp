<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.lang.reflect.Executable"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*" %>


<%
request.setCharacterEncoding("UTF-8");
/*회원 가입 폼(joinForm.jsp)에서 파라미터로 전송된 데이터를 얻어올 때 한글 데이터가 깨지지 않도록 처리하는 부분이다.*/
String id = request.getParameter("id"); /* 회원 가입 폼에서 파라미터로 전송된 데이터들을 얻어오는 부분 9~14*/
String password = request.getParameter("passwd");
String email = request.getParameter("email");
String phone = request.getParameter("phone");
String birth = request.getParameter("birth");

//날짜 생성
Timestamp regdate = new Timestamp(System.currentTimeMillis());





Connection conn = null;

Context init = new InitialContext();
DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/mariaDB");
conn = ds.getConnection();

PreparedStatement pstmt = conn.prepareStatement("INSERT INTO member(id,password,email,phone,birth,regdate,level) VALUES(?,?,?,?,?,?,?)");
/* 회원 가입 폼에서 파라미터로 전송된 데이터들을 member 테이블의 새로운 레코드로 삽입하는 부분. 21~ 30 */
pstmt.setString(1, id);
pstmt.setString(2, password);
pstmt.setString(3, email);
pstmt.setString(4, phone);
pstmt.setString(5, birth);
pstmt.setTimestamp(6, regdate);
pstmt.setInt(7, 1);
pstmt.executeUpdate();
pstmt.close();
conn.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<ul>
        <li>아이디 : <%=id %></li>
        <li>비밀번호 : <%=password %></li>
        <li>이메일 : <%=email %></li>
        <li>휴대번호 : <%=phone %></li>
        <li>생년월일 : <%=birth %></li>
        <li>등록일자 : <%=regdate %></li>
    </ul>
<a href="loginForm.jsp">로그인 페이지로</a>

</body>
</html>