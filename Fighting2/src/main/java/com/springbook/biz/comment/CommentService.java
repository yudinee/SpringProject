package com.springbook.biz.comment;

import java.util.List;

import org.springframework.stereotype.Service;


public interface CommentService {

	void insertComment(CommentVO vo);

	List<CommentVO> getCommentList(CommentVO vo);

}