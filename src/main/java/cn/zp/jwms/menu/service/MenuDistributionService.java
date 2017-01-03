package cn.zp.jwms.menu.service;

import java.util.List;

import cn.zp.jwms.menu.vo.Menu;

public interface MenuDistributionService {

	List<Menu> getMenuItemByUserID(String userID);

}
