#!/bin/zsh

#define the log file's dir
FileDir='' #/home/....
#define the watched dir
CheckDir=(
# /home/....
)

#define the func to generate the sample log of the dir to be verified
function OldFile(){
        for i in ${CheckDir[@]}
        do
#                 echo $i
                /bin/find ${i} -type f -print0 | xargs -0 md5sum >> ${FileDir}/old.log
        done
}
function NewFile(){

        for i in ${CheckDir[@]}
        do
#                 echo ${i}
                /bin/find ${i} -type f -print0 | xargs -0 md5sum >> ${FileDir}/new.log
        done
}

while true
do
    sleep 600
    if [ ! -d ${FileDir} ]
    then
        mkdir ${FileDir/lg} -p
    fi

    if [ ! -e ${FileDir}/old.log ]
    then
        OldFile
    fi

    if [ ! -e ${FileDir}/watch.log ]
    then
        touch ${FileDir}/watch.log
    fi

    #generate new log file
    NewFile
    #compare to the new log file n old log file 
    /usr/bin/diff ${FileDir}/new.log ${FileDir}/old.log > ${FileDir}/diff.log
    Status=$?

    if [ $Status -ne 0 ]
    then
        echo "-*- dir has changed -*-" >> ${FileDir}/watch.log
        cat ${FileDir}/diff.log
    fi

    #remove the new n old log files, then backup the result of comparison
    /bin/cp -f ${FileDir}/diff.log ${FileDir}/now.log
    cat /dev/null > ${FileDir}/old.log
    cat /dev/null > ${FileDir}/new.log
    #generate new log file
    OldFile
    
    if [ -s /home/jacklanda/log/now.log ];then
        #<YOUR COMMAND>
    else
        #<YOUR COMMAND>
    fi
done
