import re, sys

from requests import post, get

def login():
    url = "http://222.199.222.14"
    data = {
            "DDDDD": "你的学号",
            "upass": "密码",
            "v6ip": "你的ipv6地址",
            "0MKKey": "一个不知道叫啥的字串"
            }
    post(url, data=data).content.decode("gbk")
    return

def logout():
    url = "http://222.199.222.14/F.htm"
    get(url).content.decode("gbk")
    return

if __name__ == "__main__":
    if(len(sys.argv) > 2):
        print("参数过多，请确认参数输入正确")
    elif(len(sys.argv < 2)):
        print("参数太少啦，你总得输一个吧")
    elif(sys.argv[1] == "--login"):
        login()
        print("成功登陆校园网")
    elif(sys.argv[1] == "--logout"):
        logout()
        print("成功注销校园网")
    else:
        print("请求失败，请检查脚本参数是否输入正确")
