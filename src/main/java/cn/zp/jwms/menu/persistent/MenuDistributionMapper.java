package cn.zp.jwms.menu.persistent;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.zp.jwms.menu.vo.MenuDistribution;
import cn.zp.jwms.menu.vo.MenuDistributionExample;


public interface MenuDistributionMapper {
    int countByExample(MenuDistributionExample example);

    int deleteByExample(MenuDistributionExample example);

    int deleteByPrimaryKey(String distributeId);

    int insert(MenuDistribution record);

    int insertSelective(MenuDistribution record);

    List<MenuDistribution> selectByExample(MenuDistributionExample example);

    MenuDistribution selectByPrimaryKey(String distributeId);

    int updateByExampleSelective(@Param("record") MenuDistribution record, @Param("example") MenuDistributionExample example);

    int updateByExample(@Param("record") MenuDistribution record, @Param("example") MenuDistributionExample example);

    int updateByPrimaryKeySelective(MenuDistribution record);

    int updateByPrimaryKey(MenuDistribution record);
}