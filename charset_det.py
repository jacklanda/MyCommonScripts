import os
import sys
import chardet

#检测路径下面的所有文件编码格式
if __name__ == "__main__":
    path = r'./czbank_new/'
    list_files = os.listdir(path)
    for fileName in list_files:
        filePath = path + fileName
        with open(filePath, "rb") as f:
            data = f.read()
            codeType = chardet.detect(data)['encoding']
            print(f"{filePath} -> {codeType}")

