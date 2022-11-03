%include "io.inc"

section .data
    numbers dd 72, 82, 43, 100, 62, 52
    numbersLength dd 6
    minNumber dd 0
section .text
global CMAIN
CMAIN:
    ;cleare general porpose registers
    xor eax, eax
    xor ebx, ebx
    xor ecx, ecx
    xor edx, edx
    ;save first number address on ebx for - minNumber
    mov ebx, numbers
    ;save first number address on eax for - loop calc
    mov eax, numbers
    ;calculate itteration count to find minNumber
    mov ecx, [numbersLength]
    dec ecx
    
findingMinNumber:
    l1:
        add eax, 4 ;get numbers next element. 4 (dd) byte count
        mov edx, [ebx] ;save ebx value on edx to compare in feature
        cmp edx, [eax] ; compare edx(ebx value - minNumber) to numbers item
        jg newMinNumber ;if edx > eax or minNumver > numbers[i]
        dec ecx ;decrement accumulator
        JNZ l1 ;goto l1 if ecx is not 0
        jmp l1Continue ;when loop is over goto l1Continue
    newMinNumber:
        mov ebx, eax ;change minNumber with new minNumber
        dec ecx ;decrement accumulator
        JNZ l1 ;goto l1 if ecx is not 0

l1Continue:
    PRINT_STRING "Min number is: "
    PRINT_DEC 4, [ebx]
    NEWLINE
    mov edx, [ebx]  ;save ebx value on edx to move in minNumber
    mov [minNumber], edx
    xor edx, edx ;after saving minNumber clearing edx register
    mov ecx, 32 ;32(dd bites count) = 4 * 8
    
;edx is value of minNumber, all after registers can be reused
l2:
    mov eax, [minNumber] ;save minNumber on eax value -> not address
    dec cl
    shr eax, cl
    and eax, 1
    
    mov ebx, ecx ;save iteration state
    
    mov ecx, 31
    sub ecx, ebx
    shl eax, cl
    or edx, eax ;i save result in edx register
    
    mov ecx, ebx ;take iteration state to previous state
    
    cmp ecx, 0
    jg l2
    PRINT_STRING "Mirror reverse is: "
    PRINT_DEC 4, edx
    NEWLINE
    ret
