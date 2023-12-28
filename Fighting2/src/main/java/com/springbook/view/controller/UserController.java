package com.springbook.view.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springbook.biz.user.UserVO;
import com.springbook.biz.userdetail.UserDetailVO;
import com.springbook.biz.userdetailimpl.UserDetailDAO;
import com.springbook.biz.userimpl.UserDAO;

@Controller
public class UserController {

	@RequestMapping("/myInfo.do")
	public String myInfo(HttpSession session, UserDetailVO vo, UserDetailDAO userDetailDAO, Model model)
			throws Exception {
		UserVO user = (UserVO) session.getAttribute("user");
		String id = user.getId();
		vo.setId(id);
		UserDetailVO userDetail = userDetailDAO.getUser(vo);
		model.addAttribute("userDetail", userDetail);
		return "myInfo.jsp";
	}

	@RequestMapping("/findId.do")
	public String findId(UserVO vo, UserDAO userDAO, UserDetailVO dvo, UserDetailDAO userDetailDAO, Model model)
			throws Exception {
		UserVO user = userDAO.findId(vo);
		UserDetailVO duser = userDetailDAO.findID(dvo);

		if (user != null && duser != null && user.getId().equals(duser.getId())) {
			model.addAttribute("user", user);
			model.addAttribute("duser", duser);
			return "findId2.jsp";
		} else {
			return "findId1.jsp";
		}
	}
	
	@RequestMapping("/findPw.do")
	public String findPw(UserVO vo, UserDAO userDAO , Model model) throws Exception {
		UserVO user = userDAO.findPw(vo);
		model.addAttribute("user", user);
		if(user!=null) {
			return "findPw2.jsp";
		}else {
			return "findPw1.jsp";	
		}
	}
}