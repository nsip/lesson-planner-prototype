package main

import (
	"log"
	//"net/http"

	"github.com/labstack/echo"
	cu "github.com/nsip/curriculum-align"
	re "github.com/nsip/resource-align"
)

func main() {
	cu.Init()
	re.Init("1576")
	e := echo.New()
	e.GET("/align", re.Align)
	e.GET("/curricalign", cu.Align)
	e.Static("/", "public")
	e.File("/", "public/index.html")
	log.Println("\n\n\nEditor: http://localhost:1576")
	e.Logger.Fatal(e.Start(":1576"))
}
