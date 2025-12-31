package main

import (
	"github.com/adexcell/warehouse-control/internal/item"
	"github.com/wb-go/wbf/ginext"
	"github.com/wb-go/wbf/zlog"
)

func main() {
	zlog.Init()

	httprouter := ginext.New("debug")
	itemHandler := item.New()
	itemHandler.Register(httprouter)
}
