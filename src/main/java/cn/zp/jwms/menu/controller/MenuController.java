package cn.zp.jwms.menu.controller;

import java.net.URLDecoder;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import cn.zp.jwms.menu.service.MenuService;
import cn.zp.jwms.menu.service.RoleService;
import cn.zp.jwms.menu.vo.Menu;
import cn.zp.jwms.menu.vo.MenuWithOwnedRoleID;
import cn.zp.jwms.menu.vo.Role;

@Controller
@EnableWebMvc
@RequestMapping("/menuController")
public class MenuController {

	@Autowired
	private MenuService menuService;
	@Autowired
	private RoleService roleService;

	@ResponseBody
	@RequestMapping("/getMenuByUserID")
	public List<Menu> getMenusByUserID(String userID) {
		return menuService.getMenusByUserID(userID);
	}

	@ResponseBody
	@RequestMapping("/checkRoleNameExist")
	public String checkRoleNameExist(String roleName) {
		try {
			roleName = URLDecoder.decode(roleName, "utf-8");
		} catch (Exception e) {
			// TODO: handle exception
		}
		return roleService.checkRoleNameExist(roleName);
	}

	@ResponseBody
	@RequestMapping("/checkEditMenuNameExist")
	public Map<String, Boolean> checkEditMenuNameExist(String oldName, String newName) {
		Map<String, Boolean> map;
		if (oldName.trim().equals(newName.trim())) {
			map = new HashMap<>();
			map.put("valid", true);
			return map;
		} else {
			return menuService.checkMenuNameExist(newName);
		}
	}

	@ResponseBody
	@RequestMapping("/saveNewRole")
	public void saveNewRole(String roleName, String roleType, String roleDesc) {
		try {
			roleName = URLDecoder.decode(roleName, "utf-8");
			roleType = URLDecoder.decode(roleType, "utf-8");
			roleDesc = URLDecoder.decode(roleDesc, "utf-8");
		} catch (Exception e) {
			// TODO: handle exception
		}
		roleService.saveNewRole(roleName, roleType, roleDesc);
	}

	@ResponseBody
	@RequestMapping("/saveNewMenu")
	public void saveNewMenu(String menuName, String targetPage, String belongMenuID) {
		menuService.saveNewMenu(menuName, targetPage, belongMenuID);
	}
	
	@ResponseBody
	@RequestMapping("/updateNewMenu")
	public void updateNewMenu(String menuID,String menuName, String targetPage, String belongMenuID) {
		menuService.updateNewMenu(menuID,menuName, targetPage, belongMenuID);
	}

	@ResponseBody
	@RequestMapping("/getMenuByMenuID")
	public Menu getMenuByMenuID(String menuID) {
		Menu menu = menuService.getMenuByMenuID(menuID);
		return menu;
	}

	@ResponseBody
	@RequestMapping("/updateRole")
	public void updateRole(Role role) {
		try {
			role.setRoleName(URLDecoder.decode(role.getRoleName(), "utf-8"));
			role.setRoleType(URLDecoder.decode(role.getRoleType(), "utf-8"));
			role.setRoleDesc(URLDecoder.decode(role.getRoleDesc(), "utf-8"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		roleService.updateRole(role);
	}

	@ResponseBody
	@RequestMapping("/getAllRoles")
	public List<Role> getAllRoles() {
		return roleService.getAllRoles();
	}

	@ResponseBody
	@RequestMapping("/getRolesByName")
	public List<Role> getRolesByName(String roleName) {
		try {
			roleName = URLDecoder.decode(roleName, "UTF-8");
		} catch (Exception e) {
			System.out.println(e);
		}
		return roleService.getRolesByName(roleName);
	}

	@ResponseBody
	@RequestMapping("/getRoleByRoleID")
	public Role getRoleByRoleID(String roleID) {
		return roleService.getRoleByRoleID(roleID);
	}

	@ResponseBody
	@RequestMapping("/getMenusByRoleID")
	public List<Menu> getMenusByRoleID(String roleID) {
		return menuService.getMenusByRoleID(roleID);
	}

	@ResponseBody
	@RequestMapping("/getMenusWithIsOwned")
	public List<MenuWithOwnedRoleID> getMenusWithIsOwned(String roleID) {
		List<MenuWithOwnedRoleID> list = menuService.getMenusWithIsOwned(roleID);
		return list;
	}

	@ResponseBody
	@RequestMapping("/saveRole_Menu")
	public String saveRole_Menu(String[] menuSelect, String roleID) {
		roleService.saveRole_Menu(menuSelect, roleID);
		return "success";
	}

	@ResponseBody
	@RequestMapping("/deleteRoleByRoleIDs")
	public void deleteRoleByRoleIDs(String roleIDs) {
		List<String> ids = Arrays.asList(roleIDs.split(","));
		roleService.deleteRoleByRoleIDs(ids);
	}

	@ResponseBody
	@RequestMapping("/getAllMenu")
	public List<Menu> getAllMenu() {
		return menuService.getAllMenu();
	}

	@ResponseBody
	@RequestMapping("/checkMenuNameExist")
	public Map<String, Boolean> checkMenuNameExist(String menuName) {
		return menuService.checkMenuNameExist(menuName);
	}

	@ResponseBody
	@RequestMapping("/getRootLevelMenu")
	public List<Menu> getRootLevelMenu() {
		return menuService.getRootLevelMenu();
	}
	
	@ResponseBody
	@RequestMapping("/deleteMenuByIDs")
	public void deleteMenuByIDs(String menuIDs) {
		menuService.deleteMenuByIDs(menuIDs);
	}
}
