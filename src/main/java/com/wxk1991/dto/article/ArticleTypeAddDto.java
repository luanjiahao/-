package com.wxk1991.dto.article;

import com.baomidou.mybatisplus.annotation.TableId;
import com.wxk1991.service.AddArticleInterface;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.time.LocalDateTime;

@Data
public class ArticleTypeAddDto {


    /**
     * 文章分类名称
     */
    @NotBlank(message = "文章分类名称 不能为空")
    private String articleTypeName;

    /**
     * 文章分类排序，越小越靠前
     */
    @NotNull(message = "文章分类排序 不能为空")
    private Integer articleTypeSort;

    /**
     * 文章分类父id
     */
    private String articleTypeParentId;


}
