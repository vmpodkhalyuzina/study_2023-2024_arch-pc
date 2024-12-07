%include 'in_out.asm'
SECTION .data
msg db "Результат: ",0
form db "Формула 3x - 1",0
SECTION .text
global _start
_start:
pop ecx ; Извлекаем из стека в `ecx` количество
; аргументов (первое значение в стеке)
pop edx ; Извлекаем из стека в `edx` имя программы
; (второе значение в стеке)
sub ecx,1 ; Уменьшаем `ecx` на 1 (количество
; аргументов без названия программы)
mov esi, 0
mov eax, form
call sprintLF
mov ebx, 3
next:
cmp ecx,0h
jz _end
pop eax
call atoi
call _func
add esi,eax
loop next
_end:
mov eax, msg ; вывод сообщения "Результат: "
call sprint
mov eax, esi ; записываем сумму в регистр `eax`
call iprintLF ; печать результата
call quit ; завершение программы
_func:
mul ebx
sub eax, 1
ret
