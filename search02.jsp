<%@page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Movie Name</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String title = request.getParameter("name");
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs;
try {

Class.forName("com.mysql.jdbc.Driver");

conn = DriverManager.getConnection(
"jdbc:mysql://192.168.0.59:13303/toast?useUnicode=true&characterEncoding=utf-8", "root", "aoxkf101D!");

if (conn == null)
throw new Exception("데이터베이스 연결 실패");

String sql = "SELECT * FROM movies WHERE title = ?;";
pstmt = conn.prepareStatement(sql);
pstmt.setString(1,title);
rs = pstmt.executeQuery();


if (!rs.next()) {
out.println("해당하는 정보가 없습니다");
}else{
rs.previous();
}

while (rs.next()) {
String title1 = rs.getString("title");
String genre = rs.getString("genre");


out.println("<br> title : " + title1 + " || genre : " + genre);

sql = "SELECT * FROM directors WHERE id = ?;";
pstmt = conn.prepareStatement(sql);
pstmt.setInt(1,rs.getInt("id"));

ResultSet rs1 = pstmt.executeQuery();

while(rs1.next()) {
String name = rs1.getString("name");
int age = rs1.getInt("age");

out.println("<br> name : " + name + " || age : " + age);
 }
}
} finally {
}
%>
</body>
</html>
