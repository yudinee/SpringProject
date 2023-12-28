package com.springbook.view.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.springbook.biz.user.UserVO;
import com.springbook.biz.userimpl.UserDAO;

@Controller
public class LoginController{

	@RequestMapping ( value =  "/login.do" , method = RequestMethod.POST )
	public String login(UserVO vo, UserDAO userDAO, HttpSession session) throws Exception {

		if(userDAO.getUser(vo)!=null) {
			session.setAttribute("user", userDAO.getUser(vo));
			return "getBoardList.do";
		}else {
			return "login.jsp";
		}
		
	}
	
	@RequestMapping(value = "/login.do" , method = RequestMethod.GET )
	public String login(UserVO vo) {
		return "login.jsp";
	}
	
	

}
