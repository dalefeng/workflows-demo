package main

import (
	"fmt"
	jsoniter "github.com/json-iterator/go"
	"os"
)

func main() {
	m := map[string]string{
		"hello": "world",
	}
	baseURL := os.Getenv("BASE_URL")
	fmt.Println("BASE_URL:", baseURL)
	marshal, _ := jsoniter.Marshal(m)
	fmt.Println(string(marshal))
}
