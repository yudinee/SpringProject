package com.springbook.biz.board;

import java.util.List;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class BoardServiceClient {
	public static void main(String[] args) {
	
		AbstractApplicationContext container = new GenericXmlApplicationContext("ApplicationContext.xml");
		
		BoardService boardService = (BoardService)container.getBean("boardService");
		
		BoardVO vo = new BoardVO();
		//vo.setSeq(2);
		vo.setTitle("�̰���");
		vo.setWriter("��������");
		vo.setContent("���ϴ°���");
		
		boardService.insertBoard(vo);
		
		List<BoardVO> boardList = boardService.getBoardList(vo);
		for(BoardVO board : boardList) {
			System.out.println(board);
		}
	}
}
