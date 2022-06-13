<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.lang.reflect.Executable"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*" %>

<%   
   request.setCharacterEncoding("UTF-8");
   String id = request.getParameter("id");   
   String password = request.getParameter("password");   

   Connection conn=null;
   
   Context init = new InitialContext();
   DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/mariaDB");
   conn = ds.getConnection();
   
   PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM member WHERE id=?");
   pstmt.setString(1,id);
   ResultSet rs=pstmt.executeQuery();
  
   while(rs.next()){
      String id1 = rs.getString(1);      
      String password1 = rs.getString(2);
      String email = rs.getString(3);
      if(id1.equals(id)&&password1.equals(password)){
         session.setAttribute("id", id);
         response.sendRedirect("main.jsp");
      }
   }   
   conn.close();
   pstmt.close();
	rs.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
alert("아이디 또는 비밀번호가 틀립니다.");
location.href="loginForm.jsp";
</script>
</body>
</html>