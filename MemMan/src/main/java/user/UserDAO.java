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
}
