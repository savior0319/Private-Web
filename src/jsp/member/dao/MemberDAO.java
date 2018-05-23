package jsp.member.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import jsp.jdbc.common.JDBCTemplate;
import jsp.member.vo.MemberVo;

public class MemberDAO {

	private Properties prop = new Properties();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	public MemberDAO() {
		try {
			prop.load(new FileReader(
					"C:\\Users\\savio\\Documents\\webworkspace\\web1\\src\\properties\\query.properties"));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public MemberVo memberLogin(Connection conn, MemberVo mv) {

		MemberVo mvResult = null;
		String query = prop.getProperty("memberLogin");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, mv.getUserId());
			pstmt.setString(2, mv.getUserPwd());

			rs = pstmt.executeQuery();

			while (rs.next()) {
				mvResult = new MemberVo();
				mvResult.setUserId(rs.getString("USERID"));
				mvResult.setUserPwd(rs.getString("USERPWD"));
				mvResult.setUserName(rs.getString("USERNAME"));
				mvResult.setUserGender(rs.getString("USERGENDER"));
				mvResult.setUserLocation(rs.getString("USERLOCATION"));
				mvResult.setUserMail(rs.getString("USERMAIL"));
				mvResult.setEnterDate(rs.getDate("ENTERDATE"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		return mvResult;
	}

	public int memberSignUp(Connection conn, MemberVo mv) {

		int result = 0;

		String query = prop.getProperty("memberSignUp");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, mv.getUserId());
			pstmt.setString(2, mv.getUserPwd());
			pstmt.setString(3, mv.getUserName());
			pstmt.setString(4, mv.getUserGender());
			pstmt.setString(5, mv.getUserLocation());
			pstmt.setString(6, mv.getUserMail());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int idCheck(Connection conn, String id) {

		int result = 0;
		String query = prop.getProperty("idCheck");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				result = 1;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int CheckEmail(Connection conn, String eMail) {
		
		int result = 0;
		String query = prop.getProperty("CheckEmail");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, eMail);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				result = 1;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
}
