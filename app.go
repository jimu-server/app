package main

import (
	"fmt"
	"github.com/jimu-server/config"
	"github.com/jimu-server/logger"
	"github.com/jimu-server/web"

	_ "github.com/jimu-server/gpt"
	_ "github.com/jimu-server/mq"
	_ "github.com/jimu-server/notify"
	_ "github.com/jimu-server/org"
	_ "github.com/jimu-server/oss"
	_ "github.com/jimu-server/pay"
	"go.uber.org/zap"
	"net/http"
	"os"
	"os/signal"

	"syscall"
)

func main() {
	server := &http.Server{
		Addr:    fmt.Sprintf("%s%s", "0.0.0.0", config.Evn.App.Port),
		Handler: web.Engine,
	}
	go func() {
		if err := server.ListenAndServe(); err != nil {
			panic(err.Error())
		}
	}()

	signals := make(chan os.Signal, 1)
	signal.Notify(signals, syscall.SIGINT, syscall.SIGTERM)
	select {
	case <-signals:
		if err := zap.L().Sync(); err != nil {
			logger.Logger.Error("sync zap log error", zap.Error(err))
		}
		if err := server.Close(); err != nil {
			logger.Logger.Error("close server error", zap.Error(err))
		}
		logger.Logger.Info("server shutdown")
	}
}
