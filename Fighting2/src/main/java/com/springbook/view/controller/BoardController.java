package com.springbook.view.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.springbook.biz.board.BoardVO;
import com.springbook.biz.boardimpl.BoardDAO;
import com.springbook.biz.comment.CommentVO;
import com.springbook.biz.commentimpl.CommentDAO;

@Controller
public class BoardController {
	@RequestMapping("/insertBoard.do")
	public String insertBoard(BoardVO vo , BoardDAO boardDAO) throws Exception {
		boardDAO.insertBoard(vo);
		return "getBoardList.do";
	}
	@RequestMapping("/updateBoard.do")
	public String updateBoard(BoardVO vo , BoardDAO boardDAO) throws Exception {
		boardDAO.updateBoard(vo);
		return "getBoardList.do";
	}
	@RequestMapping("/deleteBoard.do")
	public String deleteBoard(BoardVO vo , BoardDAO boardDAO, CommentVO cvo, CommentDAO commentDAO) throws Exception {
		commentDAO.deleteAllComment(cvo);
		boardDAO.deleteBoard(vo);
		return "getBoardList.do";
	}
	@RequestMapping("/searchList.do")
	public String searchList(@RequestParam("searchCondition") String searchCondition, @RequestParam("searchKeyword") String searchKeyword, BoardDAO boardDAO ,Model model) throws Exception {
		model.addAttribute("boardList", boardDAO.getSearchList(searchCondition, searchKeyword));
		return "getBoardList.jsp";
	}
	@RequestMapping("/getBoard.do")
	public String getBoard(BoardVO vo,BoardDAO boardDAO,CommentVO dvo,CommentDAO commentDAO ,Model model) throws Exception {
		BoardVO board = boardDAO.getBoard(vo);
		boardDAO.countBoard(vo);
		
		model.addAttribute("board", board);
		model.addAttribute("commentList", commentDAO.getCommentList(dvo));
		return "getBoard.jsp";
	}
	@RequestMapping("/getBoardList.do")
	public String getBoardList(BoardVO vo, BoardDAO boardDAO,Model model) throws Exception {
		model.addAttribute("boardList", boardDAO.getBoardList(vo));
		return "getBoardList.jsp";
	}
	@RequestMapping("/insertComment.do")
	public String insertComment(CommentVO vo, CommentDAO commentDAO) throws Exception {
		commentDAO.insertComment(vo);
		return "getBoard.do";
	}
	@RequestMapping("/b_like.do")
	public String b_like(BoardVO vo,BoardDAO boardDAO) throws Exception {
		boardDAO.b_likeBoard(vo);
		return "getBoard.do?";
	}

}
