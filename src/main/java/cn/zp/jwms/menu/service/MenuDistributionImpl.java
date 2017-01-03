package cn.zp.jwms.menu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.zp.jwms.menu.persistent.MenuMapper;
import cn.zp.jwms.menu.vo.Menu;

@Service
public class MenuDistributionImpl implements MenuDistributionService{
	@Autowired
	private MenuMapper menuMapper;

	@Override
	public List<Menu> getMenuItemByUserID(String userID) {
		return menuMapper.getMenuItemByUserID(userID);
	}

}
