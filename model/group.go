package model

type ImGroup struct {
	Id        string `column:"id" json:"id"`
	GroupName string `column:"groupName" json:"groupName"` // 群名
	GroupID   string `column:"groupID" json:"groupID"`     // 群号
	Picture   string `column:"picture" json:"picture"`     // 头像
	Created   string `column:"created" json:"created"`     // 创建时间
}
