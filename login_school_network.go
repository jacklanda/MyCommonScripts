package main

import (
	"fmt"
	"io/ioutil"
	"net/http"
	"net/url"
	"os"
)

func main() {
	if len(os.Args) > 2 {
		fmt.Println("参数过多，请确认输入参数正确！")
	} else if len(os.Args) < 2 {
		fmt.Println("参数太少啦，你至少得输入一个吧！")
	} else if os.Args[1] == "--login" {
		login()
	} else if os.Args[1] == "--logout" {
		logout()
	} else {
		fmt.Println("请求失败，请检查脚本参数是否正确")
	}
	return
}

func login() {
	resp, err := http.PostForm("http://222.199.222.14", url.Values{"DDDDD": {"你的学号"}, "upass": {"密码"}, "v6ip": {"你的ipv6地址"}, "0MKKey": {"不知道是啥的字串"}})
	if err == nil {
		fmt.Println("成功登陆校园网")
	}
	defer resp.Body.Close()
	body, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		fmt.Printf("%s", body)
	}
	return
}

func logout() {
	resp, err := http.Get("http://222.199.222.14/F.htm")
	if err == nil {
		fmt.Println("成功注销校园网")
	}
	defer resp.Body.Close()
	body, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		fmt.Printf("%s", body)
	}
	return
}
