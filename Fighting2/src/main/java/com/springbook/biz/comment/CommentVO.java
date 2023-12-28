package com.springbook.biz.comment;

import java.util.Date;

public class CommentVO {
	int seq;
	String co_nickName;
	String co_content;
	Date co_regDate;
	int co_seq;

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getCo_nickName() {
		return co_nickName;
	}

	public void setCo_nickName(String co_nickName) {
		this.co_nickName = co_nickName;
	}

	public String getCo_content() {
		return co_content;
	}

	public void setCo_content(String co_content) {
		this.co_content = co_content;
	}

	public Date getCo_regDate() {
		return co_regDate;
	}

	public void setCo_regDate(Date co_regDate) {
		this.co_regDate = co_regDate;
	}

	public int getCo_seq() {
		return co_seq;
	}

	public void setCo_seq(int co_seq) {
		this.co_seq = co_seq;
	}

	@Override
	public String toString() {
		return "CommentVO [seq=" + seq + ", co_nickName=" + co_nickName + ", co_content=" + co_content
				+ ", co_regDate=" + co_regDate + "]";
	}

}
