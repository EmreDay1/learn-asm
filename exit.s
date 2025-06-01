 #PURPOSE:  Simple program that exits and returns a
 #          status code back to the Linux kernel
 #
 #INPUT:    none
 #
 #OUTPUT:   returns a status code.  This can be viewed
# by typing #
# echo $?
#
19
Chapter 3. Your First Programs
#          after running the program
#
#VARIABLES:
#          %eax holds the system call number
#          %ebx holds the return status
#
.section .data
 .section .text
 .globl _start
_start:
movl $1, %eax
movl $0, %ebx
int $0x80
# this is the linux kernel command
# number (system call) for exiting
# a program
# this is the status number we will
# return to the operating system.
# Change this around and it will
# return different things to
# echo $?
# this wakes up the kernel to run
# the exit command
