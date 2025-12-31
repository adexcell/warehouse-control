package item

import (
	"github.com/adexcell/warehouse-control/internal/controller"
	"github.com/wb-go/wbf/ginext"
)

type handler struct {

}

func New() controller.Handler {
	return &handler{}
}

func (h *handler) Register(router *ginext.Engine) {
	router.POST("/items", h.Create)
	router.GET("/items", h.Read)
	router.PUT("/items/:id", h.Update)
	router.DELETE("/items/:id", h.Delete)
}

func (h *handler) Create(c *ginext.Context) {

}

func (h *handler) Read(c *ginext.Context) {

}

func (h *handler) Update(c *ginext.Context) {

}

func (h *handler) Delete(c *ginext.Context) {

}

