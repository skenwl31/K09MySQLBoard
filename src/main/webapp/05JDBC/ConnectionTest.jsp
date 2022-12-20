<%@ page import="common.JDBConnect" %>
<%@ page import="common.DBConnPool" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JDBC</title>
</head>
<body>
	<h2>JDBC 테스트 1</h2>
	<%
	JDBConnect jdbc1 = new JDBConnect();
	jdbc1.close();
	%>
	
	<h2>JDBC 테스트 2</h2>
	<%
	//application내장객체를 통해 컨텍스트 초기화 파라미터를 얻어온다.
	String driver = application.getInitParameter("MysqlDriver");
	String url = application.getInitParameter("MysqlURL");
	String id = application.getInitParameter("MysqlId");
	String pwd = application.getInitParameter("MysqlPwd");
	//위의 값을 통해 DB연결을 위한 생성자를 호출한다.
	JDBConnect jdbc2 = new JDBConnect(driver, url, id, pwd);
	jdbc2.close();
	%>
	
	<h2>JDBC 테스트 3</h2>
	<%
	//JSP단에서 application내장객체만 인수로 전달한다.
	JDBConnect jdbc3 = new JDBConnect(application);
	jdbc3.close();
	%>
	
	<h2>커넥션 풀 테스트</h2>
	<%
	DBConnPool pool = new DBConnPool();
	pool.close();
	%>
</body>
</html>