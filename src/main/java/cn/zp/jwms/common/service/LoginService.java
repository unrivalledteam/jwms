package cn.zp.jwms.common.service;

import javax.servlet.http.HttpServletRequest;

import cn.zp.jwms.common.vo.LoginQueryVO;
import cn.zp.jwms.common.vo.User;

public interface LoginService {
	public User checkLogin(LoginQueryVO vo);

	public void saveLoginLog(LoginQueryVO vo, HttpServletRequest request, String loginMessage);
}
