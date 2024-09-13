package com.wxk1991.mapper;

import com.wxk1991.entity.Ad;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.wxk1991.vo.AdVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * 广告 Mapper 接口
 * </p>
 *
 * @author jobob
 * @since 2021-12-20
 */
public interface AdMapper extends BaseMapper<Ad> {

    /**
     * 广告列表，包含广告类型名称
     * @param adTypeId
     * @return
     */
    List<AdVo> adList(@Param("adTypeId") String adTypeId);
}
