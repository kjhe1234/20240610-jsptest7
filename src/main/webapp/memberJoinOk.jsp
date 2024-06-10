<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 확인</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String sno = request.getParameter("sno");
		String name = request.getParameter("name");
		String dept = request.getParameter("dept");
	
		String sql = "INSERT INTO student_tbl(sno, name, dept) VALUES ('"+sno+"','" +name+"', '"+dept+"') ";
		
		String driverName = "com.mysql.jdbc.Driver"; //my sql 드라이버 이름
		String url = "jdbc:mysql://localhost:3306/school_db"; //DB가 설치된 주소
		String username = "root"; // 관리자 계정 이름
		String password = "12345"; // 관리자 계정 비밀번호
		
		Connection conn = null;  //DB와의 연결 통로 확보
		Statement stmt = null; // sql문 실행
		
		try{
			Class.forName(driverName); // my sql 드라이버 불러오기
			conn = DriverManager.getConnection(url, username, password);
			stmt = conn.createStatement();
			
			int resultNum = stmt.executeUpdate(sql); //sql문을 DB에 실행!!
			// 반환되는 int 값이 1이면 sql문 실행 성공, 1이아니면 실행 실패
			if (resultNum == 1){
				out.println("회원 가입 성공!!");
			} else {
				out.println("회원 가입 실패!!");
			}
		} catch(Exception e) {
			out.println("DB연결 실패! 회원 가입 실패!!");
			e.printStackTrace();
			
		} finally {
			try {
				if(stmt != null) {
					stmt.close();
				}
				if(conn != null) {
					conn.close();
				}
			} catch(Exception e) {
				out.println("DB연결 끊기 실패!!");
				e.printStackTrace();
			}
		}
		
	%>




</body>
</html>