package com.wxk1991.mapper;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.wxk1991.entity.Article;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.wxk1991.vo.ArticleVo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * <p>
 * 文章 Mapper 接口
 * </p>
 *
 * @author jobob
 * @since 2021-12-20
 */
@Component
public interface ArticleMapper extends BaseMapper<Article> {

    /**
     * 文章列表
     *
     * @param articlePage
     * @param articleTitle
     * @return
     */
    IPage<ArticleVo> articleList(IPage<ArticleVo> articlePage, @Param("articleTitle") String articleTitle, @Param("userId") String userId);

    /**
     * 文章列表 前端
     *
     * @param articlePage
     * @param articleTitle
     * @param articleTypeId
     * @return
     */
    IPage<ArticleVo> articleListView(Page<ArticleVo> articlePage, String articleTitle, String articleTypeId);

    /**
     * 首页最新文章
     * @return
     */
    List<ArticleVo> getIndexArticleList();

    /**
     * 根据文章id获取文章信息
     * @param articleId
     * @return
     */
    ArticleVo getArticle(@Param("articleId") String articleId);

    /**
     * 获取标签对应的文章列表
     * @param articlePage
     * @param articleTagId
     * @return
     */
    IPage<ArticleVo> tagArticleList(Page<ArticleVo> articlePage,@Param("articleTagId") String articleTagId);

}
