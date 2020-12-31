import os

PATH = "./adorocinema"
FILE_LIST = os.listdir(PATH)
OUTPUT_FILE_PATH = "./影视-补充1.txt"

def merge_all():
    with open(OUTPUT_FILE_PATH, "w") as f_write:
        for each in FILE_LIST:
            #print("./adorocinema/" + each)
            with open(f"./adorocinema/{each}", "r") as f_read:
                content = f_read.readlines()
                f_write.writelines(content)

if __name__ == "__main__":
    merge_all()
