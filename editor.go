package main

import (
	"log"
	//"net/http"

	"github.com/labstack/echo"
	"github.com/nsip/curriculum-align"
)

func main() {
	align.Init()
	e := echo.New()
	e.GET("/align", align.Align)
	e.Static("/", "public")
	e.File("/", "public/index.html")
	log.Println("Editor: localhost:1756")
	e.Logger.Fatal(e.Start(":1576"))
}
