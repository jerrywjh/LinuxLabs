#!/bin/bash
# Simple menu driven shell script to get information about your Linux system

PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH


#define variables
LSB=/usr/bin/lsb_release

#purpose : disply pause prompt
# $1 -> Message(optional)
function pause() {
    local message="$@"   #$@ all parameters for this function,$1 $2 $3.... 也就是这个函数的传递进来的所有参数, 需要注意的是函数定义中是不定义parameter的
    # -z: 空串，0..
    # 下面这句话也可以写成:
    #if [ -z $message ]; then
    #    message="Press Enter Key to continue..."
    #fi
    #注意：if [ $a == "aaa" ]; then ... fi  中的空格！ 赋值语句的=前后不能有空格
    [ -z $message ] && message="Press Enter key to continue..."
    read -p "$message" enterKey
}

#Display a menu on screen
function show_menu(){
    date   #show the date information
    echo "--------------------------"
    echo " Main Menu "
    echo "--------------------------"
    echo "1. Operation system info "
    echo "2. Get my ip address "
    echo "3. Free and used memeory info "
    echo "4. My disk usage "
    echo "5. Exit "
}


# Display header message
function write_header() {
    local h="$@"
    echo "--------------------------"
    echo " ${h}   " # {} brace expansion, ${a}bc =$a+bc
    echo "--------------------------"
}

#Get information about your OS
function os_info(){
    write_header "System information"
    #$() is used to execute command
    echo "Operating system: $(uname -a)"
    #pause "Press Enter key to continue...
    pause
}

#Get public IP from your ISP
function ip_info(){
    write_header "Public IP information:"
    cmd='curl -s'
    ipservice=ip.cn
    #pipecmd=(sed -e 's/.*Current IP Address: //' -e 's/<.*s//') #using brackets to use it as an array and avoid scaping
    #$cmd "$ipservice" | "${pipecmd[@]}"
    $cmd "$ipservice"
    #当然上面一句也可以用 echo $(curl -s ip.cn) #or curl -s ip.cn
    pause
}


#Display used and free memory
function mem_info(){
    write_header "Free and used memory"
    free -h
    echo "******************************"
    echo " Virtual memory statistics"
    echo "******************************"
    vmstat
    echo "******************************"
    echo "Top  5 memory eating processes"
    echo "******************************"
    #sort, head的用法
    ps auxf | sort -n -r -k 4| head -n 5
    pause
}

# Get Disk usage infomation
function disk_info() {
    #usep=$(echo $output |awk '{print $1}'|cut -d'%' -f1)
    #partition=$(echo $output |awk '{print $2}')
    write_header "Disk usage info"
    #if [ "$EXCLUDE_LIST" != "" ]; then
    #    df -H | grep -vE "^Filesystem|tmpfs|cdrom|${EXCLUDE_LIST}" | awk '{print $5 "  " $6}'
    #else
    df -H | grep -vE "^Filesystem|tmpfs|cdrom" | awk '{print $5 "  " $6}'
    #fi
    pause
}

# Get input via keyboard and make a decision using case ..esac
function read_input(){
    local c  #by default, all varialbes in shell script are global,  so midifying a varialbe in a function changes it in the whole script.  If a vairable is only used inside a function, declare it local.
    read -p "Enter your choice [1-5]: " c
    case $c in
        1) os_info ;;   #格式： value) 执行代码 ;;
        2) ip_info ;;
        3) mem_info ;;
        4) disk_info ;;
        5) echo "Bye!"; exit 0 ;;
        *)      #通配符，相当于其他语言中的default
           echo "Please select between 1-5 only "
           pause
           ;;
    esac
}

#main logic
while true
do
    clear
    show_menu  #直接调用function
    read_input
done

