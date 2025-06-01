
.section .data

data_items:
.long 3,67,34,222,45,76,75,54,34,44,33,22,11,66,0

.section .text

.globl _start

_start:
  movl $0, %edi                 # index = 0
  movl data_items(,%edi,4), %eax  # load first value
  cmpl $0, %eax
  je loop_exit                  # if first is 0, exit immediately
  movl %eax, %ebx              # initialize max to first element

start_loop:
  incl %edi
  movl data_items(,%edi,4), %eax
  cmpl $0, %eax
  je loop_exit                 # exit if zero (end of data)
  
  cmpl %ebx, %eax
  jle start_loop               # continue if not larger

  movl %eax, %ebx             # update max
  jmp start_loop

loop_exit:
  movl $1, %eax               # exit syscall number
  # exit code will be max value in ebx
  int $0x80

  movl $1, %eax #exit call
  #ebx not movl 0'd since already 0
  int $0x80 
