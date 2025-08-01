#!/bin/bash

#check CPU Usage
top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8"% CPU used"}'

# check the free
free | awk '/Mem/{printf("Free: %.2f%%\n", $4/$2*100)}'

#check the used memory
free | awk '/Mem/{printf("Used: %.2f%%\n", $3/$2*100)}'

#check top 5 processes by cpu
ps -eo pid,ppid,cmd,%cpu,%mem --sort=-%cpu | head -n 6

#check top 5 processes by memory usage
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -n 6
