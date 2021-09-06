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
			// MySQL�� ������ �� �ֵ��� �Ű�ü ������ ���ִ� �ϳ��� ���̺귯��, JDBC ����̹� �ε�
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int login (String userID, String userPassword) 
	{
		String SQL = "SELECT userPassword FROM user WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL); //sql�������� ��� ��Ų��
			pstmt.setString(1, userID); //ù��° '?'�� �Ű������� �޾ƿ� 'userID'�� ����
			rs = pstmt.executeQuery(); //������ ������ ����� rs�� ����
			
			
			if (rs.next()) // ����� �����Ѵٸ�
			{
				if (rs.getString(1).equals(userPassword))
				// ����� ���� userPassword�� �޾Ƽ� ������ �õ��� userPassword�� �����ϴٸ�
				{
					return 1; // �α��� ����
				} else
					return 0; // �α��� ����(��й�ȣ Ʋ��)

			}
			return -1; // ���̵� ���� userID=?�κ� Ȯ��
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; // �����ͺ��̽� ����
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
        return -1; // �����ͺ��̽� ����
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
