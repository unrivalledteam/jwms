package cn.zp.jwms.common.service;

import cn.zp.jwms.common.vo.LoginQueryVO;
import cn.zp.jwms.common.vo.User;

public interface LoginService {
	public User checkLogin(LoginQueryVO vo);
}
