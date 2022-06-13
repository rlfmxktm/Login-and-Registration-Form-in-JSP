<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");	
	Context init = new InitialContext();
	DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/mariaDB");
	Connection conn = ds.getConnection();
	String sql = "SELECT * FROM member WHERE id=?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	ResultSet rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중복확인 클릭후 윈도우창</title>
</head>
<body>
		<%if(rs.next()){%>
			<h1><%=id %>는 중복된 아이디입니다:(</h1>
			<!--  resultSet(rs) 내부에는 데이터를 읽을 수 있는 커서가 있는데
		이게 처음에는 데이터를 읽을 수 없는 가장 앞쪽에 있어서 
		한번은 rs.next()를 호출해주어야 그 다음부터 데이터를 읽을 수 있게 된다. -->
		<%}else{%>
			<h1><%=id %>는 사용이 가능한 아이디 입니다:)</h1>
			<button onclick="use();">사용하기</button>
		<%}%>
		
<script>
function use(){
	opener.document.querySelector('#con').value = "1"; // 밸류가 0이면
	self.close(); // 창 닫기
}
</script>
</body>
</html>