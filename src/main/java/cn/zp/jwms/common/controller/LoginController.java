package cn.zp.jwms.common.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import cn.zp.jwms.common.service.LoginService;
import cn.zp.jwms.common.vo.LoginQueryVO;
import cn.zp.jwms.common.vo.User;

@Controller
@EnableWebMvc
public class LoginController {

	@Autowired
	private LoginService loginService;

	@RequestMapping("/toLogin")
	public ModelAndView toLogin() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("common/login");
		return mv;
	}

	@RequestMapping("/GradeManagementSystem")
	public ModelAndView doLogin(LoginQueryVO vo, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		if (vo.getUserName() == null || vo.getPassword() == null) {
			mv.setViewName("common/login");
			// mv.addObject("loginMessage", "非法登陆，请重新输入");
			return mv;
		}
		vo.setUserName(vo.getUserName().trim());
		vo.setPassword(vo.getPassword().trim());
		User user = loginService.checkLogin(vo);
		if (user != null) {
			request.getSession().setAttribute("userID", user.getUserId());
			request.getSession().setAttribute("userName", user.getUserName());
			request.getSession().setAttribute("userType", user.getUserType());
			mv.setViewName("common/main");
			return mv;
		} else {
			mv.setViewName("common/login");
			mv.addObject("loginMessage", "用户名或密码错误，请重新输入");
			return mv;
		}

	}

}
