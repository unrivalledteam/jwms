package cn.zp.jwms.common.service;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.zp.jwms.common.persistent.UserMapper;
import cn.zp.jwms.common.vo.LoginLog;
import cn.zp.jwms.common.vo.LoginQueryVO;
import cn.zp.jwms.common.vo.User;
import cn.zp.jwms.util.IpUtil;

@Service
public class LoginServiceImpl implements LoginService {
	@Autowired
	private UserMapper userMapper;
	
	@Override
	public User checkLogin(LoginQueryVO vo) {
		User queryUser = userMapper.getPasswordByLoginName(vo.getUserName());
		if(queryUser!=null&&queryUser.getLoginPassword().trim().equals(vo.getPassword())){
			return queryUser;
		}else{
			return null;
		}
	}

	@Override
	public void saveLoginLog(LoginQueryVO user, HttpServletRequest request,String loginMessage) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String loginName = user.getUserName();
		String loginPassword = user.getPassword();
		String loginIP = IpUtil.getIpAddress(request);
		String loginTime = format.format(new Date(System.currentTimeMillis()));
		LoginLog loginLog = new LoginLog(loginName, loginPassword, loginIP, loginTime, loginMessage);
		userMapper.saveLoginLog(loginLog);
	}

}
