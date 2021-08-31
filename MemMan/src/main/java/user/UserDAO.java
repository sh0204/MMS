package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/MemMan" ;		
			String dbID = "root";
			String dbPassword = "bandal2305";
			Class.forName("com.mysql.jdbc.Driver");
			// MySQL에 접속할 수 있도록 매개체 역할을 해주는 하나의 라이브러리, JDBC 드라이버 로드
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int login (String userID, String userPassword) 
	{
		String SQL = "SELECT userPassword FROM user WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL); //sql쿼리문을 대기 시킨다
			pstmt.setString(1, userID); //첫번째 '?'에 매개변수로 받아온 'userID'를 대입
			rs = pstmt.executeQuery(); //쿼리를 실행한 결과를 rs에 저장
			
			
			if (rs.next()) // 결과가 존재한다면
			{
				if (rs.getString(1).equals(userPassword))
				// 결과로 나온 userPassword를 받아서 접속을 시도한 userPassword와 동일하다면
				{
					return 1; // 로그인 성공
				} else
					return 0; // 로그인 실패(비밀번호 틀림)

			}
			return -1; // 아이디가 없음 userID=?부분 확인
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; // 데이터베이스 오류
	}
}
