package com.wxk1991.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.wxk1991.dto.article.PublishArticleActionDto;
import com.wxk1991.entity.Article;
import com.baomidou.mybatisplus.extension.service.IService;
import com.wxk1991.entity.User;
import com.wxk1991.utils.CommonResult;
import com.wxk1991.vo.ArticleVo;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * <p>
 * 文章 服务类
 * </p>
 *
 * @author jobob
 * @since 2021-12-20
 */
public interface IArticleService extends IService<Article> {

    /**
     * 文章列表
     * @param articlePage
     * @param articleTitle
     * @return
     */
    IPage<ArticleVo> articleList(IPage<ArticleVo> articlePage, String articleTitle,String userId);

    /**
     * 文章列表 前端
     * @param articlePage
     * @param articleTitle
     * @param articleTypeId
     * @return
     */
    IPage<ArticleVo> articleListView(Page<ArticleVo> articlePage, String articleTitle, String articleTypeId);

    /**
     * 发布文章方法
     * @param publishArticleActionDto
     * @return
     */
    CommonResult publishArticleAction(HttpServletRequest request, PublishArticleActionDto publishArticleActionDto);

    /**
     * 删除文章
     * @param articleId
     * @return
     */
    CommonResult delArticle(String articleId);

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
    ArticleVo getArticle(String articleId);

    /**
     * 收藏文章
     * @param user
     * @param articleId
     * @return
     */
    CommonResult articleCollection(User user, String articleId);

    /**
     * 获取标签对应的文章列表
     * @param articlePage
     * @param articleTagId
     * @return
     */
    IPage<ArticleVo> tagArticleList(Page<ArticleVo> articlePage, String articleTagId);

}
