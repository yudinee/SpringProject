package com.springbook.view.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.springbook.biz.board.BoardVO;
import com.springbook.biz.boardimpl.BoardDAO;
import com.springbook.biz.comment.CommentVO;
import com.springbook.biz.commentimpl.CommentDAO;
import com.springbook.biz.user.UserVO;

@Controller
public class MyActiveController {

	@RequestMapping("/myActive.do")
	public String myActive(HttpSession session, BoardVO vo, BoardDAO boardDAO, CommentVO cvo, CommentDAO commentDAO, Model model) throws Exception {
		UserVO user = (UserVO) session.getAttribute("user");
		
		String writer = user.getNickName();
		
		vo.setWriter(writer);
		
		List<BoardVO> boardList = boardDAO.getBoardMyList(vo);
		
		cvo.setCo_nickName(writer);
		List<CommentVO> commentList = commentDAO.getCommentMyList(cvo);
		
		model.addAttribute("boardList", boardList);
		model.addAttribute("commentList", commentList);
		
		
		return "myActive.jsp";
	}

}
