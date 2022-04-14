.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
.data
array DWORD 4h,3h,2h,1h
.code
main PROC
    mov ecx, LENGTHOF array -1
    call Bubblesort
    INVOKE ExitProcess, eax
main ENDP
;------------------Bubbsort Function--------------------------

Bubblesort PROC
    L1:
        mov ebx,0
        push ecx                    ;preserve ecx on stack
        
    L2:
        mov eax,array[ebx] /moving array sub whatever
        cmp array[ebx+4], eax       ;compares the values to see if greater or less than
        jg L3                       ;jump if greater than
        xchg eax,array[ebx+4]       ;exchanges mem between regs
        mov array[ebx],eax

    L3:
        add ebx,4                   ;move forward in array
        loop L2

        pop ecx                     ;restore ecx
        loop L1

    Bubblesort ENDP
    END main