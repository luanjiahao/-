package com.wxk1991.service.impl;

import com.wxk1991.entity.ArticleType;
import com.wxk1991.mapper.ArticleTypeMapper;
import com.wxk1991.service.IArticleTypeService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.wxk1991.vo.ArticleTypeTreeVo;
import com.wxk1991.vo.ArticleTypeVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 文章分类i 服务实现类
 * </p>
 *
 * @author jobob
 * @since 2021-12-21
 */
@Service
public class ArticleTypeServiceImpl extends ServiceImpl<ArticleTypeMapper, ArticleType> implements IArticleTypeService {
    @Autowired
    private ArticleTypeMapper articleTypeMapper;
    /**
     * 文章类型列表，包含文章数量
     * @return
     */
    @Override
    public List<ArticleTypeVo> articleTypeList() {
        return articleTypeMapper.articleTypeList();
    }

    /**
     * 获取首页文章类型树形目录
     * @param articleTypeParentId
     * @return
     */
    @Override
    public List<ArticleTypeTreeVo> getIndexArticleTypeList(String articleTypeParentId) {
        return articleTypeMapper.getIndexArticleTypeList(articleTypeParentId);
    }
}
