package com.wxk1991.mapper;

import com.wxk1991.entity.ArticleType;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.wxk1991.vo.ArticleTypeTreeVo;
import com.wxk1991.vo.ArticleTypeVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * 文章分类i Mapper 接口
 * </p>
 *
 * @author jobob
 * @since 2021-12-21
 */
public interface ArticleTypeMapper extends BaseMapper<ArticleType> {

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
    List<ArticleTypeTreeVo> getIndexArticleTypeList(@Param("articleTypeParentId") String articleTypeParentId);
}
