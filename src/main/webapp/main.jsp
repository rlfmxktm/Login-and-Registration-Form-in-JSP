<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
	
	String id = (String)session.getAttribute("id");	

	if (session.getAttribute("id")!=null){
		/* 세션에 아이디가 등록되어있으면(로그인된 상태이면) 세션에 저장된 아이디 값을 변수에 저장한다. */
		id=(String)session.getAttribute("id");
	}else{ /* 세션에 아이디가 등록되어있지 않은 경우(로그인되지 않은 상태이면) 로그인 폼으로 이동한다. 8~12*/
		out.println("<script>");
		out.println("location.href='loginForm.jsp'");
		out.println("</script>");
	}
	
	Context init = new InitialContext();
	DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/mariaDB");
	Connection conn = ds.getConnection();
	String sql = "SELECT * FROM member WHERE id=?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	ResultSet rs = pstmt.executeQuery();
	
%>
<html>
<head>
<title>회원관리 시스템 메인 페이지</title>
</head>
<body>
<h3><%=id %> 로 로그인하셨습니다.</h3>
<a href="loginForm.jsp">로그아웃</a><br>
<% while(rs.next()){
		if(rs.getInt(7)==5){%>
			<a href="memList.jsp">관리자모드 접속(회원 목록 보기)</a>
			<%}
}
conn.close();
pstmt.close();
rs.close();
%>
</body>
</html>
