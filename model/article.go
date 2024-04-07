package model

// ImArticle 朋友圈文章
type ImArticle struct {
	// 文章ID
	Id string `column:"id" json:"id,omitempty"`
	// 文章内容ID
	Content string `column:"content" json:"content,omitempty"`
	// 文章附件
	Mediums string `column:"mediums" json:"mediums,omitempty"`
	// 创建时间
	Created string `column:"created" json:"created,omitempty"`
}

// ArticleComment 朋友圈文章评论
type ArticleComment struct {
	Id         int    `column:"id" json:"id"`
	Pid        int    `column:"pid" json:"pid"`                // 父级id
	UserId     int    `column:"user_id" json:"user_id"`        // 评论人id
	Text       string `column:"name" json:"name"`              // 评论内容
	CreateTime string `column:"create_time" json:"createTime"` // 评论时间
}

func (comment *ArticleComment) GetId() int {
	return comment.Id
}

func (comment *ArticleComment) GetPid() int {
	return comment.Pid
}

func (comment *ArticleComment) GetName() string {
	return ""
}

// ImArticleLike 朋友圈文章点赞
type ImArticleLike struct {
	Id        string `column:"id"`
	UserId    string `column:"user_id"`
	ArticleId string `column:"article_id"`
	Created   string `column:"created"`
}
