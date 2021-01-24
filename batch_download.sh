#! /bin/zsh

if [ $# -lt 1 ]; then
    echo -e "\nusage: sh wget_batch_download.sh [input_batch_url_file]\n"
    exit 0
fi

input_file=$1

DirOutput="output"
mkdir $DirOutput
cd $DirOutput

while read line
do
    item_name=`echo $line | awk -F ':' '{print $1}'`
    item_url=`echo $line | awk -F ' ' '{print $2}'`
    printf "start to download website: %s -> %s\n" $item_name $item_url
    nohup wget -c -P $item_name -r -l 50 -nd -m --accept=html $item_url &> /dev/null &
    printf "finished downloading website: %s\n" $item_name
done < $input_file &
exit 0
