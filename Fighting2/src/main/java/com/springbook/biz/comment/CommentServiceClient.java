package com.springbook.biz.comment;

import java.util.List;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class CommentServiceClient {
	public static void main(String[] args) {
		AbstractApplicationContext container = new GenericXmlApplicationContext("ApplicationContext.xml");

		CommentService commentService = (CommentService) container.getBean("commentService");

		CommentVO vo = new CommentVO();
		vo.setSeq(3);
		vo.setCo_nickName("°­¾ÆÁö222");
		vo.setCo_content("¸Û¸Û2222");
		vo.setCo_seq(2);
		
		commentService.insertComment(vo);

		List<CommentVO> commentList = commentService.getCommentList(vo);

		for(
		CommentVO comment:commentList)
		{
			System.out.println(comment);
		}
	}
}