package com.wxk1991.dto.article;

import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

@Data
public class ArticleTypeUpdateDto {


    /**
     * 文章分类id
     */
    @NotBlank(message = "文章分类id 不能为空")
    private String articleTypeId;

    /**
     * 文章分类名称
     */
    private String articleTypeName;

    /**
     * 文章分类排序，越小越靠前
     */
    private Integer articleTypeSort;

    /**
     * 文章分类父id
     */
    private String articleTypeParentId;


}
