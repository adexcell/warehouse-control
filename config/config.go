package config

import (
	"fmt"

	httpserver "github.com/adexcell/warehouse-control/pkg/http/server"
	"github.com/adexcell/warehouse-control/pkg/logger"
	"github.com/adexcell/warehouse-control/pkg/otel"
	"github.com/adexcell/warehouse-control/pkg/postgres"
	"github.com/joho/godotenv"
	"github.com/kelseyhightower/envconfig"
)

type App struct {
	Name    string `envconfig:"APP_NAME"    required:"true"`
	Version string `envconfig:"APP_VERSION" required:"true"`
}

type Config struct {
	App      App
	HTTP     httpserver.Config
	Logger   logger.Config
	OTEL     otel.Config
	Postgres postgres.Config
	// Redis    redis.Config
	Router string `envconfig:"GIN_MODE"`
}

func New() (Config, error) {
	var config Config

	err := godotenv.Load(".env")
	if err != nil {
		return config, fmt.Errorf("godotenv.Load: %w", err)
	}

	err = envconfig.Process("", &config)
	if err != nil {
		return config, fmt.Errorf("envconfig.Process: %w", err)
	}

	return config, nil
}
