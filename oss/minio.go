package oss

import (
	"context"
	"github.com/minio/minio-go/v7"
	"github.com/minio/minio-go/v7/pkg/credentials"
	"go.uber.org/zap"
	"logger/logger"
)

var Minio *minio.Client

// InitMinIo 初始化 minio对象存储
// root  openIM123  用户来自 openIM 项目配置文件  config/config.yaml 的对象存储配置区域
func InitMinIo() {
	var err error
	endpoint := "82.157.160.117:10005"
	accessKeyID := "root"
	secretAccessKey := "openIM123"
	useSSL := false

	// Initialize minio client object.
	Minio, err = minio.New(endpoint, &minio.Options{
		Creds:  credentials.NewStaticV4(accessKeyID, secretAccessKey, ""),
		Secure: useSSL,
	})
	if err != nil {
		logger.Logger.Panic("初始化minio对象存储失败", zap.Error(err))
	}
	// 创建 自定义 im 媒体数据存储桶
	bucketName := "im-mediums"
	location := "us-east-1"
	found, err := Minio.BucketExists(context.Background(), bucketName)
	if err != nil {
		logger.Logger.Panic("minio.BucketExists error", zap.Error(err))
	}
	// 没有找到这个 bucket 就创建
	if !found {
		if err = Minio.MakeBucket(context.Background(), bucketName, minio.MakeBucketOptions{Region: location}); err != nil {
			logger.Logger.Panic("minio.MakeBucket error", zap.Error(err))
			return
		}
	}
}
