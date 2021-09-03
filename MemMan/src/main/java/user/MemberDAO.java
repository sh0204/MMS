package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

 
public class MemberDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public MemberDAO() {
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
	
	public ArrayList<User> listmembers(User memberVO) {
        ArrayList<User> membersList = new ArrayList<User>();
        String name_1 = memberVO.getUserName();
        try {
        	String dbURL = "jdbc:mysql://localhost:3306/MemMan" ;		
			String dbID = "root";
			String dbPassword = "bandal2305";
			Class.forName("com.mysql.jdbc.Driver");
			// MySQL에 접속할 수 있도록 매개체 역할을 해주는 하나의 라이브러리, JDBC 드라이버 로드
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			
            String SQL = "select * from user";
            
            if((name_1 != null && name_1.length() != 0)) {
                SQL += " where userName=?";
                pstmt = conn.prepareStatement(SQL);
                pstmt.setString(1, name_1);
            }else {
                pstmt = conn.prepareStatement(SQL);
            }
            ResultSet rs = pstmt.executeQuery();
            while(rs.next()) {
                String userID = rs.getString("userID");
                String userPassword = rs.getString("userPassword");
                String userName = rs.getString("userName");
                String userBirth = rs.getString("userBirth");
                String userNum = rs.getString("userNum");
                
                User vo = new User();
                vo.setUserID(userID);
                vo.setUserPassword(userPassword);
                vo.setUserName(userName);
                vo.setUserBirth(userBirth);
                vo.setUserNum(userNum);
                
                membersList.add(vo);
            }
            rs.close();
            pstmt.close();
            conn.close();
        }catch (Exception e) {
            e.printStackTrace();
        }
        return membersList;
    }
	
}
