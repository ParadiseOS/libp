format ELF

section ".text" executable

; Syscall as of  11/12/25

public send_message
send_message:
    mov eax, 0          ; send message syscall
    mov ebx, [esp + 4]  ; reader pid
    mov ecx, [esp + 8]  ; data_size
    mov edx, [esp + 12] ; data pointer
    mov esi, [esp + 16] ; flags
    int 0x80
    ret ; return status in eax

public read_message
read_message:
    mov eax, 1           ; read_message syscall
    mov ebx, [esp + 4]   ; sender pid
    mov ecx, [esp + 8]   ; reader pid
    mov edx, [esp + 12]  ; mailbox message ptr
    mov esi, [esp + 16]  ; flags
    int 0x80
    ret ; return status in eax