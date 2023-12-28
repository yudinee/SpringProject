package com.springbook.biz.commentimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.springbook.biz.comment.CommentService;
import com.springbook.biz.comment.CommentVO;
import com.springbook.biz.common.JDBCUtil;

@Repository
public class CommentDAO implements CommentService {
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	
	static final String COMMENT_LIST = "select * from comment where seq=?";
	static final String COMMENT_INSERT = "insert into comment(seq,co_nickname, co_content,co_seq) values(?,?,?,(select nvl(max(co_seq),0)+1 from comment where seq=?)) ";
	static final String COMMENT_DELETEALL = "delete comment where seq=?";
	static final String COMMENT_DELETE = "delete comment where seq=? and co_seq=?";
	static final String COMMENT_MYLIST = "select * from comment where co_nickname = ? ";
	
	public void insertComment(CommentVO vo) {
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(COMMENT_INSERT);
			stmt.setInt(1, vo.getSeq());
			stmt.setString(2, vo.getCo_nickName());
			stmt.setString(3, vo.getCo_content());
			stmt.setInt(4, vo.getSeq());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(conn, stmt);
		}
	}
	
	public void deleteAllComment(CommentVO vo) {
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(COMMENT_DELETEALL);
			stmt.setInt(1, vo.getSeq());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(conn, stmt);
		}
	}
	
	public void deleteComment(CommentVO vo) {
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(COMMENT_DELETE);
			stmt.setInt(1, vo.getSeq());
			stmt.setInt(2, vo.getCo_seq());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(conn, stmt);
		}
	}
	
	public List<CommentVO> getCommentList(CommentVO vo) {
		List<CommentVO> commentList = new ArrayList<CommentVO>();
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(COMMENT_LIST);
			stmt.setInt(1, vo.getSeq());
			rs = stmt.executeQuery();
			while(rs.next()) {
				CommentVO comment = new CommentVO();
				comment.setSeq(rs.getInt("seq"));
				comment.setCo_nickName(rs.getString("co_nickname"));
				comment.setCo_content(rs.getString("co_content"));
				comment.setCo_regDate(rs.getDate("co_regdate"));
				comment.setCo_seq(rs.getInt("co_seq"));
				commentList.add(comment);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(rs, conn, stmt);
		}
		return commentList;
	}

	public List<CommentVO> getCommentMyList(CommentVO vo) {
		List<CommentVO> commentList = new ArrayList<CommentVO>();
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(COMMENT_MYLIST);
			stmt.setString(1, vo.getCo_nickName());
			rs = stmt.executeQuery();
			while(rs.next()) {
				CommentVO comment = new CommentVO();
				comment.setSeq(rs.getInt("seq"));
				comment.setCo_nickName(rs.getString("co_nickname"));
				comment.setCo_content(rs.getString("co_content"));
				comment.setCo_regDate(rs.getDate("co_regdate"));
				comment.setCo_seq(rs.getInt("co_seq"));
				commentList.add(comment);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(rs, conn, stmt);
		}
		return commentList;
	}
}
