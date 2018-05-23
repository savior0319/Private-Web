package jsp.member.service;

import java.sql.Connection;

import jsp.jdbc.common.JDBCTemplate;
import jsp.member.dao.MemberDAO;
import jsp.member.vo.MemberVo;

public class MemberService {

	private Connection conn = null;
	private MemberDAO mDao = new MemberDAO();

	public MemberService() {
	}

	public MemberVo memberLogin(MemberVo mv) {
		conn = JDBCTemplate.getConnect(conn);
		MemberVo mvResult = mDao.memberLogin(conn, mv);
		JDBCTemplate.close(conn);
		return mvResult;
	}

	public int memberSignUp(MemberVo mv) {
		conn = JDBCTemplate.getConnect(conn);
		int result = mDao.memberSignUp(conn, mv);

		if (result > 0) {
			JDBCTemplate.close(conn);
		} else
			JDBCTemplate.rollBack(conn);

		JDBCTemplate.close(conn);
		return result;
	}

	public int idCheck(String id) {
		conn = JDBCTemplate.getConnect(conn);
		int result = mDao.idCheck(conn, id);
		JDBCTemplate.close(conn);
		return result;
	}

	public int CheckEmail(String eMail) {
		conn = JDBCTemplate.getConnect(conn);
		int result = mDao.CheckEmail(conn, eMail);
		JDBCTemplate.close(conn);
		return result;
	}

}
