package cn.zp.jwms.common.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.zp.jwms.common.persistent.UserMapper;
import cn.zp.jwms.common.vo.LoginQueryVO;
import cn.zp.jwms.common.vo.User;

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

}
