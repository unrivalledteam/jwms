package cn.zp.jwms.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

@Controller
@EnableWebMvc
@RequestMapping("/login")
public class LoginController {
	
	@RequestMapping("toLogin")
	public String toLogin(){
		return "common/login";
	}
}
