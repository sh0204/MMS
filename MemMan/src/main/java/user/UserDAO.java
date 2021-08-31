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
}
