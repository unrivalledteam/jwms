package cn.zp.jwms.menu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import cn.zp.jwms.menu.service.MenuDistributionService;
import cn.zp.jwms.menu.vo.Menu;

@Controller
@EnableWebMvc
@RequestMapping("/menuController")
public class MenuController {
	@Autowired
	private MenuDistributionService menuDistributionService;
	
	@ResponseBody
	@RequestMapping("getMenuItemByUserID")
	public List<Menu> getMenuItemByUserID(String userID){
		return menuDistributionService.getMenuItemByUserID(userID);
	}
}
