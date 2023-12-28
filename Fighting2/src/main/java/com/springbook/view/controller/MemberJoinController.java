package com.springbook.view.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springbook.biz.user.UserVO;
import com.springbook.biz.userdetail.UserDetailVO;
import com.springbook.biz.userdetailimpl.UserDetailDAO;
import com.springbook.biz.userimpl.UserDAO;

@Controller
public class MemberJoinController {

	@RequestMapping("/memberJoin.do")
	public String memberJoin(UserVO vo, UserDetailVO dvo , UserDAO userDAO, UserDetailDAO duserDAO) throws Exception {
		userDAO.memberJoin(vo);
		
		duserDAO.insertUserDetail(dvo);
		
		return "login.jsp";
	}

}
