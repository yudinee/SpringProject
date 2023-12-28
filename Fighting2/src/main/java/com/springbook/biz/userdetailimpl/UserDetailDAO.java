package com.springbook.biz.userdetailimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.springbook.biz.board.BoardVO;
import com.springbook.biz.common.JDBCUtil;
import com.springbook.biz.userdetail.UserDetailVO;

public class UserDetailDAO {
	
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	
	static final String USERDETAIL_GET = "select * from userdetail where id=?";
	static final String USERDETAIL_INSERT = "insert into userdetail values (?,?,?,?,?)";
	static final String USERDETAIL_FINDID = "select * from userdetail where phonenumber1 = ? and phonenumber2 = ?";
	
	public void insertUserDetail(UserDetailVO vo) {
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement( USERDETAIL_INSERT);
			stmt.setString(1, vo.getId());
			stmt.setString(2, vo.getPhoneNumber1());
			stmt.setString(3, vo.getPhoneNumber2());
			stmt.setString(4, vo.getAddress());
			stmt.setString(5, vo.getEmail());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(conn, stmt);
		}
	}
	
	public UserDetailVO getUser(UserDetailVO vo) {
		UserDetailVO userDetail = null;
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(USERDETAIL_GET);
			stmt.setString(1, vo.getId());
			rs = stmt.executeQuery();
			if(rs.next()) {
				userDetail = new UserDetailVO();
				userDetail.setId(rs.getString("id"));
				userDetail.setPhoneNumber1(rs.getString("phonenumber1"));
				userDetail.setPhoneNumber2(rs.getString("phonenumber2"));
				userDetail.setAddress(rs.getString("address"));
				userDetail.setEmail(rs.getString("email"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(rs, conn, stmt);
		}
		return userDetail;
	}
	
	public UserDetailVO findID(UserDetailVO vo) {
		UserDetailVO userDetail = null;
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(USERDETAIL_FINDID);
			stmt.setString(1, (vo.getPhoneNumber1()));
			stmt.setString(2, (vo.getPhoneNumber2()));
			rs = stmt.executeQuery();
			
			
			if(rs.next()) {
				userDetail = new UserDetailVO();
				userDetail.setId(vo.getId());
				userDetail.setPhoneNumber1(vo.getPhoneNumber1());
				userDetail.setPhoneNumber2(vo.getPhoneNumber2());
				userDetail.setAddress(vo.getAddress());
				userDetail.setEmail(vo.getEmail());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(rs, conn, stmt);
		}
		return userDetail;
	}

}
