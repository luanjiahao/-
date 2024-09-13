package com.wxk1991.service;

import com.wxk1991.entity.ArticleType;
import com.baomidou.mybatisplus.extension.service.IService;
import com.wxk1991.vo.ArticleTypeTreeVo;
import com.wxk1991.vo.ArticleTypeVo;

import java.util.List;

/**
 * <p>
 * 文章分类i 服务类
 * </p>
 *
 * @author jobob
 * @since 2021-12-21
 */
public interface IArticleTypeService extends IService<ArticleType> {

    /**
     * 文章类型列表，包含文章数量
     * @return
     */
    List<ArticleTypeVo> articleTypeList();

    /**
     * 获取首页文章类型树形目录
     * @param articleTypeParentId
     * @return
     */
    List<ArticleTypeTreeVo> getIndexArticleTypeList(String articleTypeParentId);
}
