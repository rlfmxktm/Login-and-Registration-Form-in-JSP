<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
	Context init = new InitialContext();
	DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/mariaDB");
	Connection conn = ds.getConnection();
	String sql = "SELECT * FROM member";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	Calendar cal = Calendar.getInstance();
	String year = Integer.toString(cal.get(Calendar.YEAR)); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<h1>회원목록</h1>
		<table border="1">			
				<thead>
					<tr>
						<th>아이디</th>
						<th>비밀번호</th>
						<th>이메일</th>
						<th>휴대폰번호</th>
						<th>생년월일</th>
						<th>등록일자</th>
						<th>나이</th>
					</tr>
				</thead>
				<tbody>
				<%
					while(rs.next()){
						String id = rs.getString(1);
						String password = rs.getString(2);
						String email = rs.getString(3);
						String tel = rs.getString(4);
						String birth = rs.getString(5);
						String regdate = rs.getString(6);						
				%>
					<tr>
						<th><%=id %></th>
						<th><%=password %></th>
						<th><%=email %></th>
						<th><%=tel %></th>
						<th><%=birth %></th>
						<th><%=regdate %></th>
						<th><%=Integer.parseInt(year)-Integer.parseInt(birth.substring(0, 4)) %></th>
					</tr>
				<%}%>
				</tbody>
		</table>
	</div>
	<a href="loginForm.jsp">로그아웃</a>
</body>
</html>
<%
	conn.close();
	pstmt.close();
	rs.close();
%>