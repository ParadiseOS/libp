format ELF

section ".text" executable

; Syscall as of  9/19/25

public write1
write1:

    mov eax, 1          ; print string w/ length syscall
    mov ebx, [esp + 4]  ; pointer to string
    mov ecx, [esp + 8]  ; size of string

    int 0x80
    ret

public write2
write2:
    mov eax, 2          ; print string syscall
    mov ebx, [esp + 4]  ; str
    int 0x80
    ret