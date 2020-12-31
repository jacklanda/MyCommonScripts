#if [ $# -ne 1  ];then
    #echo "Usage: $0 filename";
        #exit -1
#fi

#filename=$1

#egrep -o "\b[[:alpha:]]+\b" $filename | awk '{count[$0]++}END{printf("%-14s%s\n","Word","Count");for (ind in count){ printf("%-14s%d\n",ind,count[ind]); }}'

filename=$1
cat $filename | sed 's/ /\n/g' | sed '/^$/d' | sort | uniq -c | awk '{print $2, $1}'| sort -nrk2
