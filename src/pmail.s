format ELF

section ".text" executable

public send_message
send_message:
    mov eax, 3          ; send message syscall
    mov ebx, [esp + 4]  ; receiver_pid
    mov ecx, [esp + 8]  ; size
    mov edx, [esp + 12] ; data pointer
    int 0x80
    ret

public read_message
read_message:
    mov eax, 4           ; read_message syscall
    mov ebx, [esp + 4]   ; pointer to message buffer
    int 0x80
    mov eax, ecx ; return status
    ret