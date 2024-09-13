package com.wxk1991.vo;

import com.wxk1991.entity.Article;
import lombok.Data;

import java.util.List;

@Data
public class ArticleTypeTreeVo {
    private String articleTypeId;
    private String articleTypeName;
    private List<ArticleTypeTreeVo> articleTypeTreeVoList;
    private List<Article> articleList;
}
