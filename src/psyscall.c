#include "types.h"

u32 psyscall(u32 num, u32 a, u32 b, u32 c, u32 d, u32 e) {
    u32 ret;
    asm volatile("mov eax, %[num]\n"
                 "mov ebx, %[a]\n"
                 "mov ecx, %[b]\n"
                 "mov edx, %[c]\n"
                 "mov esi, %[d]\n"
                 "mov edi, %[e]\n"
                 "int 0x80\n"
                 : "=a"(ret) // <-- return value from eax
                 : [num] "g"(num), [a] "g"(a), [b] "g"(b), [c] "g"(c),
                   [d] "g"(d), [e] "g"(e)
                 : "ebx", "ecx", "edx", "esi", "edi", "memory");
    return ret;
}
