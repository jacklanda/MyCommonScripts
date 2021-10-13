#!/bin/zsh

arg_num=$#;
fn_slt=$1;

if [ $arg_num -lt 1 ]; then
    echo "\nusage: sh sysmgr [-m: lookup_usrs_mem_usage]"
    exit 0
fi

function lookup_usrs_mem_usage(){
    ps hax -o rss,user | awk '{a[$2]+=$1;}END{for(i in a)print "[" i " -> " " "int(a[i]/1024/1024+0.5) " GB" "]";}' | sort -rnk3
}

function main(){
    if [ $fn_slt == "-m" ];then
        echo "";
        lookup_usrs_mem_usage;
    fi
}

main
