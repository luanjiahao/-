package com.wxk1991.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.wxk1991.entity.Comment;
import com.wxk1991.vo.CommentVo;

/**
 * <p>
 * 文章评论 服务类
 * </p>
 *
 * @author jobob
 * @since 2021-12-20
 */
public interface ICommentService extends IService<Comment> {

    /**
     * 文章评论列表
     * @param articleId
     * @return
     */
    IPage<CommentVo> getArticleCommentList(Page<CommentVo> commentVoPage, String articleId);
}
