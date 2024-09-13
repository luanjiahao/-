package com.wxk1991.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.wxk1991.entity.Comment;
import com.wxk1991.vo.CommentVo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

/**
 * <p>
 * 文章评论 Mapper 接口
 * </p>
 *
 * @author jobob
 * @since 2021-12-20
 */
@Component
public interface CommentMapper extends BaseMapper<Comment> {

    /**
     * 文章评论列表
     * @param articleId
     * @return
     */
    IPage<CommentVo> getArticleCommentList(Page<CommentVo> commentVoPage, @Param("articleId") String articleId);
}
