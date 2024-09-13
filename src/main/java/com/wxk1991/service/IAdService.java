package com.wxk1991.service;

import com.wxk1991.entity.Ad;
import com.baomidou.mybatisplus.extension.service.IService;
import com.wxk1991.vo.AdVo;

import java.util.List;

/**
 * <p>
 * 广告 服务类
 * </p>
 *
 * @author jobob
 * @since 2021-12-20
 */
public interface IAdService extends IService<Ad> {

    /**
     * 广告列表，包含广告类型名称
     * @param adTypeId
     * @return
     */
    List<AdVo> adList(String adTypeId);
}
