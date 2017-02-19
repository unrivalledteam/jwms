package cn.zp.jwms.menu.service;

import java.util.List;
import java.util.Map;

import cn.zp.jwms.menu.vo.Menu;
import cn.zp.jwms.menu.vo.MenuWithOwnedRoleID;

public interface MenuService {

	List<Menu> getMenusByUserID(String userID);
	List<Menu> getMenusByRoleIDs(List<String> roleIDs);
	List<Menu> getMenusByRoleID(String roleID);
	List<MenuWithOwnedRoleID> getMenusWithIsOwned(String roleID);
	List<Menu> getAllMenu();
	Map<String, Boolean> checkMenuNameExist(String menuName);
	List<Menu> getRootLevelMenu();
	void saveNewMenu(String menuName, String targetPage, String belongMenuID);
	Menu getMenuByMenuID(String menuID);
	void updateNewMenu(String menuID, String menuName, String targetPage, String belongMenuID);
	void deleteMenuByIDs(String menuIDs);
}
