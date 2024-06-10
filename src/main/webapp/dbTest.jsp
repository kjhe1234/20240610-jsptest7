<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JDBC 연결 테스트</title>
</head>
<body>
	<%
		// my sql하고 연결에 필요한 4개의 변수 선언
		String driverName = "com.mysql.jdbc.Driver"; //my sql 드라이버 이름
		String url = "jdbc:mysql://localhost:3306/school_db"; //DB가 설치된 주소
		String username = "root"; // 관리자 계정 이름
		String password = "12345"; // 관리자 계정 비밀번호
		
		Connection conn = null;// DB와의 커넥션 생성
		
		try {
			Class.forName(driverName); // my sql 드라이버 불러오기
			conn = DriverManager.getConnection(url, username, password); //DB와의 커넥션 생성
			out.println(conn);
		} catch(Exception e) {
			out.println("DB 연결 실패!!");
			e.printStackTrace(); // 에러 발생시 에러의 내용을 콘솔창에 출력
		} finally { //db에러의 발생여부와 상관없이 무조건 실행
			try{
				if(conn != null) { // connection이 null이 아닐때만 close 실행
					conn.close();
				} 
			} catch (Exception e) {
				e.printStackTrace();
				}
			
			}
		
	%>


</body>
</html>