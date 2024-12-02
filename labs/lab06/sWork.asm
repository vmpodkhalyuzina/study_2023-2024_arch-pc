%include 'in_out.asm'
SECTION .data
msg: DB 'Введите X: ',0
div: DB 'Результат y = ',0
fun: DB 'y = (12x + 3) * 5',0
SECTION .bss
x: RESB 80
SECTION .text
GLOBAL _start
_start:
mov eax,fun
call sprintLF
mov eax, msg
call sprintLF
mov ecx, x
mov edx, 80
call sread
mov eax,x
call atoi
; ---- Вычисление
mov ebx,12
mul ebx
add eax,3
xor ebx,ebx
mov ebx,5
mul ebx
mov edi,eax
; ---- Вывод результата на экран
mov eax,div
call sprint
mov eax,edi
call iprintLF
call quit
