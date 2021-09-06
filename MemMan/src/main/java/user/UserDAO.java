package user;

import java.beans.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private java.sql.Statement stmt;
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
	
	public int join(User user) {
        String SQL = "INSERT INTO USER VALUES (?, ?, ?, ?, ?)";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, user.getUserID());
            pstmt.setString(2, user.getUserPassword());
            pstmt.setString(3, user.getUserName());
            pstmt.setString(4, user.getUserBirth());
            pstmt.setString(5, user.getUserNum());
            return pstmt.executeUpdate();
        } catch(Exception e) {
            e.printStackTrace();
        }
        return -1; // 데이터베이스 오류
    }
	
	public User getUser(String userID) {
		String SQL = "SELECT * FROM user WHERE userID='"+userID+"'";
		try {
			stmt = conn.createStatement();
			System.out.println("getUser:execute_before" + SQL);
			rs= stmt.executeQuery(SQL);
			User user = new User();
			if(rs.next()) {
			user.setUserID(rs.getString(1));
			System.out.println("getUser:user.getUserID" + user.getUserID());
			user.setUserPassword(rs.getNString(2));
			user.setUserName(rs.getString(3));
			user.setUserBirth(rs.getString(4));
			user.setUserNum(rs.getString(5));
			return user;
			}
		}catch(Exception e){
			System.out.println("exeption");
			e.printStackTrace();
		}
		System.out.println("return: -1");
		return null;
	}
	public int modify(User user) {
		String SQL = "UPDATE user SET userID='" + user.getUserID() + "'"+", userPassword='" + user.getUserPassword() + "'"+", userName='" + user.getUserName() + "'"
																								+", userBirth='" + user.getUserBirth() + "'"+", userNum="+ "'" + user.getUserNum() + "' WHERE userID='"+ user.getUserID() +"'";
		try {
			stmt = conn.createStatement();
			System.out.println("executeupdate_before");
			return stmt.executeUpdate(SQL);
		}catch(Exception e){
			System.out.println("exeption");
			e.printStackTrace();
		}
		System.out.println("return: -1");
		return -1;
	} 
}
