package cn.zp.jwms.common.persistent;

import java.util.List;
import org.apache.ibatis.annotations.Param;

import cn.zp.jwms.common.vo.LoginQueryVO;
import cn.zp.jwms.common.vo.User;
import cn.zp.jwms.common.vo.UserExample;

public interface UserMapper {
    int countByExample(UserExample example);

    int deleteByExample(UserExample example);

    int deleteByPrimaryKey(String userId);

    int insert(User record);

    int insertSelective(User record);

    List<User> selectByExample(UserExample example);

    User selectByPrimaryKey(String userId);

    int updateByExampleSelective(@Param("record") User record, @Param("example") UserExample example);

    int updateByExample(@Param("record") User record, @Param("example") UserExample example);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

	User getPasswordByLoginName(String loginName);
}