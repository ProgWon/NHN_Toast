<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.Connection" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
        request.setCharacterEncoding("euc-kr");
	String title=request.getParameter("title");
	String genre=request.getParameter("genre");
        String name=request.getParameter("name");
        String age=request.getParameter("age");

        //db에 저장하기
        String DB_URL = "jdbc:mysql://192.168.0.59:13303/toast";
        String DB_USER = "root";
        String DB_PASSWORD = "aoxkf101D!";
	Connection con = null;
        PreparedStatement pstmt = null;
        String sql = "insert into directors values(?,?,?,?)";
        int n=0;

        try{

                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
                pstmt = con.prepareStatement(sql);
                pstmt.setString(1, title);
                pstmt.setString(2, genre);
                pstmt.setString(3, name);
                pstmt.setString(4, age);

                

                n = pstmt.executeUpdate();
        }catch(SQLException se){
                System.out.println(se.getMessage());
        }finally{
                try{
                        if(pstmt!=null) pstmt.close();
                        if(con!=null) con.close();
                }catch(SQLException se){
                        System.out.println(se.getMessage());
                }
        }
%>
<script type="text/javascript">
        if(<%=n%> > 0){
                alert("Add Success");
                location.href="index.html";//
        }else{
                alert("Add Fail");
                history.go(-1);//이전페이지로 가기
        }
</script>
</body>
</html>
~
~
~
~
~
~
~

