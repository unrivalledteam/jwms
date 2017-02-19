package cn.zp.jwms.menu.service;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.zp.jwms.menu.persistent.MenuMapper;
import cn.zp.jwms.menu.vo.Menu;
import cn.zp.jwms.menu.vo.MenuWithOwnedRoleID;

@Service
public class MenuServiceImpl implements MenuService {

	@Autowired
	private RoleService roleService;
	@Autowired
	private MenuMapper menuMapper;

	@Override
	public List<Menu> getMenusByUserID(String userID) {
		List<String> roleIDs = roleService.getRoleIDsbyUserID(userID);
		List<Menu> menus = getMenusByRoleIDs(roleIDs);
		return menus;
	}

	@Override
	public List<Menu> getMenusByRoleIDs(List<String> roleIDs) {
		List<Menu> menus = menuMapper.getMenusByRoleIDs(roleIDs);
		return menus;
	}

	@Override
	public List<Menu> getMenusByRoleID(String roleID) {
		List<Menu> menus = menuMapper.getMenusByRoleID(roleID);
		return menus;
	}

	@Override
	public List<MenuWithOwnedRoleID> getMenusWithIsOwned(String roleID) {
		List<MenuWithOwnedRoleID> menus = menuMapper.getMenusWithIsOwned(roleID);
		return menus;
	}

	@Override
	public List<Menu> getAllMenu() {
		return menuMapper.getAllMenu();
	}

	@Override
	public Map<String, Boolean> checkMenuNameExist(String menuName) {
		Map<String, Boolean> result = new HashMap<>();
		int count = menuMapper.checkMenuNameExist(menuName);
		if (count == 0) {
			result.put("valid", true);
		} else {
			result.put("valid", false);
		}
		return result;
	}

	@Override
	public List<Menu> getRootLevelMenu() {
		return menuMapper.getRootLevelMenu();
	}

	@Override
	public void saveNewMenu(String menuName, String targetPage, String belongMenuID) {
		int menuID = 0;
		if (belongMenuID.equals("root")) {
			Integer maxID = menuMapper.getRootMenuMaxID();
			if (maxID == null) {
				menuID = 100;
			} else {
				menuID = ((maxID / 100) + 1) * 100;
			}
		} else {
			Integer maxID = menuMapper.getNotRootMenuMaxID(belongMenuID);
			if (maxID == null) {
				menuID = Integer.valueOf(belongMenuID) + 1;
			} else {
				menuID = maxID + 1;
			}
		}
		menuMapper.saveNewMenu(String.valueOf(menuID), menuName, targetPage, belongMenuID);
	}

	@Override
	public Menu getMenuByMenuID(String menuID) {
		return menuMapper.getMenuByMenuID(menuID);
	}

	@Override
	public void updateNewMenu(String menuID, String menuName, String targetPage, String belongMenuID) {
		menuMapper.updateNewMenu(menuID, menuName, targetPage, belongMenuID);
	}

	@Override
	public void deleteMenuByIDs(String menuIDs) {
		List<String> menuIDList = null;
		try {
			menuIDList = Arrays.asList(menuIDs.split(","));
		} catch (Exception e) {
			System.out.println(e);
		}
		menuMapper.deleteMenuByIDs(menuIDList);
		menuMapper.deleteMenuDistributionByIDs(menuIDList);
		
	}

}
