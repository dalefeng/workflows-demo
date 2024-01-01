package main

import (
	"fmt"
	jsoniter "github.com/json-iterator/go"
)

func main() {
	m := map[string]string{
		"hello": "world121",
	}
	marshal, _ := jsoniter.Marshal(m)
	fmt.Println(string(marshal))
}
