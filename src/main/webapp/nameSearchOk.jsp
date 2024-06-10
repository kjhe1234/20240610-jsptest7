<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 이름 검색</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String memberName = request.getParameter("name");
		
		String sql = "SELECT * FROM student_tbl WHERE name= '"+memberName+"'";  // 모든 회원의 목록을 가져오기
		
		String driverName = "com.mysql.jdbc.Driver"; //my sql 드라이버 이름
		String url = "jdbc:mysql://localhost:3306/school_db"; //DB가 설치된 주소
		String username = "root"; // 관리자 계정 이름
		String password = "12345"; // 관리자 계정 비밀번호
		

		
		Connection conn = null;  //DB와의 연결 통로 확보
		Statement stmt = null; // sql문 실행
		ResultSet rs = null; //select 문 실행시 DB에서 반환해주는 결과 레코드를 받기 위한 자료타입을 준비
		
		
		try{
			Class.forName(driverName); // my sql 드라이버 불러오기
			conn = DriverManager.getConnection(url, username, password);
			stmt = conn.createStatement();
			
			//int resultNum = stmt.executeUpdate(sql); //sql문을 DB에 실행!!
			// 반환되는 int 값이 1이면 sql문 실행 성공, 1이아니면 실행 실패
			
			rs = stmt.executeQuery(sql);
			
			//ArrayList memberList = new ArrayList();
			//memberList = null;
			
			while(rs.next()) {
				int sno = rs.getInt("sno");
				String name = rs.getString("name");
				String dept = rs.getString("dept");
				
				if (name.equals(memberName)) {
					out.println(sno + "/" + name + "/" + dept + "<br><br>");	
				} else {
					out.println("가입되지 않은 회원 입니다.");
				}

			}
			
			
		} catch(Exception e) {
			out.println("DB연결 실패! 회원 목록 불러오기 실패!!");
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